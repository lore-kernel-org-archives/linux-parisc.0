From: Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Tue, 9 Sep 2008 11:22:48 +1000
Message-ID: <18629.53224.103107.523514@drongo.ozlabs.ibm.com>
References: <1220914847.8074.81.camel@localhost.localdomain>
	<20080908.160441.124972717.davem@davemloft.net>
	<200809081629.21125.david-b@pacbell.net>
	<20080908.164427.216880550.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: david-b@pacbell.net, James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	alessandro.zummo@towertech.it
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080908.164427.216880550.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

David Miller writes:

> int update_persistent_clock(struct timespec now)
> {
> 	struct rtc_device *rtc = rtc_class_open("rtc0");
> 
> 	if (rtc)
> 		return rtc_set_mmss(rtc, now.tv_sec);
> 
> 	return -1;
> }
> 
> and that should handle this NTP shouldn't it?

Yes as long as your rtc set functions don't need to sleep, since
update_persistent_clock is called at interrupt level.  Some powerpc
systems have their RTC at the far end of an I2C bus, and the I2C
access routines can sleep.

Paul.
