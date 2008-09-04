From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: NTPL transition
Date: Thu, 04 Sep 2008 12:52:44 -0500
Message-ID: <1220550764.3276.45.camel@localhost.localdomain>
References: <20080904114551.GA18877@tilt.dandreoli.com>
	 <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
	 <20080904152329.GA24316@colo.lackof.org>
	 <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com>
	 <20080904160407.GB24316@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080904160407.GB24316@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2008-09-04 at 10:04 -0600, dann frazier wrote:
> On Thu, Sep 04, 2008 at 11:31:52AM -0400, Carlos O'Donell wrote:
> > On Thu, Sep 4, 2008 at 11:23 AM, dann frazier <dannf@dannf.org> wrote:
> > > I've already done the initial bootstrapping and John Wright and I have
> > > a buildd actively rebuilding bits against sid. We're rsyncing the
> > > results out to here:
> > >  http://parisc-linux.org/~dannf/hppa-nptl-mirror/unstable/
> > >
> > > Suffice to say, the rebuild is going fairly smoothly. But, I wonder
> > > how we're going to transition systems over to an NPTL userspace. Does
> > > anyone have a plan for that?
> > 
> > Isn't this the responsibility of the package manager?
> > 
> > Why wouldn't apt-get dist-upgrade work?
> 
> We had a discussion about this on IRC, a while back, let me see if I
> can recap...
> 
> If we continue to use libc6 as the package name as we're currently
> doing, at some point libc will get upgraded to the NPTL interface and
> things will start crashing immediately. I asked if we could just do
> "whatever x86 did", and kyle said that we have a problem they didn't -
> our data nptl/lt data structures are incompatible.
> 
> We can deal with that to an extent by adding a second libc package,
> e.g., libc6.1. But, jejb pointed out that, since most libs depend on
> libc, we'll need to be able to have libs for both interfaces at the
> same time to support a transitional upgrade - and that implies an
> SONAME bump for every C library.
> 
> Hopefully there's an easier way, but I don't know of one.

Can we go via an intermediate library that would coexist with current
glibc?  Something like libc6-nptl, then we do the transitional update
with the tools and other libraries moving over to libc6-nptl, then the
final piece of the upgrade is libc6 going to nptl based libc6.1 and we
remove the transitional libc6-nptl?  This type of flip will have to be
done via ld.so.conf magic, but it should be doable.

James


