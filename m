Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id E48C5485D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 00:09:42 -0600 (MDT)
Date: Mon, 24 Sep 2001 02:10:54 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Cc: Albert Strasheim <fullung@ilink.nis.za>
Message-ID: <20010924021054.I3025@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Bn2rw/3z4jIqBvZU"
Subject: [parisc-linux] Non-atomic __set_bit
List-ID: <linux-parisc.vger.kernel.org>

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

parisc,

Walking the source for devfs and thinking about Alberts problem.

Would the non-working devfs be fixed by adding:

Non-atomic versions of set_bit e.g. __set_bit 
and test_and_set_bit e.g. __test_and_set_bit
to linux/include/asm-parisc/bitops.h?

I have the latest CVS linux module.
I've patched against that. It compiles now ;)
(god bless make -j8)

I'm currently sleepy, but I'll post the patch, and test
it tommorow on a 712/60 and 715/50.

c.

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bitops-devfs.diff"

--- ./linux/include/asm-parisc/bitops.h.orig	Mon Sep 24 01:27:31 2001
+++ ./linux/include/asm-parisc/bitops.h.mod	Mon Sep 24 01:41:38 2001
@@ -50,6 +50,26 @@
 	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
 }
 
+/*
+ * Non-Atomic __set_bit
+ *
+ * If called by multiple processes, only one will succeed.
+ * The others would have been reordered before the succeeding
+ * call.
+ *
+ */
+
+static __inline__ void __set_bit(int nr, void * address)
+{
+        unsigned long mask;
+        unsigned long *addr = (unsigned long *) address;
+
+        addr += (nr >> SHIFT_PER_LONG);
+        mask = 1L << CHOP_SHIFTCOUNT(nr);
+        *addr |= mask;
+}
+
+
 static __inline__ int test_and_clear_bit(int nr, void * address)
 {
 	unsigned long mask;
@@ -66,6 +86,25 @@
 
 	return oldbit;
 }
+
+/*
+ * Non-Atomic __test_and_clear_bit
+ *
+ */
+
+static __inline__ int __test_and_clear_bit(int nr, void * address)
+{
+        unsigned long mask;
+        unsigned long *addr = (unsigned long *) address;
+        int oldbit;
+        addr += (nr >> SHIFT_PER_LONG);
+        mask = 1L << CHOP_SHIFTCOUNT(nr);
+        oldbit = (*addr & mask) ? 1 : 0;
+        *addr &= ~mask;
+											            return oldbit;
+}
+
+
 
 static __inline__ void clear_bit(int nr, void * address)
 {

--Bn2rw/3z4jIqBvZU--
