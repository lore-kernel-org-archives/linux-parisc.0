From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at
 lib/timerqueue.c:74
Date: Thu, 21 Mar 2013 15:57:04 +0100
Message-ID: <20130321155704.7aeaf169@marga.jer-c2.orkz.net>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net>
	<BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl>
	<20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
	<5148E903.1020105@gmx.de>
	<20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
	<514A183A.7090809@bell.net>
	<BLU0-SMTP790A969254E562667034B397EB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: John David Anglin <dave.anglin@bell.net>,
	Helge Deller <deller@gmx.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP790A969254E562667034B397EB0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 20 Mar 2013 22:02:55 -0400
John David Anglin <dave.anglin@bell.net> wrote:

> On 20-Mar-13, at 4:12 PM, John David Anglin wrote:
> 
> > On 3/20/2013 1:27 PM, Jeroen Roovers wrote:
> >> +CONFIG_PREEMPT_NONE=y
> > Given that CONFIG_PREEMPT is broken, we must be missing at least one
> > preempt_disable()/preempt_enable() pair.
> 
> 
> You might try the attached change.  My rp3440 booted with  
> CONFIG_PREEMPT=y
> and CONFIG_PREEMPT_NONE=y with it.  The fix is just a guess.

That gave me the exact same error.


     jer
