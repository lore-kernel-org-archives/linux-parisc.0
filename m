Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smallone.fc.hp.com (smallone.fc.hp.com [192.25.206.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE0EB482B
	for <parisc-linux@parisc-linux.org>; Tue,  8 Jul 2003 23:20:41 -0600 (MDT)
Date: Tue, 8 Jul 2003 23:18:10 -0600
To: parisc-linux@parisc-linux.org
Cc: lamont@hp.com, bdale@gag.com
Message-ID: <20030709051810.GA2948@smallone.fc.hp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
From: lamont@smallone.fc.hp.com (LaMont Jones)
Subject: [parisc-linux] unaligned.c changes
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

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just committed the following changes to unaligned.c, so that we now
handle unaligned floating point loads/stores, as well as getting a bit
better about noticing 64-bit (pa2.0) general register ops on a 32-bit
kernel.

lamont

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Description: 2.4 patch
Content-Disposition: attachment; filename="2.4"

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.15
retrieving revision 1.16
diff -u -r1.15 -r1.16
--- arch/parisc/kernel/unaligned.c	26 Jan 2003 20:59:10 -0000	1.15
+++ arch/parisc/kernel/unaligned.c	9 Jul 2003 05:15:20 -0000	1.16
@@ -92,6 +92,15 @@
 #define OPCODE_STWA	OPCODE1(0x03,1,0xe)
 #define OPCODE_STDA	OPCODE1(0x03,1,0xf)
 
+#define OPCODE_FLDWX	OPCODE1(0x09,0,0x0)
+#define OPCODE_FSTWX	OPCODE1(0x09,0,0x4)
+#define OPCODE_FLDWS	OPCODE1(0x09,1,0x0)
+#define OPCODE_FSTWS	OPCODE1(0x09,1,0x4)
+#define OPCODE_FLDDX	OPCODE1(0x0b,0,0x0)
+#define OPCODE_FSTDX	OPCODE1(0x0b,0,0x4)
+#define OPCODE_FLDDS	OPCODE1(0x0b,1,0x0)
+#define OPCODE_FSTDS	OPCODE1(0x0b,1,0x4)
+
 #define OPCODE_LDD_L	OPCODE2(0x14,0)
 #define OPCODE_FLDD_L	OPCODE2(0x14,1)
 #define OPCODE_STD_L	OPCODE2(0x1c,0)
@@ -113,6 +122,7 @@
 #define R1(i) (((i)>>21)&0x1f)
 #define R2(i) (((i)>>16)&0x1f)
 #define R3(i) ((i)&0x1f)
+#define FR3(i) ((((i)<<1)&0x1f)|(((i)>>6)&1))
 #define IM(i,n) (((i)>>1&((1<<(n-1))-1))|((i)&1?((0-1L)<<(n-1)):0))
 #define IM5_2(i) IM((i)>>16,5)
 #define IM5_3(i) IM((i),5)
@@ -146,7 +156,7 @@
 
 	return 0;
 }
-static int emulate_ldw(struct pt_regs *regs, int toreg)
+static int emulate_ldw(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
 	unsigned long val = 0;
@@ -169,20 +179,26 @@
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
-	if (toreg)
+	if (flop)
+		((__u32*)(regs->fr))[toreg] = val;
+	else if (toreg)
 		regs->gr[toreg] = val;
 
 	return 0;
 }
-#ifdef __LP64__
-static int emulate_ldd(struct pt_regs *regs, int toreg)
+static int emulate_ldd(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
-	unsigned long val = 0;
+	__u64 val = 0;
 
 	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", 
 		regs->isr, regs->ior, toreg);
+#ifdef CONFIG_PA20
 
+#ifndef __LP64__
+	if (!flop)
+		return -1;
+#endif
 	__asm__ __volatile__  (
 "	depd,z	%2,60,3,%%r19\n"		/* r19=(ofs&7)*8 */
 "	mtsp	%3, %%sr1\n"
@@ -195,15 +211,36 @@
 	: "=r" (val)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
 	: "r19", "r20" );
+#else
+    {
+	unsigned long valh=0,vall=0;
+	__asm__ __volatile__  (
+"	zdep	%4,29,2,%%r19\n"		/* r19=(ofs&3)*8 */
+"	mtsp	%5, %%sr1\n"
+"	dep	%%r0,31,2,%4\n"
+"	ldw	0(%%sr1,%5),%0\n"
+"	ldw	4(%%sr1,%5),%1\n"
+"	ldw	8(%%sr1,%5),%%r20\n"
+"	subi	32,%%r19,%%r19\n"
+"	mtsar	%%r19\n"
+"	vshd	%0,%1,%0\n"
+"	vshd	%1,%%r20,%1\n"
+	: "=r" (valh), "=r" (vall)
+	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
+	: "r19", "r20" );
+	val=((__u64)valh<<32)|(__u64)vall;
+    }
+#endif
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
-	if (toreg)
+	if (flop)
+		regs->fr[toreg] = val;
+	else if (toreg)
 		regs->gr[toreg] = val;
 
 	return 0;
 }
