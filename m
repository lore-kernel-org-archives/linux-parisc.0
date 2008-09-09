From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 09 Sep 2008 12:53:52 -0500
Message-ID: <1220982832.3334.34.camel@localhost.localdomain>
References: <1220713586.3430.14.camel@localhost.localdomain>
	 <20080908163703.GA3218@wavehammer.waldi.eu.org>
	 <1220893102.8074.41.camel@localhost.localdomain>
	 <20080909165835.GB1447@colo.lackof.org>
	 <20080909173837.GA1457@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: debian-kernel@lists.debian.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: Bastian Blank <waldi@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080909173837.GA1457@wavehammer.waldi.eu.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2008-09-09 at 19:38 +0200, Bastian Blank wrote:
> On Tue, Sep 09, 2008 at 10:58:35AM -0600, dann frazier wrote:
> > fyi, I've got an hppa build in progress - disabling RTC_CLASS causes
> > the symbols below to be removed (essentially, ^rtc_*)
> 
> The whole new-style rtc support.

But it doesn't work, that's rather the point of all of this.  If it
doesn't work, it can hardly be a committed ABI.

> > I'm not sure what's behind the hppa/ABI removal commits - I didn't see
> > this discussed on the list - but I think it should be safe to remove
> > these symbols from the ABI files if we can demonstrate that none of
> > the conglomerate packages use them.
> 
> Why does noone write this 30 lines module and fix it for all?

Because only an idiot would fix a bug in a released product by
introducing a new feature: that's QA and release process 101.  New
features belong in the next merge window, which will be for 2.6.28 by
which time it should have been reasonably QA'd by the parisc developers.

James


