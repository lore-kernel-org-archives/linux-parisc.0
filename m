From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 09:00:50 -0600
Message-ID: <20050427150050.GB21784@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rhirst@levanta.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427052055.GJ2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 26, 2005 at 11:20:55PM -0600, Grant Grundler wrote:
> *sigh*. The ssm 0,0/nop * 8/rsm sequence isn't so obvious.
> Richard Hirst added this comment to entry.S in 2001:
>         * The ssm is necessary due to a PCXT bug

Here's a new patch WITHOUT the s/__lp64__/CONFIG_64BIT/ changes.

Please review.

grant


Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.27
diff -u -p -r1.27 entry.S
--- arch/parisc/kernel/entry.S	1 Apr 2005 07:37:25 -0000	1.27
+++ arch/parisc/kernel/entry.S	27 Apr 2005 06:27:57 -0000
@@ -893,9 +893,6 @@ _switch_to_ret:
 	 * this way, then we will need to copy %sr3 in to PT_SR[3..7], and
 	 * adjust IASQ[0..1].
 	 *
-	 * Note that the following code uses a "relied upon translation".
-	 * See the parisc ACD for details. The ssm is necessary due to a
-	 * PCXT bug.
 	 */
 
 	.align 4096
@@ -990,24 +987,18 @@ intr_restore:
 	rest_fp         %r1
 	rest_general    %r29
 
-	/* Create a "relied upon translation" PA 2.0 Arch. F-5 */
-	ssm		0,%r0
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	tophys_r1       %r29
-	rsm             (PSW_SM_Q|PSW_SM_P|PSW_SM_D|PSW_SM_I),%r0
+	rsm             PSW_SM_QUIET,%r0	/* prepare for rfi */
 
 	/* Restore space id's and special cr's from PT_REGS
-	 * structure pointed to by r29 */
+	 * structure pointed to by r29
+	 */
 	rest_specials	%r29
 
-	/* Important: Note that rest_stack restores r29
-	 * last (we are using it)! It also restores r1 and r30. */
+	/* IMPORTANT: rest_stack restores r29 last (we are using it)!
+	 * It also restores r1 and r30.
+	 */
 	rest_stack
 
 	rfi
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.11
diff -u -p -r1.11 head.S
--- arch/parisc/kernel/head.S	1 Nov 2004 16:15:50 -0000	1.11
+++ arch/parisc/kernel/head.S	27 Apr 2005 06:27:57 -0000
@@ -254,32 +254,14 @@ $is_pa20:
 $install_iva:
 	mtctl		%r10,%cr14
 
-#ifdef __LP64__
 	b		aligned_rfi
 	nop
 
-	.align          256
+	.align          128
 aligned_rfi:
-	ssm             0,0
-	nop             /* 1 */
-	nop             /* 2 */
-	nop             /* 3 */
-	nop             /* 4 */
-	nop             /* 5 */
-	nop             /* 6 */
-	nop             /* 7 */
-	nop             /* 8 */
-#endif
-
-#ifdef __LP64__ /* move to psw.h? */
-#define		PSW_BITS	PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
-#else
-#define		PSW_BITS	PSW_SM_Q
-#endif
-
-$rfi:	
-	/* turn off troublesome PSW bits */
-	rsm		PSW_BITS,%r0
+	pcxt_ssm_bug
+	rsm		PSW_SM_QUIET,%r0	/* off troublesome PSW bits */
+	/* Don't need NOPs, have 8 compliant insn below */
 
 	/* kernel PSW:
 	 *  - no interruptions except HPMC and TOC (which are handled by PDC)
Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.17
diff -u -p -r1.17 pacache.S
--- arch/parisc/kernel/pacache.S	18 Apr 2005 05:52:31 -0000	1.17
+++ arch/parisc/kernel/pacache.S	27 Apr 2005 06:27:57 -0000
@@ -62,25 +62,10 @@ flush_tlb_all_local:
 	 * to happen in real mode with all interruptions disabled.
 	 */
 
