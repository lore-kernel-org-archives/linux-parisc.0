Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA02485
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Sep 2000 14:40:14 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 6F85A4CD
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Sep 2000 13:40:39 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id NAA04417
	for parisc-linux@thepuffingroup.com; Wed, 13 Sep 2000 13:44:14 -0700 (PDT)
Date: Wed, 13 Sep 2000 13:44:14 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200009132044.NAA04417@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PATCH: xxxx_alloc_range()
List-ID: <linux-parisc.vger.kernel.org>

Summary -----------
Thanks to Ryan Bradetich for asking the right questions...we found
a resource management bug I created in both ccio-dma.c and sba_iommu.c.
Ryan will update ccio-dma.c and I'll do the same for sba_iommu.c
once we've had a chance to test it on the respective machines.

Details -----------
This bug would cause the system to HPMC or corrupt memory if more
than one DMA is outstanding at a time. This generally won't occur
until the system starts multitasking.

Doesn't affect A180 or similar machines w/o an I/O MMU.

The problem is the resource bit map gets out of sync
with the I/O Pdir usage and we can end up using the same I/O
pdir entries for more than one DMA...obivously this won't
work. The symptom will depend on when the first consumer
unmap's the DMA WRT when the second consumer uses it.

sorry,
grant

Index: sba_iommu.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/sba_iommu.c,v
retrieving revision 1.21
diff -u -p -r1.21 sba_iommu.c
--- sba_iommu.c 2000/08/30 15:43:52     1.21
+++ sba_iommu.c 2000/09/13 20:30:33
@@ -394,7 +394,7 @@ static int sba_alloc_range(struct ioc *i
        ASSERT(pages_order < (BITS_PER_LONG - IOVP_SHIFT));
 
        pages_mask= (u_long) -1L;
-       pages_mask >>= BITS_PER_LONG - pages_order;     /* clear top bits */
+       pages_mask >>= BITS_PER_LONG - pages_needed;    /* clear top bits */
 
 #if 0
        /*
