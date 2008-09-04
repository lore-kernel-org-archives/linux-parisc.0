From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Thu, 4 Sep 2008 13:29:06 -0400
Message-ID: <119aab440809041029v6d7592bau15a2307099e5f02e@mail.gmail.com>
References: <20080904114551.GA18877@tilt.dandreoli.com>
	 <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
	 <20080904152329.GA24316@colo.lackof.org>
	 <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com>
	 <20080904160407.GB24316@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Debian HPPA Port List" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "dann frazier" <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080904160407.GB24316@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 4, 2008 at 12:04 PM, dann frazier <dannf@dannf.org> wrote:
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

How far away is queeze?

I have to go write some, code, and test some changes, and get back to
the list with some options.

Namely:

Is it possible to change the pthread structures such that writing the
compatibility code is easy?
- Leave padding where the old lock words were and detect statically
initialized locks by looking at these words?
- Does this break Gentoo? I think they just emerge world.
- Does this break Ubuntu hppa? Probably.

Chers,
Carlos.
