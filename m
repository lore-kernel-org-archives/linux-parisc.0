Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA06896
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 00:08:15 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 286B910B6
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Apr 2000 23:08:14 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id XAA16442 for <parisc-linux@thepuffingroup.com>; Tue, 11 Apr 2000 23:08:16 -0700 (PDT)
Message-Id: <200004120608.XAA16442@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Astro and 100BT still not working 
In-reply-to: Your message of "Tue, 11 Apr 2000 22:14:55 PDT."
             <200004120514.WAA16365@milano.cup.hp.com>
Date: Tue, 11 Apr 2000 23:08:16 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Some possible theories:
> 1) it's not coherent (perhaps LCI didn't work right),

First off, I noticed (again) that the I/O MMU (aka IIOC)
isn't documented. Since it wasn't part of "Astro" documentation
it didn't get put through "the process".  Astro uses I/O MMU logic
original designed for Ike and thus didn't repeat stuff written
in the Ike Documentation. I think the public files even say
that someplace.

Anyway, Here's something interesting out of the "Ike" documentation:

    7.6 Virtual Index support

    In PCX-W based systems, DMA is coherent only if a virtual index is
    supplied with the physical address. So, most DMA addresses will have
    to be translated by the TLB. When the translation is done, the virtual
    index stored in the VINDEX field of the I/O PDIR entry is supplied by
    the TLB. In some cases, however, this may lead to performance problems.
    So, a Direct Virtual Index (DVI) mode is also supported. The PSC in
    Elroy is responsible for recognizing a DVI address and separating the
    virtual index from the address. See the PSC chapter. In either mode,
    8 bits of virtual index are supported.

    For I/O PDIR fetches themselves, IKE assumes that the I/O PDIR is
    equivalently mapped. I.e., it assumes that the physical address =
    virtual address and so it supplies bits 19:12 of the physical address
    as the virtual index. To ensure coherency of I/O PDIR fetches, the
    I/O PDIR must be equivalently mapped.


The second paragraph worries me. It suggests parisc-linux has to flush
the cachelines which contain I/O Pdir data every time such data is
changed since it's not equivalently mapped.  Since only bits 31:28
are different for kernel space (0xc....), does this still apply?

How can I test this?
(ie What's the linux function/macro to flush a cacheline?)

FWIW, this is a safe assumption for HP-UX.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
