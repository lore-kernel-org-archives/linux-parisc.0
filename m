Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E91C48B7
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 00:34:09 -0600 (MDT)
Date: Sat, 18 Oct 2003 23:38:25 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031019063825.GE24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] handle pagefaults on unaligned access
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

while testing out gcj today, i was able to crash the machine
consistently with both 2.4 and 2.6 kernel. turns out our unaligned
handler doesn't handle page faults properly. in the case for gcj, there
was a ldh on the edge of the page, the first byte is on a resident page,
the 2nd byte is on a faulting page.

this patch seems to fix it (at least the case i was seeing). any 
comments before i commit it?

thanks
randolph

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.21
diff -u -p -r1.21 unaligned.c
--- arch/parisc/kernel/unaligned.c	23 Sep 2003 20:15:33 -0000	1.21
+++ arch/parisc/kernel/unaligned.c	19 Oct 2003 06:29:00 -0000
@@ -128,6 +128,9 @@
 #define IM5_3(i) IM((i),5)
 #define IM14(i) IM((i),14)
 
+#define ERR_NOTHANDLED	-1
+#define ERR_PAGEFAULT	-2
+
 int unaligned_enabled = 1;
 
 void die_if_kernel (char *str, struct pt_regs *regs, long err);
@@ -136,16 +139,28 @@ static int emulate_ldh(struct pt_regs *r
 {
 	unsigned long saddr = regs->ior;
 	unsigned long val = 0;
+	int ret;
 
 	DPRINTF("load " RFMT ":" RFMT " to r%d for 2 bytes\n", 
 		regs->isr, regs->ior, toreg);
 
 	__asm__ __volatile__  (
-"	mtsp	%3, %%sr1\n"
-"	ldbs	0(%%sr1,%2), %%r20\n"
-"	ldbs	1(%%sr1,%2), %0\n"
-	"depw	%%r20, 23, 24, %0\n"
-	: "=r" (val)
+"	mtsp	%4, %%sr1\n"
+"1:	ldbs	0(%%sr1,%3), %%r20\n"
+"2:	ldbs	1(%%sr1,%3), %0\n"
+"	depw	%%r20, 23, 24, %0\n"
+"	cmpclr,= %%r0, %%r0, %1\n"
+"3:	ldo	-2(%%r0), %1\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(3b-1b)\n"
+"	.dword  2b,(3b-2b)\n"
+#else
+"	.word	1b,(3b-1b)\n"
+"	.word	2b,(3b-2b)\n"
+#endif
+"	.previous\n"
+	: "=r" (val), "=r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
 	: "r20" );
 
@@ -154,26 +169,39 @@ static int emulate_ldh(struct pt_regs *r
 	if (toreg)
 		regs->gr[toreg] = val;
 
-	return 0;
+	return ret;
 }
+
 static int emulate_ldw(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
 	unsigned long val = 0;
+	int ret;
 
 	DPRINTF("load " RFMT ":" RFMT " to r%d for 4 bytes\n", 
 		regs->isr, regs->ior, toreg);
 
 	__asm__ __volatile__  (
-"	zdep	%2,28,2,%%r19\n"		/* r19=(ofs&3)*8 */
-"	mtsp	%3, %%sr1\n"
-"	depw	%%r0,31,2,%2\n"
-"	ldw	0(%%sr1,%2),%0\n"
-"	ldw	4(%%sr1,%2),%%r20\n"
+"	zdep	%3,28,2,%%r19\n"		/* r19=(ofs&3)*8 */
+"	mtsp	%4, %%sr1\n"
+"	depw	%%r0,31,2,%3\n"
+"1:	ldw	0(%%sr1,%3),%0\n"
+"2:	ldw	4(%%sr1,%3),%%r20\n"
 "	subi	32,%%r19,%%r19\n"
 "	mtctl	%%r19,11\n"
 "	vshd	%0,%%r20,%0\n"
-	: "=r" (val)
+"	cmpclr,= %%r0, %%r0, %1\n"
+"3:	ldo	-2(%%r0), %1\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(3b-1b)\n"
+"	.dword  2b,(3b-2b)\n"
+#else
+"	.word	1b,(3b-1b)\n"
+"	.word	2b,(3b-2b)\n"
+#endif
+"	.previous\n"
+	: "=r" (val), "=r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
 	: "r19", "r20" );
 
@@ -184,12 +212,13 @@ static int emulate_ldw(struct pt_regs *r
 	else if (toreg)
 		regs->gr[toreg] = val;
 
-	return 0;
+	return ret;
 }
 static int emulate_ldd(struct pt_regs *regs, int toreg, int flop)
 {
 	unsigned long saddr = regs->ior;
 	__u64 val = 0;
+	int ret;
 
 	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", 
 		regs->isr, regs->ior, toreg);
@@ -200,51 +229,77 @@ static int emulate_ldd(struct pt_regs *r
 		return -1;
 #endif
 	__asm__ __volatile__  (
-"	depd,z	%2,60,3,%%r19\n"		/* r19=(ofs&7)*8 */
-"	mtsp	%3, %%sr1\n"
-"	depd	%%r0,63,3,%2\n"
-"	ldd	0(%%sr1,%2),%0\n"
-"	ldd	8(%%sr1,%2),%%r20\n"
+"	depd,z	%3,60,3,%%r19\n"		/* r19=(ofs&7)*8 */
+"	mtsp	%4, %%sr1\n"
+"	depd	%%r0,63,3,%3\n"
+"1:	ldd	0(%%sr1,%3),%0\n"
+"2:	ldd	8(%%sr1,%3),%%r20\n"
 "	subi	64,%%r19,%%r19\n"
 "	mtsar	%%r19\n"
 "	shrpd	%0,%%r20,%%sar,%0\n"
-	: "=r" (val)
+"	cmpclr,= %%r0, %%r0, %1\n"
+"3:	ldo	-2(%%r0), %1\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(3b-1b)\n"
+"	.dword  2b,(3b-2b)\n"
+#else
+"	.word	1b,(3b-1b)\n"
+"	.word	2b,(3b-2b)\n"
+#endif
+"	.previous\n"
+	: "=r" (val), "=r" (ret)
 	: "0" (val), "r" (saddr), "r" (regs->isr)
 	: "r19", "r20" );
 #else
     {
 	unsigned long valh=0,vall=0;
 	__asm__ __volatile__  (
-"	zdep	%4,29,2,%%r19\n"		/* r19=(ofs&3)*8 */
-"	mtsp	%5, %%sr1\n"
-"	dep	%%r0,31,2,%4\n"
-"	ldw	0(%%sr1,%5),%0\n"
-"	ldw	4(%%sr1,%5),%1\n"
-"	ldw	8(%%sr1,%5),%%r20\n"
+"	zdep	%5,29,2,%%r19\n"		/* r19=(ofs&3)*8 */
+"	mtsp	%6, %%sr1\n"
+"	dep	%%r0,31,2,%5\n"
+"1:	ldw	0(%%sr1,%6),%0\n"
+"2:	ldw	4(%%sr1,%6),%1\n"
+"3:	ldw	8(%%sr1,%6),%%r20\n"
 "	subi	32,%%r19,%%r19\n"
 "	mtsar	%%r19\n"
 "	vshd	%0,%1,%0\n"
 "	vshd	%1,%%r20,%1\n"
-	: "=r" (valh), "=r" (vall)
+"	cmpclr,= %%r0, %%r0, %2\n"
+"4:	ldo	-2(%%r0), %2\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(4b-1b)\n"
+"	.dword  2b,(4b-2b)\n"
+"	.dword	3b,(4b-3b)\n"
+#else
+"	.word	1b,(4b-1b)\n"
+"	.word	2b,(4b-2b)\n"
+"	.word	3b,(4b-3b)\n"
+#endif
+"	.previous\n"
+	: "=r" (valh), "=r" (vall), "=r" (ret)
 	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
 	: "r19", "r20" );
 	val=((__u64)valh<<32)|(__u64)vall;
     }
 #endif
 
-	DPRINTF("val = 0x" RFMT "\n", val);
+	DPRINTF("val = 0xllx\n", val);
 
 	if (flop)
 		regs->fr[toreg] = val;
 	else if (toreg)
 		regs->gr[toreg] = val;
 
-	return 0;
+	return ret;
 }
 
 static int emulate_sth(struct pt_regs *regs, int frreg)
 {
 	unsigned long val = regs->gr[frreg];
+	int ret;
+
 	if (!frreg)
 		val = 0;
 
@@ -252,19 +307,32 @@ static int emulate_sth(struct pt_regs *r
 		val, regs->isr, regs->ior);
 
 	__asm__ __volatile__ (
-"	mtsp %2, %%sr1\n"
-"	extrw,u %0, 23, 8, %%r19\n"
-"	stb %0, 1(%%sr1, %1)\n"
-"	stb %%r19, 0(%%sr1, %1)\n"
-	:
+"	mtsp %3, %%sr1\n"
+"	extrw,u %1, 23, 8, %%r19\n"
+"1:	stb %1, 1(%%sr1, %2)\n"
+"2:	stb %%r19, 0(%%sr1, %2)\n"
+"	cmpclr,= %%r0, %%r0, %0\n"
+"3:	ldo	-2(%%r0), %0\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(3b-1b)\n"
+"	.dword  2b,(3b-2b)\n"
+#else
+"	.word	1b,(3b-1b)\n"
+"	.word	2b,(3b-2b)\n"
+#endif
+"	.previous\n"
+	: "=r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19" );
 
-	return 0;
+	return ret;
 }
+
 static int emulate_stw(struct pt_regs *regs, int frreg, int flop)
 {
 	unsigned long val;
+	int ret;
 
 	if (flop)
 		val = ((__u32*)(regs->fr))[frreg];
@@ -278,22 +346,33 @@ static int emulate_stw(struct pt_regs *r
 
 
 	__asm__ __volatile__ (
-"	mtsp %2, %%sr1\n"
-"	zdep	%1, 28, 2, %%r19\n"
-"	dep	%%r0, 31, 2, %1\n"
+"	mtsp %3, %%sr1\n"
+"	zdep	%2, 28, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %2\n"
 "	mtsar	%%r19\n"
 "	depwi,z	-2, %%sar, 32, %%r19\n"
-"	ldw	0(%%sr1,%1),%%r20\n"
-"	ldw	4(%%sr1,%1),%%r21\n"
-"	vshd	%%r0, %0, %%r22\n"
-"	vshd	%0, %%r0, %%r1\n"
+"1:	ldw	0(%%sr1,%2),%%r20\n"
+"2:	ldw	4(%%sr1,%2),%%r21\n"
+"	vshd	%%r0, %1, %%r22\n"
+"	vshd	%1, %%r0, %%r1\n"
 "	and	%%r20, %%r19, %%r20\n"
 "	andcm	%%r21, %%r19, %%r21\n"
 "	or	%%r22, %%r20, %%r20\n"
 "	or	%%r1, %%r21, %%r21\n"
-"	stw	%%r20,0(%%sr1,%1)\n"
-"	stw	%%r21,4(%%sr1,%1)\n"
-	:
+"	stw	%%r20,0(%%sr1,%2)\n"
+"	stw	%%r21,4(%%sr1,%2)\n"
+"	cmpclr,= %%r0, %%r0, %0\n"
+"3:	ldo	-2(%%r0), %0\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(3b-1b)\n"
+"	.dword  2b,(3b-2b)\n"
+#else
+"	.word	1b,(3b-1b)\n"
+"	.word	2b,(3b-2b)\n"
+#endif
+"	.previous\n"
+	: "=r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r22", "r1" );
 
@@ -302,6 +381,7 @@ static int emulate_stw(struct pt_regs *r
 static int emulate_std(struct pt_regs *regs, int frreg, int flop)
 {
 	__u64 val;
+	int ret;
 
 	if (flop)
 		val = regs->fr[frreg];
@@ -310,7 +390,7 @@ static int emulate_std(struct pt_regs *r
 	else
 		val = 0;
 
-	DPRINTF("store r%d (0x" %016llx ") to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
+	DPRINTF("store r%d (0x%016llx) to " RFMT ":" RFMT " for 8 bytes\n", frreg, 
 		val,  regs->isr, regs->ior);
 
 #ifdef CONFIG_PA20
@@ -319,52 +399,84 @@ static int emulate_std(struct pt_regs *r
 		return -1;
 #endif
 	__asm__ __volatile__ (
-"	mtsp %2, %%sr1\n"
-"	depd,z	%1, 60, 3, %%r19\n"
-"	depd	%%r0, 63, 3, %1\n"
+"	mtsp %3, %%sr1\n"
+"	depd,z	%2, 60, 3, %%r19\n"
+"	depd	%%r0, 63, 3, %2\n"
 "	mtsar	%%r19\n"
 "	depdi,z	-2, %%sar, 64, %%r19\n"
-"	ldd	0(%%sr1,%1),%%r20\n"
-"	ldd	8(%%sr1,%1),%%r21\n"
-"	shrpd	%%r0, %0, %%sar, %%r22\n"
-"	shrpd	%0, %%r0, %%sar, %%r1\n"
+"1:	ldd	0(%%sr1,%2),%%r20\n"
+"2:	ldd	8(%%sr1,%2),%%r21\n"
+"	shrpd	%%r0, %1, %%sar, %%r22\n"
+"	shrpd	%1, %%r0, %%sar, %%r1\n"
 "	and	%%r20, %%r19, %%r20\n"
 "	andcm	%%r21, %%r19, %%r21\n"
 "	or	%%r22, %%r20, %%r20\n"
 "	or	%%r1, %%r21, %%r21\n"
-"	std	%%r20,0(%%sr1,%1)\n"
-"	std	%%r21,8(%%sr1,%1)\n"
-	:
+"3:	std	%%r20,0(%%sr1,%2)\n"
+"4:	std	%%r21,8(%%sr1,%2)\n"
+"	cmpclr,= %%r0, %%r0, %0\n"
+"5:	ldo	-2(%%r0), %0\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(5b-1b)\n"
+"	.dword  2b,(5b-2b)\n"
+"	.dword	3b,(5b-3b)\n"
+"	.dword  4b,(5b-4b)\n"
+#else
+"	.word	1b,(5b-1b)\n"
+"	.word	2b,(5b-2b)\n"
+"	.word	3b,(5b-3b)\n"
+"	.word	4b,(5b-4b)\n"
+#endif
+"	.previous\n"
+	: "=r" (ret)
 	: "r" (val), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r22", "r1" );
 #else
     {
 	unsigned long valh=(val>>32),vall=(val&0xffffffffl);
 	__asm__ __volatile__ (
-"	mtsp	%3, %%sr1\n"
-"	zdep	%1, 29, 2, %%r19\n"
-"	dep	%%r0, 31, 2, %1\n"
+"	mtsp	%4, %%sr1\n"
+"	zdep	%2, 29, 2, %%r19\n"
+"	dep	%%r0, 31, 2, %2\n"
 "	mtsar	%%r19\n"
 "	zvdepi	-2, 32, %%r19\n"
-"	ldw	0(%%sr1,%2),%%r20\n"
-"	ldw	8(%%sr1,%2),%%r21\n"
-"	vshd	%0, %1, %%r1\n"
-"	vshd	%%r0, %0, %0\n"
-"	vshd	%1, %%r0, %1\n"
+"1:	ldw	0(%%sr1,%3),%%r20\n"
+"2:	ldw	8(%%sr1,%3),%%r21\n"
+"	vshd	%1, %2, %%r1\n"
+"	vshd	%%r0, %1, %1\n"
+"	vshd	%2, %%r0, %2\n"
 "	and	%%r20, %%r19, %%r20\n"
 "	andcm	%%r21, %%r19, %%r21\n"
-"	or	%0, %%r20, %0\n"
-"	or	%1, %%r21, %1\n"
-"	stw	%0,0(%%sr1,%2)\n"
-"	stw	%%r1,4(%%sr1,%2)\n"
-"	stw	%1,8(%%sr1,%2)\n"
-	:
+"	or	%1, %%r20, %1\n"
+"	or	%2, %%r21, %2\n"
+"3:	stw	%1,0(%%sr1,%1)\n"
+"4:	stw	%%r1,4(%%sr1,%3)\n"
+"5:	stw	%2,8(%%sr1,%3)\n"
+"	cmpclr,= %%r0, %%r0, %0\n"
+"6:	ldo	-2(%%r0), %0\n"
+"	.section __ex_table,\"a\"\n"
+#ifdef __LP64__
+"	.dword	1b,(6b-1b)\n"
+"	.dword  2b,(6b-2b)\n"
+"	.dword	3b,(6b-3b)\n"
+"	.dword  4b,(6b-4b)\n"
+"	.dword  5b,(6b-5b)\n"
+#else
+"	.word	1b,(6b-1b)\n"
+"	.word	2b,(6b-2b)\n"
+"	.word	3b,(6b-3b)\n"
+"	.word	4b,(6b-4b)\n"
+"	.word  	5b,(6b-5b)\n"
+#endif
+"	.previous\n"
+	: "r" (ret)
 	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
 	: "r19", "r20", "r21", "r1" );
     }
 #endif
 
-	return 0;
+	return ret;
 }
 
 void handle_unaligned(struct pt_regs *regs)
@@ -373,7 +485,7 @@ void handle_unaligned(struct pt_regs *re
 	static unsigned long last_time = 0;
         unsigned long newbase = R1(regs->iir)?regs->gr[R1(regs->iir)]:0;
 	int modify = 0;
-	int ret = -1;
+	int ret = ERR_NOTHANDLED;
 	struct siginfo si;
 	register int flop=0;	/* true if this is a flop */
 
@@ -567,7 +679,7 @@ void handle_unaligned(struct pt_regs *re
 	case OPCODE_LDCW_I:
 	case OPCODE_LDCD_S:
 	case OPCODE_LDCW_S:
-		ret = -1;	/* "undefined", but lets kill them. */
+		ret = ERR_NOTHANDLED;	/* "undefined", but lets kill them. */
 		break;
 	}
 #ifdef CONFIG_PA20
@@ -632,7 +744,7 @@ void handle_unaligned(struct pt_regs *re
 		regs->gr[R1(regs->iir)] = newbase;
 
 
-	if (ret < 0)
+	if (ret == ERR_NOTHANDLED)
 		printk(KERN_CRIT "Not-handled unaligned insn 0x%08lx\n", regs->iir);
 
 	DPRINTF("ret = %d\n", ret);
@@ -641,13 +753,25 @@ void handle_unaligned(struct pt_regs *re
 	{
 		printk(KERN_CRIT "Unaligned handler failed, ret = %d\n", ret);
 		die_if_kernel("Unaligned data reference", regs, 28);
+
+		if (ret == ERR_PAGEFAULT)
+		{
+			si.si_signo = SIGSEGV;
+			si.si_errno = 0;
+			si.si_code = SEGV_MAPERR;
+			si.si_addr = (void *)regs->ior;
+			force_sig_info(SIGSEGV, &si, current);
+		}
+		else
+		{
 force_sigbus:
-		/* couldn't handle it ... */
-		si.si_signo = SIGBUS;
-		si.si_errno = 0;
-		si.si_code = BUS_ADRALN;
-		si.si_addr = (void *)regs->ior;
-		force_sig_info(SIGBUS, &si, current);
+			/* couldn't handle it ... */
+			si.si_signo = SIGBUS;
+			si.si_errno = 0;
+			si.si_code = BUS_ADRALN;
+			si.si_addr = (void *)regs->ior;
+			force_sig_info(SIGBUS, &si, current);
+		}
 		
 		return;
 	}
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
