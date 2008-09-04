From: Domenico Andreoli <cavok@dandreoli.com>
Subject: Re: NTPL transition
Date: Fri, 5 Sep 2008 01:22:57 +0200
Message-ID: <20080904232257.GA25926@tilt.dandreoli.com>
References: <20080904114551.GA18877@tilt.dandreoli.com> <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com> <20080904152329.GA24316@colo.lackof.org> <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com> <20080904160407.GB24316@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080904160407.GB24316@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 04, 2008 at 10:04:07AM -0600, dann frazier wrote:
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

I am not understanding why "we'll need to be able to have libs for both
interfaces at the same time to support a transitional upgrade".

Suppose the new libc6 (LT) is a compatibility wrapper around new libc6.1
(NPTL). The remainder is really an apt's job.

cheers,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
