Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailf.telia.com (mailf.telia.com [194.22.194.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60217482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 15:10:35 -0600 (MDT)
Date: Tue, 16 Oct 2001 23:10:28 +0200
From: Daniel Engstrom <5116@telia.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] GSC & EISA devices and pci_alloc_consistent
Message-ID: <20011016231028.A10728@zaphod.halden.lillfab.se>
References: <20011016213234.I15532@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20011016213234.I15532@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Oct 16, 2001 at 22:32:34 +0200
List-ID: <linux-parisc.vger.kernel.org>

On 2001.10.16 22:32 Matthew Wilcox wrote:
> I think the solution to this is to create a fake struct pci_dev that our
> drivers hand to pci_alloc_consistent.  Then we have:
> 
> PCXL, L2:
> 	if (pci_dev == NULL) return wax_alloc_consistent();
> 	else kmalloc()
> 
> ccio:
> 	if (pci_dev == NULL) return wax_alloc_consistent();
> 	ioc = find_ioc(pci_dev);
> 	...
> 
> astro/elroy systems remain unchanged.
> 
> The only question is how/where to obtain this pci_dev, and how to give
> it to the drivers which need it.

We could add it to struct parisc_device. Then it could be setup as required
in alloc_pa_dev() from the IODC/PDC data (assuming that one can tell where
the device is located from that data)

/Daniel
-- 
