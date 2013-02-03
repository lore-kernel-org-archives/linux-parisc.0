From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fixes and cleanups in page cache flushing (2/4)
Date: Mon, 4 Feb 2013 00:00:54 +0100
Message-ID: <20130203230054.GB14573@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Author: John David Anglin <dave.anglin@bell.net>

Implement clear_page_asm and copy_page_asm. These are optimized routines to
clear and copy a page.  I tested prefetch optimizations in clear_page_asm and
copy_page_asm but didn't see any significant performance improvement on rp3440.
I'm not sure if these are routines are significantly faster than memset and/or
memcpy, but they are there for further performance evaluation. 

TLB purge operations on PA 1.X SMP machines are now serialized with the help of
the new tlb_lock() and tlb_unlock() macros, since on some PA-RISC machines, TLB
purges need to be serialized in software.  Obviously, lock isn't needed in UP
kernels.  On PA 2.0 machines, there is a local TLB instruction which is much
less disruptive to the memory subsystem.  No lock is needed for local purge.

Loops are also unrolled in flush_instruction_cache_local and
flush_data_cache_local.

The implementation of what used to be copy_user_page (now copy_user_page_asm)
is now fixed. Additionally 64-bit support is now added. Read the preceding
comment which I didn't change.  I left the comment but it is now inaccurate.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 5d7218a..312b484 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -199,7 +199,6 @@ ENTRY(flush_instruction_cache_local)
 	.callinfo NO_CALLS
 	.entry
 
-	mtsp		%r0, %sr1
 	load32		cache_info, %r1
 
 	/* Flush Instruction Cache */
@@ -208,7 +207,8 @@ ENTRY(flush_instruction_cache_local)
 	LDREG		ICACHE_STRIDE(%r1), %arg1
 	LDREG		ICACHE_COUNT(%r1), %arg2
 	LDREG		ICACHE_LOOP(%r1), %arg3
-	rsm             PSW_SM_I, %r22		/* No mmgt ops during loop*/
+	rsm		PSW_SM_I, %r22		/* No mmgt ops during loop*/
+	mtsp		%r0, %sr1
 	addib,COND(=)		-1, %arg3, fioneloop	/* Preadjust and test */
 	movb,<,n	%arg3, %r31, fisync	/* If loop < 0, do sync */
 
@@ -220,7 +220,33 @@ fimanyloop:					/* Loop if LOOP >= 2 */
 	addib,COND(<=),n	-1, %arg2, fisync	/* Outer loop decr */
 
 fioneloop:					/* Loop if LOOP = 1 */
-	addib,COND(>)		-1, %arg2, fioneloop	/* Outer loop count decr */
+	/* Some implementations may flush with a single fice instruction */
+	cmpib,COND(>>=),n	15, %arg2, fioneloop2
+
+fioneloop1:
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	fice,m		%arg1(%sr1, %arg0)
+	addib,COND(>)	-16, %arg2, fioneloop1
+	fice,m		%arg1(%sr1, %arg0)
+
+	/* Check if done */
+	cmpb,COND(=),n	%arg2, %r0, fisync	/* Predict branch taken */
+
+fioneloop2:
+	addib,COND(>)	-1, %arg2, fioneloop2	/* Outer loop count decr */
 	fice,m		%arg1(%sr1, %arg0)	/* Fice for one loop */
 
 fisync:
@@ -240,8 +266,7 @@ ENTRY(flush_data_cache_local)
 	.callinfo NO_CALLS
 	.entry
 
-	mtsp		%r0, %sr1
-	load32 		cache_info, %r1
+	load32		cache_info, %r1
 
 	/* Flush Data Cache */
 
@@ -249,7 +274,8 @@ ENTRY(flush_data_cache_local)
 	LDREG		DCACHE_STRIDE(%r1), %arg1
 	LDREG		DCACHE_COUNT(%r1), %arg2
 	LDREG		DCACHE_LOOP(%r1), %arg3
-	rsm		PSW_SM_I, %r22
+	rsm		PSW_SM_I, %r22		/* No mmgt ops during loop*/
+	mtsp		%r0, %sr1
 	addib,COND(=)		-1, %arg3, fdoneloop	/* Preadjust and test */
 	movb,<,n	%arg3, %r31, fdsync	/* If loop < 0, do sync */
 
@@ -261,7 +287,33 @@ fdmanyloop:					/* Loop if LOOP >= 2 */
 	addib,COND(<=),n	-1, %arg2, fdsync	/* Outer loop decr */
 
 fdoneloop:					/* Loop if LOOP = 1 */
