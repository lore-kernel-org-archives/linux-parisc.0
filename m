Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0DC1482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 May 2001 14:49:50 -0600 (MDT)
Message-Id: <200105182042.OAA28517@puffin.external.hp.com>
To: "Mikkel Lauritsen" <ml@Catalog-international.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems booting 712/100 with 0.6 ISO 
In-Reply-To: Your message of "Fri, 18 May 2001 09:43:05 +0200."
             <D29B706549FC12468AC1A06BA08D6E703C6457@CIEXCHANGE.Catalog-international.com>
Date: Fri, 18 May 2001 14:42:50 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Mikkel Lauritsen" wrote:
> > If the disk is bootable it should show up.
> 
> It does. What I'm wondering is if the rather old CD-drive that I'm
> using is somehow unsupported when it comes to booting from it. As I
> mentioned, the original HP drive (which is really a Toshiba 5701)
> doesn't grok the CD, so I'm using another drive instead.

Ok. Some PDC implementations have problems with SCSI devices
that initiate SDTR or WDTR negotiation or don't auto-spin up.
It's called "Target Initiated Negotiations" in the IBM literature
I recently looked at.
Check the jumpers on the device with a product manual in hand.

> > Oh and what Firmware rev do you have on the 712/100?
> > (hint: FAQ at www.parisc-linux.org explains PDC updates)
> 
> 2.3, which would appear to be the newest, judging from the list at
> HP.

Yes it is.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
