Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E8F9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 13:45:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bonD-00057g-00; Tue, 28 Aug 2001 20:44:59 +0100
Date: Tue, 28 Aug 2001 20:44:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828204458.B2995@parcelfarce.linux.theplanet.co.uk>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net> <20010828155619.I18341@parcelfarce.linux.theplanet.co.uk> <20010828112900.B30657@megatonmonkey.net> <20010828194713.A2995@parcelfarce.linux.theplanet.co.uk> <20010828152221.B4741@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828152221.B4741@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 03:22:21PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 28, 2001 at 03:22:21PM -0400, Carlos O'Donell Jr. wrote:
> That's odd, I built it fine.

Yes, but you were crosscompiling.  `make install' is very different
with a crossbuild.

> What is running at the moment? One of the binutils or gcc?
> It should most definately not segfault in any of the _dl_xxxxx routines ;)

THe program which is being run is
/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/timezone/zic; glibc
is making sure it's run with the new ld.so and all the new versions of
the libs.

Have you actually tried installing glibc 2.2.4-1 on a live system and
running programs with it?

> I grabbed the glibc2.2.4 from the debian pool (orig.tar.gz), then applied
> the 2.2.4-1 patch, followed by running the glibc22-hppa.dpatch (since I
> don't have any deb tools).
> 
> The last two patches should probably have been run in the reverse order,
> could this be the crux?

It's more likely that one of the other debian patches conflicts with
what we're doing.  The debian/rules file will apply the patches in the
debian/patches directory in the order given by debian/patches/0list.
I seem to remember a couple of other diffs that need to get applied...

> I'm still very confused about the ia64 stuff that wants to get touched
> by the glibc22-hppa.dpatch?

That's changing all the testandset to trylock.

-- 
Revolutions do not require corporate support.
