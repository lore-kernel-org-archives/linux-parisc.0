Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 398CF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 10:13:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15fOFj-0007f0-00; Fri, 07 Sep 2001 17:13:11 +0100
Date: Fri, 7 Sep 2001 17:13:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: Galen Arnold <arnoldg@ncsa.uiuc.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: smp kernel hangs during boot on L2000 ... (fwd)
Message-ID: <20010907171311.D23780@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0109070842320.13232-100000@osage.ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109070842320.13232-100000@osage.ncsa.uiuc.edu>; from arnoldg@ncsa.uiuc.edu on Fri, Sep 07, 2001 at 08:42:56AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 07, 2001 at 08:42:56AM -0500, Galen Arnold forwarded:
> > Initialized PDC Console for debu
> >                                 ^^^^^hangs right there...
> >

> I've done most of my SMP development on a 4 CPU L2000.  So far I've only
> tested a SMP kernel on a L2000 (64 bit) and a J5000 (32 & 64 bit).
> However, I have 440 Mhz PA8500 CPU's.  That shouldn't make a significant
> difference, other than some possible timing problem.  I'll try to test on
> a 2 CPU A500 with PA8600 CPU's on Monday just in case.

I can't imagine that's likely either.  One difference is that I believe
a two-cpu L2k shows up with CPUs 0 and 3 rather than 0 and 1.  Maybe we have
a problem there.  John, could you try disabling cpus 1 and 2 on the L2k?

Galen, how about trying booting the same SMP kernel, but disable the
second CPU at the pdc prompt?  That might help narrow down the problem
a little.

-- 
Revolutions do not require corporate support.
