Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2F7D4A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 12:40:45 -0700 (MST)
Message-Id: <200102211940.LAA17629@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC 
In-reply-to: Your message of "Wed, 21 Feb 2001 18:55:51 PST."
             <E14VeQa-0002ZJ-00@the-village.bc.nu>
Date: Wed, 21 Feb 2001 11:40:42 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> Can the prefetch on the hppa fault ?

"PARISC 2.0 Arch" page 6-11 says:
   If one of those exceptions would occur, the prefetch
   is simply ignored, but any base register modification
   specified by the instruction still occurs.

I haven't checked if the errata contradicts this.
The whole point of prefetch which be undermined if it could fault.

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
