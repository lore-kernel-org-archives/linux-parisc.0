From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 16:29:20 -0700
Message-ID: <200809081629.21125.david-b@pacbell.net>
References: <200809081429.57805.david-b@pacbell.net> <1220914847.8074.81.camel@localhost.localdomain> <20080908.160441.124972717.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Alessandro Zummo <alessandro.zummo@towertech.it>
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080908.160441.124972717.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, David Miller wrote:
> I think the powerpc folks did the wrong thing and should just register
> generic platform_device objects in their platform code, and let the
> RTC layer drive the individual devices in response.

I kind of thought that was a migration aid ... 


> All the powerpc folks are doing is providing a dummy shim into the
> RTC layer using their machine description vector, and not really using
> the RTC layer drivers at all.

I basically agree.  There's functional overlap between those
machine descriptions and the RTC framework, and it should be
removed (by shrinking those descriptions).  The shim gets
/dev/rtcN support, and thus hwclock; also /sys/class/rtc/*
stuff.  But no wake alarms...


That said, there's a bit of unresolved stuff around NTP hooks
in the kernel.  Some patches are pending to let thtem work with
the RTC framework -- where writing an RTC may need to sleep,
for example because the RTC is on an I2C or SPI bus.  And
then there's the discussion of whether that shouldn't all be
handled by NTPD anyway, no special kernel support desired.
Alessandro has opinions there.  ;)

ISTR that was a factor in the powerpc taking that "sideways"
step.  Or if not powerpc, then some other arch.

- Dave

