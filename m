Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AA6549E4
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 09:01:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pWTr-0005MA-00
	for parisc-linux@parisc-linux.org; Fri, 05 Oct 2001 16:01:39 +0100
Date: Fri, 5 Oct 2001 16:01:39 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011005160139.C19206@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] ramdisc fixes
List-ID: <linux-parisc.vger.kernel.org>

I'm thinking about committing the following patch to our cvs:

Index: drivers/block/rd.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/block/rd.c,v
retrieving revision 1.16
diff -u -p -r1.16 rd.c
--- drivers/block/rd.c	2001/08/01 15:25:06	1.16
+++ drivers/block/rd.c	2001/10/05 06:00:50
@@ -227,14 +227,9 @@ static int rd_make_request(request_queue
 	 */
 	bdata = bh_kmap(sbh);
 	if (rw == READ) {
-		/* XXX FIXME This is probably not the right fix, and the
-		 * upstream kernel will probably fix this a different way,
-		 * but for now I'd rather have something which works in
-		 * CVS rather than a semi-secret patch. -PB
-		 */
 		if (sbh != rbh) {
 			memcpy(bdata, rbh->b_data, rbh->b_size);
-			flush_kernel_dcache_range(bdata,rbh->b_size);
+			flush_dcache_page(sbh->b_page);
 		}
 	} else
 		if (sbh != rbh)

However, rd.c changed dramatically in 2.4.10, and I think the following
patch will be equivalent.  I posted a short analysis here
http://marc.theaimsgroup.com/?l=linux-kernel&m=100160260325543&w=2
but neither Linus nor Alan seem to have applied this patch yet.

--- linux-2410/drivers/block/rd.c	Thu Sep 27 08:32:39 2001
+++ linux-2410-rd/drivers/block/rd.c	Thu Sep 27 08:35:34 2001
@@ -276,7 +276,6 @@ static int rd_blkdev_pagecache_IO(int rw
 			if (!Page_Uptodate(page)) {
 				memset(kmap(page), 0, PAGE_CACHE_SIZE);
 				kunmap(page);
-				flush_dcache_page(page);
 				SetPageUptodate(page);
 			}
 
@@ -301,8 +300,11 @@ static int rd_blkdev_pagecache_IO(int rw
 		kunmap(page);
 		bh_kunmap(sbh);
 
-		if (rw != READ)
+		if (rw == READ) {
+			flush_dcache_page(page);
+		} else {
 			SetPageDirty(page);
+		}
 		if (unlock)
 			UnlockPage(page);
 		__free_page(page);

anyone see any problems with my analysis / fixes?

-- 
Revolutions do not require corporate support.
