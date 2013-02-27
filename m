From: Helge Deller <deller@gmx.de>
Subject: parisc: check return value of down_interruptible() in hp_sdc_rtc.c
Date: Wed, 27 Feb 2013 23:22:23 +0100
Message-ID: <20130227222223.GA2941@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 42dfe13d133f945b49377c29b8c828205b231b4c
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 22:46:56 2013 +0100

parisc: check return value of down_interruptible() in hp_sdc_rtc.c

additionally comment out unused code (which may be used later)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
index 0b4f542..2e3334b 100644
--- a/drivers/input/misc/hp_sdc_rtc.c
+++ b/drivers/input/misc/hp_sdc_rtc.c
@@ -109,7 +109,9 @@ static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
 	
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&tsem);  /* Put ourselves to sleep for results. */
+	/* Put ourselves to sleep for results. */
+	if (WARN_ON(down_interruptible(&tsem)))
+		return -1;
 	
 	/* Check for nonpresence of BBRTC */
 	if (!((tseq[83] | tseq[90] | tseq[69] | tseq[76] |
@@ -176,11 +178,16 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
 	t.seq =			tseq;
 	t.act.semaphore =	&i8042tregs;
 
-	down_interruptible(&i8042tregs);  /* Sleep if output regs in use. */
+	/* Sleep if output regs in use. */
+	if (WARN_ON(down_interruptible(&i8042tregs)))
+		return -1;
 
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&i8042tregs);  /* Sleep until results come back. */
+	/* Sleep until results come back. */
+	if (WARN_ON(down_interruptible(&i8042tregs)))
+		return -1;
+
 	up(&i8042tregs);
 
 	return (tseq[5] | 
@@ -276,6 +283,7 @@ static inline int hp_sdc_rtc_read_ct(struct timeval *res) {
 }
 
 
+#if 0 /* not used yet */
 /* Set the i8042 real-time clock */
 static int hp_sdc_rtc_set_rt (struct timeval *setto)
 {
@@ -386,6 +394,7 @@ static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
 	}
 	return 0;
 }
+#endif
 
 static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
 			       size_t count, loff_t *ppos) {
