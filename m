Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA19951
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 10:29:37 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id 5990568E
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 10:32:23 -0700 (MST)
Message-Id: <200011301731.JAA29335@milano.cup.hp.com>
To: "Gunneswara Marripudi" <raomg@cup.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: Question on Linux DMA routines 
In-reply-to: Your message of "Thu, 30 Nov 2000 01:03:25 PST."
             <01c05aac$657dec80$0f0d8421@hpinddm>
Date: Thu, 30 Nov 2000 09:31:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Gunneswara Marripudi" wrote:
> Hi Grant,
> 
> I have a quick question on Linux 2.3 DMA routines.

2.3 is dead. You mean 2.4.


> If I allocate and map memory using pci_alloc_consistent(),
> do I still need to call pci_dma_sync_single() if there is a 
> need to ensure the coherency? The documentation on it
> at DMA-mapping.txt is ambiguous (at least to me). 

No - it's not needed.

> - Consistent DMA mappings which are usually mapped at driver
> 113   initialization, unmapped at the end and for which the hardware should
> 114   guarantee that the device and the cpu can access the data
> 115   in parallel and will see updates made by each other without any
> 116   explicit software flushing.
> 117 
> 118   Think of "consistent" as "synchronous" or "coherent".
> 
> 
> It says that h/w should guarantee the consistency and I'm not sure 
> what if the underlying platform is not fully coherent.

The HW *is* fully coherent when the CPU doesn't cache the pages.
Only systems with PCX-L/L2 CPU (need to) operate this way.
All other platforms have an I/O MMU which manages the coherency.

You might be confused because HPUX doesn't ever use uncached memory
for I/O since it has dma_sync() macro instead. And device driver writers
are "trained" to use that.


grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
