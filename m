Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DBAF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 16:47:35 -0600 (MDT)
Message-Id: <200104262241.QAA09672@puffin.external.hp.com>
To: "Peter Weatherall" <peter.weatherall@3beans.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dino 
In-Reply-To: Your message of "Thu, 26 Apr 2001 16:28:13 CDT."
             <000501c0ce97$cd18ec00$a2035ad8@3beans.com>
Date: Thu, 26 Apr 2001 16:41:08 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Peter Weatherall" wrote:
> Dino version 2.1 (bridge mode) found at 0xf1600000
> 
> 
> The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
> data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
> Systems shipped after Aug 20, 1997 will not exhibit this problem.
> Models affected: C180, C160, C160L, B160L, and B132L workstations.
> 
> dino_bridge_init: IO_ADDR_EN hasn't been configured.
> kernel BUG at dino.c:795!
> >>>>>

I added this text about 1.5 years ago.


> How can I determine if my c160 is affected ? what's this kernel bug at
> dino.c all about and is there some Dino documentation available ?

The bug is documented in the Dino3.1 Errata. I don't recall if that got
published. Search the mail archive for "corruption".

With a dino2.1, I'd be pretty certain your box will be affected.
My understanding was HP replaced old dino chips with 3.1 versions.
For customers, this meant a board swap.

Note that upgrading PDC (firmware) may render PCI unusable.  PDC won't
let you boot (or get to PDC prompt) the box if dino is rev 3.0 or lower
*and* a PCI card (except HP graphics) is installed. It'll halt and print
something about PCI and "contact local HP support".

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