-#endif
 
 static int emulate_sth(struct pt_regs *regs, int frreg)
 {
@@ -212,7 +249,7 @@
 		val = 0;
 
 	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 2 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+		val, regs->isr, regs->ior);
 
 	__asm__ __volatile__ (
 "	mtsp %2, %%sr1\n"
@@ -225,14 +262,19 @@
 
 	return 0;
 }
-static int emulate_stw(struct pt_regs *regs, int frreg)
+static int emulate_stw(struct pt_regs *regs, int frreg, int flop)
 {
-	unsigned long val = regs->gr[frreg];
-	if (!frreg)
+	unsigned long val;
+
+	if (flop)
+		val = ((__u32*)(regs->fr))[frreg];
+	else if (frreg)
+		val = regs->gr[frreg];
+	else
 		val = 0;
 
 	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 4 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+		val, regs->isr, regs->ior);
 
 
 	__asm__ __volatile__ (
@@ -257,17 +299,25 @@
 
 	return 0;
 }
-#ifdef __LP64__
-static int emulate_std(struct pt_regs *regs, int frreg)
+static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 {
-	unsigned long val = regs->gr[frreg];
-	if (!frreg)
-		val = 0;
+	__u64 val;
 
-	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+	if (flop)
+		val = regs->fr[frreg];
+	else if (frreg)
+		val = regs->gr[frreg];
+	else
+		val = 0;
 
+	DPRINTF("store r%d (0x" %016llx ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
+		val,  regs->isr, regs->ior);
 
+#ifdef CONFIG_PA20
+#ifndef __LP64__
+	if (!flop)
+		return -1;
+#endif
 	__asm__ __volatile__ (
 "	mtsp %2, %%sr1\n"
 "	depd,z	%1, 60, 3, %%r19\n"
@@ -287,19 +337,45 @@
 	:
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r22", "r1" );
+#else
+    {
+	unsigned long valh=(val>>32),vall=(val&0xffffffffl);
+	__asm__ __volatile__ (
+"	mtsp	%3, %%sr1\n"
+"	zdep	%1, 29, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %1\n"
+"	mtsar	%%r19\n"
+"	zvdepi	-2, 32, %%r19\n"
+"	ldw	0(%%sr1,%2),%%r20\n"
+"	ldw	8(%%sr1,%2),%%r21\n"
+"	vshd	%0, %1, %%r1\n"
+"	vshd	%%r0, %0, %0\n"
+"	vshd	%1, %%r0, %1\n"
+"	and	%%r20, %%r19, %%r20\n"
+"	andcm	%%r21, %%r19, %%r21\n"
+"	or	%0, %%r20, %0\n"
+"	or	%1, %%r21, %1\n"
+"	stw	%0,0(%%sr1,%2)\n"
+"	stw	%%r1,4(%%sr1,%2)\n"
+"	stw	%1,8(%%sr1,%2)\n"
+	:
+	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21", "r1" );
+    }
+#endif
 
 	return 0;
 }
-#endif
 
 void handle_unaligned(struct pt_regs *regs)
 {
 	unsigned long unaligned_count = 0;
 	unsigned long last_time = 0;
-	unsigned long newbase = regs->gr[R1(regs->iir)];
+        unsigned long newbase = R1(regs->iir)?regs->gr[R1(regs->iir)]:0;
 	int modify = 0;
 	int ret = -1;
 	struct siginfo si;
+	register int flop=0;	/* true if this is a flop */
 
 	/* if the unaligned access is inside the kernel:
 	 *   if the access is caused by a syscall, then we fault the calling
@@ -438,7 +514,7 @@
 	case OPCODE_LDWA_I:
 	case OPCODE_LDW_S:
 	case OPCODE_LDWA_S:
-		ret = emulate_ldw(regs, R3(regs->iir));
+		ret = emulate_ldw(regs, R3(regs->iir),0);
 		break;
 
 	case OPCODE_STH:
@@ -447,23 +523,47 @@
 
 	case OPCODE_STW:
 	case OPCODE_STWA:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 
-#ifdef __LP64__
+#ifdef CONFIG_PA20
 	case OPCODE_LDD_I:
 	case OPCODE_LDDA_I:
 	case OPCODE_LDD_S:
 	case OPCODE_LDDA_S:
-		ret = emulate_ldd(regs, R3(regs->iir));
+		ret = emulate_ldd(regs, R3(regs->iir),0);
 		break;
 
 	case OPCODE_STD:
 	case OPCODE_STDA:
-		ret = emulate_std(regs, R2(regs->iir));
+		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
 #endif
 
+	case OPCODE_FLDWX:
+	case OPCODE_FLDWS:
+		flop=1;
+		ret = emulate_ldw(regs,FR3(regs->iir),1);
+		break;
+
+	case OPCODE_FLDDX:
+	case OPCODE_FLDDS:
+		flop=1;
+		ret = emulate_ldd(regs,R3(regs->iir),1);
+		break;
+
+	case OPCODE_FSTWX:
+	case OPCODE_FSTWS:
+		flop=1;
+		ret = emulate_stw(regs,FR3(regs->iir),1);
+		break;
+
+	case OPCODE_FSTDX:
+	case OPCODE_FSTDS:
+		flop=1;
+		ret = emulate_std(regs,R3(regs->iir),1);
+		break;
+
 	case OPCODE_LDCD_I:
 	case OPCODE_LDCW_I:
 	case OPCODE_LDCD_S:
@@ -471,30 +571,44 @@
 		ret = -1;	/* "undefined", but lets kill them. */
 		break;
 	}
-#ifdef __LP64__
+#ifdef CONFIG_PA20
 	switch (regs->iir & OPCODE2_MASK)
 	{
-	case OPCODE_LDD_L:
 	case OPCODE_FLDD_L:
-		ret = emulate_ldd(regs, R2(regs->iir));
+		flop=1;
+		ret = emualate_ldd(regs,R2(regs->iir),1);
+		break;
+	case OPCODE_FSTD_L:
+		flop=1;
+		ret = emulate_std(regs, R2(regs->iir),1);
 		break;
 
+#ifdef CONFIG_PA20
+	case OPCODE_LDD_L:
+		ret = emulate_ldd(regs, R2(regs->iir),0);
+		break;
 	case OPCODE_STD_L:
-	case OPCODE_FSTD_L:
-		ret = emulate_std(regs, R2(regs->iir));
+		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
+#endif
 	}
 #endif
 	switch (regs->iir & OPCODE3_MASK)
 	{
-	case OPCODE_LDW_M:
 	case OPCODE_FLDW_L:
-		ret = emulate_ldw(regs, R2(regs->iir));
+		flop=1;
+		ret = emulate_ldw(regs, R2(regs->iir),0);
+		break;
+	case OPCODE_LDW_M:
+		ret = emulate_ldw(regs, R2(regs->iir),1);
 		break;
 
 	case OPCODE_FSTW_L:
+		flop=1;
+		ret = emulate_stw(regs, R2(regs->iir),1);
+		break;
 	case OPCODE_STW_M:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 	}
 	switch (regs->iir & OPCODE4_MASK)
@@ -504,17 +618,16 @@
 		break;
 	case OPCODE_LDW_L:
 	case OPCODE_LDWM:
-		ret = emulate_ldw(regs, R2(regs->iir));
+		ret = emulate_ldw(regs, R2(regs->iir),0);
 		break;
 	case OPCODE_STH_L:
 		ret = emulate_sth(regs, R2(regs->iir));
 		break;
 	case OPCODE_STW_L:
 	case OPCODE_STWM:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 	}
-	/* XXX LJ - need to handle float load/store */
 
 	if (modify && R1(regs->iir))
 		regs->gr[R1(regs->iir)] = newbase;
@@ -540,9 +653,8 @@
 		return;
 	}
 
