Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA22474
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 10:59:36 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id C38556C9
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:02:21 -0700 (MST)
Message-Id: <200011301801.KAA29413@milano.cup.hp.com>
To: "Gunneswara Marripudi" <raomg@cup.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: Question on Linux DMA routines 
In-reply-to: Your message of "Thu, 30 Nov 2000 09:31:14 PST."
             <200011301731.JAA29335@milano.cup.hp.com>
Date: Thu, 30 Nov 2000 10:01:13 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> The HW *is* fully coherent when the CPU doesn't cache the pages.
> Only systems with PCX-L/L2 CPU (need to) operate this way.
> All other platforms have an I/O MMU which manages the coherency.

Correction - PCX-T and older platforms are not coherent and U-bit
isn't available/useable on those machines. Drivers must do their own
cache flushing. sim700 (LASI SCSI) does this and I think Apricot
(LASI LAN) too. I'm suspecting this might be part of the 735 problems.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