-	/*
-	 * Once again, we do the rfi dance ... some day we need examine
-	 * all of our uses of this type of code and see what can be
-	 * consolidated.
-	 */
-
-	rsm		PSW_SM_I, %r19		/* relied upon translation! PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	
-	rsm		PSW_SM_Q, %r0		/* Turn off Q bit to load iia queue */
-	ldil		L%REAL_MODE_PSW, %r1
-	ldo		R%REAL_MODE_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	/* relied upon translation! PA 2.0 Arch. F-4 and F-5 */
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%PA(1f), %r1
@@ -88,6 +73,8 @@ flush_tlb_all_local:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -178,15 +165,14 @@ fdtonemiddle:					/* Loop if LOOP = 1 */
 	ADDIB>		-1, %r22, fdtoneloop	/* Outer loop count decr */
 	add		%r21, %r20, %r20	/* increment space */
 
-fdtdone:
 
-	/* Switch back to virtual mode */
+fdtdone:
+	/*
+	 * Switch back to virtual mode
+	 */
+	pcxt_ssm_bug
 
-	rsm		PSW_SM_Q, %r0		/* clear Q bit to load iia queue */
-	ldil		L%KERNEL_PSW, %r1
-	ldo		R%KERNEL_PSW(%r1), %r1
-	or		%r1, %r19, %r1		/* Set I bit if set on entry */
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%(2f), %r1
@@ -194,6 +180,9 @@ fdtdone:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	or		%r1, %r19, %r1		/* Set I bit if set on entry */
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -238,7 +227,7 @@ fioneloop:					/* Loop if LOOP = 1 */
 
 fisync:
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -281,7 +270,7 @@ fdoneloop:					/* Loop if LOOP = 1 */
 fdsync:
 	syncdma
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -1005,21 +994,12 @@ disable_sr_hashing_asm:
 	.callinfo NO_CALLS
 	.entry
 
-	/* Switch to real mode */
+	/*
+	 * Switch to real mode
+	 */
+	pcxt_ssm_bug
 
-	ssm		0, %r0			/* relied upon translation! */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	
-	rsm		(PSW_SM_Q|PSW_SM_I), %r0 /* disable Q&I to load the iia queue */
-	ldil		L%REAL_MODE_PSW, %r1
-	ldo		R%REAL_MODE_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%PA(1f), %r1
@@ -1027,6 +1007,8 @@ disable_sr_hashing_asm:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -1065,13 +1047,10 @@ srdis_pa20:
 	.word		0x145c1840		/* mtdiag %r28, %dr2 */
 
 srdis_done:
-
 	/* Switch back to virtual mode */
+	pcxt_ssm_bug
 
-	rsm		PSW_SM_Q, %r0		/* clear Q bit to load iia queue */
-	ldil		L%KERNEL_PSW, %r1
-	ldo		R%KERNEL_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil 	   	L%(2f), %r1
@@ -1079,6 +1058,8 @@ srdis_done:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
Index: arch/parisc/kernel/real2.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/real2.S,v
retrieving revision 1.17
diff -u -p -r1.17 real2.S
--- arch/parisc/kernel/real2.S	7 Jan 2005 21:14:33 -0000	1.17
+++ arch/parisc/kernel/real2.S	27 Apr 2005 06:27:57 -0000
@@ -147,17 +147,9 @@ restore_control_regs:
 	.text
 rfi_virt2real:
 	/* switch to real mode... */
-	ssm		0,0		/* See "relied upon translation" */
-	nop				/* PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	
-	rsm             (PSW_SM_Q|PSW_SM_I),%r0  /* disable Q & I bits to load iia queue */
+	rsm             PSW_SM_Q+PSW_SM_I,%r0  /* prep to load iia queue */
 	mtctl		%r0, %cr17	/* Clear IIASQ tail */
 	mtctl		%r0, %cr17	/* Clear IIASQ head */
 	load32		PA(rfi_v2r_1), %r1
@@ -184,17 +176,9 @@ rfi_v2r_1:
 	.text
 	.align 128
 rfi_real2virt:
-	ssm		0,0		/* See "relied upon translation" */
-	nop				/* PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	
-	rsm             PSW_SM_Q,%r0    /* disable Q bit to load iia queue */
+	pcxt_ssm_bug
+
+	rsm             PSW_SM_Q+PSW_SM_I,%r0    /* prep to load iia queue */
 	mtctl		%r0, %cr17	/* Clear IIASQ tail */
 	mtctl		%r0, %cr17	/* Clear IIASQ head */
 	load32		(rfi_r2v_1), %r1
