Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8BEB482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 May 2001 01:14:34 -0600 (MDT)
Message-Id: <200105060707.BAA05978@puffin.external.hp.com>
To: drepper@cygnus.com (Ulrich Drepper)
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp 
In-Reply-To: Your message of "05 May 2001 23:14:55 PDT."
             <m3d79ngg0w.fsf@otr.mynet>
Date: Sun, 06 May 2001 01:07:56 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Drepper wrote:
> Matthew Wilcox <matthew@wil.cx> writes:
> > On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> > > ....  It might help to do a static link.
> > 
> > this code is in the dynamic linker :-))
> 
> And the problem is?  I debug ld.so as a normal program.  The necessary
> patches I came up with are in the official gdb for quite some time
> now.

Seems Matthew misunderstood the suggestion to use a static link.
I also read jda's comment to mean statically link the target obj.
It's clear now jda meant gdb.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
