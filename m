Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E71E6482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Jul 2001 12:44:02 -0600 (MDT)
Message-Id: <200107261842.MAA19577@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>,
	parisc-linux@lists.parisc-linux.org, sanaya@gr.hp.com
Subject: Re: [parisc-linux] Re: Help on install 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Thu, 26 Jul 2001 18:35:26 BST." <20010726183526.A27258@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 26 Jul 2001 12:42:35 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> ** "HP has discovered a potential system defect that can affect
> ** the behavior of five models of HP VISUALIZE workstations when
> ** equipped with third-party or customer-installed PCI I/O expansion
> ** cards. The defect is limited to the HP C180, C160, C160L, B160L,
> ** and B132L VISUALIZE workstations, and will only be encountered
> ** when data is transmitted through PCI I/O expansion cards on the
> ** PCI bus. HP-supplied graphics cards that utilize the PCI bus are
> ** not affected."
> 
> Maybe we're triggering this bug... grant?

Perhaps...updating the firmware to the latest will not let the system
boot if in fact that's the case. remove all PCI devices and then
the system will boot.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
