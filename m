Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A93DE4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Feb 2001 10:06:21 -0700 (MST)
Message-Id: <200102161709.JAA13661@milano.cup.hp.com>
To: Kevin Read <obsidian@panokratie.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can't build kernel without PCI 
In-reply-to: Your message of "Fri, 16 Feb 2001 09:42:46 PST."
             <Pine.LNX.4.31.0102160941400.3578-100000@kiste.innnet.de>
Date: Fri, 16 Feb 2001 09:08:52 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kevin Read wrote:
> 
> Hi folks,
> 
> btw, the kernel won't build if you don't select PCI support which I don't
> have on the 705 ;). It complains about missing inb and outb functions.
> When I select it everything is ok.

Your 705 doesn't have anything "PCI-Like" in either.
The "inb/outb" imply you are including a driver that's "PCI-like".
If you can narrow down which driver(s) complain about it...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
