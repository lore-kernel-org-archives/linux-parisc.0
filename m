Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6DCA482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 05:17:09 -0600 (MDT)
Date: Tue, 28 Aug 2001 07:17:43 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828071743.A1289@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Aug 28, 2001 at 06:10:37AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > And applied glibc_2.2.4-1.diff from same directory.
> 
> 2.2.4-1 doesn't build.  I haven't investigated in any detail, but it gets
> further than your build error indicates.  Use dpkg-buildpackage to build
> it... and you need to uncomment the hppa-specific patch in 0list... and
> you need to edit the patch anyway to get it to apply...
> 
> I have no enthusiasm for working on glibc.  Please, someone, take it
> off my hands.
> 
> -- 
> Revolutions do not require corporate support.
>

I have also tried building 2.2.4 without the diff, but with no success.

What would be the responsibilities of said maintianer?

The small fact that "uncomment the hppa-specific patch in 0list" means
little to nothing to me ;) ... is probably an indication that I'm not
experienced enough to take on glibc.

Seeing as you are the current glibc maintainer, my question would be:
What type of process do you follow for maintaining glibc?

a) Kick machine until glibc works.
b) Throw machines out window until glibc works.
c) Wait. Glibc will fix itself.
d) Who nees glibc? PARISC ASM!
e) Stay up many hours extracting those pesky pieces that don't work with HPPA.

Thanks for all the invaluable help Matthew! :}

I promise to try and stop doing crazy things like building the toolchain
by hand ;)

Cheers,
Carlos
