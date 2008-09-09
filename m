From: dann frazier <dannf@dannf.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 10:58:35 -0600
Message-ID: <20080909165835.GB1447@colo.lackof.org>
References: <1220713586.3430.14.camel@localhost.localdomain> <20080908163703.GA3218@wavehammer.waldi.eu.org> <1220893102.8074.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bastian Blank <waldi@debian.org>, debian-kernel@lists.debian.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220893102.8074.41.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Sep 08, 2008 at 11:58:22AM -0500, James Bottomley wrote:
> On Mon, 2008-09-08 at 18:37 +0200, Bastian Blank wrote:
> > On Sat, Sep 06, 2008 at 10:06:26AM -0500, James Bottomley wrote:
> > > Parisc is a CONFIG_GEN_RTC architecture (we use the generic real time
> > > clock driver).
> > 
> > Well.
> > 
> > >                 Starting with 2.6.26, debian is now enabling
> > > CONFIG_RTC_CLASS (for platforms with specific RTC drivers) which
> > > disables CONFIG_GEN_RTC and means that hwclock (and ntp tracking) are
> > > broken on parisc with debian kernels 2.6.26 and above.
> > 
> > Yes. Most arches already needs it anyway.
> > 
> > > All of the arch/parisc/config files get this right, so someone at debian
> > > must have screwed up somehow.  The config option CONFIG_RTC_CLASS must
> > > be set to 'N' for all parisc systems.
> > 
> > Apparently hppa uses its special rtc type.  I propose that you take a
> > look at drivers/rtc/rtc-ppc.c and write a wrapper rtc module.
> 
> That may be the way forwards depending on what the RTC developers say,
> but it certainly won't fix the 2.6.26 regression.
> 
> > >                                        I'd suggest checking the debian
> > > kernel configs against the in-tree default files to see if there are any
> > > other cockups like this.
> > 
> > If there are, this are bugs in the kernel themself. I'm no hppa
> > developer so I won't waste my time with such.
> 
> Hardly, the bug is actually in the debian configs.  You have
> CONFIG_RTC_CLASS as a generic override.  This is wrong, it needs to be
> subordinate to CONIFG_GEN_RTC.  The quick fix would be to move the
> CONFIG_RTC_CLASS sequence down from generic to the architectures ... if
> you're incapable of doing that, I might be able to find time to look at
> doing it for you.
> 
> The real bug looks to be the debian config system which relies on
> concatenation ... what's really needed is a way of turning
> CONFIG_RTC_CLASS off on parisc while keeping RTC_CLASS generic for those
> architectures that need it.

fyi, I've got an hppa build in progress - disabling RTC_CLASS causes
the symbols below to be removed (essentially, ^rtc_*)

I'm not sure what's behind the hppa/ABI removal commits - I didn't see
this discussed on the list - but I think it should be safe to remove
these symbols from the ABI files if we can demonstrate that none of
the conglomerate packages use them.

rtc_class_close
rtc_class_open
rtc_device_register
rtc_device_unregister
rtc_irq_register
rtc_irq_set_freq
rtc_irq_set_state
rtc_irq_unregister
rtc_month_days
rtc_read_alarm
rtc_read_time
rtc_set_alarm
rtc_set_mmss
rtc_set_time
rtc_time_to_tm
rtc_tm_to_time
rtc_update_irq
rtc_valid_tm
rtc_year_days

-- 
dann frazier

