Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5CE7482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Jul 2001 19:20:59 -0600 (MDT)
Message-Id: <200107090120.TAA09388@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa5 crashes on B160L 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 09 Jul 2001 00:48:38 BST." <20010709004838.R6103@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 08 Jul 2001 19:20:02 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> If we didn't do
> the stack dump, the users would probably send more information which
> came before the stack dump.

*sigh*
My gut feeling is you are right.
Despite asking for *full* console output, seems everyone trims the output.
I'm not sure an option would fix this. Perhaps we only get register dumps
instead. :^/

However, it's useful as an option if one can (a) reproduce the problem and
(b) enable stack dump as a boot parameter with exactly the same kernel bits.

Sorry for the 180 so suddenly.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