-	addib,COND(>)		-1, %arg2, fdoneloop	/* Outer loop count decr */
+	/* Some implementations may flush with a single fdce instruction */
+	cmpib,COND(>>=),n	15, %arg2, fdoneloop2
+
+fdoneloop1:
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	fdce,m		%arg1(%sr1, %arg0)
+	addib,COND(>)	-16, %arg2, fdoneloop1
+	fdce,m		%arg1(%sr1, %arg0)
+
+	/* Check if done */
+	cmpb,COND(=),n	%arg2, %r0, fdsync	/* Predict branch taken */
+
+fdoneloop2:
+	addib,COND(>)	-1, %arg2, fdoneloop2	/* Outer loop count decr */
 	fdce,m		%arg1(%sr1, %arg0)	/* Fdce for one loop */
 
 fdsync:
@@ -277,7 +329,104 @@ ENDPROC(flush_data_cache_local)
 
 	.align	16
 
-ENTRY(copy_user_page_asm)
+/* Macros to serialize TLB purge operations on SMP.  */
+
+	.macro	tlb_lock	la,flags,tmp
+#ifdef CONFIG_SMP
+	ldil		L%pa_tlb_lock,%r1
+	ldo		R%pa_tlb_lock(%r1),\la
+	rsm		PSW_SM_I,\flags
+1:	LDCW		0(\la),\tmp
+	cmpib,<>,n	0,\tmp,3f
+2:	ldw		0(\la),\tmp
+	cmpb,<>		%r0,\tmp,1b
+	nop
+	b,n		2b
+3:
+#endif
+	.endm
+
+	.macro	tlb_unlock	la,flags,tmp
+#ifdef CONFIG_SMP
+	ldi		1,\tmp
+	stw		\tmp,0(\la)
+	mtsm		\flags
+#endif
+	.endm
+
+/* Clear page using kernel mapping.  */
+
+ENTRY(clear_page_asm)
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+#ifdef CONFIG_64BIT
+
+	/* Unroll the loop.  */
+	ldi		(PAGE_SIZE / 128), %r1
+
+1:
+	std		%r0, 0(%r26)
+	std		%r0, 8(%r26)
+	std		%r0, 16(%r26)
+	std		%r0, 24(%r26)
+	std		%r0, 32(%r26)
+	std		%r0, 40(%r26)
+	std		%r0, 48(%r26)
+	std		%r0, 56(%r26)
+	std		%r0, 64(%r26)
+	std		%r0, 72(%r26)
+	std		%r0, 80(%r26)
+	std		%r0, 88(%r26)
+	std		%r0, 96(%r26)
+	std		%r0, 104(%r26)
+	std		%r0, 112(%r26)
+	std		%r0, 120(%r26)
+
+	/* Note reverse branch hint for addib is taken.  */
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		128(%r26), %r26
+
+#else
+
+	/*
+	 * Note that until (if) we start saving the full 64-bit register
+	 * values on interrupt, we can't use std on a 32 bit kernel.
+	 */
+	ldi		(PAGE_SIZE / 64), %r1
+
+1:
+	stw		%r0, 0(%r26)
+	stw		%r0, 4(%r26)
+	stw		%r0, 8(%r26)
+	stw		%r0, 12(%r26)
+	stw		%r0, 16(%r26)
+	stw		%r0, 20(%r26)
+	stw		%r0, 24(%r26)
+	stw		%r0, 28(%r26)
+	stw		%r0, 32(%r26)
+	stw		%r0, 36(%r26)
+	stw		%r0, 40(%r26)
+	stw		%r0, 44(%r26)
+	stw		%r0, 48(%r26)
+	stw		%r0, 52(%r26)
+	stw		%r0, 56(%r26)
+	stw		%r0, 60(%r26)
+
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		64(%r26), %r26
+#endif
+	bv		%r0(%r2)
+	nop
+	.exit
+
+	.procend
+ENDPROC(clear_page_asm)
+
+/* Copy page using kernel mapping.  */
+
+ENTRY(copy_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -285,18 +434,14 @@ ENTRY(copy_user_page_asm)
 #ifdef CONFIG_64BIT
 	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
 	 * Unroll the loop by hand and arrange insn appropriately.
-	 * GCC probably can do this just as well.
+	 * Prefetch doesn't improve performance on rp3440.
+	 * GCC probably can do this just as well...
 	 */
 
-	ldd		0(%r25), %r19
 	ldi		(PAGE_SIZE / 128), %r1
 
-	ldw		64(%r25), %r0		/* prefetch 1 cacheline ahead */
-	ldw		128(%r25), %r0		/* prefetch 2 */
-
-1:	ldd		8(%r25), %r20
-	ldw		192(%r25), %r0		/* prefetch 3 */
-	ldw		256(%r25), %r0		/* prefetch 4 */
+1:	ldd		0(%r25), %r19
+	ldd		8(%r25), %r20
 
 	ldd		16(%r25), %r21
 	ldd		24(%r25), %r22
@@ -330,20 +475,16 @@ ENTRY(copy_user_page_asm)
 
 	ldd		112(%r25), %r21
 	ldd		120(%r25), %r22
+	ldo		128(%r25), %r25
 	std		%r19, 96(%r26)
 	std		%r20, 104(%r26)
 
-	ldo		128(%r25), %r25
 	std		%r21, 112(%r26)
 	std		%r22, 120(%r26)
-	ldo		128(%r26), %r26
 
-	/* conditional branches nullify on forward taken branch, and on
-	 * non-taken backward branch. Note that .+4 is a backwards branch.
-	 * The ldd should only get executed if the branch is taken.
-	 */
-	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
-	ldd		0(%r25), %r19		/* start next loads */
+	/* Note reverse branch hint for addib is taken.  */
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		128(%r26), %r26
 
 #else
 
@@ -399,7 +540,7 @@ ENTRY(copy_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(copy_user_page_asm)
+ENDPROC(copy_page_asm)
 
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
@@ -422,8 +563,6 @@ ENDPROC(copy_user_page_asm)
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
-#if 0
-
 	/*
 	 * We can't do this since copy_user_page is used to bring in
 	 * file data that might have instructions. Since the data would
@@ -435,6 +574,7 @@ ENDPROC(copy_user_page_asm)
 	 * use it if more information is passed into copy_user_page().
 	 * Have to do some measurements to see if it is worthwhile to
 	 * lobby for such a change.
+	 *
 	 */
 
 ENTRY(copy_user_page_asm)
@@ -442,16 +582,21 @@ ENTRY(copy_user_page_asm)
 	.callinfo NO_CALLS
 	.entry
 
+	/* Convert virtual `to' and `from' addresses to physical addresses.
+	   Move `from' physical address to non shadowed register.  */
 	ldil		L%(__PAGE_OFFSET), %r1
 	sub		%r26, %r1, %r26
-	sub		%r25, %r1, %r23		/* move physical addr into non shadowed reg */
+	sub		%r25, %r1, %r23
 
 	ldil		L%(TMPALIAS_MAP_START), %r28
 	/* FIXME for different page sizes != 4k */
 #ifdef CONFIG_64BIT
-	extrd,u		%r26,56,32, %r26		/* convert phys addr to tlb insert format */
-	extrd,u		%r23,56,32, %r23		/* convert phys addr to tlb insert format */
-	depd		%r24,63,22, %r28		/* Form aliased virtual address 'to' */
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
+#endif
+	extrd,u		%r26,56,32, %r26	/* convert phys addr to tlb insert format */
+	extrd,u		%r23,56,32, %r23	/* convert phys addr to tlb insert format */
+	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
 	depdi		0, 63,12, %r28		/* Clear any offset bits */
 	copy		%r28, %r29
 	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
@@ -466,10 +611,76 @@ ENTRY(copy_user_page_asm)
 
 	/* Purge any old translations */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+	pdtlb,l		0(%r29)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
 	pdtlb		0(%r29)
+	tlb_unlock	%r20,%r21,%r22
+#endif
+
+#ifdef CONFIG_64BIT
+	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
+	 * Unroll the loop by hand and arrange insn appropriately.
+	 * GCC probably can do this just as well.
+	 */
 
-	ldi		64, %r1
+	ldd		0(%r29), %r19
+	ldi		(PAGE_SIZE / 128), %r1
+
+1:	ldd		8(%r29), %r20
+
+	ldd		16(%r29), %r21
+	ldd		24(%r29), %r22
+	std		%r19, 0(%r28)
+	std		%r20, 8(%r28)
+
+	ldd		32(%r29), %r19
+	ldd		40(%r29), %r20
+	std		%r21, 16(%r28)
+	std		%r22, 24(%r28)
+
+	ldd		48(%r29), %r21
+	ldd		56(%r29), %r22
+	std		%r19, 32(%r28)
+	std		%r20, 40(%r28)
+
+	ldd		64(%r29), %r19
+	ldd		72(%r29), %r20
+	std		%r21, 48(%r28)
+	std		%r22, 56(%r28)
+
+	ldd		80(%r29), %r21
+	ldd		88(%r29), %r22
+	std		%r19, 64(%r28)
+	std		%r20, 72(%r28)
+
+	ldd		 96(%r29), %r19
+	ldd		104(%r29), %r20
+	std		%r21, 80(%r28)
+	std		%r22, 88(%r28)
+
+	ldd		112(%r29), %r21
+	ldd		120(%r29), %r22
+	std		%r19, 96(%r28)
+	std		%r20, 104(%r28)
+
+	ldo		128(%r29), %r29
+	std		%r21, 112(%r28)
+	std		%r22, 120(%r28)
+	ldo		128(%r28), %r28
+
+	/* conditional branches nullify on forward taken branch, and on
+	 * non-taken backward branch. Note that .+4 is a backwards branch.
+	 * The ldd should only get executed if the branch is taken.
+	 */
+	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
+	ldd		0(%r29), %r19		/* start next loads */
+
+#else
+	ldi		(PAGE_SIZE / 64), %r1
 
 	/*
 	 * This loop is optimized for PCXL/PCXL2 ldw/ldw and stw/stw
@@ -480,9 +691,7 @@ ENTRY(copy_user_page_asm)
 	 * use ldd/std on a 32 bit kernel.
 	 */
 
-
-1:
-	ldw		0(%r29), %r19
+1:	ldw		0(%r29), %r19
 	ldw		4(%r29), %r20
 	ldw		8(%r29), %r21
 	ldw		12(%r29), %r22
@@ -515,8 +724,10 @@ ENTRY(copy_user_page_asm)
 	stw		%r21, 56(%r28)
 	stw		%r22, 60(%r28)
 	ldo		64(%r28), %r28
+
 	addib,COND(>)		-1, %r1,1b
 	ldo		64(%r29), %r29
+#endif
 
 	bv		%r0(%r2)
 	nop
@@ -524,9 +735,8 @@ ENTRY(copy_user_page_asm)
 
 	.procend
 ENDPROC(copy_user_page_asm)
-#endif
 
-ENTRY(__clear_user_page_asm)
+ENTRY(clear_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -550,7 +760,13 @@ ENTRY(__clear_user_page_asm)
 
 	/* Purge any old translation */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
@@ -580,8 +796,7 @@ ENTRY(__clear_user_page_asm)
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1
 
-1:
-	stw		%r0, 0(%r28)
+1:	stw		%r0, 0(%r28)
 	stw		%r0, 4(%r28)
 	stw		%r0, 8(%r28)
 	stw		%r0, 12(%r28)
@@ -606,7 +821,7 @@ ENTRY(__clear_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(__clear_user_page_asm)
+ENDPROC(clear_user_page_asm)
 
 ENTRY(flush_dcache_page_asm)
 	.proc
@@ -630,7 +845,13 @@ ENTRY(flush_dcache_page_asm)
 
 	/* Purge any old translation */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r1
@@ -663,8 +884,17 @@ ENTRY(flush_dcache_page_asm)
 	fdc,m		%r1(%r28)
 
 	sync
+
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r25)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		0(%r25)
+	tlb_unlock	%r20,%r21,%r22
+#endif
+
 	bv		%r0(%r2)
-	pdtlb		(%r25)
+	nop
 	.exit
 
 	.procend
@@ -692,7 +922,13 @@ ENTRY(flush_icache_page_asm)
 
 	/* Purge any old translation */
 
-	pitlb		(%sr4,%r28)
+#ifdef CONFIG_PA20
+	pitlb,l         %r0(%sr4,%r28)
+#else
+	tlb_lock        %r20,%r21,%r22
+	pitlb           (%sr4,%r28)
+	tlb_unlock      %r20,%r21,%r22
+#endif
 
 	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r1
@@ -727,8 +963,17 @@ ENTRY(flush_icache_page_asm)
 	fic,m		%r1(%sr4,%r28)
 
 	sync
+
+#ifdef CONFIG_PA20
+	pitlb,l         %r0(%sr4,%r25)
+#else
+	tlb_lock        %r20,%r21,%r22
+	pitlb           (%sr4,%r25)
+	tlb_unlock      %r20,%r21,%r22
+#endif
+
 	bv		%r0(%r2)
-	pitlb		(%sr4,%r25)
+	nop
 	.exit
 
 	.procend
@@ -777,7 +1022,7 @@ ENTRY(flush_kernel_dcache_page_asm)
 	.procend
 ENDPROC(flush_kernel_dcache_page_asm)
 
-ENTRY(purge_kernel_dcache_page)
+ENTRY(purge_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -817,7 +1062,7 @@ ENTRY(purge_kernel_dcache_page)
 	.exit
 
 	.procend
-ENDPROC(purge_kernel_dcache_page)
+ENDPROC(purge_kernel_dcache_page_asm)
 
 ENTRY(flush_user_dcache_range_asm)
 	.proc
