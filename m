Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 464844A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 00:08:40 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA31292
	for <parisc-linux@puffin.external.hp.com>; Tue, 6 Feb 2001 00:04:24 -0700
Message-Id: <200102060710.XAA03545@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design 
In-reply-to: Your message of "Tue, 06 Feb 2001 06:02:57 PST."
             <20010206060257.B27096@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 05 Feb 2001 23:10:56 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> I was thinking along the lines of:
...
> and then use the pci_bus sysdata to point to the struct hp_device which
> is the parent of this pci_bus.

Several levels of indirection are needed here.
Currently, we only store PCI bus host adapter (eg dino or elroy)
pointer here. We need to store "per device" DMA parameters here
as well and similar cruft. ie something like:

struct pa_devinfo {
	void * pa_iommu;
	void * pa_hba;
}

((pa_sysinfo *) pci_device->sysdata)

This should work for both PCI and "PCI-like" bus devices.
pa_hba* would point to PCI bus info for dino/elroy.

> Rather than try to abuse the `parent' entry in the pci_bus.

Right. parent field can never point to anything that's not a struct pci_bus.
The reason is PCI generic code walks *up* the tree and terminates on
a NULL ptr.

> Yeah, I was thinking about that.  In some of the larger systems (say,
> N class), there's no real central point at which to base the bus walk,
> other than the Stretch memory controller.

Two comments:
1) IMHO N-class really isn't that big.
2) It does have a "central bus" (Merced). Actually two of them but they
   are peers and for most cases look like one.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
