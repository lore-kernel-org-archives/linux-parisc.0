From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [RFC PATCHv2] 64bit LWS CAS
Date: Tue, 29 Jul 2014 21:13:34 +0200
Message-ID: <20140729211334.02d2b5e2@borg.lux.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/mSAcROvYiRceeOw_I3WU0V/"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/mSAcROvYiRceeOw_I3WU0V/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

Following the discussion about broken CAS for size != 4, I took a new 
approach and implemented in a different way.

The new ABI takes the oldval, newval and mem as pointers plus a size 
parameter. This means that a single LWS can now handle all types of 
variable size.
Note that the 32bit CAS for 64bit size has not been tested (not even
compiled) since I can't compile a 32bit kernel a the moment.


My approach for 64bit CAS on 32bit is be the following :
  - Load old into 2 registers
  - Compare low and high part and bail out if different
  - Load new into a FPU register
  - Store the content of the FPU register to the memory

The point here being to do the store in the last step in a single 
instruction.
I think the same approach can be used for 128bit CAS as well but I
don't think it's needed at the moment.


Regading the GCC counterpart of the implementation, I'm not sure about 
the way to proceed.

Should I try to detect the presence of the new LWS and use it for all 
CAS operations at init time ?

So far I only used the new LWS for 64bit CAS.
I guess that using the new LWS unconditionally for all CAS operations 
isn't an option since it will break for newer gcc on old kernels.


Regards,
   Guy



--MP_/mSAcROvYiRceeOw_I3WU0V/
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=gcc-64bit-atomic-cas2.patch

--- libgcc/config/pa/linux-atomic.c	2011-11-02 15:23:48.000000000 +0000
+++ /root/gcc-trunk/libgcc/config/pa/linux-atomic.c	2014-07-29 16:05:21.932078161 +0000
@@ -1,5 +1,5 @@
 /* Linux-specific atomic operations for PA Linux.
-   Copyright (C) 2008, 2009, 2010 Free Software Foundation, Inc.
+   Copyright (C) 2008-2014 Free Software Foundation, Inc.
    Based on code contributed by CodeSourcery for ARM EABI Linux.
    Modifications for PA Linux by Helge Deller <deller@gmx.de>
 
@@ -75,6 +75,31 @@
   return lws_errno;
 }
 
+static inline long
+__kernel_cmpxchg2 (void * oldval, void * newval, void *mem, int val_size)
+{
+
+  register unsigned long lws_mem asm("r26") = (unsigned long) (mem);
+  register long lws_ret   asm("r28");
+  register long lws_errno asm("r21");
+  register unsigned long lws_old asm("r25") = (unsigned long) oldval;
+  register unsigned long lws_new asm("r24") = (unsigned long) newval;
+  register int lws_size asm("r23") = val_size;
+  asm volatile (	"ble	0xb0(%%sr2, %%r0)	\n\t"
+			"ldi	%2, %%r20		\n\t"
+	: "=r" (lws_ret), "=r" (lws_errno)
+	: "i" (2), "r" (lws_mem), "r" (lws_old), "r" (lws_new), "r" (lws_size)
+	: "r1", "r20", "r22", "r29", "r31", "fr4", "memory"
+  );
+  if (__builtin_expect (lws_errno == -EFAULT || lws_errno == -ENOSYS, 0))
+    ABORT_INSTRUCTION;
+
+  /* If the kernel LWS call fails, retrun EBUSY */
+  if (!lws_errno && lws_ret)
+    lws_errno = -EBUSY;
+
+  return lws_errno;
+}
 #define HIDDEN __attribute__ ((visibility ("hidden")))
 
 /* Big endian masks  */
@@ -84,6 +109,29 @@
 #define MASK_1 0xffu
 #define MASK_2 0xffffu
 
+#define FETCH_AND_OP_DWORD(OP, PFX_OP, INF_OP)					\
+  long long HIDDEN								\
+  __sync_fetch_and_##OP##_8 (long long *ptr, long long val)			\
+  {										\
+    long long tmp, newval;							\
+    int failure;								\
+										\
+    do {									\
+      tmp = *ptr;								\
+      newval = PFX_OP (tmp INF_OP val);						\
+      failure = __kernel_cmpxchg2 (&tmp, &newval, ptr, 3);			\
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
@@ -147,6 +195,29 @@
 SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, oldval)
 SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, oldval)
 
+#define OP_AND_FETCH_DWORD(OP, PFX_OP, INF_OP)					\
+  long long HIDDEN								\
+  __sync_##OP##_and_fetch_8 (long long *ptr, long long val)			\
+  {										\
+    long long tmp, newval;							\
+    int failure;								\
+										\
+    do {									\
+      tmp = *ptr;								\
+      newval = PFX_OP (tmp INF_OP val);						\
+      failure = __kernel_cmpxchg2 (&tmp, &newval, ptr, 3);			\
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
@@ -182,6 +253,26 @@
 SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, newval)
 SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, newval)
 
