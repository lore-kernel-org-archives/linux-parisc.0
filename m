Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05060482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 07:51:06 -0600 (MDT)
Message-Id: <200107161349.HAA20437@puffin.external.hp.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HD not bootable after installation.... 
In-Reply-To: Message from "Pedot, Wolfgang" <wpedot@harris.com>
   of "Mon, 16 Jul 2001 05:18:56 EDT." <8D4C69676E66D511A1CB00508BBBB192162690@ranmx1.ran.harris.com>
Date: Mon, 16 Jul 2001 07:49:34 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Pedot, Wolfgang" wrote:
> Well, the HD has a Jumper called "Auto Start" which is set. Without that
> jumper set the HD doesn´t spin up. The only Jumpers set now are ID,
> AutoStart and Termination Power. There are others to but I have no Idea
> what they mean..
> 
> Option Block Mode
> Disable T.I. Sync Negotiations
> Disable Unit Attention
> 
> Any Ideas?

sorry - forgot about TI Sync jumper - you want that disabled
for workstations...I think servers are ok with having enabled (no jumper).

"Target Initiated Synchronous Negotiations" is when the Target device
(eg drive) realizes it doesn't have an agreement with the Initiator
(eg host controller) about how fast to send "synchronous" data (SDTR).
Even though the SCSI protocol allows this, older products didn't
do this and the PDC didn't need to (and can't) handle it.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
