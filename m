Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 443D6482A
	for <parisc-linux@parisc-linux.org>; Thu, 23 Aug 2001 00:21:39 -0600 (MDT)
Message-Id: <200108230618.AAA06470@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Tue, 21 Aug 2001 23:12:09 +0200." <200108212111.PAA28876@puffin.external.hp.com>
Date: Thu, 23 Aug 2001 00:18:22 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> Why should the user be
> bothered to compile in that PCI stuff if he won't need it at all ?

That isn't an issue - we all agree CONFIG_PCI isn't needed on older machines.

> Those are well-defined drivers which we
> know that they work without PCI and which other drivers should we need ? 

This is a good point. I'll shup up. :^)

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
