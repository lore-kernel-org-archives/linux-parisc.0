Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6452482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 01:20:29 -0600 (MDT)
Message-Id: <200108210718.BAA21014@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Turn off CONFIG_PCI 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sun, 19 Aug 2001 00:59:41 +0200." <20010818230140.3B894482A@dsl2.external.hp.com>
Date: Tue, 21 Aug 2001 01:18:38 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> Machines with a PA8XXX CPU don't have any LASI/GSC devices and would _always_
> HPMC without PCI support.

Later K-class models have no PCI (except "card-mode Dino add-on cards)
and PA2.0 CPU's.

> So I still think it is better to panic() with a nice message 

Better to just not link if the kernel configuration permits a driver to get
included which needs inb/outb functions. We should be able to catch stuff
like this at link time.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
