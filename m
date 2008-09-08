From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 16:44:27 -0700 (PDT)
Message-ID: <20080908.164427.216880550.davem@davemloft.net>
References: <1220914847.8074.81.camel@localhost.localdomain>
	<20080908.160441.124972717.davem@davemloft.net>
	<200809081629.21125.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	alessandro.zummo@towertech.it
To: david-b@pacbell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809081629.21125.david-b@pacbell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: David Brownell <david-b@pacbell.net>
Date: Mon, 8 Sep 2008 16:29:20 -0700

> That said, there's a bit of unresolved stuff around NTP hooks
> in the kernel.  Some patches are pending to let thtem work with
> the RTC framework -- where writing an RTC may need to sleep,
> for example because the RTC is on an I2C or SPI bus.  And
> then there's the discussion of whether that shouldn't all be
> handled by NTPD anyway, no special kernel support desired.
> Alessandro has opinions there.  ;)

My update_persistent_clock() on sparc64 is:

int update_persistent_clock(struct timespec now)
{
	struct rtc_device *rtc = rtc_class_open("rtc0");

	if (rtc)
		return rtc_set_mmss(rtc, now.tv_sec);

	return -1;
}

and that should handle this NTP shouldn't it?
