Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89E5B482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 06:51:15 -0600 (MDT)
Subject: Re: [parisc-linux] FB cleanups
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Fri, 13 Apr 2001 13:52:54 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	parisc-linux@parisc-linux.org
In-Reply-To: <200104130704.BAA30742@puffin.external.hp.com> from "Grant Grundler" at Apr 13, 2001 01:04:22 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14o34K-0002o5-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > ISA is a PCI like device, its a wacky slow motion PCI bridge with no 
> > configuration space ;).
> 
> And no memory mapped I/O. Just I/O port space afaik.

ISA bus has MMIO, including busmastering. 
