From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sat, 11 Sep 2004 09:53:25 -0700
Message-ID: <20040911165325.GO28659@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: PARISC list <parisc-linux@lists.parisc-linux.org>
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

Currently, palinux handles exceptions differently from other
architectures in the kernel. On most other architectures, an exception
to a read/store that has an associated exception table entry in the
kernel is handled by code in a fixup section, which is responsible for
setting the proper return values, etc.

On pa, we currently have an interesting scheme that associates a "skip"
value with each exception entry. The bottom two bits of the skip value
indicates whether r8,r9 should be set to -EFAULT,0 during a fault, and
the top bits indicate a relative adjustment that should be applied to
the iaoq to handle the fault.

The patch below, based on my discussions with jejb, changes this
behaviour so that it more closely matches what happens on other
architectures (but with a twist...): the exception table entries now
contain an *absolute* address to branch to for the fixup [1]. The 
fixups are placed in a separate fixup section (this simplifies a bit of 
code in unaligned.c too). The fixup code loads up whatever values are 
required by the caller, and typically branches back to the original 
code at a correct location to continue.

This frees up the bottom two bits for other purposes -- currently there
is no way to pass the faulting address and instruction back to an
exception table handler. The proposal is to reuse the bottom 2 bits to
indicate whether the faulting address/insn should be passed back to the
handler in r8/r9. (this will be used by the optimized pa copy routines,
for example)

One downside of this approach is that the extra fixup sections take up
more space, so the end kernel is bigger. In my test on 64-bit, the
kernel size increases by ~2%.

The patch below has been tested against 2.6.8.1-pa11 on 64-bit-SMP, and
compile tested on 32-bit-UP. I don't have a 32-bit machine to test on
atm, so test reports are most welcome [2]. I've applied the manual stubs
trick that jejb mentioned earlier, but only for 64-bit, since the 32-bit
linker is able to generate those stubs automatically when needed.

Comments?

randolph

[1] The change to using absolute jumps is because gas doesn't want to
let us take the difference of labels in two different sections (viz.
.text vs .fixup). jejb and I are not able to come up with a case where
using relative jumps is required.

[2] Since this changes the *exception* path, simply booting a kernel or
building things will not exercise the new code. You need to do something
that will trigger a load/store fault on userspace in the kernel. If I
were Carlos I would have attached a nice testsuite to this patch, but
alas I've only done some manual testing on a few cases.... there's a
debug printk in this patch which will print something like:
    "applying fixup for 0x10281ae4, fixup at 0x103ca614"
if you see that, then you are exercising the new code.


Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.14
diff -u -p -r1.14 syscall.S
--- arch/parisc/kernel/syscall.S	10 Sep 2004 14:52:01 -0000	1.14
+++ arch/parisc/kernel/syscall.S	11 Sep 2004 16:25:50 -0000
@@ -29,6 +29,19 @@
 #else
 	.level		1.1
 #endif
+
+#ifndef __LP64__
+	.macro fixup_branch,lbl
+	b	    \lbl
+	.endm
+#else
+	.macro fixup_branch,lbl
+	ldil	    L%\lbl, %r1
+	ldo	    R%\lbl(%r1), %r1
+	bv,n        %r0(%r1)
+	.endm
+#endif
+
 	.text
 
 	.import syscall_exit,code
@@ -575,10 +588,8 @@ cas_action:
 	/* Return to userspace, set no error */
 	b	lws_exit
 	copy	%r0, %r21
-	nop	/* Add some visual space in objdump */
-	nop
-	nop
-	nop
+
+	.section .fixup,"ax"
 3:		
 	/* Error occured on load or store */
 #ifdef CONFIG_SMP
@@ -588,12 +599,13 @@ cas_action:
 	stw	%r0, 4(%sr2,%r20)
 # endif
 #endif
-	b	lws_exit
+	fixup_branch lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
 	nop
 	nop
 	nop
 	nop
+	.previous
 
 	/* Two exception table entries, one for the load,
 	   the other for the store. Either return -EFAULT */
@@ -601,10 +613,10 @@ cas_action:
 #ifdef __LP64__
 	/* Pad the address calculation */
 	.word	0,(2b - linux_gateway_page)
-	.dword	(3b - 2b) 
+	.dword	3b
 #else
 	.word	2b - linux_gateway_page
-	.word	(3b - 2b) 
+	.word	3b
 #endif
 	.previous
 
@@ -612,10 +624,10 @@ cas_action:
 #ifdef __LP64__
 	/* Pad the address calculation */
 	.word	0,(1b - linux_gateway_page)