-	/* else we handled it, advance the PC.... */
-	regs->iaoq[0] = regs->iaoq[1];
-	regs->iaoq[1] = regs->iaoq[0] + 4;
+	/* else we handled it, let life go on. */
+	regs->gr[0]|=PSW_N;
 }
 
 /*

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Description: 2.5 patch
Content-Disposition: attachment; filename="2.5"

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- arch/parisc/kernel/unaligned.c	12 Jan 2003 08:24:26 -0000	1.4
+++ arch/parisc/kernel/unaligned.c	9 Jul 2003 05:15:38 -0000	1.5
@@ -92,6 +92,15 @@
 #define OPCODE_STWA	OPCODE1(0x03,1,0xe)
 #define OPCODE_STDA	OPCODE1(0x03,1,0xf)
 
+#define OPCODE_FLDWX	OPCODE1(0x09,0,0x0)
+#define OPCODE_FSTWX	OPCODE1(0x09,0,0x4)
+#define OPCODE_FLDWS	OPCODE1(0x09,1,0x0)
+#define OPCODE_FSTWS	OPCODE1(0x09,1,0x4)
+#define OPCODE_FLDDX	OPCODE1(0x0b,0,0x0)
+#define OPCODE_FSTDX	OPCODE1(0x0b,0,0x4)
+#define OPCODE_FLDDS	OPCODE1(0x0b,1,0x0)
+#define OPCODE_FSTDS	OPCODE1(0x0b,1,0x4)
+
 #define OPCODE_LDD_L	OPCODE2(0x14,0)
 #define OPCODE_FLDD_L	OPCODE2(0x14,1)
 #define OPCODE_STD_L	OPCODE2(0x1c,0)
@@ -113,6 +122,7 @@
 #define R1(i) (((i)>>21)&0x1f)
 #define R2(i) (((i)>>16)&0x1f)
 #define R3(i) ((i)&0x1f)
+#define FR3(i) ((((i)<<1)&0x1f)|(((i)>>6)&1))
 #define IM(i,n) (((i)>>1&((1<<(n-1))-1))|((i)&1?((0-1L)<<(n-1)):0))
 #define IM5_2(i) IM((i)>>16,5)
 #define IM5_3(i) IM((i),5)
@@ -146,7 +156,7 @@
 
 	return 0;
 }
-static int emulate_ldw(struct pt_regs *regs, int toreg)
+static int emulate_ldw(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
 	unsigned long val = 0;
@@ -169,20 +179,26 @@
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
-	if (toreg)
+	if (flop)
+		((__u32*)(regs->fr))[toreg] = val;
+	else if (toreg)
 		regs->gr[toreg] = val;
 
 	return 0;
 }
-#ifdef __LP64__
-static int emulate_ldd(struct pt_regs *regs, int toreg)
+static int emulate_ldd(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
-	unsigned long val = 0;
+	__u64 val = 0;
 
 	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", 
 		regs->isr, regs->ior, toreg);
+#ifdef CONFIG_PA20
 
+#ifndef __LP64__
+	if (!flop)
+		return -1;
+#endif
 	__asm__ __volatile__  (
 "	depd,z	%2,60,3,%%r19\n"		/* r19=(ofs&7)*8 */
 "	mtsp	%3, %%sr1\n"
