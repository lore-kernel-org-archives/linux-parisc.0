Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA28965
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 May 2000 18:16:04 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by palrel3.hp.com (Postfix) with SMTP id 02705EEF4
	for <parisc-linux@puffin.external.hp.com>; Fri,  5 May 2000 17:07:16 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id C0B581B213
	for <parisc-linux@thepuffingroup.com>; Fri,  5 May 2000 20:05:44 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id RAA18075 for <parisc-linux@thepuffingroup.com>; Fri, 5 May 2000 17:06:07 -0700 (PDT)
Message-Id: <200005060006.RAA18075@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SCSI works on B180 and 712 
In-reply-to: Your message of "Fri, 05 May 2000 17:05:59 PDT."
             <E12nrAV-00040I-00@endor.fc.hp.com>
Date: Fri, 05 May 2000 17:06:07 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> Many thanks to ggg, robert, and prumpf, for helping me get the SCSI
                      -------

Uh, erm, you mean Richard? (as in Richard Hirst)

> driver (sim710 specifically) working on B180 (should work on A180 too)
> and 712!!!

Basically this should work on any box who's processor (U-bit) and
memory controller supports uncacheable memory. Consensus to date
seems to limit this to boxes with 7100LC and 7300LC processors.

Last I heard, Richard was still working on getting stuff working
on the 715/75 recently dropped off. It seems since this box is
a PA7100 (not LC), it doesn't support U-bit (just ignores it
perhaps?).

For systems with U2/Uturn (HP-UX ccio driver), prumpf is working
on "Dynamic DMA mapping" support on those. For boxes with Astro
(HP-UX sba driver), support is already in CVS and "sort-of" tested.

welcome (it was fun),
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
