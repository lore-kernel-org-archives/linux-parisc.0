Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FAF84A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 12:44:07 -0700 (MST)
Message-Id: <200102131946.LAA10733@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] C100 & Latest CVS Bits 
In-reply-to: Your message of "Tue, 13 Feb 2001 12:32:01 PST."
             <Pine.LNX.4.21.0102131225540.14493-100000@maestro.symsys.com>
Date: Tue, 13 Feb 2001 11:46:34 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> As I recall, Grant said the stack dump itself isn't
> helpful unless it's a kernel built with the default configuration.

I can't (or won't) help with stack/register dumps unless they are built
with default config. That's different than saying they aren't helpful.
The problem is the symbols are what's interesting to me and I can't
determine them unless the bits match what's in a source tree I have.

I guess it's time we put together a "PARISC Kernel Debugging HOW-TO
for Dummies". ie how to look up symbols, explain TOC (and HPMC), how
to get/decode TOC/HPMC dumps, etc.

> As a side question, is it possible to have the system automatically reboot
> after it encounters these errors?

It can. There's a global variable someplace that is *disabled* by default.
If someone can just remember the global's name...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
