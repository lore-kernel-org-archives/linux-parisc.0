Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dh64.b180 (b180.mmjgroup.com [192.34.35.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E1D34829
	for <parisc-linux@parisc-linux.org>; Thu, 19 Dec 2002 16:09:47 -0700 (MST)
Date: Thu, 19 Dec 2002 16:09:40 -0700
To: parisc-linux@parisc-linux.org
Message-ID: <20021219230940.GA661@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: lamont@b180.mmjgroup.com (LaMont Jones)
Subject: [parisc-linux] patch to unaligned.c
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

The patch below fixes base register modificiation in the unaligned
load/store code.  It still doesn't do floating point load/stores, and
I'll work on those later.  In the meantime, this will deal with lots
of issues around base reg modification not happening.

Part of the unrolling is a precursor to adding floating point stuff.

lamont

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.11
diff -u -r1.11 unaligned.c
--- arch/parisc/kernel/unaligned.c	24 Sep 2002 05:52:46 -0000	1.11
+++ arch/parisc/kernel/unaligned.c	19 Dec 2002 23:00:36 -0000
@@ -66,28 +66,28 @@
 #define OPCODE3_MASK	OPCODE3(0x3f,1)
 #define OPCODE4_MASK    OPCODE4(0x3f)
 
-/* skip LDB (index) */
+/* skip LDB - never unaligned (index) */
 #define OPCODE_LDH_I	OPCODE1(0x03,0,0x1)
 #define OPCODE_LDW_I	OPCODE1(0x03,0,0x2)
 #define OPCODE_LDD_I	OPCODE1(0x03,0,0x3)
 #define OPCODE_LDDA_I	OPCODE1(0x03,0,0x4)
-/* skip LDCD (index) */
+#define OPCODE_LDCD_I	OPCODE1(0x03,0,0x5)
 #define OPCODE_LDWA_I	OPCODE1(0x03,0,0x6)
-/* skip LDCW (index) */
-/* skip LDB (short) */
+#define OPCODE_LDCW_I	OPCODE1(0x03,0,0x7)
+/* skip LDB - never unaligned (short) */
 #define OPCODE_LDH_S	OPCODE1(0x03,1,0x1)
 #define OPCODE_LDW_S	OPCODE1(0x03,1,0x2)
 #define OPCODE_LDD_S	OPCODE1(0x03,1,0x3)
 #define OPCODE_LDDA_S	OPCODE1(0x03,1,0x4)
-/* skip LDCD (short) */
+#define OPCODE_LDCD_S	OPCODE1(0x03,1,0x5)
 #define OPCODE_LDWA_S	OPCODE1(0x03,1,0x6)
-/* skip LDCW (short) */
-/* skip STB */
+#define OPCODE_LDCW_S	OPCODE1(0x03,1,0x7)
+/* skip STB - never unaligned */
 #define OPCODE_STH	OPCODE1(0x03,1,0x9)
 #define OPCODE_STW	OPCODE1(0x03,1,0xa)
 #define OPCODE_STD	OPCODE1(0x03,1,0xb)
-/* skip STBY */
-/* skip STDBY */
+/* skip STBY - never unaligned */
+/* skip STDBY - never unaligned */
 #define OPCODE_STWA	OPCODE1(0x03,1,0xe)
 #define OPCODE_STDA	OPCODE1(0x03,1,0xf)
 
@@ -103,15 +103,107 @@
 
 #define OPCODE_LDH_L    OPCODE4(0x11)
 #define OPCODE_LDW_L    OPCODE4(0x12)
-#define OPCODE_LDW_L2   OPCODE4(0x13)
+#define OPCODE_LDWM     OPCODE4(0x13)
 #define OPCODE_STH_L    OPCODE4(0x19)
 #define OPCODE_STW_L    OPCODE4(0x1A)
-#define OPCODE_STW_L2   OPCODE4(0x1B)
+#define OPCODE_STWM     OPCODE4(0x1B)
+
+#define MAJOR_OP(i) (((i)>>26)&0x3f)
+#define R1(i) (((i)>>21)&0x1f)
+#define R2(i) (((i)>>16)&0x1f)
+#define R3(i) ((i)&0x1f)
+#define IM(i,n) (((i)>>1&((1<<(n-1))-1))|((i)&1?((0-1L)<<(n-1)):0))
+#define IM5_2(i) IM((i)>>16,5)
+#define IM5_3(i) IM((i),5)
+#define IM14(i) IM((i),14)
 
 int unaligned_enabled = 1;
 
 void die_if_kernel (char *str, struct pt_regs *regs, long err);
 
+static int emulate_ldh(struct pt_regs *regs, int toreg)
+{
+	unsigned long saddr = regs->ior;
+	unsigned long val = 0;
+
+	DPRINTF("load " RFMT ":" RFMT " to r%d for 2 bytes\n", 
+		regs->isr, regs->ior, toreg);
+
+	__asm__ __volatile__  (
+"       mtsp	%3, %%sr1\n"
+"	ldbs	0(%%sr1,%2), %%r20\n"
+"	ldbs	1(%%sr1,%2), %0\n"
+	"depw	%%r20, 23, 24, %0\n"
+	: "=r" (val)
+	: "0" (val), "r" (saddr), "r" (regs->isr)
+	: "r20" );
+
+	DPRINTF("val = 0x" RFMT "\n", val);
+
+	if (toreg)
+		regs->gr[toreg] = val;
+
+	return 0;
+}
+static int emulate_ldw(struct pt_regs *regs, int toreg)
+{
+	unsigned long saddr = regs->ior;
+	unsigned long val = 0;
+
+	DPRINTF("load " RFMT ":" RFMT " to r%d for 4 bytes\n", 
+		regs->isr, regs->ior, toreg);
+
+	__asm__ __volatile__  (
+"	zdep	%2,28,2,%%r19\n"		/* r19=(ofs&3)*8 */
+"	mtsp	%3, %%sr1\n"
+"	depw	%%r0,31,2,%2\n"
+"	ldw	0(%%sr1,%2),%0\n"
+"	ldw	4(%%sr1,%2),%%r20\n"
+"	subi	32,%%r19,%%r19\n"
+"	mtctl	%%r19,11\n"
+"	vshd	%0,%%r20,%0\n"
+	: "=r" (val)
+	: "0" (val), "r" (saddr), "r" (regs->isr)
+	: "r19", "r20" );
+
+	DPRINTF("val = 0x" RFMT "\n", val);
+
+	if (toreg)
+		regs->gr[toreg] = val;
+
+	return 0;
+}
+#ifdef __LP64__
+static int emulate_ldd(struct pt_regs *regs, int toreg)
+{
+	unsigned long saddr = regs->ior;
+	unsigned long val = 0;
+
+	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", 
+		regs->isr, regs->ior, toreg);
+
+	__asm__ __volatile__  (
+"	zdepd	%2,60,3,%%r19\n"		/* r19=(ofs&7)*8 */
+"       mtsp	%3, %%sr1\n"
+"	depd	%%r0,63,3,%2\n"
+"	ldd	0(%%sr1,%2),%0\n"
+"	ldd	8(%%sr1,%2),%%r20\n"
+"	subi	64,%%r19,%%r19\n"
+"	mtsar	%%r19\n"
+"	shrpd	%0,%%r20,%sar,%0\n"
+	: "=r" (val)
+	: "0" (val), "r" (saddr), "r" (regs->isr)
+	: "r19", "r20" );
+
+	DPRINTF("val = 0x" RFMT "\n", val);
+
+	if (toreg)
+		regs->gr[toreg] = val;
+
+	return 0;
+}
+#endif
+#if 0
 static int emulate_load(struct pt_regs *regs, int len, int toreg)
 {
 	unsigned long saddr = regs->ior;
@@ -159,19 +251,144 @@
 
 	DPRINTF("val = 0x" RFMT "\n", val);
 
-	regs->gr[toreg] = val;
+	if (toreg)
+		regs->gr[toreg] = val;
 
 	return ret;
 }
+#endif
+
+static int emulate_sth(struct pt_regs *regs, int frreg)
+{
+	unsigned long val = regs->gr[frreg];
+	if (!frreg)
+		val = 0;
+
+	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 2 bytes\n", frreg, 
+		regs->gr[frreg], regs->isr, regs->ior);
+
+	__asm__ __volatile__ (
+"       mtsp %2, %%sr1\n"
+"	extrw,u %0, 23, 8, %%r19\n"
+"	stb %0, 1(%%sr1, %1)\n"
+"	stb %%r19, 0(%%sr1, %1)\n"
+	:
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
+	: "r19" );
+
+	return 0;
+}
+static int emulate_stw(struct pt_regs *regs, int frreg)
+{
+	unsigned long val = regs->gr[frreg];
+	if (!frreg)
+		val = 0;
+
+	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 4 bytes\n", frreg, 
+		regs->gr[frreg], regs->isr, regs->ior);
+
+
+	__asm__ __volatile__ (
+"       mtsp %2, %%sr1\n"
+#if 0
+"	extru	%0,  7, 8, %%r19\n"
+"	extru	%0, 15, 8, %%r20\n"
+"	extru	%0, 23, 8, %%r21\n"
+"	stb	%%r19, 0(%%sr1, %1)\n"
+"	stb	%%r20, 1(%%sr1, %1)\n"
+"	stb	%%r21, 2(%%sr1, %1)\n"
+"	stb	%0, 3(%%sr1, %1)\n"
+	:
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21" );
+#else
+"	zdep	%1, 28, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %1\n"
+"	mtsar	%%r19\n"
+"	zvdepi	-2, 32, %%r19\n"
+"	ldw	0(%%sr1,%1),%%r20\n"
+"	ldw	4(%%sr1,%1),%%r21\n"
+"	vshd	%%r0, %0, %%r22\n"
+"	vshd	%0, %%r0, %%r1\n"
+"	and	%%r20, %%r19, %%r20\n"
+"	andcm	%%r21, %%r19, %%r21\n"
+"	or	%%r22, %%r20, %%r20\n"
+"	or	%%r1, %%r21, %%r21\n"
+"	stw	%%r20,0(%%sr1,%1)\n"
+"	stw	%%r21,4(%%sr1,%1)\n"
+	:
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21", "r22", "r1" );
+#endif
 
+	return 0;
+}
+#ifdef __LP64__
+static int emulate_std(struct pt_regs *regs, int frreg)
+{
+	unsigned long val = regs->gr[frreg];
+	if (!frreg)
+		val = 0;
+
+	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
+		regs->gr[frreg], regs->isr, regs->ior);
+
+
+	__asm__ __volatile__ (
+"       mtsp %2, %%sr1\n"
+#if 0
+"	extrd	%0,  7, 8, %%r19\n"
+"	extrd	%0, 15, 8, %%r20\n"
+"	stb	%%r19, 0(%%sr1, %1)\n"
+"	stb	%%r20, 1(%%sr1, %1)\n"
+"	extrd	%0, 23, 8, %%r19\n"
+"	extrd	%0, 31, 8, %%r20\n"
+"	stb	%%r19, 2(%%sr1, %1)\n"
+"	stb	%%r20, 3(%%sr1, %1)\n"
+"	extrd	%0, 39, 8, %%r19\n"
+"	extrd	%0, 47, 8, %%r20\n"
+"	extrd	%0, 55, 8, %%r21\n"
+"	stb	%%r19, 4(%%sr1, %1)\n"
+"	stb	%%r20, 5(%%sr1, %1)\n"
+"	stb	%%r21, 6(%%sr1, %1)\n"
+"	stb	%0, 7(%%sr1, %1)\n"
+	: 
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21" );
+#else
+"	depd,z	%1, 60, 3, %%r19\n"
+"	depd	%%r0, 63, 3, %1\n"
+"	mtsar	%%r19\n"
+"	depdi,z	-2, 64, %%r19\n"
+"	ldd	0(%%sr1,%1),%%r20\n"
+"	ldd	8(%%sr1,%1),%%r21\n"
+"	shrpd	%%r0, %0, %sar, %%r22\n"
+"	shrpd	%0, %%r0, %sar, %%r1\n"
+"	and	%%r20, %%r19, %%r20\n"
+"	andcm	%%r21, %%r19, %%r21\n"
+"	or	%%r22, %%r20, %%r20\n"
+"	or	%%r1, %%r21, %%r21\n"
+"	std	%%r20,0(%%sr1,%1)\n"
+"	std	%%r21,8(%%sr1,%1)\n"
+	:
+	: "r" (val), "r" (regs->ior), "r" (regs->isr)
+	: "r19", "r20", "r21", "r22", "r1" );
+#endif
+
+	return 0;
+}
+#endif
+#if 0
 static int emulate_store(struct pt_regs *regs, int len, int frreg)
 {
 	int ret = 0;
 #ifdef __LP64__
-	unsigned long val = regs->gr[frreg] << (64 - (len << 3));
+        unsigned long val = regs->gr[frreg] << (64 - (len << 3));
 #else
-	unsigned long val = regs->gr[frreg] << (32 - (len << 3));
+        unsigned long val = regs->gr[frreg] << (32 - (len << 3));
 #endif
+	if (!frreg)
+		val = 0;
 
 	if (regs->isr != regs->sr[7])
 	{
@@ -220,12 +437,15 @@
 
 	return ret;
 }
+#endif
 
 
 void handle_unaligned(struct pt_regs *regs)
 {
 	unsigned long unaligned_count = 0;
 	unsigned long last_time = 0;
+	unsigned long newbase = regs->gr[R1(regs->iir)];
+	int modify = 0;
 	int ret = -1;
 	struct siginfo si;
 
@@ -284,83 +504,169 @@
 	if (!unaligned_enabled)
 		goto force_sigbus;
 
+	/* handle modification - OK, it's ugly, see the instruction manual */
+	switch (MAJOR_OP(regs->iir))
+	{
+	case 0x03:
+	case 0x09:
+	case 0x0b:
+		if (regs->iir&0x20)
+		{
+			modify = 1;
+			if (regs->iir&0x1000)		/* short loads */
+				if (regs->iir&0x200)
+					newbase += IM5_3(regs->iir);
+				else
+					newbase += IM5_2(regs->iir);
+			else if (regs->iir&0x2000)	/* scaled indexed */
+			{
+				int shift=0;
+				switch (regs->iir & OPCODE1_MASK)
+				{
+				case OPCODE_LDH_I:
+					shift= 1; break;
+				case OPCODE_LDW_I:
+					shift= 2; break;
+				case OPCODE_LDD_I:
+				case OPCODE_LDDA_I:
+					shift= 3; break;
+				}
+				newbase += regs->gr[R2(regs->iir)]<<shift;
+			} else				/* simple indexed */
+				newbase += regs->gr[R2(regs->iir)];
+		}
+		break;
+	case 0x13:
+	case 0x1b:
+		modify = 1;
+		newbase += IM14(regs->iir);
+		break;
+	case 0x14:
+	case 0x1c:
+		if (regs->iir&8)
+		{
+			modify = 1;
+			newbase += IM14(regs->iir&~0xe);
+		}
+		break;
+	case 0x16:
+	case 0x1e:
+		modify = 1;
+		newbase += IM14(regs->iir&6);
+		break;
+	case 0x17:
+	case 0x1f:
+		if (regs->iir&4)
+		{
+			modify = 1;
+			newbase += IM14(regs->iir&~4);
+		}
+		break;
+	}
+
+	if (regs->isr != regs->sr[7])
+	{
+		printk(KERN_CRIT "isr verification failed (isr: " RFMT ", sr7: " RFMT "\n",
+			regs->isr, regs->sr[7]);
+
+		/* don't kill him though, since he has appropriate access to the page, or we
+		 * would never have gotten here.
+		 */
+	}
+
 	/* TODO: make this cleaner... */
 	switch (regs->iir & OPCODE1_MASK)
 	{
 	case OPCODE_LDH_I:
 	case OPCODE_LDH_S:
-		ret = emulate_load(regs, 2, regs->iir & 0x1f);
+		ret = emulate_ldh(regs, R3(regs->iir));
 		break;
 
 	case OPCODE_LDW_I:
 	case OPCODE_LDWA_I:
 	case OPCODE_LDW_S:
 	case OPCODE_LDWA_S:
-		ret = emulate_load(regs, 4, regs->iir&0x1f);
-		break;
-
-	case OPCODE_LDD_I:
-	case OPCODE_LDDA_I:
-	case OPCODE_LDD_S:
-	case OPCODE_LDDA_S:
-		ret = emulate_load(regs, 8, regs->iir&0x1f);
+		ret = emulate_ldw(regs, R3(regs->iir));
 		break;
 
 	case OPCODE_STH:
-		ret = emulate_store(regs, 2, (regs->iir>>16)&0x1f);
+		ret = emulate_sth(regs, R2(regs->iir));
 		break;
 
 	case OPCODE_STW:
 	case OPCODE_STWA:
-		ret = emulate_store(regs, 4, (regs->iir>>16)&0x1f);
+		ret = emulate_stw(regs, R2(regs->iir));
+		break;
+
+#ifdef __LP64__
+	case OPCODE_LDD_I:
+	case OPCODE_LDDA_I:
+	case OPCODE_LDD_S:
+	case OPCODE_LDDA_S:
+		ret = emulate_ldd(regs, R3(regs->iir));
 		break;
 
 	case OPCODE_STD:
 	case OPCODE_STDA:
-		ret = emulate_store(regs, 8, (regs->iir>>16)&0x1f);
+		ret = emulate_std(regs, R2(regs->iir));
+		break;
+#endif
+
+	case OPCODE_LDCD_I:
+	case OPCODE_LDCW_I:
+	case OPCODE_LDCD_S:
+	case OPCODE_LDCW_S:
+		ret = -1;	/* "undefined", but lets kill them. */
 		break;
 	}
+#ifdef __LP64__
 	switch (regs->iir & OPCODE2_MASK)
 	{
 	case OPCODE_LDD_L:
 	case OPCODE_FLDD_L:
-		ret = emulate_load(regs, 8, (regs->iir>>16)&0x1f);
+		ret = emulate_ldd(regs, R2(regs->iir));
 		break;
 
 	case OPCODE_STD_L:
 	case OPCODE_FSTD_L:
-		ret = emulate_store(regs, 8, (regs->iir>>16)&0x1f);
+		ret = emulate_std(regs, R2(regs->iir));
 		break;
 	}
+#endif
 	switch (regs->iir & OPCODE3_MASK)
 	{
 	case OPCODE_LDW_M:
 	case OPCODE_FLDW_L:
-		ret = emulate_load(regs, 4, (regs->iir>>16)&0x1f);
+		ret = emulate_ldw(regs, R2(regs->iir));
 		break;
 
 	case OPCODE_FSTW_L:
 	case OPCODE_STW_M:
-		ret = emulate_store(regs, 4, (regs->iir>>16)&0x1f);
+		ret = emulate_stw(regs, R2(regs->iir));
 		break;
 	}
 	switch (regs->iir & OPCODE4_MASK)
 	{
 	case OPCODE_LDH_L:
-		ret = emulate_load(regs, 2, (regs->iir>>16)&0x1f);
+		ret = emulate_ldh(regs, R2(regs->iir));
 		break;
 	case OPCODE_LDW_L:
-	case OPCODE_LDW_L2:
-		ret = emulate_load(regs, 4, (regs->iir>>16)&0x1f);
+	case OPCODE_LDWM:
+		ret = emulate_ldw(regs, R2(regs->iir));
 		break;
 	case OPCODE_STH_L:
-		ret = emulate_store(regs, 2, (regs->iir>>16)&0x1f);
+		ret = emulate_sth(regs, R2(regs->iir));
 		break;
 	case OPCODE_STW_L:
-	case OPCODE_STW_L2:
-		ret = emulate_store(regs, 4, (regs->iir>>16)&0x1f);
+	case OPCODE_STWM:
+		ret = emulate_stw(regs, R2(regs->iir));
 		break;
 	}
+	/* XXX LJ - need to handle float load/store */
+
+	if (modify)
+		regs->gr[R1(regs->iir)] = newbase;
+
 
 	if (ret < 0)
 		printk(KERN_CRIT "Not-handled unaligned insn 0x%08lx\n", regs->iir);
@@ -424,9 +730,9 @@
 			align_mask = 1UL;
 			break;
 		case OPCODE_LDW_L:
-		case OPCODE_LDW_L2:
+		case OPCODE_LDWM:
 		case OPCODE_STW_L:
-		case OPCODE_STW_L2:
+		case OPCODE_STWM:
 			align_mask = 3UL;
 			break;
 		}
