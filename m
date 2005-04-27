From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 12:28:06 +0200
Message-ID: <426F253000000322@mail-6-bnl.tiscali.it>
References: <20050427065822.GK2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="========/426F253000000322/mail-6-bnl.tiscali.it"
Cc: rhirst@levanta.com
To: "Grant Grundler" <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427065822.GK2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--========/426F253000000322/mail-6-bnl.tiscali.it
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Grant,

> 
> 
> Regardless of what this is for, the following patch adds pcxt_ssm_bug
> macro to assembly.h. pcxt_ssm_bug is only enabled for CONFIG_PA7000
> which is only enabled for generic 32-bit kernel.
> 
(what's up for other PA7xxx?)

> I've added pcxt_ssm_bug use to all the locations I could
> find where PSW_SM_Q was being twiddled. Until someone can
> tell me what the bug is exactly, my assumption is it
> is needed for all cases where we "rsm PSW_SM_Q" and not
> just at init time.
> 
> I've also tried to unify all the RFI asm into a similar layout
> that could be (hopefully) replaced with a macro in a future step.
> And I've made them all use "PSW_SM_Q+PSW_SM_I" just to be consistent.
> 
Cool you just did in one shoot what I was testing step by step ;-)

> I apologize in advance since this patch also replaces __LP64__
> with CONFIG_64BIT. I thought it would only be a few but it
> turned out to interfer with the patch.
> 
Exact, that's confusing me a bit so I prepare (here below) sample geting
rid of this change ;-)

> I can split out CONFIG_64BIT changes if someone really needs that
> before reviewing it.  It's just too late tonight for me to do it.
> 

> Can the asm gurus please closely review this patch?
> 
> I don't plan on committing this before it's been tested too.
Thanks for a break to let me test some config (b180, b2k, c110, d380)

So the essence of this patch is:
--- arch/parisc/kernel/entry.S.orig	2005-04-27 11:33:57.000000000 +0200
+++ arch/parisc/kernel/entry.S	2005-04-27 11:34:45.000000000 +0200
@@ -893,9 +893,6 @@
 	 * this way, then we will need to copy %sr3 in to PT_SR[3..7], and
 	 * adjust IASQ[0..1].
 	 *
-	 * Note that the following code uses a "relied upon translation".
-	 * See the parisc ACD for details. The ssm is necessary due to a
-	 * PCXT bug.
 	 */
 
 	.align 4096
@@ -990,24 +987,18 @@
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
--- arch/parisc/kernel/head.S.orig	2005-04-27 11:33:57.000000000 +0200
+++ arch/parisc/kernel/head.S	2005-04-27 11:34:45.000000000 +0200
@@ -254,32 +254,14 @@
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
--- arch/parisc/kernel/pacache.S.orig	2005-04-27 11:33:57.000000000 +0200=

+++ arch/parisc/kernel/pacache.S	2005-04-27 11:34:45.000000000 +0200
@@ -62,25 +62,10 @@
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
@@ -88,6 +73,8 @@
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -178,15 +165,14 @@
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
@@ -194,6 +180,9 @@
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	or		%r1, %r19, %r1		/* Set I bit if set on entry */
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -238,7 +227,7 @@
 
 fisync:
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -281,7 +270,7 @@
 fdsync:
 	syncdma
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -1005,21 +994,12 @@
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
@@ -1027,6 +1007,8 @@
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -1065,13 +1047,10 @@
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
@@ -1079,6 +1058,8 @@
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
--- arch/parisc/kernel/real2.S.orig	2005-04-27 11:33:57.000000000 +0200
+++ arch/parisc/kernel/real2.S	2005-04-27 11:34:45.000000000 +0200
@@ -147,17 +147,9 @@
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
 	
-	rsm             (PSW_SM_Q|PSW_SM_I),%r0  /* disable Q & I bits to load
iia queue */
+	rsm             PSW_SM_Q+PSW_SM_I,%r0  /* prep to load iia queue */
 	mtctl		%r0, %cr17	/* Clear IIASQ tail */
 	mtctl		%r0, %cr17	/* Clear IIASQ head */
 	load32		PA(rfi_v2r_1), %r1
@@ -184,17 +176,9 @@
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
--- include/asm-parisc/assembly.h.orig	2005-04-27 11:33:57.000000000 +020=
0
+++ include/asm-parisc/assembly.h	2005-04-27 11:34:45.000000000 +0200
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
+#define pcxt_ssm_bug	/* Thank $DIETY. You don't have brain damaged HW. *=
/
+#endif
+
 #endif /* __ASSEMBLY__ */
 #endif
--- include/asm-parisc/psw.h.orig	2005-04-27 11:33:57.000000000 +0200
+++ include/asm-parisc/psw.h	2005-04-27 11:34:45.000000000 +0200
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
@@ -31,32 +41,20 @@
 #define	PSW_Y	0x80000000	/* PA1.x only */
 
 #ifdef __LP64__
-#define PSW_HI_CB 0x000000ff    /* PA2.0 only */
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
 #ifdef __LP64__
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_W | PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_W | PSW_Q)
-#  define USER_PSW_MASK (PSW_W | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V |=

PSW_CB)
-#  define USER_PSW_HI_MASK (PSW_HI_CB)
-#else
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_Q)
-#  define USER_PSW_MASK (PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)=

+#  define USER_PSW_HI_MASK	PSW_HI_CB
+#  define WIDE_PSW		PSW_W
+#else 
+#  define WIDE_PSW		0
 #endif
 
+/* Used when setting up for rfi */
+#define KERNEL_PSW    (WIDE_PSW | PSW_C | PSW_Q | PSW_P | PSW_D)
+#define REAL_MODE_PSW (WIDE_PSW | PSW_Q)
+#define USER_PSW_MASK (WIDE_PSW | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V
| PSW_CB)
+#define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
+
 #endif
=3D=3D=3D=3D<>=3D=3D=3D=3D

notes:
    o already test with success for b180, d380 (32bit smp) following:
        #define		PSW_BITS	PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R

    o jda also suggesting;
        .align 128
srdis_done:

(and most probably also for 'fdtdone:' I will try to test too)

Hth and thanks again,
    Joel



--========/426F253000000322/mail-6-bnl.tiscali.it
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="diff-2.6.12-rc3-pa1-pcxt_ssm_bug2.gz"

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
oqXyf6/GbA08JQAA

--========/426F253000000322/mail-6-bnl.tiscali.it
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--========/426F253000000322/mail-6-bnl.tiscali.it--
