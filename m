Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 929F9482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 15:04:12 -0600 (MDT)
Message-Id: <200110162100.PAA15770@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] GSC & EISA devices and pci_alloc_consistent 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 16 Oct 2001 21:32:34 BST." <20011016213234.I15532@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 16 Oct 2001 15:00:19 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> I think the solution to this is to create a fake struct pci_dev that our
> drivers hand to pci_alloc_consistent.

In order to use one interface, perhaps dma_ops should be a field
in struct pci_hba_data.
We could then
#define pci_alloc_consistent(p, s, a)	\
	(p->sys_data->dma_ops->alloc_consistent)(p, s, a)

(with a bit of casting magic in there)

The fake pdev's points to the correct OPS in the first place.
And systems which don't have EISA or GSC support wouldn't need
this and could continue to use the original method:

#define pci_alloc_consistent(p, s, a)   hppa_dma_ops->alloc_consistent(p,s,a)


> Then we have:
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

I don't like this for performance reasons.
Branches on PCX-U systems are 15+ cycles if predicated wrong.
With this, we've added a branch and a function call where
we really only want to make one function call.

> The only question is how/where to obtain this pci_dev, and how to give
> it to the drivers which need it.

I think it has to be during the regular buswalk for that bus.
(either EISA or GSC).
The HBA managing the bus walk will know which dma_ops need to be used.

One idea is the either make pci_dev the first part of the EISA/GSC struct
(which you've suggested before) or allocate a new pci_dev and have a
pointer to it from the parisc_device struct. I'd like to see more thoughts
on this from others.

grant