-	.dword	(3b - 1b) 
+	.dword	3b
 #else
 	.word	1b - linux_gateway_page
-	.word	(3b - 1b) 
+	.word	3b
 #endif
 	.previous
 
Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.8
diff -u -p -r1.8 unaligned.c
--- arch/parisc/kernel/unaligned.c	21 Aug 2004 06:19:33 -0000	1.8
+++ arch/parisc/kernel/unaligned.c	11 Sep 2004 16:25:50 -0000
@@ -23,6 +23,7 @@
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <asm/uaccess.h>
 
 /* #define DEBUG_UNALIGNED 1 */
 
@@ -134,15 +135,19 @@ static int emulate_ldh(struct pt_regs *r
 "1:	ldbs	0(%%sr1,%3), %%r20\n"
 "2:	ldbs	1(%%sr1,%3), %0\n"
 "	depw	%%r20, 23, 24, %0\n"
-"	cmpclr,= %%r0, %%r0, %1\n"
-"3:	ldo	-2(%%r0), %1\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %1\n"
+"3:	\n"
+"	.section .fixup,\"ax\"\n"
+"4:	ldi	-2, %1\n"
+	FIXUP_BRANCH(3b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(3b-1b)\n"
-"	.dword  2b,(3b-2b)\n"
+"	.dword	1b,4b\n"
+"	.dword  2b,4b\n"
 #else
-"	.word	1b,(3b-1b)\n"
-"	.word	2b,(3b-2b)\n"
+"	.word	1b,4b\n"
+"	.word	2b,4b\n"
 #endif
 "	.previous\n"
 	: "=r" (val), "=r" (ret)
@@ -175,15 +180,19 @@ static int emulate_ldw(struct pt_regs *r
 "	subi	32,%%r19,%%r19\n"
 "	mtctl	%%r19,11\n"
 "	vshd	%0,%%r20,%0\n"
-"	cmpclr,= %%r0, %%r0, %1\n"
-"3:	ldo	-2(%%r0), %1\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %1\n"
+"3:	\n"
+"	.section .fixup,\"ax\"\n"
+"4:	ldi	-2, %1\n"
+	FIXUP_BRANCH(3b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(3b-1b)\n"
-"	.dword  2b,(3b-2b)\n"
+"	.dword	1b,4b\n"
+"	.dword  2b,4b\n"
 #else
-"	.word	1b,(3b-1b)\n"
-"	.word	2b,(3b-2b)\n"
+"	.word	1b,4b\n"
+"	.word	2b,4b\n"
 #endif
 "	.previous\n"
 	: "=r" (val), "=r" (ret)
@@ -222,15 +231,19 @@ static int emulate_ldd(struct pt_regs *r
 "	subi	64,%%r19,%%r19\n"
 "	mtsar	%%r19\n"
 "	shrpd	%0,%%r20,%%sar,%0\n"
-"	cmpclr,= %%r0, %%r0, %1\n"
-"3:	ldo	-2(%%r0), %1\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %1\n"
+"3:	\n"
+"	.section .fixup,\"ax\"\n"
+"4:	ldi	-2, %1\n"
+	FIXUP_BRANCH(3b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(3b-1b)\n"
-"	.dword  2b,(3b-2b)\n"
+"	.dword	1b,4b\n"
+"	.dword  2b,4b\n"
 #else
-"	.word	1b,(3b-1b)\n"
-"	.word	2b,(3b-2b)\n"
+"	.word	1b,4b\n"
+"	.word	2b,4b\n"
 #endif
 "	.previous\n"
 	: "=r" (val), "=r" (ret)
@@ -250,17 +263,20 @@ static int emulate_ldd(struct pt_regs *r
 "	mtsar	%%r19\n"
 "	vshd	%0,%1,%0\n"
 "	vshd	%1,%%r20,%1\n"
-"	cmpclr,= %%r0, %%r0, %2\n"
-"4:	ldo	-2(%%r0), %2\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %2\n"
+"4:	\n"
+"	.section .fixup,\"ax\"\n"
+"5:	ldi	-2, %2\n"
+	FIXUP_BRANCH(4b)
+"	.previous\n"
 #ifdef __LP64__
-"	.dword	1b,(4b-1b)\n"
-"	.dword  2b,(4b-2b)\n"
-"	.dword	3b,(4b-3b)\n"
-#else
-"	.word	1b,(4b-1b)\n"
-"	.word	2b,(4b-2b)\n"
-"	.word	3b,(4b-3b)\n"
+"	.dword	1b,5b\n"
+"	.dword  2b,5b\n"
+"	.dword	3b,5b\n"
+#else
+"	.word	1b,5b\n"
+"	.word	2b,5b\n"
+"	.word	3b,5b\n"
 #endif
 "	.previous\n"
 	: "=r" (valh), "=r" (vall), "=r" (ret)
@@ -296,15 +312,19 @@ static int emulate_sth(struct pt_regs *r
 "	extrw,u %1, 23, 8, %%r19\n"
 "1:	stb %1, 1(%%sr1, %2)\n"
 "2:	stb %%r19, 0(%%sr1, %2)\n"
-"	cmpclr,= %%r0, %%r0, %0\n"
-"3:	ldo	-2(%%r0), %0\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %0\n"
+"3:	\n"
+"	.section .fixup,\"ax\"\n"
+"4:	ldi	-2, %0\n"
+	FIXUP_BRANCH(3b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(3b-1b)\n"
-"	.dword  2b,(3b-2b)\n"
+"	.dword	1b,4b\n"
+"	.dword  2b,4b\n"
 #else
-"	.word	1b,(3b-1b)\n"
-"	.word	2b,(3b-2b)\n"
+"	.word	1b,4b\n"
+"	.word	2b,4b\n"
 #endif
 "	.previous\n"
 	: "=r" (ret)
@@ -346,15 +366,19 @@ static int emulate_stw(struct pt_regs *r
 "	or	%%r1, %%r21, %%r21\n"
 "	stw	%%r20,0(%%sr1,%2)\n"
 "	stw	%%r21,4(%%sr1,%2)\n"
-"	cmpclr,= %%r0, %%r0, %0\n"
-"3:	ldo	-2(%%r0), %0\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %0\n"
+"3:	\n"
+"	.section .fixup,\"ax\"\n"
+"4:	ldi	-2, %0\n"
+	FIXUP_BRANCH(3b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(3b-1b)\n"
-"	.dword  2b,(3b-2b)\n"
+"	.dword	1b,4b\n"
+"	.dword  2b,4b\n"
 #else
-"	.word	1b,(3b-1b)\n"
-"	.word	2b,(3b-2b)\n"
+"	.word	1b,4b\n"
+"	.word	2b,4b\n"
 #endif
 "	.previous\n"
 	: "=r" (ret)
@@ -399,19 +423,23 @@ static int emulate_std(struct pt_regs *r
 "	or	%%r1, %%r21, %%r21\n"
 "3:	std	%%r20,0(%%sr1,%2)\n"
 "4:	std	%%r21,8(%%sr1,%2)\n"
-"	cmpclr,= %%r0, %%r0, %0\n"
-"5:	ldo	-2(%%r0), %0\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %0\n"
+"5:	\n"
+"	.section .fixup,\"ax\"\n"
+"6:	ldi	-2, %0\n"
+	FIXUP_BRANCH(5b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(5b-1b)\n"
-"	.dword  2b,(5b-2b)\n"
-"	.dword	3b,(5b-3b)\n"
-"	.dword  4b,(5b-4b)\n"
-#else
-"	.word	1b,(5b-1b)\n"
-"	.word	2b,(5b-2b)\n"
-"	.word	3b,(5b-3b)\n"
-"	.word	4b,(5b-4b)\n"
+"	.dword	1b,6b\n"
+"	.dword  2b,6b\n"
+"	.dword	3b,6b\n"
+"	.dword  4b,6b\n"
+#else
+"	.word	1b,6b\n"
+"	.word	2b,6b\n"
+"	.word	3b,6b\n"
+"	.word	4b,6b\n"
 #endif
 "	.previous\n"
 	: "=r" (ret)
@@ -438,21 +466,25 @@ static int emulate_std(struct pt_regs *r
 "3:	stw	%1,0(%%sr1,%1)\n"
 "4:	stw	%%r1,4(%%sr1,%3)\n"
 "5:	stw	%2,8(%%sr1,%3)\n"
-"	cmpclr,= %%r0, %%r0, %0\n"
-"6:	ldo	-2(%%r0), %0\n"
-"	.section __ex_table,\"a\"\n"
+"	copy	%%r0, %0\n"
+"6:	\n"
+"	.section .fixup,\"ax\"\n"
+"7:	ldi	-2, %0\n"
+	FIXUP_BRANCH(6b)
+"	.previous\n"
+"	.section __ex_table,\"aw\"\n"
 #ifdef __LP64__
-"	.dword	1b,(6b-1b)\n"
-"	.dword  2b,(6b-2b)\n"
-"	.dword	3b,(6b-3b)\n"
-"	.dword  4b,(6b-4b)\n"
-"	.dword  5b,(6b-5b)\n"
-#else
-"	.word	1b,(6b-1b)\n"
-"	.word	2b,(6b-2b)\n"
-"	.word	3b,(6b-3b)\n"
-"	.word	4b,(6b-4b)\n"
-"	.word  	5b,(6b-5b)\n"
+"	.dword	1b,7b\n"
+"	.dword  2b,7b\n"
+"	.dword	3b,7b\n"
+"	.dword  4b,7b\n"
+"	.dword  5b,7b\n"
+#else
+"	.word	1b,7b\n"
+"	.word	2b,7b\n"
+"	.word	3b,7b\n"
+"	.word	4b,7b\n"
+"	.word  	5b,7b\n"
 #endif
 "	.previous\n"
 	: "=r" (ret)
Index: arch/parisc/lib/lusercopy.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/lib/lusercopy.S,v
retrieving revision 1.3
diff -u -p -r1.3 lusercopy.S
--- arch/parisc/lib/lusercopy.S	17 Jan 2004 06:39:24 -0000	1.3
+++ arch/parisc/lib/lusercopy.S	11 Sep 2004 16:25:50 -0000
@@ -53,6 +53,18 @@
 	mtsp        %r1,%sr1
 	.endm
 
+#ifndef __LP64__
+	.macro fixup_branch lbl
+	b	    \lbl
+	.endm
+#else
+	.macro fixup_branch lbl
+	ldil	    L%\lbl, %r1
+	ldo	    R%\lbl(%r1), %r1
+	bv,n        %r0(%r1)
+	.endm
+#endif
+
 	/*
 	 * unsigned long
 	 * lcopy_to_user(void *to, const void *from, unsigned long n)
@@ -77,14 +89,16 @@ $lctu_done:
 	copy        %r24,%r28
 	.exit
 
-2:      b $lctu_done
+	.section .fixup,"ax"
+2:      fixup_branch $lctu_done
 	ldo         1(%r24),%r24
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(2b-1b)
+	.dword      1b,2b
 #else
-	.word       1b,(2b-1b)
+	.word       1b,2b
 #endif
 	.previous
 
@@ -118,18 +132,20 @@ $lcfu_done:
 	copy        %r24,%r28
 	.exit
 
+	.section .fixup,"ax"
 2:      copy        %r24,%r23
 $lcfu_zero_loop:
 	addib,<>    -1,%r23,$lcfu_zero_loop
 	stbs,ma     %r0,1(%r26)
-	b           $lcfu_done
+	fixup_branch $lcfu_done
 	nop
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(2b-1b)
+	.dword      1b,2b
 #else
-	.word       1b,(2b-1b)
+	.word       1b,2b
 #endif
 	.previous
 
@@ -159,14 +175,16 @@ $lciu_done:
 	copy        %r24,%r28
 	.exit
 
-2:      b $lciu_done
+	.section .fixup,"ax"
+2:      fixup_branch $lciu_done
 	ldo         1(%r24),%r24
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(2b-1b)
+	.dword      1b,2b
 #else
-	.word       1b,(2b-1b)
+	.word       1b,2b
 #endif
 	.previous
 
@@ -201,16 +219,18 @@ $lsfu_exit:
 	nop
 	.exit
 
-3:      b           $lsfu_exit
+	.section .fixup,"ax"
+3:      fixup_branch $lsfu_exit
 	ldi         -EFAULT,%r28
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(3b-1b)
-	.dword      2b,(3b-2b)
+	.dword      1b,3b
+	.dword      2b,3b
 #else
-	.word       1b,(3b-1b)
-	.word       2b,(3b-2b)
+	.word       1b,3b
+	.word       2b,3b
 #endif
 	.previous
 
@@ -239,14 +259,16 @@ $lclu_done:
 	copy        %r25,%r28
 	.exit
 
-2:      b $lclu_done
+	.section .fixup,"ax"
+2:      fixup_branch $lclu_done
 	ldo        1(%r25),%r25
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(2b-1b)
+	.dword      1b,2b
 #else
-	.word       1b,(2b-1b)
+	.word       1b,2b
 #endif
 	.previous
 
@@ -282,16 +304,18 @@ $lslen_nzero:
 	b           $lslen_done
 	ldo         1(%r26),%r26 /* special case for N == 0 */
 
-3:      b           $lslen_done
+	.section .fixup,"ax"
+3:      fixup_branch $lslen_done
 	copy        %r24,%r26    /* reset r26 so 0 is returned on fault */
+	.previous
 
-	.section __ex_table,"a"
+	.section __ex_table,"aw"
 #ifdef __LP64__
-	.dword      1b,(3b-1b)
-	.dword      2b,(3b-2b)
+	.dword      1b,3b
+	.dword      2b,3b
 #else
-	.word       1b,(3b-1b)
-	.word       2b,(3b-2b)
+	.word       1b,3b
+	.word       2b,3b
 #endif
 	.previous
 
Index: arch/parisc/mm/fault.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/fault.c,v
retrieving revision 1.1
diff -u -p -r1.1 fault.c
--- arch/parisc/mm/fault.c	29 Jul 2003 17:00:42 -0000	1.1
+++ arch/parisc/mm/fault.c	11 Sep 2004 16:25:50 -0000
@@ -235,12 +235,14 @@ no_context:
 
 		if (fix) {
 
-			if (fix->skip & 1) 
-				regs->gr[8] = -EFAULT;
-			if (fix->skip & 2)
-				regs->gr[9] = 0;
+printk("applying fixup for 0x%lx, fixup at 0x%lx\n", regs->iaoq[0], fix->fixup & ~3);
 
-			regs->iaoq[0] += ((fix->skip) & ~3);
+			if (fix->fixup & 1) 
+				regs->gr[8] = regs->iir;
+			if (fix->fixup & 2)
+				regs->gr[9] = regs->ior;
+
+			regs->iaoq[0] = ((fix->fixup) & ~3);
 
 			/*
 			 * NOTE: In some cases the faulting instruction
Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.13
diff -u -p -r1.13 uaccess.h
--- include/asm-parisc/uaccess.h	4 Feb 2004 18:24:55 -0000	1.13
+++ include/asm-parisc/uaccess.h	11 Sep 2004 16:26:04 -0000
@@ -54,16 +54,15 @@ extern int __put_user_bad(void);
 /*
  * The exception table contains two values: the first is an address
  * for an instruction that is allowed to fault, and the second is
- * the number of bytes to skip if a fault occurs. We also support in
- * two bit flags: 0x2 tells the exception handler to clear register
- * r9 and 0x1 tells the exception handler to put -EFAULT in r8.
- * This allows us to handle the simple cases for put_user and
- * get_user without having to have .fixup sections.
+ * the address to the fixup routine. We also support two bit flags: 
+ * 0x2 tells the exception handler to store the faulting address in
+ * r9 and 0x1 tells the exception handler to store the faulting
+ * insn in r8.
  */
 
 struct exception_table_entry {
 	unsigned long insn;  /* address of insn that is allowed to fault.   */
-	long skip;           /* pcoq skip | r9 clear flag | r8 -EFAULT flag */
+	long fixup;          /* fixup | r9 ior flag | r8 iir flag */
 };
 
 #define __get_user(x,ptr)                               \
@@ -94,43 +93,70 @@ struct exception_table_entry {
 	__gu_err;                                       \
 })
 
+#ifndef __LP64__
+#define FIXUP_BRANCH(lbl) \
+	"\tb " #lbl "\n"
+#else
+#define FIXUP_BRANCH(lbl) \
+	"\tldil L%%" #lbl ", %%r1\n"			\
+	"\tldo R%%" #lbl "(%%r1), %%r1\n"		\
+	"\tbv,n %%r0(%%r1)\n"
+#endif
+
+/* -14 is -EFAULT below */
 #ifdef __LP64__
 #define __get_kernel_asm(ldx,ptr)                       \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
 		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.dword\t1b\n"                       \
-		 "\t.dword\t(2b-1b)+3\n"                \
-		 "\t.previous"                          \
+		"\t.section .fixup,\"ax\"\n"		\
+		"3:\tldi -14, %1\n"			\
+		"\tcopy %%r0, %0\n"			\
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"                          	\
+		"\t.section __ex_table,\"aw\"\n"        \
+		"\t.dword\t1b,3b\n"			\
+		"\t.previous"                          	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));
 
 #define __get_user_asm(ldx,ptr)                         \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
 		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.dword\t1b\n"                       \
-		 "\t.dword\t(2b-1b)+3\n"                \
-		 "\t.previous"                          \
+		"\t.section .fixup,\"ax\"\n"		\
+		"3:\tldi -14, %1\n"			\
+		"\tcopy %%r0, %0\n"			\
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				\
+		"\t.section __ex_table,\"aw\"\n"	\
+		"\t.dword\t1b,3b\n"			\
+		"\t.previous"				\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));
 #else
 #define __get_kernel_asm(ldx,ptr)                       \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
 		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.word\t1b\n"                        \
-		 "\t.word\t(2b-1b)+3\n"                 \
-		 "\t.previous"                          \
+		"\t.section .fixup,\"ax\"\n"		\
+		"3:\tldi -14, %1\n"			\
+		"\tcopy %%r0, %0\n"			\
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				\
+		"\t.section __ex_table,\"aw\"\n"        \
+		"\t.word\t1b,3b\n"			\
+		"\t.previous"                          	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));
 
 #define __get_user_asm(ldx,ptr)                         \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
 		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.word\t1b\n"                        \
-		 "\t.word\t(2b-1b)+3\n"                 \
+		"\t.section .fixup,\"ax\"\n"		\
+		"3:\tldi -14, %1\n"			\
+		"\tcopy %%r0, %0\n"			\
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				\
+		"\t.section __ex_table,\"aw\"\n"	\
+		 "\t.word\t1b,3b\n"			\
 		 "\t.previous"                          \
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err));
@@ -168,15 +194,19 @@ struct exception_table_entry {
  * gcc knows about, so there are no aliasing issues.
  */
 
+/* -14 is -EFAULT below */
 #ifdef __LP64__
 #define __put_kernel_asm(stx,x,ptr)                         \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%1)\n"                 \
 		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.dword\t1b\n"                           \
-		 "\t.dword\t(2b-1b)+1\n"                    \
-		 "\t.previous"                              \
+		"\t.section .fixup,\"ax\"\n"		    \
+		"3:\tldi -14, %0\n"			    \
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				    \
+		"\t.section __ex_table,\"aw\"\n"            \
+		"\t.dword\t1b,3b\n"			    \
+		"\t.previous"                               \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
 
@@ -184,9 +214,12 @@ struct exception_table_entry {
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
 		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.dword\t1b\n"                           \
-		 "\t.dword\t(2b-1b)+1\n"                    \
+		"\t.section .fixup,\"ax\"\n"		    \
+		"3:\tldi -14, %0\n"			    \
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				    \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.dword\t1b,3b\n"			    \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
@@ -195,9 +228,12 @@ struct exception_table_entry {
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%1)\n"                 \
 		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.word\t1b\n"                            \
-		 "\t.word\t(2b-1b)+1\n"                     \
+		"\t.section .fixup,\"ax\"\n"		    \
+		"3:\tldi -14, %0\n"			    \
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				    \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.word\t1b,3b\n"			    \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
@@ -206,9 +242,12 @@ struct exception_table_entry {
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
 		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.word\t1b\n"                            \
-		 "\t.word\t(2b-1b)+1\n"                     \
+		"\t.section .fixup,\"ax\"\n"		    \
+		"3:\tldi -14, %0\n"			    \
+		FIXUP_BRANCH(2b)			\
+		"\t.previous"				    \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.word\t1b,3b\n"                         \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
@@ -221,11 +260,14 @@ static inline void __put_kernel_asm64(u6
 		"\n1:\tstw %1,0(%0)\n"
 		"\n2:\tstw %2,4(%0)\n"
 		"3:\n"
+		"\t.section .fixup,\"ax\"\n"
+/*		"4:\tldi -14, %0\n" */
+		"4:"
+		FIXUP_BRANCH(3b)
+		"\t.previous"
 		"\t.section __ex_table,\"aw\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
+		 "\t.word\t1b,4b\n"
+		 "\t.word\t2b,4b\n"
 		 "\t.previous"
 		: : "r"(ptr), "r"(hi), "r"(lo));
 
@@ -239,11 +281,14 @@ static inline void __put_user_asm64(u64 
 		"\n1:\tstw %1,0(%%sr3,%0)\n"
 		"\n2:\tstw %2,4(%%sr3,%0)\n"
 		"3:\n"
+		"\t.section .fixup,\"ax\"\n"
+/*		"4:\tldi -14, %0\n" */
+		"4:"
+		FIXUP_BRANCH(3b)
+		"\t.previous"
 		"\t.section __ex_table,\"aw\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
+		 "\t.word\t1b,4b\n"
+		 "\t.word\t2b,4b\n"
 		 "\t.previous"
 		: : "r"(ptr), "r"(hi), "r"(lo));
 
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
