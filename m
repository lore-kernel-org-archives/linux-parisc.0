Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 295894A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 01:05:11 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA31575
	for <parisc-linux@puffin.external.hp.com>; Tue, 6 Feb 2001 01:00:55 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id E8EE77C3
	for <parisc-linux@thepuffingroup.com>; Tue,  6 Feb 2001 00:05:05 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id AAA03565
	for <parisc-linux@thepuffingroup.com>; Tue, 6 Feb 2001 00:07:31 -0800 (PST)
Message-Id: <200102060807.AAA03565@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design 
In-reply-to: Your message of "Mon, 05 Feb 2001 23:10:56 PST."
             <200102060710.XAA03545@milano.cup.hp.com>
Date: Tue, 06 Feb 2001 00:07:29 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> struct pa_devinfo {
> 	void * pa_iommu;
> 	void * pa_hba;
> }
> 
> ((pa_sysinfo *) pci_device->sysdata)

I meant to write
    ((pa_devinfo *) pci_device->sysdata)->pa_iommu

I also thought the pa_devinfo struct could hold flags/info which
describes device and driver DMA behaviors not passed in to
pci_map_single(). I don't expect device drivers to be modified
to manipulate this flags/info fields unless it is designed to be arch-
independent.

Stuff like this is normally stored in the HPUX I/O tree associated
with specific nodes (and thus visible to parents). Note that I only
expect the parisc-linux "I/O tree" to only deal with PA I/O devices.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
