Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C7F5482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Jun 2001 18:11:02 -0600 (MDT)
Message-Id: <200106110003.SAA11489@puffin.external.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] memcpy_fromio() seems partially broken [with patch] 
In-Reply-To: Your message of "Sat, 09 Jun 2001 02:39:17 BST."
             <20010609023917.C28264@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 10 Jun 2001 18:03:26 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> This is very bizarre.  Following the codepaths, the current code does:
...
>  bytecopy:
...
> and i don't see how that can possibly do byteswapping.  unless byteswapping
> is necessary and this code is failing to do that?

That's what it sounds like.

> Your code is doing:
> 
>          if (((unsigned long)dest & 3) != (src & 3))
>                  goto wordcopy;
> 
>   wordcopy:
>          if (src & 3)
>                  goto bytecopy;
>   wordcopy_loop:
...
> which is doing a byteswap on the  value returned from readl!

Exactly.

> This seems
> pretty grotesque to me.

It looks grotesque but the compiler should be able to
do pretty well with that.

>   I want to hear from someone (eg grant) who can
> say what's actually going on here..

The problem seems that the data needs to be swapped and I don't know why.
Perhaps the card is swapping the data?
acenic (and tulip?) has such a mode.

PARISC pci host bus adapters has a "byte is byte" approach to data.
I've heard the term "address invariance" used but not sure if
that's exactly the same thing. The idea here is data DMA'd into memory
is a byte stream and the CPU reading the data from memory byte at a time
from low address to higher address would see the same data.

Normally we expect the consumer of data (eg device driver) from IO space
to perform the swap and not the accessor functions (eg readl).

I need to do more homework to be certain about the following:
  I *think* CPU reading IO space directly needs to be swapped to
  provide the same illusion that DMA provides. The problem (I think)
  is the data is *little* endian across the PCI bus and presented as
  such to the CPU which then stores it *big* endian in memory.

Dino ERS has a nice chapter on this mess. Elroy follows the same rules.
I'll have to read that again.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