@@ -195,15 +211,36 @@
 	: "=r" (val)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
 	: "r19", "r20" );
+#else
+    {
+	unsigned long valh=0,vall=0;
+	__asm__ __volatile__  (
+"	zdep	%4,29,2,%%r19\n"		/* r19=(ofs&3)*8 */
+"	mtsp	%5, %%sr1\n"
+"	dep	%%r0,31,2,%4\n"
+"	ldw	0(%%sr1,%5),%0\n"
+"	ldw	4(%%sr1,%5),%1\n"
+"	ldw	8(%%sr1,%5),%%r20\n"
+"	subi	32,%%r19,%%r19\n"
+"	mtsar	%%r19\n"
+"	vshd	%0,%1,%0\n"
+"	vshd	%1,%%r20,%1\n"
+	: "=r" (valh), "=r" (vall)
+	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
+	: "r19", "r20" );
+	val=((__u64)valh<<32)|(__u64)vall;
+    }
+#endif
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
-	if (toreg)
+	if (flop)
+		regs->fr[toreg] = val;
+	else if (toreg)
 		regs->gr[toreg] = val;
 
 	return 0;
 }
-#endif
 
 static int emulate_sth(struct pt_regs *regs, int frreg)
 {
@@ -212,7 +249,7 @@
 		val = 0;
 
 	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 2 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+		val, regs->isr, regs->ior);
 
 	__asm__ __volatile__ (
 "	mtsp %2, %%sr1\n"
@@ -225,14 +262,19 @@
 
 	return 0;
 }
