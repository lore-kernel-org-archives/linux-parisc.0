Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F29E5482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 16:24:53 -0600 (MDT)
Message-Id: <200104142218.QAA30044@puffin.external.hp.com>
To: amodra@one.net.au
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem 
In-Reply-To: Your message of "Sat, 14 Apr 2001 21:25:57 +0930."
             <20010414212557.E16364@squeak.one.net.au>
Date: Sat, 14 Apr 2001 16:18:47 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

amodra@one.net.au wrote:
> > 2) c++ isn't returning the error reported by collect2
> >    Fortunately the build soon dies since the expected product
> >    doesn't exist. Known problem?
> 
> Are you sure about this statement?  It might just be "make" (the presense
> of those `+'s is ringing bells with me but I don't recall the exact
> signifigance.)

I'm not. It might be a make bug.
I've seen make say something like "[ ... ignored ]" when ignoring an error.

Anyway, after spending another two hours on the -fPIC problem, I'm
starting to think the xfree86 lib build is broken by design for __hppa__.
I'll send out another mail with a patch + recipe for building the libs.
I'm pretty close to finding workarounds (not solutions) for the problems.

Do other arches allow non-PIC .o's to be linked into a .so lib?

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
