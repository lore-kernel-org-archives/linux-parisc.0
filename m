Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6266F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 22:49:50 -0600 (MDT)
Message-Id: <200107140448.WAA28246@puffin.external.hp.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: "'Parisc Linux Mailinglist'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HD not bootable after installation.... 
In-Reply-To: Message from "Pedot, Wolfgang" <wpedot@harris.com>
   of "Fri, 13 Jul 2001 06:14:02 EDT." <8D4C69676E66D511A1CB00508BBBB19216268C@ranmx1.ran.harris.com>
Date: Fri, 13 Jul 2001 22:48:28 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Pedot, Wolfgang" wrote:
...
> After installing an other Harddisk the installation
> went fine but for some reason this new Harddisk is not bootable
> (Palo was executed successfully), its not in the list of bootable
> devices at startup and if i select it manualy it fails to boot.
> But after booting from network the disk is detected. Since this harddisk
> was in a PC before I wonder if theres anything
> I may have forgotten...

Perhaps. To add/remove jumpers on the HD to enable "Auto-Spinup"?
You need a spec sheet for the HD to figure out which jumpers those are.
If you only have 1 or 2 HDs, it's better to disable "Spinup Delay".

PC BIOS (or scsi controller Expansion ROM) and Linux SCSI drivers 
are smart enough to send a "Start Unit" cmd to spin up the disk.
PDC on most (all?) parisc workstations is not. I don't think the
servers are any smarter but don't know for sure.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
