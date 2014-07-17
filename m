From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [RFC PATCH] 64bit LWS CAS
Date: Thu, 17 Jul 2014 22:00:00 +0200
Message-ID: <20140717220000.555b2bec@dellete.lux.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/km4FDq+E+/5RFV+s67pDqBM"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/km4FDq+E+/5RFV+s67pDqBM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I've attached the gcc and kernel patch for 64bit CAS. So far I've
implemented the easiest use case which is for 64bit kernel.

I'll investigate using the FPU register for 64 bit operations with
32bit kernels.

I feel like there is a lot of code duplication in my patches, this can
probably be optimized altho it might reduce readability.

Any comments ?


Thanks,
  Guy
--MP_/km4FDq+E+/5RFV+s67pDqBM
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux-hppa-atomic-cas-64bit.patch

--- ./arch/parisc/kernel/syscall.S.orig	2014-07-16 16:39:20.684498341 +0200
+++ ./arch/parisc/kernel/syscall.S	2014-07-17 21:34:35.091933739 +0200
@@ -74,7 +74,7 @@
 	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
-#define __NR_lws_entries (2)
+#define __NR_lws_entries (3)
 
 lws_entry:
 	gate	lws_start, %r0		/* increase privilege */
@@ -502,7 +502,7 @@
 
 	
 	/***************************************************
-		Implementing CAS as an atomic operation:
+		Implementing 32bit CAS as an atomic operation:
 
 		%r26 - Address to examine
 		%r25 - Old value to check (old)
@@ -658,6 +658,161 @@
 	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 3b-linux_gateway_page)
 	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 3b-linux_gateway_page)
 
+	
+	/***************************************************
+		Implementing 64bit CAS as an atomic operation for ELF32:
+
+		%r26 - Address to examine
+		%r25 - Old 32bit high value to check (old)
+		%r24 - Old 32bit low value to check (old)
+		%r23 - New 32bit high value to set (new)
+		%r22 - New 32bit low value to set (new)
+		%r28 - Return prev 32bit high through this register.
+		%r29 - Return prev 32bit low through this register.
+		%r21 - Kernel error code
+
+		If debugging is DISabled:
+
+		%r21 has the following meanings:
+
+		EAGAIN - CAS is busy, ldcw failed, try again.
+		EFAULT - Read or write failed.		
+
+		If debugging is enabled:
+
+		EDEADLOCK - CAS called recursively.
+		EAGAIN && r28 == 1 - CAS is busy. Lock contended.
+		EAGAIN && r28 == 2 - CAS is busy. ldcw failed.
+		EFAULT - Read or write failed.
+
+		Scratch: r20, r28, r1
+
+	****************************************************/
+
+	/* ELF32 Process entry path */
+lws_compare_and_swap_dword:
+#ifdef CONFIG_64BIT
+	/* Clip all the input registers */
+	depdi	0, 31, 32, %r26
+	/* Merge low/high bits */
+	shld	%r25, 32, %r24
+	shld	%r23, 32, %r22
+#else
+#error Not implemented
+#endif
+	/* Load start of lock table */
+	ldil	L%lws_lock_start, %r20
+	ldo	R%lws_lock_start(%r20), %r28
+
+	/* Extract four bits from r26 and hash lock (Bits 4-7) */
+	extru  %r26, 27, 4, %r20
+
+	/* Find lock to use, the hash is either one of 0 to
+	   15, multiplied by 16 (keep it 16-byte aligned)
+	   and add to the lock table offset. */
+	shlw	%r20, 4, %r20
+	add	%r20, %r28, %r20
+
+# if ENABLE_LWS_DEBUG
+	/*	
+		DEBUG, check for deadlock! 
+		If the thread register values are the same
+		then we were the one that locked it last and
+		this is a recurisve call that will deadlock.
+		We *must* giveup this call and fail.
+	*/
+	ldw	4(%sr2,%r20), %r28			/* Load thread register */
+	/* WARNING: If cr27 cycles to the same value we have problems */
+	mfctl	%cr27, %r21				/* Get current thread register */
+	cmpb,<>,n	%r21, %r28, cas_dword_lock	/* Called recursive? */
+	b	lws_exit				/* Return error! */
+	ldo	-EDEADLOCK(%r0), %r21
+cas_dword_lock:
+	cmpb,=,n	%r0, %r28, cas_dword_nocontend /* Is nobody using it? */
+	ldo	1(%r0), %r28				/* 1st case */
+	b	lws_exit				/* Contended... */
+	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+cas_dword_nocontend:
+# endif
+/* ENABLE_LWS_DEBUG */
+
+	rsm	PSW_SM_I, %r0				/* Disable interrupts */
+	/* COW breaks can cause contention on UP systems */
+	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
+	cmpb,<>,n	%r0, %r28, cas_dword_action	/* Did we get it? */
+cas_dword_wouldblock:
+	ldo	2(%r0), %r28				/* 2nd case */
+	ssm	PSW_SM_I, %r0
+	b	lws_exit				/* Contended... */
+	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+
+	/*
+		prev = *addr;
+		if ( prev == old )
+		  *addr = new;
+		return prev;
+	*/
+
+	/* NOTES:
+		This all works becuse intr_do_signal
+		and schedule both check the return iasq
+		and see that we are on the kernel page
+		so this process is never scheduled off
+		or is ever sent any signal of any sort,
+		thus it is wholly atomic from usrspaces
+		perspective
+	*/
+cas_dword_action:
+#if defined CONFIG_SMP && ENABLE_LWS_DEBUG
+	/* DEBUG */
+	mfctl	%cr27, %r1
+	stw	%r1, 4(%sr2,%r20)
+#endif
+
+#ifdef CONFIG_64BIT
+	/* The load and store could fail */
+4:	ldd,ma	0(%sr3,%r26), %r29
+	sub,<>	%r29, %r24, %r0
+5:	std,ma	%r22, 0(%sr3,%r26)
+	/* Split the high/low bit of the result */
+	shrd	%r29,32,%r28
+	depdi	0, 31, 32, %r28
+#else
+#error Not implemented
+#endif
+
+	/* Free lock */
+	stw,ma	%r20, 0(%sr2,%r20)
+#if ENABLE_LWS_DEBUG
+	/* Clear thread register indicator */
+	stw	%r0, 4(%sr2,%r20)
+#endif
+	/* Enable interrupts */
+	ssm	PSW_SM_I, %r0
+	/* Return to userspace, set no error */
+	b	lws_exit
+	copy	%r0, %r21
+
+6:		
+	/* Error occurred on load or store */
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+#if ENABLE_LWS_DEBUG
+	stw	%r0, 4(%sr2,%r20)
+#endif
+	ssm	PSW_SM_I, %r0
+	b	lws_exit
+	ldo	-EFAULT(%r0),%r21	/* set errno */
+	nop
+	nop
+	nop
+	nop
+
+	/* Two exception table entries, one for the loads,
+	   the other for the store. Either return -EFAULT.
+	   Each of the entries must be relocated. */
+	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 6b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 6b-linux_gateway_page)
 
 	/* Make sure nothing else is placed on this page */
 	.align PAGE_SIZE