Index: include/asm-parisc/assembly.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/assembly.h,v
retrieving revision 1.10
diff -u -p -r1.10 assembly.h
--- include/asm-parisc/assembly.h	4 Feb 2005 19:34:33 -0000	1.10
+++ include/asm-parisc/assembly.h	27 Apr 2005 06:27:59 -0000
@@ -450,5 +450,23 @@
 	REST_CR	(%cr22, PT_PSW	(\regs))
 	.endm
 
+#if defined(CONFIG_PA7000)
+	.macro	pcxt_ssm_bug
+	/* Create a "relied upon translation" PA 2.0 Arch. page F-4 and F-5
+	* The ssm is necessary due to a PCXT bug. Ie not needed for 64-bit.
+	*/
+	ssm	0,%r0
+	nop	/* 1 */
+	nop	/* 2 */
+	nop	/* 3 */
+	nop	/* 4 */
+	nop	/* 5 */
+	nop	/* 6 */
+	nop	/* 7 */
+	.endm
+#else
+#define pcxt_ssm_bug	/* Thank $DEITY. You don't have brain damaged HW. */
+#endif
+
 #endif /* __ASSEMBLY__ */
 #endif
Index: include/asm-parisc/psw.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/psw.h,v
retrieving revision 1.1
diff -u -p -r1.1 psw.h
--- include/asm-parisc/psw.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/psw.h	27 Apr 2005 06:27:59 -0000
@@ -9,6 +9,16 @@
 #define	PSW_G	0x00000040	/* PA1.x only */
 #define PSW_O	0x00000080	/* PA2.0 only */
 
+/* ssm/rsm instructions number PSW_W and PSW_E differently */
+#define PSW_SM_I	PSW_I	/* Enable External Interrupts */
+#define PSW_SM_D	PSW_D
+#define PSW_SM_P	PSW_P
+#define PSW_SM_Q	PSW_Q	/* Enable Interrupt State Collection */
+#define PSW_SM_R	PSW_R	/* Enable Recover Counter Trap */
+#define PSW_SM_W	0x200	/* PA2.0 only : Enable Wide Mode */
+
+#define PSW_SM_QUIET	PSW_SM_R+PSW_SM_Q+PSW_SM_P+PSW_SM_D+PSW_SM_I
+
 #define PSW_CB	0x0000ff00
 
 #define	PSW_M	0x00010000
@@ -30,33 +40,21 @@
 #define	PSW_Z	0x40000000	/* PA1.x only */
 #define	PSW_Y	0x80000000	/* PA1.x only */
 
-#ifdef __LP64__
-#define PSW_HI_CB 0x000000ff    /* PA2.0 only */
+#ifdef CONFIG_64BIT
+#  define PSW_HI_CB 0x000000ff    /* PA2.0 only */
 #endif
 
-/* PSW bits to be used with ssm/rsm */
-#define PSW_SM_I        0x1
-#define PSW_SM_D        0x2
-#define PSW_SM_P        0x4
-#define PSW_SM_Q        0x8
-#define PSW_SM_R        0x10
-#define PSW_SM_F        0x20
-#define PSW_SM_G        0x40
-#define PSW_SM_O        0x80
-#define PSW_SM_E        0x100
-#define PSW_SM_W        0x200
-
-#ifdef __LP64__
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_W | PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_W | PSW_Q)
-#  define USER_PSW_MASK (PSW_W | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
-#  define USER_PSW_HI_MASK (PSW_HI_CB)
-#else
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_Q)
-#  define USER_PSW_MASK (PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
+#ifdef CONFIG_64BIT
+#  define USER_PSW_HI_MASK	PSW_HI_CB
+#  define WIDE_PSW		PSW_W
+#else 
+#  define WIDE_PSW		0
 #endif
+
+/* Used when setting up for rfi */
+#define KERNEL_PSW    (WIDE_PSW | PSW_C | PSW_Q | PSW_P | PSW_D)
+#define REAL_MODE_PSW (WIDE_PSW | PSW_Q)
+#define USER_PSW_MASK (WIDE_PSW | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
+#define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
 
 #endif
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
