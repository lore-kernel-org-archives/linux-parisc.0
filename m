Return-Path: <SRS0=9Rxp=OG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7425C43441
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 21:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60DD8208E4
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 21:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DD8208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbeK1IQq (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Nov 2018 03:16:46 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50680 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbeK1IQq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Nov 2018 03:16:46 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id CB9212951B;
        Tue, 27 Nov 2018 16:17:30 -0500 (EST)
Date:   Wed, 28 Nov 2018 08:17:28 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Helge Deller <deller@gmx.de>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
        Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [RFC][PATCH] m68k/parisc: Convert hp_sdc_rtc driver to rtc
 framework
In-Reply-To: <20181127210107.GA11661@ls3530.dellerweb.de>
Message-ID: <alpine.LNX.2.21.1811280815210.28@nippy.intranet>
References: <20181127210107.GA11661@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Adding Kars to Cc.

On Tue, 27 Nov 2018, Helge Deller wrote:

> This patch is a first step to convert the hp_sdc_rtc driver to the new
> rtc framework.
> 
> The HP SDC RTC driver is available on HP machines only, which run either
> a parisc or a m68k processor.  I did tested this patch on a parisc
> machine, but it would be nice if someone with a m68k machine could test
> it too.
>     
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
> index 47eb8ca729fe..c787bde12fce 100644
> --- a/drivers/input/misc/hp_sdc_rtc.c
> +++ b/drivers/input/misc/hp_sdc_rtc.c
> @@ -34,51 +34,27 @@
>   */
>  
>  #include <linux/hp_sdc.h>
> -#include <linux/errno.h>
> -#include <linux/types.h>
> -#include <linux/init.h>
>  #include <linux/module.h>
> -#include <linux/time.h>
> -#include <linux/miscdevice.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/poll.h>
>  #include <linux/rtc.h>
> -#include <linux/mutex.h>
>  #include <linux/semaphore.h>
>  
>  MODULE_AUTHOR("Brian S. Julin <bri@calyx.com>");
>  MODULE_DESCRIPTION("HP i8042 SDC + MSM-58321 RTC Driver");
>  MODULE_LICENSE("Dual BSD/GPL");
>  
> -#define RTC_VERSION "1.10d"
> +#define RTC_VERSION "1.2"
>  
> -static DEFINE_MUTEX(hp_sdc_rtc_mutex);
> -static unsigned long epoch = 2000;
> +static struct rtc_device *rtc;
>  
>  static struct semaphore i8042tregs;
>  
> -static hp_sdc_irqhook hp_sdc_rtc_isr;
> -
> -static struct fasync_struct *hp_sdc_rtc_async_queue;
> -
>  static DECLARE_WAIT_QUEUE_HEAD(hp_sdc_rtc_wait);
>  
> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
> -			       size_t count, loff_t *ppos);
> -
> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
> -				      unsigned int cmd, unsigned long arg);
> -
> -static unsigned int hp_sdc_rtc_poll(struct file *file, poll_table *wait);
> -
> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file);
> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on);
> -
>  static void hp_sdc_rtc_isr (int irq, void *dev_id, 
>  			    uint8_t status, uint8_t data) 
>  {
> -	return;
> +	/* Notify RTC core on alarm event */
> +	rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
>  }
>  
>  static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
> @@ -105,17 +81,18 @@ static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
>  	t.act.semaphore =	&tsem;
>  	sema_init(&tsem, 0);
>  	
> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
> +	if (hp_sdc_enqueue_transaction(&t))
> +		return -EIO;
>  	
>  	/* Put ourselves to sleep for results. */
>  	if (WARN_ON(down_interruptible(&tsem)))
> -		return -1;
> +		return -EIO;
>  	
>  	/* Check for nonpresence of BBRTC */
>  	if (!((tseq[83] | tseq[90] | tseq[69] | tseq[76] |
>  	       tseq[55] | tseq[62] | tseq[34] | tseq[41] |
>  	       tseq[20] | tseq[27] | tseq[6]  | tseq[13]) & 0x0f))
> -		return -1;
> +		return -ENODEV;
>  
>  	memset(rtctm, 0, sizeof(struct rtc_time));
>  	rtctm->tm_year = (tseq[83] & 0x0f) + (tseq[90] & 0x0f) * 10;
> @@ -132,17 +109,24 @@ static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
>  static int hp_sdc_rtc_read_bbrtc (struct rtc_time *rtctm)
>  {
>  	struct rtc_time tm, tm_last;
> -	int i = 0;
> +	int i = 0, ret;
>  
>  	/* MSM-58321 has no read latch, so must read twice and compare. */
>  
> -	if (hp_sdc_rtc_do_read_bbrtc(&tm_last)) return -1;
> -	if (hp_sdc_rtc_do_read_bbrtc(&tm)) return -1;
> +	ret = hp_sdc_rtc_do_read_bbrtc(&tm_last);
> +	if (ret)
> +		return ret;
> +	ret = hp_sdc_rtc_do_read_bbrtc(&tm);
> +	if (ret)
> +		return ret;
>  
>  	while (memcmp(&tm, &tm_last, sizeof(struct rtc_time))) {
> -		if (i++ > 4) return -1;
> +		if (i++ > 4)
> +			return -EAGAIN;
>  		memcpy(&tm_last, &tm, sizeof(struct rtc_time));
> -		if (hp_sdc_rtc_do_read_bbrtc(&tm)) return -1;
> +		ret = hp_sdc_rtc_do_read_bbrtc(&tm);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	memcpy(rtctm, &tm, sizeof(struct rtc_time));
> @@ -150,7 +134,6 @@ static int hp_sdc_rtc_read_bbrtc (struct rtc_time *rtctm)
>  	return 0;
>  }
>  
> -
>  static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
>  {
>  	hp_sdc_transaction t;
> @@ -178,16 +161,16 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
>  
>  	/* Sleep if output regs in use. */
>  	if (WARN_ON(down_interruptible(&i8042tregs)))
> -		return -1;
> +		return -EIO;
>  
>  	if (hp_sdc_enqueue_transaction(&t)) {
>  		up(&i8042tregs);
> -		return -1;
> +		return -EIO;
>  	}
>  	
>  	/* Sleep until results come back. */
>  	if (WARN_ON(down_interruptible(&i8042tregs)))
> -		return -1;
> +		return -EIO;
>  
>  	up(&i8042tregs);
>  
> @@ -198,13 +181,15 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
>  
>  
>  /* Read the i8042 real-time clock */
> -static inline int hp_sdc_rtc_read_rt(struct timespec64 *res) {
> +static int hp_sdc_rtc_read_rt(struct timespec64 *res)
> +{
>  	int64_t raw;
>  	uint32_t tenms; 
>  	unsigned int days;
>  
>  	raw = hp_sdc_rtc_read_i8042timer(HP_SDC_CMD_LOAD_RT, 5);
> -	if (raw < 0) return -1;
> +	if (raw < 0)
> +		return -EIO;
>  
>  	tenms = (uint32_t)raw & 0xffffff;
>  	days  = (unsigned int)(raw >> 24) & 0xffff;
> @@ -222,7 +207,8 @@ static inline int hp_sdc_rtc_read_fhs(struct timespec64 *res) {
>  	unsigned int tenms;
>  
>  	raw = hp_sdc_rtc_read_i8042timer(HP_SDC_CMD_LOAD_FHS, 2);
> -	if (raw < 0) return -1;
> +	if (raw < 0)
> +		return -EIO;
>  
>  	tenms = (unsigned int)raw & 0xffff;
>  
> @@ -239,7 +225,8 @@ static inline int hp_sdc_rtc_read_mt(struct timespec64 *res) {
>  	uint32_t tenms; 
>  
>  	raw = hp_sdc_rtc_read_i8042timer(HP_SDC_CMD_LOAD_MT, 3);
> -	if (raw < 0) return -1;
> +	if (raw < 0)
> +		return -EIO;
>  
>  	tenms = (uint32_t)raw & 0xffffff;
>  
> @@ -256,7 +243,8 @@ static inline int hp_sdc_rtc_read_dt(struct timespec64 *res) {
>  	uint32_t tenms;
>  
>  	raw = hp_sdc_rtc_read_i8042timer(HP_SDC_CMD_LOAD_DT, 3);
> -	if (raw < 0) return -1;
> +	if (raw < 0)
> +		return -EIO;
>  
>  	tenms = (uint32_t)raw & 0xffffff;
>  
> @@ -273,7 +261,8 @@ static inline int hp_sdc_rtc_read_ct(struct timespec64 *res) {
>  	uint32_t tenms;
>  
>  	raw = hp_sdc_rtc_read_i8042timer(HP_SDC_CMD_LOAD_CT, 3);
> -	if (raw < 0) return -1;
> +	if (raw < 0)
> +		return -EIO;
>  
>  	tenms = (uint32_t)raw & 0xffffff;
>  
> @@ -284,11 +273,11 @@ static inline int hp_sdc_rtc_read_ct(struct timespec64 *res) {
>  }
>  
>  
> -#if 0 /* not used yet */
>  /* Set the i8042 real-time clock */
> -static int hp_sdc_rtc_set_rt (struct timeval *setto)
> +static int hp_sdc_rtc_set_rt(struct rtc_time *tm)
>  {
>  	uint32_t tenms;
> +	time64_t seconds;
>  	unsigned int days;
>  	hp_sdc_transaction t;
>  	uint8_t tseq[11] = {
> @@ -300,17 +289,13 @@ static int hp_sdc_rtc_set_rt (struct timeval *setto)
>  
>  	t.endidx = 10;
>  
> -	if (0xffff < setto->tv_sec / 86400) return -1;
> -	days = setto->tv_sec / 86400;
> -	if (0xffff < setto->tv_usec / 1000000 / 86400) return -1;
> -	days += ((setto->tv_sec % 86400) + setto->tv_usec / 1000000) / 86400;
> -	if (days > 0xffff) return -1;
> -
> -	if (0xffffff < setto->tv_sec) return -1;
> -	tenms  = setto->tv_sec * 100;
> -	if (0xffffff < setto->tv_usec / 10000) return -1;
> -	tenms += setto->tv_usec / 10000;
> -	if (tenms > 0xffffff) return -1;
> +	seconds = rtc_tm_to_time64(tm);
> +	days = seconds / 86400;
> +	if (days > 0xffff)
> +		return -EINVAL;
> +	tenms  = (seconds % 86400) * 100;
> +	if (tenms > 0xffffff)
> +		return -EINVAL;
>  
>  	tseq[3] = (uint8_t)(tenms & 0xff);
>  	tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
> @@ -321,12 +306,14 @@ static int hp_sdc_rtc_set_rt (struct timeval *setto)
>  
>  	t.seq =	tseq;
>  
> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
> +	if (hp_sdc_enqueue_transaction(&t))
> +		return -EIO;
>  	return 0;
>  }
>  
>  /* Set the i8042 fast handshake timer */
> -static int hp_sdc_rtc_set_fhs (struct timeval *setto)
> +#if 0
> +static int hp_sdc_rtc_set_fhs(struct timespec64 *setto)
>  {
>  	uint32_t tenms;
>  	hp_sdc_transaction t;
> @@ -337,36 +324,36 @@ static int hp_sdc_rtc_set_fhs (struct timeval *setto)
>  
>  	t.endidx = 4;
>  
> -	if (0xffff < setto->tv_sec) return -1;
>  	tenms  = setto->tv_sec * 100;
> -	if (0xffff < setto->tv_usec / 10000) return -1;
> -	tenms += setto->tv_usec / 10000;
> -	if (tenms > 0xffff) return -1;
> +	tenms += setto->tv_nsec / 10000 / 1000;
> +	if (tenms > 0xffff)
> +		return -EINVAL;
>  
>  	tseq[3] = (uint8_t)(tenms & 0xff);
>  	tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
>  
>  	t.seq =	tseq;
>  
> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
> +	if (hp_sdc_enqueue_transaction(&t))
> +		return -EIO;
>  	return 0;
>  }
> -
> +#endif
>  
>  /* Set the i8042 match timer (a.k.a. alarm) */
> -#define hp_sdc_rtc_set_mt (setto) \
> +#define hp_sdc_rtc_set_mt(setto) \
>  	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_MT)
>  
>  /* Set the i8042 delay timer */
> -#define hp_sdc_rtc_set_dt (setto) \
> +#define hp_sdc_rtc_set_dt(setto) \
>  	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_DT)
>  
>  /* Set the i8042 cycle timer (a.k.a. periodic) */
> -#define hp_sdc_rtc_set_ct (setto) \
> +#define hp_sdc_rtc_set_ct(setto) \
>  	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_CT)
>  
>  /* Set one of the i8042 3-byte wide timers */
> -static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
> +static int hp_sdc_rtc_set_i8042timer(struct timespec64 *setto, uint8_t setcmd)
>  {
>  	uint32_t tenms;
>  	hp_sdc_transaction t;
> @@ -377,58 +364,96 @@ static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
>  
>  	t.endidx = 6;
>  
> -	if (0xffffff < setto->tv_sec) return -1;
> +	if (setto->tv_sec > 0xffffff)
> +		return -EINVAL;
>  	tenms  = setto->tv_sec * 100;
> -	if (0xffffff < setto->tv_usec / 10000) return -1;
> -	tenms += setto->tv_usec / 10000;
> -	if (tenms > 0xffffff) return -1;
> +	if (setto->tv_nsec / 10000 / 1000 > 0xffffff)
> +		return -EINVAL;
> +	tenms += setto->tv_nsec / 10000 / 1000;
> +	if (tenms > 0xffffff)
> +		return -EINVAL;
>  
>  	tseq[1] = setcmd;
>  	tseq[3] = (uint8_t)(tenms & 0xff);
>  	tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
>  	tseq[5] = (uint8_t)((tenms >> 16)  & 0xff);
>  
> -	t.seq =			tseq;
> +	t.seq =	tseq;
>  
>  	if (hp_sdc_enqueue_transaction(&t)) { 
> -		return -1;
> +		return -EIO;
>  	}
>  	return 0;
>  }
> -#endif
>  
> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
> -			       size_t count, loff_t *ppos) {
> -	ssize_t retval;
> -
> -        if (count < sizeof(unsigned long))
> -                return -EINVAL;
> -
> -	retval = put_user(68, (unsigned long __user *)buf);
> -	return retval;
> +static int hp_sdc_rtc_get_time(struct device *dev, struct rtc_time *tm)
> +{
> +	return hp_sdc_rtc_read_bbrtc(tm);
>  }
>  
> -static __poll_t hp_sdc_rtc_poll(struct file *file, poll_table *wait)
> +static int hp_sdc_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  {
> -        unsigned long l;
> +	if (!rtc_valid_tm(tm))
> +		return -EINVAL;
>  
> -	l = 0;
> -        if (l != 0)
> -                return EPOLLIN | EPOLLRDNORM;
> -        return 0;
> +	return hp_sdc_rtc_set_rt(tm);
>  }
>  
> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file)
> +static int hp_sdc_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *wa)
>  {
> -        return 0;
> +	/* Read the present alarm time */
> +	int ret;
> +	struct timespec64 ttime;
> +	struct rtc_time *wtime = &wa->time;
> +
> +	ret = hp_sdc_rtc_read_mt(&ttime);
> +	if (ret)
> +		return ret;
> +	ret = hp_sdc_rtc_read_bbrtc(wtime);
> +	if (ret)
> +		return ret;
> +
> +	wtime->tm_hour = ttime.tv_sec / 3600;  ttime.tv_sec %= 3600;
> +	wtime->tm_min  = ttime.tv_sec / 60;    ttime.tv_sec %= 60;
> +	wtime->tm_sec  = ttime.tv_sec;
> +
> +	wa->enabled = 0;
> +	wa->pending = 0;
> +
> +	return 0;
>  }
>  
> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on)
> +static int hp_sdc_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wa)
>  {
> -        return fasync_helper (fd, filp, on, &hp_sdc_rtc_async_queue);
> +	/* Set the alarm time */
> +	struct timespec64 ttime;
> +
> +	/*
> +	 * This expects a struct hp_sdc_rtc_time. Writing 0xff means
> +	 * "don't care" or "match all" for PC timers.  The HP SDC
> +	 * does not support that perk, but it could be emulated fairly
> +	 * easily.  Only the tm_hour, tm_min and tm_sec are used.
> +	 * We could do it with 10ms accuracy with the HP SDC, if the
> +	 * rtc interface left us a way to do that.
> +	 */
> +
> +	if (wa->time.tm_hour > 23)
> +		return -EINVAL;
> +	if (wa->time.tm_min  > 59)
> +		return -EINVAL;
> +	if (wa->time.tm_sec  > 59)
> +		return -EINVAL;
> +
> +	ttime.tv_sec = wa->time.tm_hour * 3600 +
> +	  wa->time.tm_min * 60 + wa->time.tm_sec;
> +	ttime.tv_nsec = 0;
> +	if (hp_sdc_rtc_set_mt(&ttime))
> +		return -EIO;
> +
> +	return 0;
>  }
>  
> -static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
> +static int hp_sdc_rtc_proc(struct device *dev, struct seq_file *m)
>  {
>  #define YN(bit) ("no")
>  #define NY(bit) ("yes")
> @@ -442,11 +467,10 @@ static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
>  	} else {
>  		seq_printf(m,
>  			     "rtc_time\t: %02d:%02d:%02d\n"
> -			     "rtc_date\t: %04d-%02d-%02d\n"
> -			     "rtc_epoch\t: %04lu\n",
> +			     "rtc_date\t: %04d-%02d-%02d\n",
>  			     tm.tm_hour, tm.tm_min, tm.tm_sec,
>  			     tm.tm_year + 1900, tm.tm_mon + 1, 
> -			     tm.tm_mday, epoch);
> +			     tm.tm_mday);
>  	}
>  
>  	if (hp_sdc_rtc_read_rt(&tv)) {
> @@ -509,185 +533,42 @@ static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
>  #undef NY
>  }
>  
> -static int hp_sdc_rtc_ioctl(struct file *file, 
> +static int hp_sdc_rtc_ioctl(struct device *dev,
>  			    unsigned int cmd, unsigned long arg)
>  {
> -#if 1
> -	return -EINVAL;
> -#else
> -	
> -        struct rtc_time wtime; 
> -	struct timeval ttime;
> -	int use_wtime = 0;
> -
> -	/* This needs major work. */
> -
> -        switch (cmd) {
> -
> -        case RTC_AIE_OFF:       /* Mask alarm int. enab. bit    */
> -        case RTC_AIE_ON:        /* Allow alarm interrupts.      */
> +	switch (cmd) {
> +	case RTC_AIE_OFF:       /* Mask alarm int. enab. bit    */
> +	case RTC_AIE_ON:        /* Allow alarm interrupts.      */
>  	case RTC_PIE_OFF:       /* Mask periodic int. enab. bit */
> -        case RTC_PIE_ON:        /* Allow periodic ints          */
> -        case RTC_UIE_ON:        /* Allow ints for RTC updates.  */
> -        case RTC_UIE_OFF:       /* Allow ints for RTC updates.  */
> -        {
> +	case RTC_PIE_ON:        /* Allow periodic ints          */
> +	case RTC_UIE_ON:        /* Allow ints for RTC updates.  */
> +	case RTC_UIE_OFF:       /* Allow ints for RTC updates.  */
> +	{
>  		/* We cannot mask individual user timers and we
>  		   cannot tell them apart when they occur, so it 
>  		   would be disingenuous to succeed these IOCTLs */
>  		return -EINVAL;
> -        }
> -        case RTC_ALM_READ:      /* Read the present alarm time */
> -        {
> -		if (hp_sdc_rtc_read_mt(&ttime)) return -EFAULT;
> -		if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
> -
> -		wtime.tm_hour = ttime.tv_sec / 3600;  ttime.tv_sec %= 3600;
> -		wtime.tm_min  = ttime.tv_sec / 60;    ttime.tv_sec %= 60;
> -		wtime.tm_sec  = ttime.tv_sec;
> -                
> -		break;
> -        }
> -        case RTC_IRQP_READ:     /* Read the periodic IRQ rate.  */
> -        {
> -                return put_user(hp_sdc_rtc_freq, (unsigned long *)arg);
> -        }
> -        case RTC_IRQP_SET:      /* Set periodic IRQ rate.       */
> -        {
> -                /* 
> -                 * The max we can do is 100Hz.
> -		 */
> -
> -                if ((arg < 1) || (arg > 100)) return -EINVAL;
> -		ttime.tv_sec = 0;
> -		ttime.tv_usec = 1000000 / arg;
> -		if (hp_sdc_rtc_set_ct(&ttime)) return -EFAULT;
> -		hp_sdc_rtc_freq = arg;
> -                return 0;
> -        }
> -        case RTC_ALM_SET:       /* Store a time into the alarm */
> -        {
> -                /*
> -                 * This expects a struct hp_sdc_rtc_time. Writing 0xff means
> -                 * "don't care" or "match all" for PC timers.  The HP SDC
> -		 * does not support that perk, but it could be emulated fairly
> -		 * easily.  Only the tm_hour, tm_min and tm_sec are used.
> -		 * We could do it with 10ms accuracy with the HP SDC, if the 
> -		 * rtc interface left us a way to do that.
> -                 */
> -                struct hp_sdc_rtc_time alm_tm;
> -
> -                if (copy_from_user(&alm_tm, (struct hp_sdc_rtc_time*)arg,
> -                                   sizeof(struct hp_sdc_rtc_time)))
> -                       return -EFAULT;
> -
> -                if (alm_tm.tm_hour > 23) return -EINVAL;
> -		if (alm_tm.tm_min  > 59) return -EINVAL;
> -		if (alm_tm.tm_sec  > 59) return -EINVAL;  
> -
> -		ttime.sec = alm_tm.tm_hour * 3600 + 
> -		  alm_tm.tm_min * 60 + alm_tm.tm_sec;
> -		ttime.usec = 0;
> -		if (hp_sdc_rtc_set_mt(&ttime)) return -EFAULT;
> -                return 0;
> -        }
> -        case RTC_RD_TIME:       /* Read the time/date from RTC  */
> -        {
> -		if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
> -                break;
> -        }
> -        case RTC_SET_TIME:      /* Set the RTC */
> -        {
> -                struct rtc_time hp_sdc_rtc_tm;
> -                unsigned char mon, day, hrs, min, sec, leap_yr;
> -                unsigned int yrs;
> -
> -                if (!capable(CAP_SYS_TIME))
> -                        return -EACCES;
> -		if (copy_from_user(&hp_sdc_rtc_tm, (struct rtc_time *)arg,
> -                                   sizeof(struct rtc_time)))
> -                        return -EFAULT;
> -
> -                yrs = hp_sdc_rtc_tm.tm_year + 1900;
> -                mon = hp_sdc_rtc_tm.tm_mon + 1;   /* tm_mon starts at zero */
> -                day = hp_sdc_rtc_tm.tm_mday;
> -                hrs = hp_sdc_rtc_tm.tm_hour;
> -                min = hp_sdc_rtc_tm.tm_min;
> -                sec = hp_sdc_rtc_tm.tm_sec;
> -
> -                if (yrs < 1970)
> -                        return -EINVAL;
> -
> -                leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
> -
> -                if ((mon > 12) || (day == 0))
> -                        return -EINVAL;
> -                if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
> -                        return -EINVAL;
> -		if ((hrs >= 24) || (min >= 60) || (sec >= 60))
> -                        return -EINVAL;
> -
> -                if ((yrs -= eH) > 255)    /* They are unsigned */
> -                        return -EINVAL;
> -
> -
> -                return 0;
> -        }
> -        case RTC_EPOCH_READ:    /* Read the epoch.      */
> -        {
> -                return put_user (epoch, (unsigned long *)arg);
> -        }
> -        case RTC_EPOCH_SET:     /* Set the epoch.       */
> -        {
> -                /* 
> -                 * There were no RTC clocks before 1900.
> -                 */
> -                if (arg < 1900)
> -		  return -EINVAL;
> -		if (!capable(CAP_SYS_TIME))
> -		  return -EACCES;
> -		
> -                epoch = arg;
> -                return 0;
> -        }
> -        default:
> -                return -EINVAL;
> -        }
> -        return copy_to_user((void *)arg, &wtime, sizeof wtime) ? -EFAULT : 0;
> -#endif
> -}
> -
> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
> -				      unsigned int cmd, unsigned long arg)
> -{
> -	int ret;
> -
> -	mutex_lock(&hp_sdc_rtc_mutex);
> -	ret = hp_sdc_rtc_ioctl(file, cmd, arg);
> -	mutex_unlock(&hp_sdc_rtc_mutex);
> -
> -	return ret;
> +	}
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +	return 0;
>  }
>  
> -
> -static const struct file_operations hp_sdc_rtc_fops = {
> -        .owner =		THIS_MODULE,
> -        .llseek =		no_llseek,
> -        .read =			hp_sdc_rtc_read,
> -        .poll =			hp_sdc_rtc_poll,
> -        .unlocked_ioctl =	hp_sdc_rtc_unlocked_ioctl,
> -        .open =			hp_sdc_rtc_open,
> -        .fasync =		hp_sdc_rtc_fasync,
> -};
> -
> -static struct miscdevice hp_sdc_rtc_dev = {
> -        .minor =	RTC_MINOR,
> -        .name =		"rtc_HIL",
> -        .fops =		&hp_sdc_rtc_fops
> +static const struct rtc_class_ops hp_sdc_rtc_ops = {
> +	.ioctl = hp_sdc_rtc_ioctl,
> +	.proc = hp_sdc_rtc_proc,
> +	.read_time = hp_sdc_rtc_get_time,
> +	.set_time = hp_sdc_rtc_set_time,
> +	.read_alarm = hp_sdc_rtc_read_alarm,
> +	.set_alarm = hp_sdc_rtc_set_alarm,
> +	// int (*alarm_irq_enable)(struct device *, unsigned int enabled);
>  };
>  
>  static int __init hp_sdc_rtc_init(void)
>  {
>  	int ret;
> +	struct rtc_time tm;
>  
>  #ifdef __mc68000__
>  	if (!MACH_IS_HP300)
> @@ -696,14 +577,22 @@ static int __init hp_sdc_rtc_init(void)
>  
>  	sema_init(&i8042tregs, 1);
>  
> +	/* check if BBRTC is available */
> +	ret = hp_sdc_rtc_read_bbrtc(&tm);
> +	if (ret) {
> +		pr_info("hil-rtc: BBRTC not available.");
> +		return -ENODEV;
> +	}
> +
>  	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
>  		return ret;
> -	if (misc_register(&hp_sdc_rtc_dev) != 0)
> -		printk(KERN_INFO "Could not register misc. dev for i8042 rtc\n");
>  
> -        proc_create_single("driver/rtc", 0, NULL, hp_sdc_rtc_proc_show);
> +	rtc = devm_rtc_device_register(hp_sdc_get_sdc_device(),
> +			"hil-rtc", &hp_sdc_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(rtc))
> +		return PTR_ERR(rtc);
>  
> -	printk(KERN_INFO "HP i8042 SDC + MSM-58321 RTC support loaded "
> +	pr_info("hil-rtc: HP i8042 SDC + MSM-58321 RTC support loaded "
>  			 "(RTC v " RTC_VERSION ")\n");
>  
>  	return 0;
> @@ -711,10 +600,9 @@ static int __init hp_sdc_rtc_init(void)
>  
>  static void __exit hp_sdc_rtc_exit(void)
>  {
> -	remove_proc_entry ("driver/rtc", NULL);
> -        misc_deregister(&hp_sdc_rtc_dev);
> +	devm_rtc_device_unregister(hp_sdc_get_sdc_device(), rtc);
>  	hp_sdc_release_timer_irq(hp_sdc_rtc_isr);
> -        printk(KERN_INFO "HP i8042 SDC + MSM-58321 RTC support unloaded\n");
> +	pr_info("hil-rtc: HP i8042 SDC + MSM-58321 RTC support unloaded\n");
>  }
>  
>  module_init(hp_sdc_rtc_init);
> diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
> index 0b8a25c58d02..3e0ad6a4907f 100644
> --- a/drivers/input/serio/hp_sdc.c
> +++ b/drivers/input/serio/hp_sdc.c
> @@ -110,6 +110,17 @@ MODULE_PARM_DESC(no_hpsdc, "Do not enable HP SDC driver.");
>  
>  static hp_i8042_sdc	hp_sdc;	/* All driver state is kept in here. */
>  
> +struct device *hp_sdc_get_sdc_device(void)
> +{
> +#if defined(__hppa__)
> +	return &hp_sdc.dev->dev;
> +#elif defined(__mc68000__)
> +	/* hp_sdc.dev is 1, so return NULL instead. */
> +	return NULL;
> +#endif
> +}
> +EXPORT_SYMBOL(hp_sdc_get_sdc_device);
> +
>  /*************** primitives for use in any context *********************/
>  static inline uint8_t hp_sdc_status_in8(void)
>  {
> diff --git a/include/linux/hp_sdc.h b/include/linux/hp_sdc.h
> index 6f1dee7e67e0..8988e32adebd 100644
> --- a/include/linux/hp_sdc.h
> +++ b/include/linux/hp_sdc.h
> @@ -298,4 +298,6 @@ typedef struct {
>  
>  } hp_i8042_sdc;
>  
> +struct device *hp_sdc_get_sdc_device(void);
> +
>  #endif /* _LINUX_HP_SDC_H */
> 