+long long HIDDEN
+__sync_val_compare_and_swap_8 (long long *ptr, long long oldval, long long newval)
+{
+  long long actual_oldval;
+  int fail;
+    
+  while (1)
+    {
+      actual_oldval = *ptr;
+
+      if (__builtin_expect (oldval != actual_oldval, 0))
+	return actual_oldval;
+
+      fail = __kernel_cmpxchg2 (&actual_oldval, &newval, ptr, 3);
+  
+      if (__builtin_expect (!fail, 1))
+	return actual_oldval;
+    }
+}
+
 int HIDDEN
 __sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
 {
@@ -256,6 +347,20 @@
 SUBWORD_BOOL_CAS (unsigned short, 2)
 SUBWORD_BOOL_CAS (unsigned char,  1)
 
+long long HIDDEN
+__sync_lock_test_and_set_8 (long long *ptr, long long val)
+{
+  long long oldval;
+  int failure;
+
+  do {
+    oldval = *ptr;
+    failure = __kernel_cmpxchg2 (&oldval, &val, ptr, 3);
+  } while (failure != 0);
+
+  return oldval;
+}
+
 int HIDDEN
 __sync_lock_test_and_set_4 (int *ptr, int val)
 {
@@ -293,13 +398,45 @@
 SUBWORD_TEST_AND_SET (unsigned short, 2)
 SUBWORD_TEST_AND_SET (unsigned char,  1)
 
+void HIDDEN
+__sync_lock_release_8 (int *ptr)
+{
+  long long failure, oldval, zero = 0;
+
+  do {
+    oldval = *ptr;
+    failure = __kernel_cmpxchg2 (&oldval, &zero, ptr, 3);
+  } while (failure != 0);
+}
+
+void HIDDEN
+__sync_lock_release_4 (int *ptr)
+{
+  int failure, oldval;
+
+  do {
+    oldval = *ptr;
+    failure = __kernel_cmpxchg (oldval, 0, ptr);
+  } while (failure != 0);
+}
+
 #define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
   void HIDDEN								\
   __sync_lock_release_##WIDTH (TYPE *ptr)				\
   {									\
-    *ptr = 0;								\
+    int failure;							\
+    unsigned int oldval, newval, shift, mask;				\
+    int *wordptr = (int *) ((unsigned long) ptr & ~3);			\
+									\
+    shift = (((unsigned long) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
+    mask = MASK_##WIDTH << shift;					\
+									\
+    do {								\
+      oldval = *wordptr;						\
+      newval = oldval & ~mask;						\
+      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
+    } while (failure != 0);						\
   }
 
-SYNC_LOCK_RELEASE (int,   4)
 SYNC_LOCK_RELEASE (short, 2)
 SYNC_LOCK_RELEASE (char,  1)

--MP_/mSAcROvYiRceeOw_I3WU0V/
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux-hppa-atomic-cas2.patch

--- arch/parisc/kernel/syscall.S.orig	2014-06-08 20:19:54.000000000 +0200
+++ arch/parisc/kernel/syscall.S	2014-07-25 23:45:10.544853275 +0200
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
@@ -658,6 +658,274 @@
 	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 3b-linux_gateway_page)
 	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 3b-linux_gateway_page)
 
+	
+	/***************************************************
+		New CAS implementation which uses pointers and variable size information.
+		The value pointed by old and new MUST NOT change while performing CAS.
+		The lock only protect the value at %r26.
+
+		%r26 - Address to examine
+		%r25 - Pointer to the value to check (old)
+		%r24 - Pointer to the value to set (new)
+		%r23 - Size of the variable (8bit = 0, 16bit = 1, 32bit = 2, 64bit = 4)
+		%r28 - Return non-zero on failure
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
+		Scratch: r20, r22, r28, r29, r1, fr4 (32bit for 64bit CAS only)
+
+	****************************************************/
+
+	/* ELF32 Process entry path */
+lws_compare_and_swap_2:
+#ifdef CONFIG_64BIT
+	/* Clip the input registers */
+	depdi	0, 31, 32, %r26
+	depdi	0, 31, 32, %r25
+	depdi	0, 31, 32, %r24
+	depdi	0, 31, 32, %r23
+#endif
+
+	/* Check the validity of the size pointer */
+	subi,>>= 4, %r23, %r0
+	b,n	lws_exit_nosys
+
+	/* Jump to the functions which will load the old and new values into
+	   registers depending on the their size */
+	shlw	%r23, 2, %r29
+	blr	%r29, %r0
+	nop
+
+	/* 8bit load */
+4:	ldb	0(%sr3,%r25), %r25
+	b	cas2_lock_start
+5:	ldb	0(%sr3,%r24), %r24
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	/* 16bit load */
+6:	ldh	0(%sr3,%r25), %r25
+	b	cas2_lock_start
+7:	ldh	0(%sr3,%r24), %r24
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	/* 32bit load */
+8:	ldw	0(%sr3,%r25), %r25
+	b	cas2_lock_start
+9:	ldw	0(%sr3,%r24), %r24
+	nop
+	nop
+	nop
+	nop
+	nop
+
+	/* 64bit load */
+#ifdef CONFIG_64BIT
+10:	ldd	0(%sr3,%r25), %r25
+11:	ldd	0(%sr3,%r24), %r24
+#else
+	/* Load new value into r22/r23 - high/low */
+10:	ldw	0(%sr3,%r25), %r22
+11:	ldw	4(%sr3,%r25), %r23
+#endif
+
+cas2_lock_start:
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
+	cmpb,<>,n	%r21, %r28, cas2_lock	/* Called recursive? */
+	b	lws_exit				/* Return error! */
+	ldo	-EDEADLOCK(%r0), %r21
+cas2_lock:
+	cmpb,=,n	%r0, %r28, cas2_nocontend /* Is nobody using it? */
+	ldo	1(%r0), %r28				/* 1st case */
+	b	lws_exit				/* Contended... */
+	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+cas2_nocontend:
+# endif
+/* ENABLE_LWS_DEBUG */
+
+	rsm	PSW_SM_I, %r0				/* Disable interrupts */
+	/* COW breaks can cause contention on UP systems */
+	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
+	cmpb,<>,n	%r0, %r28, cas2_action	/* Did we get it? */
+cas2_wouldblock:
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
+cas2_action:
+#if defined CONFIG_SMP && ENABLE_LWS_DEBUG
+	/* DEBUG */
+	mfctl	%cr27, %r1
+	stw	%r1, 4(%sr2,%r20)
+#endif
+
+	/* Jump to the correct function */
+	blr	%r29, %r0
+	/* Set %r28 as non-zero for now */
+	ldo	1(%r0),%r28
+
+	/* 8bit CAS */
+12:	ldb,ma	0(%sr3,%r26), %r29
+	sub,=	%r29, %r25, %r0
+	b,n	cas2_end
+13:	stb,ma	%r24, 0(%sr3,%r26)
+	b	cas2_end
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 16bit CAS */
+14:	ldh,ma	0(%sr3,%r26), %r29
+	sub,=	%r29, %r25, %r0
+	b,n	cas2_end
+15:	sth,ma	%r24, 0(%sr3,%r26)
+	b	cas2_end
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 32bit CAS */
+16:	ldw,ma	0(%sr3,%r26), %r29
+	sub,=	%r29, %r25, %r0
+	b,n	cas2_end
+17:	stw,ma	%r24, 0(%sr3,%r26)
+	b	cas2_end
+	copy	%r0, %r28
+	nop
+	nop
+
+	/* 64bit CAS */
+#ifdef CONFIG_64BIT
+18:	ldd,ma	0(%sr3,%r26), %r29
+	sub,=	%r29, %r25, %r0
+	b,n	cas2_end
+19:	std,ma	%r24, 0(%sr3,%r26)
+	copy	%r0, %r28
+#else
+	/* Compare first word */
+18:	ldd,ma	0(%sr3,%r26), %r29
+	sub,=	%r29, %r22, %r0
+	b,n	cas2_end
+	/* Compare second word */
+19:	ldd,ma	4(%sr3,%r26), %r29
+	sub,=	%r29, %r23, %r0
+	b,n	cas2_end
+	/* Performe the store */
+20:	flddx	0(%sr3,%r24), %fr4
+21:	fstdx	%fr4, 0(%sr3,%r26)
+	copy	%r0, %r28
+#endif
+
+cas2_end:
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
+22:		
+	/* Error occurred on load or store */
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+#if ENABLE_LWS_DEBUG
+	stw	%r0, 4(%sr2,%r20)
+#endif
+	ssm	PSW_SM_I, %r0
+	ldo	1(%r0),%r28
+	b	lws_exit
+	ldo	-EFAULT(%r0),%r21	/* set errno */
+	nop
+	nop
+	nop
+
+	/* Exception table entries, for the load and store, return EFAULT.
+	   Each of the entries must be relocated. */
+	ASM_EXCEPTIONTABLE_ENTRY(4b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(5b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(6b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(7b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(8b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(9b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(10b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(11b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(12b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(13b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(14b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(15b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(16b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(17b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(18b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(19b-linux_gateway_page, 22b-linux_gateway_page)
+#ifndef CONFIG_64BIT
+	ASM_EXCEPTIONTABLE_ENTRY(20b-linux_gateway_page, 22b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(21b-linux_gateway_page, 22b-linux_gateway_page)
+#endif
 
 	/* Make sure nothing else is placed on this page */
 	.align PAGE_SIZE
@@ -675,8 +943,9 @@
 	/* Light-weight-syscall table */
 	/* Start of lws table. */
 ENTRY(lws_table)
-	LWS_ENTRY(compare_and_swap32)	/* 0 - ELF32 Atomic compare and swap */
-	LWS_ENTRY(compare_and_swap64)	/* 1 - ELF64 Atomic compare and swap */
+	LWS_ENTRY(compare_and_swap32)		/* 0 - ELF32 Atomic 32bit compare and swap */
+	LWS_ENTRY(compare_and_swap64)		/* 1 - ELF64 Atomic 32bit compare and swap */
+	LWS_ENTRY(compare_and_swap_2)		/* 2 - ELF32 Atomic 64bit compare and swap */
 END(lws_table)
 	/* End of lws table */
 

--MP_/mSAcROvYiRceeOw_I3WU0V/--

