From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Wed, 10 Sep 2008 14:40:00 -0700 (PDT)
Message-ID: <20080910.144000.111159506.davem@davemloft.net>
References: <200809101419.05499.david-b@pacbell.net>
	<20080910.142047.265458325.davem@davemloft.net>
	<200809101436.26162.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: rdunlap@xenotime.net, akpm@linux-foundation.org,
	James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, alessandro.zummo@towertech.it,
	tglx@linutronix.de
To: david-b@pacbell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809101436.26162.david-b@pacbell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: David Brownell <david-b@pacbell.net>
Date: Wed, 10 Sep 2008 14:36:25 -0700

> Of course, you're very unlikely to sleep while waiting for that
> mutex; or even while holding it, if you stick to Sun hardware.
> Someone running Linux on one of the FPGA-based SPARCs might well
> use an I2C based RTC though.

There are at least one or two sparc workstations and/or servers that
use an I2C based RTC, I just haven't written the driver yet :)