@@ -675,8 +830,9 @@
 	/* Light-weight-syscall table */
 	/* Start of lws table. */
 ENTRY(lws_table)
-	LWS_ENTRY(compare_and_swap32)	/* 0 - ELF32 Atomic compare and swap */
-	LWS_ENTRY(compare_and_swap64)	/* 1 - ELF64 Atomic compare and swap */
+	LWS_ENTRY(compare_and_swap32)		/* 0 - ELF32 Atomic 32bit compare and swap */
+	LWS_ENTRY(compare_and_swap64)		/* 1 - ELF64 Atomic 32bit compare and swap */
+	LWS_ENTRY(compare_and_swap_dword)	/* 2 - ELF32 Atomic 64bit compare and swap */
 END(lws_table)
 	/* End of lws table */
 

--MP_/km4FDq+E+/5RFV+s67pDqBM
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=gcc-atomic-buildins-64bit.patch

--- libgcc/config/pa/linux-atomic.c.orig	2014-07-16 19:29:28.670595484 +0000
+++ libgcc/config/pa/linux-atomic.c	2014-07-16 19:31:32.754003341 +0000
@@ -24,6 +24,8 @@
 see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
 <http://www.gnu.org/licenses/>.  */
 
+#include <stdint.h>
+
 #define EFAULT  14 
 #define EBUSY   16
 #define ENOSYS 251 
@@ -75,6 +77,39 @@
   return lws_errno;
 }
 
+/* Kernel helper for compare-and-exchange a 64-bit value from ELF32.  */
+static inline long
+__kernel_cmpxchg_dword32 (int64_t oldval, int64_t newval, int64_t *mem)
+{
+  register unsigned long lws_mem asm("r26") = (unsigned long) (mem);
+  register long lws_ret_h   asm("r28");
+  register long lws_ret_l   asm("r29");
+  register long lws_errno   asm("r21");
+  register int lws_old_h    asm("r25") = oldval >> 32;
+  register int lws_old_l    asm("r24") = oldval & 0xffffffff;
+  register int lws_new_h    asm("r23") = newval >> 32;
+  register int lws_new_l    asm("r22") = newval & 0xffffffff;
+  asm volatile (	"ble	0xb0(%%sr2, %%r0)	\n\t"
+			"ldi	%8, %%r20		\n\t"
+	: "=r" (lws_ret_h), "=r" (lws_ret_l), "=r" (lws_errno), "=r" (lws_mem),
+	  "=r" (lws_old_h), "=r" (lws_old_l), "=r" (lws_new_h), "=r" (lws_new_l)
+	: "i" (2), "3" (lws_mem), "4" (lws_old_h), "5" (lws_old_l), "6" (lws_new_h), "7" (lws_new_l)
+	: "r1", "r20", "r31", "memory"
+  );
+  if (__builtin_expect (lws_errno == -EFAULT || lws_errno == -ENOSYS, 0))
+    ABORT_INSTRUCTION;
+
+   int64_t lws_ret = ((int64_t)lws_ret_h << 32) | (int64_t)lws_ret_l;
+
+  /* If the kernel LWS call succeeded (lws_errno == 0), lws_ret contains
+     the old value from memory.  If this value is equal to OLDVAL, the
+     new value was written to memory.  If not, return -EBUSY.  */
+  if (!lws_errno && lws_ret != oldval)
+    lws_errno = -EBUSY;
+
+  return lws_errno;
+}
+
 #define HIDDEN __attribute__ ((visibility ("hidden")))
 
 /* Big endian masks  */
