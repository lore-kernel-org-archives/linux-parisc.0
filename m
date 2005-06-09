From: Kyle McMartin <kyle@fattire.cabal.ca>
Subject: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 01:07:02 -0400
Message-ID: <20050609050702.GB4641@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The 16-byte alignment for ldcw doesn't seem to be required on PA2.0
processors (though the details of the insn in the manual are confusing)
so let's get rid of it.

This is a rather nice savings:
    text    data     bss     dec     hex filename
4020166 1814920  368896 6203982  5eaa4e vmlinux
4096278 1822416  373400 6292094  60027e vmlinux.orig

The comment on the PA2.0 case could use a little work though. :)

(I also added labels to the __SPIN_LOCK_UNLOCKED, as in the
 first pass through, I missed that, which caused very interesting
 build warnings...)

cheers,
	kyle

Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
retrieving revision 1.10
diff -u -d -p -r1.10 spinlock.h
--- include/asm-parisc/spinlock.h	7 Mar 2005 15:05:48 -0000	1.10
+++ include/asm-parisc/spinlock.h	9 Jun 2005 04:23:03 -0000
@@ -10,7 +10,12 @@
 
 #ifndef CONFIG_DEBUG_SPINLOCK
 
-#define __SPIN_LOCK_UNLOCKED	{ { 1, 1, 1, 1 } }
+#ifdef CONFIG_PA20
+#define __SPIN_LOCK_UNLOCKED    { .lock = 1, }
+#else
+#define __SPIN_LOCK_UNLOCKED	{ .lock = { 1, 1, 1, 1 }, }
+#endif
+
 #undef SPIN_LOCK_UNLOCKED
 #define SPIN_LOCK_UNLOCKED (spinlock_t) __SPIN_LOCK_UNLOCKED
 
Index: include/asm-parisc/system.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
retrieving revision 1.11
diff -u -d -p -r1.11 system.h
--- include/asm-parisc/system.h	4 Jun 2005 07:11:25 -0000	1.11
+++ include/asm-parisc/system.h	9 Jun 2005 04:23:03 -0000
@@ -145,6 +145,7 @@ static inline void set_eiem(unsigned lon
 	__ret; \
 })
 
+#ifndef CONFIG_PA20
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
    and GCC only guarantees 8-byte alignment for stack locals, we can't
    be assured of 16-byte alignment for atomic lock data even if we
@@ -152,6 +153,7 @@ static inline void set_eiem(unsigned lon
    we use a struct containing an array of four ints for the atomic lock
    type and dynamically select the 16-byte aligned int from the array
    for the semaphore.  */
+
 #define __PA_LDCW_ALIGNMENT 16
 #define __ldcw_align(a) ({ \
   unsigned long __ret = (unsigned long) &(a)->lock[0];        		\
@@ -159,13 +161,26 @@ static inline void set_eiem(unsigned lon
   (volatile unsigned int *) __ret;                                      \
 })
 
+#else /*CONFIG_PA20*/
+/* Apparently this architectural requirement was removed from PA2.0
+   processors. So we'll forego the 16-byte alignment on these machines. */
+
+#define __PA_LDCW_ALIGNMENT 4
+#define __ldcw_align(a) ((volatile unsigned int *)a)
+
+#endif /*!CONFIG_PA20*/
+
 #ifdef CONFIG_SMP
 /*
  * Your basic SMP spinlocks, allowing only a single CPU anywhere
  */
 
 typedef struct {
-	volatile unsigned int lock[4];
+#ifdef CONFIG_PA20
+	volatile unsigned int lock;
+#else
+        volatile unsigned int lock[4];
+#endif
 #ifdef CONFIG_DEBUG_SPINLOCK
 	unsigned long magic;
 	volatile unsigned int babble;

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
