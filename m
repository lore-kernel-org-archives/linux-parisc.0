Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1978482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jan 2002 00:19:40 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16RTJK-0004sI-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jan 2002 08:19:38 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1011338378.3c47cc8a895dd@webmail.tiscalinet.be>
Date: Fri, 18 Jan 2002 08:19:38 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] sched-O1-2.4.17-I3.patch, need help
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

Hi all,

Curious to test the patch of the new scheduler-0(1) on the palin, I need your help.

I apply successfully the original patch against kernel 2.4.17-pa11 and after
analysing its contents it appear that there are some i386 specific patches.
There is the two which are problems for me because there are in asm section (and
I do not undertand what the first makes):

--- linux/include/asm-i386/bitops.h.orig        Tue Aug 21 14:26:16 2001
+++ linux/include/asm-i386/bitops.h     Wed Jan 16 00:52:28 2002
@@ -75,6 +75,14 @@
                :"=m" (ADDR)
                :"Ir" (nr));
 }
+
+static __inline__ void __clear_bit(int nr, volatile void * addr)
+{
+       __asm__ __volatile__(
+               "btrl %1,%0"
+               :"=m" (ADDR)
+               :"Ir" (nr));
+}
 #define smp_mb__before_clear_bit()     barrier()
 #define smp_mb__after_clear_bit()      barrier()

This second seems to me that I can transpose as it is but want your advice:

--- linux/include/asm-i386/mmu_context.h.orig   Tue Aug 21 14:26:23 2001
+++ linux/include/asm-i386/mmu_context.h        Wed Jan 16 00:52:28 2002
@@ -7,6 +7,28 @@
 #include <asm/pgalloc.h>

 /*
+ * Every architecture must define this function. It's the fastest
+ * way of searching a 168-bit bitmap where the first 128 bits are
+ * unlikely to be set. It's guaranteed that at least one of the 168
+ * bits is cleared.
+ */
+#if MAX_RT_PRIO != 128 || MAX_PRIO != 168
+# error update this function.
+#endif
+
+static inline int sched_find_first_zero_bit(unsigned long *b)
+{
+       unsigned int rt;
+
+       rt = b[0] & b[1] & b[2] & b[3];
+       if (unlikely(rt != 0xffffffff))
+               return find_first_zero_bit(b, MAX_RT_PRIO);
+
+       if (b[4] != ~0)
+               return ffz(b[4]) + MAX_RT_PRIO;
+       return ffz(b[5]) + 32 + MAX_RT_PRIO;
+}
+/*
  * possibly do the LDT unload here?
  */
 #define destroy_context(mm)            do { } while(0)

And what do you about this one (how to implement it on hppa?):

--- linux/arch/i386/kernel/process.c.orig       Sun Jan  6 13:55:47 2002
+++ linux/arch/i386/kernel/process.c    Wed Jan 16 00:52:28 2002
@@ -123,15 +123,12 @@
 void cpu_idle (void)
 {
        /* endless idle loop with no priority at all */
-       init_idle();
-       current->nice = 20;
-       current->counter = -100;

        while (1) {
                void (*idle)(void) = pm_idle;
                if (!idle)
                        idle = default_idle;
-               while (!current->need_resched)
+               if (!current->need_resched)
                        idle();
                schedule();
                check_pgt_cache();

Thanks in advance for your help,
        Joel

PS: please make me in CC.



-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
