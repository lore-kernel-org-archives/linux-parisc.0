Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A50F7482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 07:38:55 -0600 (MDT)
Message-Id: <200107161338.HAA20386@puffin.external.hp.com>
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] help debuging HMPC 
In-Reply-To: Message from rbrad@beavis.ybsoft.com (Ryan Bradetich)
   of "Sun, 15 Jul 2001 21:31:57 MDT." <20010715213157.A13729@beavis.ybsoft.com>
Date: Mon, 16 Jul 2001 07:38:00 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Just a quick clarification:
> 
> I macro expanded dino_in32 into this:
> 	static u32 dino_in32 (struct pci_hba_data *d, u16 addr);
> 
> dino_in32 only takes two arguments, so I should check GR25 and manually
> perform the calculations in the dino_in32 to get the proper address
> passed to the _gsc_readl function, correct?  

Erm, right...dino_outX takes three...but the address is the second arg
and should be found in GR25 too. ATM, I can't explain why I found the
IO port address in GR24 when debugging a PCI problem on the A500.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