-static int emulate_stw(struct pt_regs *regs, int frreg)
+static int emulate_stw(struct pt_regs *regs, int frreg, int flop)
 {
-	unsigned long val = regs->gr[frreg];
-	if (!frreg)
+	unsigned long val;
+
+	if (flop)
+		val = ((__u32*)(regs->fr))[frreg];
+	else if (frreg)
+		val = regs->gr[frreg];
+	else
 		val = 0;
 
 	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 4 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+		val, regs->isr, regs->ior);
 
 
 	__asm__ __volatile__ (
@@ -257,17 +299,25 @@
 
 	return 0;
 }
-#ifdef __LP64__
-static int emulate_std(struct pt_regs *regs, int frreg)
+static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 {
-	unsigned long val = regs->gr[frreg];
-	if (!frreg)
-		val = 0;
+	__u64 val;
 
-	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
-		regs->gr[frreg], regs->isr, regs->ior);
+	if (flop)
+		val = regs->fr[frreg];
+	else if (frreg)
+		val = regs->gr[frreg];
+	else
+		val = 0;
 
+	DPRINTF("store r%d (0x" %016llx ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
+		val,  regs->isr, regs->ior);
 
+#ifdef CONFIG_PA20
+#ifndef __LP64__
+	if (!flop)
+		return -1;
+#endif
 	__asm__ __volatile__ (
 "	mtsp %2, %%sr1\n"
 "	depd,z	%1, 60, 3, %%r19\n"
@@ -287,19 +337,45 @@
 	:
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r22", "r1" );
+#else
+    {
+	unsigned long valh=(val>>32),vall=(val&0xffffffffl);
+	__asm__ __volatile__ (
+"	mtsp	%3, %%sr1\n"
+"	zdep	%1, 29, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %1\n"
+"	mtsar	%%r19\n"
+"	zvdepi	-2, 32, %%r19\n"
+"	ldw	0(%%sr1,%2),%%r20\n"
+"	ldw	8(%%sr1,%2),%%r21\n"
+"	vshd	%0, %1, %%r1\n"
+"	vshd	%%r0, %0, %0\n"
+"	vshd	%1, %%r0, %1\n"
+"	and	%%r20, %%r19, %%r20\n"
+"	andcm	%%r21, %%r19, %%r21\n"
+"	or	%0, %%r20, %0\n"
+"	or	%1, %%r21, %1\n"
+"	stw	%0,0(%%sr1,%2)\n"
+"	stw	%%r1,4(%%sr1,%2)\n"
+"	stw	%1,8(%%sr1,%2)\n"
+	:
+	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21", "r1" );
+    }
+#endif
 
 	return 0;
 }
-#endif
 
 void handle_unaligned(struct pt_regs *regs)
 {
 	unsigned long unaligned_count = 0;
 	unsigned long last_time = 0;
-	unsigned long newbase = regs->gr[R1(regs->iir)];
+	unsigned long newbase = R1(regs->iir)?regs->gr[R1(regs->iir)]:0;
 	int modify = 0;
 	int ret = -1;
 	struct siginfo si;
+	register int flop=0;	/* true if this is a flop */
 
 	/* if the unaligned access is inside the kernel:
 	 *   if the access is caused by a syscall, then we fault the calling
@@ -383,9 +459,9 @@
 				case OPCODE_LDDA_I:
 					shift= 3; break;
 				}
-				newbase += regs->gr[R2(regs->iir)]<<shift;
+				newbase += (R2(regs->iir)?regs->gr[R2(regs->iir)]:0)<<shift;
 			} else				/* simple indexed */
-				newbase += regs->gr[R2(regs->iir)];
+				newbase += (R2(regs->iir)?regs->gr[R2(regs->iir)]:0);
 		}
 		break;
 	case 0x13:
@@ -438,7 +514,7 @@
 	case OPCODE_LDWA_I:
 	case OPCODE_LDW_S:
 	case OPCODE_LDWA_S:
-		ret = emulate_ldw(regs, R3(regs->iir));
+		ret = emulate_ldw(regs, R3(regs->iir),0);
 		break;
 
 	case OPCODE_STH:
@@ -447,23 +523,47 @@
 
 	case OPCODE_STW:
 	case OPCODE_STWA:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 
-#ifdef __LP64__
+#ifdef CONFIG_PA20
 	case OPCODE_LDD_I:
 	case OPCODE_LDDA_I:
 	case OPCODE_LDD_S:
 	case OPCODE_LDDA_S:
-		ret = emulate_ldd(regs, R3(regs->iir));
+		ret = emulate_ldd(regs, R3(regs->iir),0);
 		break;
 
 	case OPCODE_STD:
 	case OPCODE_STDA:
-		ret = emulate_std(regs, R2(regs->iir));
+		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
 #endif
 
+	case OPCODE_FLDWX:
+	case OPCODE_FLDWS:
+		flop=1;
+		ret = emulate_ldw(regs,FR3(regs->iir),1);
+		break;
+
+	case OPCODE_FLDDX:
+	case OPCODE_FLDDS:
+		flop=1;
+		ret = emulate_ldd(regs,R3(regs->iir),1);
+		break;
+
+	case OPCODE_FSTWX:
+	case OPCODE_FSTWS:
+		flop=1;
+		ret = emulate_stw(regs,FR3(regs->iir),1);
+		break;
+
+	case OPCODE_FSTDX:
+	case OPCODE_FSTDS:
+		flop=1;
+		ret = emulate_std(regs,R3(regs->iir),1);
+		break;
+
 	case OPCODE_LDCD_I:
 	case OPCODE_LDCW_I:
 	case OPCODE_LDCD_S:
@@ -471,30 +571,44 @@
 		ret = -1;	/* "undefined", but lets kill them. */
 		break;
 	}
