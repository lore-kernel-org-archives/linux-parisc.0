From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Thu, 16 Mar 2006 18:31:17 +0100
Message-ID: <E1FJwJh-00084l-00__11342.7144977779$1416624587$gmane$org@dorka.pomaz.szeredi.hu>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<20060316161336.GA16771@colo.lackof.org>
	<1142528286.3244.19.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org,
 chris@frostnet.net
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1142528286.3244.19.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Thu, 16 Mar 2006 10:58:06 -0600)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This is wrong.  A VIPT cache requires a mapping to flush on.  If you
> kunmap, you've lost the mapping.

Ahh, I knew I was missing something fundamental.

> What you should do is
> 
> kmap()
> operate on data
> flush_kernel_dcache_page()
> kunmap()

Chris, can you try the below patch?

Thanks,
Miklos

Index: linux/fs/fuse/dev.c
===================================================================
--- linux.orig/fs/fuse/dev.c	2006-03-13 18:26:00.000000000 +0100
+++ linux/fs/fuse/dev.c	2006-03-16 18:28:54.000000000 +0100
@@ -432,11 +432,11 @@ static void fuse_copy_init(struct fuse_c
 static void fuse_copy_finish(struct fuse_copy_state *cs)
 {
 	if (cs->mapaddr) {
-		kunmap_atomic(cs->mapaddr, KM_USER0);
-		if (cs->write) {
+		if (cs->write)
 			flush_dcache_page(cs->pg);
+		kunmap_atomic(cs->mapaddr, KM_USER0);
+		if (cs->write)
 			set_page_dirty_lock(cs->pg);
-		}
 		put_page(cs->pg);
 		cs->mapaddr = NULL;
 	}
@@ -504,6 +504,8 @@ static int fuse_copy_page(struct fuse_co
 	if (page && zeroing && count < PAGE_SIZE) {
 		void *mapaddr = kmap_atomic(page, KM_USER1);
 		memset(mapaddr, 0, PAGE_SIZE);
+		if (!cs->write)
+			flush_dcache_page(page);
 		kunmap_atomic(mapaddr, KM_USER1);
 	}
 	while (count) {
@@ -514,12 +516,12 @@ static int fuse_copy_page(struct fuse_co
 			void *mapaddr = kmap_atomic(page, KM_USER1);
 			void *buf = mapaddr + offset;
 			offset += fuse_copy_do(cs, &buf, &count);
+			if (!cs->write)
+				flush_dcache_page(page);
 			kunmap_atomic(mapaddr, KM_USER1);
 		} else
 			offset += fuse_copy_do(cs, NULL, &count);
 	}
-	if (page && !cs->write)
-		flush_dcache_page(page);
 	return 0;
 }
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
