Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B98A482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 01:11:07 -0600 (MDT)
Message-Id: <200104130704.BAA30742@puffin.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups 
In-Reply-To: Your message of "Thu, 12 Apr 2001 00:00:56 BST."
             <E14nTbe-0007lJ-00@the-village.bc.nu>
Date: Fri, 13 Apr 2001 01:04:22 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> > Then Linus changed his mind. You are still *only* supposed to use
> > readb/writeb on PCI (and possible ISA) on PCI like devices.
> 
> ISA is a PCI like device, its a wacky slow motion PCI bridge with no 
> configuration space ;).

And no memory mapped I/O. Just I/O port space afaik.

grant
