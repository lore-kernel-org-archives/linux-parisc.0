From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Mon, 08 Sep 2008 10:43:03 -0500
Message-ID: <1220888583.8074.10.camel@localhost.localdomain>
References: <1220713586.3430.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: waldi@debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220713586.3430.14.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2008-09-06 at 10:06 -0500, James Bottomley wrote:
> Parisc is a CONFIG_GEN_RTC architecture (we use the generic real time
> clock driver).  Starting with 2.6.26, debian is now enabling
> CONFIG_RTC_CLASS (for platforms with specific RTC drivers) which
> disables CONFIG_GEN_RTC and means that hwclock (and ntp tracking) are
> broken on parisc with debian kernels 2.6.26 and above.
> 
> All of the arch/parisc/config files get this right, so someone at debian
> must have screwed up somehow.  The config option CONFIG_RTC_CLASS must
> be set to 'N' for all parisc systems.  I'd suggest checking the debian
> kernel configs against the in-tree default files to see if there are any
> other cockups like this.

OK, I dug into this.  The problem with debian is that CONFIG_RTC_CLASS
is set in the generic configuration and from 2.6.26 onwards
CONFIG_GEN_RTC is overridden by this (that's the reason we don't see it
on our local configs).  I'm not entirely sure what the correct fix is.
It looks like GEN_RTC is being deprecated, so it might be to move to
RTC_CLASS.  I think the best thing is for me to try to put an arch
override for RTC_CLASS and see what the reaction is.

In the meantime, you can get a working debian kernel here:

http://parisc-linux.org/~jejb/linux-image-2.6.26-1-parisc_2.6.26-4+b1_hppa.deb

James


