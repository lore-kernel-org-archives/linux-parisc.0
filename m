Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B4884829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Nov 2002 04:40:14 -0700 (MST)
Date: Sun, 3 Nov 2002 12:33:56 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Randolph Chung <randolph@tausq.org>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] unreliable mmap
In-Reply-To: <20021023231536.GC5602@tausq.org>
Message-ID: <Pine.LNX.4.44.0211031232380.24848-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Randolph,

> no one has managed to really track this down yet. i can insert a dcache
> flush into the kernel to 'fix' this, but it is not the right place to be
> doing the flush.

I can confirm this. The following patch "fixes" the problem for me. Please
do NOT apply this dirty hack to CVS!

cvs server: Diffing .
Index: filemap.c
===================================================================
RCS file: /var/cvs/linux/mm/filemap.c,v
retrieving revision 1.27
diff -u -r1.27 filemap.c
--- filemap.c   4 Aug 2002 23:00:15 -0000       1.27
+++ filemap.c   3 Nov 2002 11:37:52 -0000
@@ -3075,6 +3075,7 @@
                        goto sync_failure;
                page_fault = __copy_from_user(kaddr+offset, buf, bytes);
                flush_dcache_page(page);
+               flush_cache_all();
                status = mapping->a_ops->commit_write(file, page, offset,
offset+bytes);
                if (page_fault)
                        goto fail_write;


--jochen
