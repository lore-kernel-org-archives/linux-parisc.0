Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE0C4482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Aug 2001 10:57:27 -0600 (MDT)
Received: from puffin (IDENT:grundler@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA21894
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Aug 2001 10:55:56 -0600
Message-Id: <200108101655.KAA21894@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] fix for ccio cpio cdrom -> disk HPMC 
In-Reply-To: Message from rbrad@beavis.ybsoft.com (Ryan Bradetich)
   of "Thu, 09 Aug 2001 22:51:55 MDT." <20010809225155.A21997@beavis.ybsoft.com>
Date: Fri, 10 Aug 2001 10:55:56 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Hello parisc-linux hackers,
> 
> I think I have finally located and fixed the bug that has been haunting 
> the ccio driver.  This is the infamous cpio cdrom -> disk bug that I could
> reliably HPMC my C200+ with.

Excellent! That's so cool!

> The fix is simple, and I want to thank both Richard Hirst and Grant
> Grundler for taking the time at OLS to explain how the SCSI layer was
> interacting with the ccio driver.  Understanding this gave me the clue I
> needed to find/solve this long outstanding bug.

welcome...no manual labor involved like getting you coffee or something. ;^)

...
> The reason the second case does not hold true for the U2/Uturn chip because
> because the IO TLB is direct mapped on a 32k block boundary.

Use of "direct mapped" doesn't seem right here.
I *think* it means a given IOVA will always map to the same IO TLB entry.
Many IOVA's can map to one IO TLB entry. Each IOVA has a corresponding
entry in the IO PDIR. (IOVA == I/O Virtual Address)
 
I'm wondering why U2 has 8 IO Pdir entries per IO TLB entry.
If the 8 entries can only map one physically contiguous chunk
of memory, does it make sense to have 8 entries?

Do the 8 entries have to have the same "Coherency Index" values?
(note: to date, all buffer addresses are kernel virtual addresses.)

...
> Next the SCSI driver will try to write the data to the invalid I/O TLB
> entry at block 2.  At this point I believe the machine will HPMC because 
> of the invalid I/O TLB entry in the U2/UTurn chip.  Which verifies the PIM
> codes I have been seeing on the C200+.

An invalid IO TLB entry with a valid IO PDIR entry behind it suggests
we aren't managing the IO TLB right or the ccio driver wasn't mapping the
second "chunk" correctly.

Maybe we were asking the IO TLB to do something which U2 doesn't support.
Obviously I don't understand U2 IO TLB behavior in great detail or I would
have written the code right before Ryan picked it up.
Can anyone explain this U2/Uturn IO TLB behavior better?


> Also I would like to fix the documentation in
> Documentation/DMA-mapping.txt since it is not quite accurate and threw
> me off for quite a while.
...
>   1. Submit the patch directly to the document authors and have them
>      review/accept/reject the patch?

Generally I prefer this since we "automatically" pull upstream changes
with every merge. IMHO, commit only non-arch/parisc changes when
we need a bug fix or feature *now* (eg serial console, 100BT, etc).

> The following section of text is the misleading portion of the document.
> 
> > The implementation is free to merge several consecutive sglist entries
> > into one (e.g. if DMA mapping is done with PAGE_SIZE granularity, any
>                                              ^^^^^^^^^

Note this starts with "e.g.". It's just an example and it should be simple.
Think about keeping the example simple when you submit your patch.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
