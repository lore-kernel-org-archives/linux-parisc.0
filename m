Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AA894838
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Aug 2001 12:30:07 -0600 (MDT)
Message-Id: <200108121828.MAA05262@puffin.external.hp.com>
To: Timothy Ball <timball@tux.org>
Cc: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712/60 screwy console stuff 
In-Reply-To: Message from Timothy Ball <timball@tux.org>
   of "Sat, 11 Aug 2001 16:04:25 EDT." <20010811160425.E13253@gwyn.tux.org>
Date: Sun, 12 Aug 2001 12:28:30 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Timothy Ball wrote:
> I got a 712/60 and I'm connecting to it via serial console and when I
> power it up I get this:
> 
> --snip--snip--snip--
> 0x04.1095
> 0x04.1096
> 0x04.1090
> 0x04.108D

Those are diagnostic messages from the PDC telling what's going on.
Useful for when the machine *stops* working and won't get to a
"BOOT_ADMIN" prompt. I'm doubt the magic decoder ring for those
has been published though...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
