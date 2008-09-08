From: Bastian Blank <waldi@debian.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Mon, 8 Sep 2008 18:37:04 +0200
Message-ID: <20080908163703.GA3218@wavehammer.waldi.eu.org>
References: <1220713586.3430.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	debian-kernel@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220713586.3430.14.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Sep 06, 2008 at 10:06:26AM -0500, James Bottomley wrote:
> Parisc is a CONFIG_GEN_RTC architecture (we use the generic real time
> clock driver).

Well.

>                 Starting with 2.6.26, debian is now enabling
> CONFIG_RTC_CLASS (for platforms with specific RTC drivers) which
> disables CONFIG_GEN_RTC and means that hwclock (and ntp tracking) are
> broken on parisc with debian kernels 2.6.26 and above.

Yes. Most arches already needs it anyway.

> All of the arch/parisc/config files get this right, so someone at debian
> must have screwed up somehow.  The config option CONFIG_RTC_CLASS must
> be set to 'N' for all parisc systems.

Apparently hppa uses its special rtc type.  I propose that you take a
look at drivers/rtc/rtc-ppc.c and write a wrapper rtc module.

>                                        I'd suggest checking the debian
> kernel configs against the in-tree default files to see if there are any
> other cockups like this.

If there are, this are bugs in the kernel themself. I'm no hppa
developer so I won't waste my time with such.

Bastian

-- 
Those who hate and fight must stop themselves -- otherwise it is not stopped.
		-- Spock, "Day of the Dove", stardate unknown
