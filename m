Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 747D3482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 22:51:57 -0600 (MDT)
Received: from beavis.ybsoft.com (ns1.ybsoft.com [10.0.0.2])
	by amanda.ybsoft.com (Postfix) with ESMTP id D19B75873A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 15:53:21 -0600 (MDT)
Date: Thu, 9 Aug 2001 22:51:55 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010809225155.A21997@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
Subject: [parisc-linux] [PATCH] fix for ccio cpio cdrom -> disk HPMC
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

I think I have finally located and fixed the bug that has been haunting 
the ccio driver.  This is the infamous cpio cdrom -> disk bug that I could
reliably HPMC my C200+ with.

The fix is simple, and I want to thank both Richard Hirst and Grant
Grundler for taking the time at OLS to explain how the SCSI layer was
interacting with the ccio driver.  Understanding this gave me the clue I
needed to find/solve this long outstanding bug.


The problem is in the coalescing of the sg chunks.  The ccio (and SBA)
drivers attempt to coalesce the sg chunks via 2 methods:

  1. Merging virtually contiguous addresses into a single, larger address.
  2. Merging non-virtually contiguous addresses into a single, larger
     address iff the entries start/end on a page boundary.

These two constraints are well documented in the
Documentation/DMA-mapping.txt, but unfortunately the second case does not
hold true for the ccio driver as I will try to explain after the short
patch to remove the second case:


--- ccio-dma.c	2001/07/14 21:17:01	1.33
+++ ccio-dma.c	2001/08/10 03:24:38
@@ -992,18 +992,7 @@ ccio_coalesce_chunks(struct ioc *ioc, st
 
 			vcontig_sg = startsg;
 			vcontig_len = startsg->length;
-
-			/*
-			** 3) do the entries end/start on page boundaries?
-			**    Don't update vcontig_end until we've checked.
-			*/
-			if (DMA_CONTIG(vcontig_end, startsg->address)) {
-				vcontig_end = vcontig_len + (unsigned long)startsg->address;
-				dma_len += vcontig_len;
-				continue;
-			} else {
-				break;
-			}
+			break;
 		}
 
 		/*

The reason the second case does not hold true for the U2/Uturn chip because
because the IO TLB is direct mapped on a 32k block boundary.  If the
U2/UTurn chip was mapped on a 4k boundary (like Astro and IKE) then the
second case would work fine.  [Note: I could have changed the DMA_CONTIG
macro to align on a 32k block boundary instead of a 4k block bound and
probably still fixed the problem, but I'm currently testing a new
coalescing design Richard, Grant and I discussed at OLS, so I opted for
simplicity :)]


Now for the pretty ASCII art showing why the second case is broken
for the ccio driver:

Lets assume the SCSI layer passes the 1st, 2nd, and 4th page of a 32k block
to the ccio driver to be coalesced.

      0   1   2   3   4   5   6   7
    +---+---+---+---+---+---+---+---+
    | X | X |   | X |   |   |   |   |
    +---+---+---+---+---+---+---+---+


The ccio_coalesc_chunks function would return a single DMA stream with the
translated address of block 0 and a length of 3 pages.

The ccio_fill_pdir function would then mark the correct pages of the 32k
block valid in the I/O TLB.

Next the SCSI driver will try to write the data to the invalid I/O TLB
entry at block 2.  At this point I believe the machine will HPMC because 
of the invalid I/O TLB entry in the U2/UTurn chip.  Which verifies the PIM
codes I have been seeing on the C200+.

With the above patch applied to my local TOB tree, I have successfully
cpio'ed a cdrom to disk several time without causing the HPMC.  So I am
going to commit the patch to the ccio driver.  We can back it out later
if someone has concerns or finds my analysis invalid :)

As for my long shot in the dark as to why it was very reproducible with
a cdrom -> disk copy and not the disk -> disk copy is that the SCSI driver
passed 2k block in the sg list while the disk -> disk copy uses 1k block.
Therefore the 2k blocks increased the likely-hood of catching the second
case and causing the HPMC.


Also I would like to fix the documentation in
Documentation/DMA-mapping.txt since it is not quite accurate and threw
me off for quite a while.  I would be happy to submit a small patch to
clarify the documentation, but I'm not sure of the proper way to submit
a patch to architecture independent code/documentation.

  1. Submit the patch directly to the document authors and have them
     review/accept/reject the patch?

  2. Commit the patch to the parisc-linux tree and handle it during 
     the upstream merge?


The following section of text is the misleading portion of the document.

> The implementation is free to merge several consecutive sglist entries
> into one (e.g. if DMA mapping is done with PAGE_SIZE granularity, any
                                             ^^^^^^^^^
> consecutive sglist entries can be merged into one provided the first one
> ends and the second one starts on a page boundary - in fact this is a huge
> advantage for cards which either cannot do scatter-gather or have very
> limited number of scatter-gather entries) and returns the actual number
> of sg entries it mapped them to.


If someone else with a U2/Uturn chip wants to beat on the ccio driver for
a while with this patch and verify the the HPMC is gone for them I would
greatly appreciate it.

Thanks,

- Ryan
