Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5C5A482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 04:42:40 -0600 (MDT)
Message-Id: <200106181042.EAA18612@puffin.external.hp.com>
To: Matteo Boschini <boschini@cilea.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FDDI on 735/99 
In-Reply-To: Your message of "Mon, 18 Jun 2001 11:22:30 +0200."
             <Pine.LNX.4.21.0106181054280.852-100000@boschini.sede.cilea.it>
Date: Mon, 18 Jun 2001 04:42:29 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matteo Boschini wrote:
> 
> Hello all, 
> 
> this is probably a dumb question, but I'm really stuck.
> I have a 735 Apollo/99 on which I finally installed what seems a
> reasonably stable kernel.
> machine has only fddi net card. 
> At boot, system detects Outfiled FDDI, which seems to be supported as from
> http://216.208.98.4/view.php3?type=devicetype&name=Foreign%20I%2FO%20Module

I don't think anyone has actually tested any sort of FDDI for parisc-linux.
Much less one for GSC (which is what I expect the 735 to accept.)

> I have compiled the kernel without seeing anything about FDDI. 

I don't expect any driver to support the GSC FDDI card without modfications.
You might need to look at how GSC SCSI (Zalon driver)
support works to get an idea of what needs to be done.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
