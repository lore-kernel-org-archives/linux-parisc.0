Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id B73004829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 00:44:56 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 63C072B282
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 00:44:52 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 13 Nov 2002 00:44:52 -0700
Message-Id: <1037173492.9031.7.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] Broken Cache Flushing in arch/parisc/kernel/signal.c.??
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

Hello parisc-linux hackers,

I spent the evening tracking down why the serial mux failed to start
init and I kept getting the cow message on 2.5.47...and why it worked
for 2.5.46-pa7. After re-merging all the cvs commits in the last 4 days,
I finally tracked the problem down to this chunk of code from
arch/parisc/kernel/singal.c:

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/signal.c,v
retrieving revision 1.6
diff -u -p -r1.6 signal.c
--- arch/parisc/kernel/signal.c	10 Nov 2002 19:39:16 -0000	1.6
+++ arch/parisc/kernel/signal.c	13 Nov 2002 07:38:58 -0000
@@ -308,8 +308,21 @@ setup_rt_frame(int sig, struct k_sigacti
 	}
 #endif
 
+#if CACHE_FLUSHING_IS_NOT_BROKEN
 	flush_icache_range((unsigned long) &frame->tramp[0],
 			   (unsigned long) &frame->tramp[4]);
+#else
+       /* It should *always* be cache line-aligned, but the compiler
+           sometimes screws up. */
+       asm volatile("fdc 0(%%sr3,%0)\n\t"
+                    "fdc %1(%%sr3,%0)\n\t"
+                    "sync\n\t"
+                    "fic 0(%%sr3,%0)\n\t"
+                    "fic %1(%%sr3,%0)\n\t"
+                    "sync\n\t"
+                    : : "r" (frame->tramp), "r" (L1_CACHE_BYTES));
+#endif
+
 	rp = (unsigned long) frame->tramp;
 
 	if (err)


This patch is needed to restore the functionality of the 2.5.46 kernel
so the Serial Mux, pdc console, etc will boot on the K460, etc.  I did
not want to re-commit this patch because it is ugly, and it would be
nice to figure out how to solve this problem properly.  

Any thoughts, suggestions, etc?

Thanks!

- Ryan