-#ifdef __LP64__
+#ifdef CONFIG_PA20
 	switch (regs->iir & OPCODE2_MASK)
 	{
-	case OPCODE_LDD_L:
 	case OPCODE_FLDD_L:
-		ret = emulate_ldd(regs, R2(regs->iir));
+		flop=1;
+		ret = emualate_ldd(regs,R2(regs->iir),1);
+		break;
+	case OPCODE_FSTD_L:
+		flop=1;
+		ret = emulate_std(regs, R2(regs->iir),1);
 		break;
 
+#ifdef CONFIG_PA20
+	case OPCODE_LDD_L:
+		ret = emulate_ldd(regs, R2(regs->iir),0);
+		break;
 	case OPCODE_STD_L:
-	case OPCODE_FSTD_L:
-		ret = emulate_std(regs, R2(regs->iir));
+		ret = emulate_std(regs, R2(regs->iir),0);
 		break;
+#endif
 	}
 #endif
 	switch (regs->iir & OPCODE3_MASK)
 	{
-	case OPCODE_LDW_M:
 	case OPCODE_FLDW_L:
-		ret = emulate_ldw(regs, R2(regs->iir));
+		flop=1;
+		ret = emulate_ldw(regs, R2(regs->iir),0);
+		break;
+	case OPCODE_LDW_M:
+		ret = emulate_ldw(regs, R2(regs->iir),1);
 		break;
 
 	case OPCODE_FSTW_L:
+		flop=1;
+		ret = emulate_stw(regs, R2(regs->iir),1);
+		break;
 	case OPCODE_STW_M:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 	}
 	switch (regs->iir & OPCODE4_MASK)
@@ -504,19 +618,18 @@
 		break;
 	case OPCODE_LDW_L:
 	case OPCODE_LDWM:
-		ret = emulate_ldw(regs, R2(regs->iir));
+		ret = emulate_ldw(regs, R2(regs->iir),0);
 		break;
 	case OPCODE_STH_L:
 		ret = emulate_sth(regs, R2(regs->iir));
 		break;
 	case OPCODE_STW_L:
 	case OPCODE_STWM:
-		ret = emulate_stw(regs, R2(regs->iir));
+		ret = emulate_stw(regs, R2(regs->iir),0);
 		break;
 	}
-	/* XXX LJ - need to handle float load/store */
 
-	if (modify)
+	if (modify && R1(regs->iir))
 		regs->gr[R1(regs->iir)] = newbase;
 
 
@@ -540,9 +653,8 @@
 		return;
 	}
 
-	/* else we handled it, advance the PC.... */
-	regs->iaoq[0] = regs->iaoq[1];
-	regs->iaoq[1] = regs->iaoq[0] + 4;
+	/* else we handled it, let life go on. */
+	regs->gr[0]|=PSW_N;
 }
 
 /*

--GvXjxJ+pjyke8COw--
