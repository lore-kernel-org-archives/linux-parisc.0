Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4A30482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 21:36:55 -0600 (MDT)
Date: Tue, 14 Aug 2001 23:37:24 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Message-ID: <20010814233724.I26703@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Aug 15, 2001 at 04:16:10AM +0100
Subject: [parisc-linux] Users staying up to late. ;)
List-ID: <linux-parisc.vger.kernel.org>


> > In general, I don't want to submit a bugreport and have the
> > list say "That's already fixed in the latest updated package" :)
> 
> That's fair enough.

Thanks for all the comments!

> 
> Yes, it does.  Until you've managed to get sully synced up to latest
> toolchain/libs/kernel at which point, it magically stops.
> 

Leading back to my reasoning at the start.
Things magically fix themselves when you get the latest package.
Atleast that's what the developers always say ;)

> > Linux node10 2.4.0 #37 Tue Jul 17 22:33:26 EDT 2001 parisc unknown
>
> OK, you _definitely_ need to update this.  You could pull from CVS or
> grab a snapshot tarball, see the webpages on how to do this.

True. Our nodes aren't running the latest kernel, but now that I see
the myriad of page_faults that many programs are causing, I will
be rolling a new one quite soon.

I had the auto-builder perl script working at one point.
Then I mucked about with it, broke it, and then never used it again.
I should get it going again, have been doing most of the kernel builds
by doing a quick CVS slurp and xcompile (Yes my PIII 450 is much
faster at compiling kernels ;) ... then again so is our newly acquired Dual
PIII 1.0GHz mmmmm.... -j16. god bless funding from the engineering
undergraduate society!)

> 
> I seem to remember someone saying this was a bug in an old version
> of dpkg.  So one way around this may be to dpkg --remove texinfo, then
> install dpkg, then install texinfo again.
>

I will try removing texinfo and then installing dpkg, and tell you 
if that was the fix.

TODO:

- Latest kernel.
- dpkg unintall-install-install.

Muchas gracias senores y senoras!

Cheers,
Carlos
--------------------------
Baldric Project
http://www.baldric.uwo.ca
--------------------------
