Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0562482C
	for <parisc-linux@parisc-linux.org>;
	Sat,  3 Apr 2004 23:56:05 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id EAD1829804B
	for <parisc-linux@parisc-linux.org>;
	Sat,  3 Apr 2004 23:56:04 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02266-04 for <parisc-linux@parisc-linux.org>;
	Sat, 3 Apr 2004 23:56:04 -0700 (MST)
Date: Sat, 3 Apr 2004 23:56:04 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20040404065604.GA2335@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] ATOMIC_HASH brainfart
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
Seems like someone was confused when they hacked ATOMIC_HASH macro.
Cacheline is 64 bytes not 256...but I've been told several times gcc
is smart enough to convert "foo/64" to "foo>>6"...then just use
the L1_CACHE_BYTES definition to indicate intent?

I haven't verified everything builds and works right
but it looks "obviously correct" to me. Comments?

I'm still looking at getting SMP to boot.

grant


Index: include/asm/atomic.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/atomic.h,v
retrieving revision 1.6
diff -u -p -r1.6 atomic.h
--- a/include/asm/atomic.h	25 Mar 2004 06:19:07 -0000	1.6
+++ b/include/asm/atomic.h	4 Apr 2004 06:48:20 -0000
@@ -19,10 +19,10 @@ typedef spinlock_t atomic_lock_t;
 
 /* Use an array of spinlocks for our atomic_ts.
  * Hash function to index into a different SPINLOCK.
- * Since "a" is usually an address, ">>8" makes one spinlock per 64-bytes.
+ * Since "a" is usually an address, use one spinlock per cacheline.
  */
 #  define ATOMIC_HASH_SIZE 4
-#  define ATOMIC_HASH(a) (&__atomic_hash[(((unsigned long) a)>>8)&(ATOMIC_HASH_SIZE-1)])
+#  define ATOMIC_HASH(a) (&__atomic_hash[(((unsigned long) a)/L1_CACHE_BYTES)&(ATOMIC_HASH_SIZE-1)])
 
 extern atomic_lock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
 
