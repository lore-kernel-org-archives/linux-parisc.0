From: Domenico Andreoli <cavok@dandreoli.com>
Subject: Re: NTPL transition
Date: Fri, 5 Sep 2008 01:26:38 +0200
Message-ID: <20080904232638.GB25926@tilt.dandreoli.com>
References: <20080904114551.GA18877@tilt.dandreoli.com> <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com> <20080904152329.GA24316@colo.lackof.org> <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com> <20080904160407.GB24316@colo.lackof.org> <1220550764.3276.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dann frazier <dannf@dannf.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220550764.3276.45.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 04, 2008 at 12:52:44PM -0500, James Bottomley wrote:
> On Thu, 2008-09-04 at 10:04 -0600, dann frazier wrote:
> > 
> > We had a discussion about this on IRC, a while back, let me see if I
> > can recap...
> > 
> > If we continue to use libc6 as the package name as we're currently
> > doing, at some point libc will get upgraded to the NPTL interface and
> > things will start crashing immediately. I asked if we could just do
> > "whatever x86 did", and kyle said that we have a problem they didn't -
> > our data nptl/lt data structures are incompatible.
> > 
> > We can deal with that to an extent by adding a second libc package,
> > e.g., libc6.1. But, jejb pointed out that, since most libs depend on
> > libc, we'll need to be able to have libs for both interfaces at the
> > same time to support a transitional upgrade - and that implies an
> > SONAME bump for every C library.
> > 
> > Hopefully there's an easier way, but I don't know of one.
> 
> Can we go via an intermediate library that would coexist with current
> glibc?  Something like libc6-nptl, then we do the transitional update
> with the tools and other libraries moving over to libc6-nptl, then the
> final piece of the upgrade is libc6 going to nptl based libc6.1 and we
> remove the transitional libc6-nptl?  This type of flip will have to be
> done via ld.so.conf magic, but it should be doable.

Is it possible to export two different symbols based on the version
used at link time?

This way it would remain libc6, all the pre-existing binaries would use
the older interface wrapped around the new one. Of course newly built
packages would link with the new interface.

ciao,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
