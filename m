Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (lt200001.hrz.uni-oldenburg.de [134.106.156.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id B57C14830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 06:41:37 -0600 (MDT)
Date: Sun, 30 Sep 2001 14:39:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010930143928.B6355@solo.franken.de>
References: <200109300638.AAA13665@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109300638.AAA13665@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Sun, Sep 30, 2001 at 12:38:08AM -0600
Subject: [parisc-linux] Re: shm cache flush bug?
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 30, 2001 at 12:38:08AM -0600, John Marvin wrote:
> The workaround fix for your problem will probably involve flushing a
> specific page.  Since the problem you are seeing is related to System V

there is a flush_page_to_ram() at the right place.

I've tested following patch:

diff -u -r1.32 pgalloc.h
--- pgalloc.h	2001/09/06 09:44:12	1.32
+++ pgalloc.h	2001/09/30 12:13:57
@@ -17,6 +17,7 @@
 static inline void
 flush_page_to_ram(struct page *page)
 {
+	flush_kernel_dcache_page (page_address(page));
 }

That one fixes the problem, too. Is this patch something you would see
as the right thing to do ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
