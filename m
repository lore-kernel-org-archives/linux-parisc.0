Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94D45482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 16:20:24 -0600 (MDT)
Message-Id: <200104092213.QAA29325@puffin.external.hp.com>
To: "Gorbunov D.L." <dlynx@mail.ru>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA-RISK Linux 
In-Reply-To: Your message of "Fri, 06 Apr 2001 09:43:47 +0400."
             <001601c0be5c$9af6ad20$0b2aa8c0@dg>
Date: Mon, 09 Apr 2001 16:13:13 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Gorbunov D.L." wrote:
> Dear sirs!
> Our office in 1996 buy HP9000(D-class) with hot-swap hdd, but now we =
> have some problem with software for this system.

Gorbunov,
You need to read the "fine print" before jumping in with both feet.
See http://www.parisc-linux.org/hardware/index.html and our FAQ
at http://www.parisc-linux.org/faq/index.html.

> I try to install PA-RISK Linux from bootable CDROM (I get iso-image via =
> your FTP-site).

Which version of the ISO image did you get?

> But after some minutes, I see next mesagge - Kernel Faults - code 15, =
> regs - c9fe8840 (addr =3D f6632087),
> and system stopped.=20
>   Could not you suggest, where I can find iso-image bootable CDROM with =
> PA-RISK Linux for HP9000 (d-class)?

We (HP) have not made any effort to support parisc-servers other than A180,
A500, and L2000. However, much of the technology in D and K-class systems 
is the same as what's in workstations of the same generation. Nearly all
of the older workstations are supported to some degree.

If you (or anyone else) has patches to support D or K-class machines, I'll
help review and integrate them since they are most likely going to be IO
related.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
