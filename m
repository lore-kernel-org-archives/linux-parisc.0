Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6F87482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 22:30:36 -0600 (MDT)
Message-Id: <200104150423.WAA30889@puffin.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem 
In-Reply-To: Your message of "Sun, 15 Apr 2001 00:41:00 BST."
             <E14oZf5-0005mU-00@the-village.bc.nu>
Date: Sat, 14 Apr 2001 22:23:24 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> Did the patches I built to get XFree86 libs building not get as far as you.
> I sent them to Paul (I believe)

nope. On Thursday, paul (Lahaie) forwarded an email from you (Feb 12th)
stating you would dig up the patches for him but no patches.I pointed
this out to paul but he didn't reply yet. Can you fwd me the patches?

Besides, alot has changed since you built xfree86.
But I could use it as guidance.

BTW, I did get the libs to build.  I've hacked the Imakefile for libGLU
so only the .a gets built.  Battling my way through programs directories
now. A good test to see if the libs are useful or not (already found
the libfreetype.a was missing/stale).
Short notes and diff are on pehc:~grundler/*.xfree86

ta,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