@@ -84,6 +119,28 @@
 #define MASK_1 0xffu
 #define MASK_2 0xffffu
 
+#define FETCH_AND_OP_DWORD(OP, PFX_OP, INF_OP)					\
+  int64_t HIDDEN								\
+  __sync_fetch_and_##OP##_8 (int64_t *ptr, int64_t val)				\
+  {										\
+    int64_t tmp;								\
+    int failure;								\
+										\
+    do {									\
+      tmp = *ptr;								\
+      failure = __kernel_cmpxchg_dword32 (tmp, PFX_OP (tmp INF_OP val), ptr);	\
+    } while (failure != 0);							\
+										\
+    return tmp;									\
+  }
+
+FETCH_AND_OP_DWORD (add,   , +)
+FETCH_AND_OP_DWORD (sub,   , -)
+FETCH_AND_OP_DWORD (or,    , |)
+FETCH_AND_OP_DWORD (and,   , &)
+FETCH_AND_OP_DWORD (xor,   , ^)
+FETCH_AND_OP_DWORD (nand, ~, &)
+
 #define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP)				\
   int HIDDEN								\
   __sync_fetch_and_##OP##_4 (int *ptr, int val)				\
@@ -147,6 +204,28 @@
 SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, oldval)
 SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, oldval)
 
+#define OP_AND_FETCH_DWORD(OP, PFX_OP, INF_OP)					\
+  int64_t HIDDEN								\
+  __sync_##OP##_and_fetch_8 (int64_t *ptr, int64_t val)				\
+  {										\
+    int64_t tmp;								\
+    int failure;								\
+										\
+    do {									\
+      tmp = *ptr;								\
+      failure = __kernel_cmpxchg_dword32 (tmp, PFX_OP (tmp INF_OP val), ptr);	\
+    } while (failure != 0);							\
+										\
+    return PFX_OP (tmp INF_OP val);						\
+  }
+
+OP_AND_FETCH_DWORD (add,   , +)
+OP_AND_FETCH_DWORD (sub,   , -)
+OP_AND_FETCH_DWORD (or,    , |)
+OP_AND_FETCH_DWORD (and,   , &)
+OP_AND_FETCH_DWORD (xor,   , ^)
+OP_AND_FETCH_DWORD (nand, ~, &)
+
 #define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
   int HIDDEN								\
   __sync_##OP##_and_fetch_4 (int *ptr, int val)				\
@@ -182,6 +261,26 @@
 SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, newval)
 SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, newval)
 
+int64_t HIDDEN
+__sync_val_compare_and_swap_8 (int64_t *ptr, int64_t oldval, int64_t newval)
+{
+  int64_t actual_oldval;
+  int fail;
+    
+  while (1)
+    {
+      actual_oldval = *ptr;
+
+      if (__builtin_expect (oldval != actual_oldval, 0))
+	return actual_oldval;
+
+      fail = __kernel_cmpxchg_dword32 (actual_oldval, newval, ptr);
+  
+      if (__builtin_expect (!fail, 1))
+	return actual_oldval;
+    }
+}
+
 int HIDDEN
 __sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
 {
@@ -256,6 +355,20 @@
 SUBWORD_BOOL_CAS (unsigned short, 2)
 SUBWORD_BOOL_CAS (unsigned char,  1)
 
+int64_t HIDDEN
+__sync_lock_test_and_set_8 (int64_t *ptr, int64_t val)
+{
+  int64_t oldval;
+  int failure;
+
+  do {
+    oldval = *ptr;
+    failure = __kernel_cmpxchg_dword32 (oldval, val, ptr);
+  } while (failure != 0);
+
+  return oldval;
+}
+
 int HIDDEN
 __sync_lock_test_and_set_4 (int *ptr, int val)
 {
@@ -300,6 +413,7 @@
     *ptr = 0;								\
   }
 
-SYNC_LOCK_RELEASE (int,   4)
-SYNC_LOCK_RELEASE (short, 2)
-SYNC_LOCK_RELEASE (char,  1)
+SYNC_LOCK_RELEASE (int64_t, 8)
+SYNC_LOCK_RELEASE (int,     4)
+SYNC_LOCK_RELEASE (short,   2)
+SYNC_LOCK_RELEASE (char,    1)

--MP_/km4FDq+E+/5RFV+s67pDqBM--

