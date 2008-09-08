From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 16:43:05 -0700 (PDT)
Message-ID: <20080908.164305.140831737.davem@davemloft.net>
References: <1220914847.8074.81.camel@localhost.localdomain>
	<20080908.160441.124972717.davem@davemloft.net>
	<1220916186.8074.84.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: david-b@pacbell.net, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220916186.8074.84.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Mon, 08 Sep 2008 18:23:06 -0500

> But realistically that's all we need.  Our RTC is controlled by two
> calls into firmware: a get and a set; nothing else.  We don't have the
> docs to get at the clock without the firmware calls.

I wrote RTC layer drivers on sparc64 that make the firmware calls in
the Niagara system case, exactly like your case.

Really, this is the way to do this.

Since you're not reading what I implemented, I'll read it for you :-/

See drivers/rtc/rtc-sun4v.c, that's the driver

Code in arch/sparc64/kernel/time.c creates and registers the
appropriate platform_device object once the correct system type is
detected, and then rtc-sun4v.c attaches when such objects have been
registered.

Likewise for all the other RTC types that can be found on Sparc machines.
