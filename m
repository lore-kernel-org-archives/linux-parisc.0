Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B558A482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 01:55:46 -0600 (MDT)
Message-Id: <200108210753.BAA21158@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 21 Aug 2001 08:09:53 BST." <20010821080953.B12638@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 21 Aug 2001 01:53:26 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> I discussed this with Ted Ts'o at OLS.  The difficulty is that there's
> a fair bit of arch-independent code which does (example taken from serial.c):
> 
> static _INLINE_ unsigned int serial_in(struct async_struct *info, int offset)
....
> so either we add the nasty:
> 
>         default:
> #if defined(CONFIG_PCI) || defined(CONFIG_ISA)
>                 return inb(info->port + offset);
> #else
>                 BUG();
> #endif

The ifdef is only once in that source file.

> or we just make inb() BUG().

The problem is serial.c is written for x86 arch and wasn't ported
cleanly for other arches. Makeing inb() BUG() allows sloppy
porting.


> Only if they're called.  The majority of places where these functions
> exist can provably never be called.  The others probably won't be :-)

I don't bet on "probably".

If the kernel is designed to not link when a dependency is not met,
I can find problems much faster when they arise. Having to build/reboot
to find porting/coding issues seems harder than it needs to be.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
