From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Mon, 13 Sep 2004 19:37:06 -0700
Message-ID: <20040914023706.GX28659@tausq.org>
References: <20040911165325.GO28659@tausq.org>
	<20040913233742.GW28659@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040913233742.GW28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Version 2a of the patch. Changes from the previous version:

- Fixed the comment in uaccess.h, added some more comments to fixup.S
- Added missing r1 clobbers
- addil/ldd should be relative to r27, not r1

i found out this is a somewhat effective way of testing this patch:

- run "make vmlinux" (or make -j4 vmlinux) in one window
- run "while true; do ./wtest; sleep 30; done" in another window

wtest is compiled from:
-------------------8< cut here 8<--------------------
#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char **argv)
{
        char *buf = (char *)1;
        int ret;

        ret = write(fileno(stdout), buf, 10);
        printf("write returned ret = %d, errno = %d\n", ret, errno);

        return 0;
}

-------------------8< cut here 8<--------------------

patch:

Index: arch/parisc/kernel/asm-offsets.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/asm-offsets.c,v
retrieving revision 1.9
diff -u -p -r1.9 asm-offsets.c
--- arch/parisc/kernel/asm-offsets.c	8 May 2004 14:12:45 -0000	1.9
+++ arch/parisc/kernel/asm-offsets.c	14 Sep 2004 02:34:06 -0000
@@ -38,6 +38,7 @@
 #include <asm/processor.h>
 #include <asm/hardirq.h>
 #include <asm/pdc.h>
+#include <asm/uaccess.h>
 
 #define DEFINE(sym, val) \
 	asm volatile("\n->" #sym " %0 " #val : : "i" (val))
@@ -291,5 +292,8 @@ int main(void)
 	DEFINE(ASM_PT_INITIAL, PT_INITIAL);
 	DEFINE(ASM_PAGE_SIZE, PAGE_SIZE);
 	BLANK();
+	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
+	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
+	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
 	return 0;
 }
Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.14
diff -u -p -r1.14 syscall.S
--- arch/parisc/kernel/syscall.S	10 Sep 2004 14:52:01 -0000	1.14
+++ arch/parisc/kernel/syscall.S	14 Sep 2004 02:34:06 -0000
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
+++ arch/parisc/kernel/unaligned.c	14 Sep 2004 02:34:06 -0000
@@ -23,6 +23,7 @@
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <asm/uaccess.h>
 
 /* #define DEBUG_UNALIGNED 1 */
 
@@ -34,8 +35,14 @@
 
 #ifdef __LP64__
 #define RFMT "%016lx"
+#define FIXUP_BRANCH(lbl) \
+	"\tb " #lbl "\n"
 #else
 #define RFMT "%08lx"
+#define FIXUP_BRANCH(lbl) \
+	"\tldil L%%" #lbl ", %%r1\n"			\
+	"\tldo R%%" #lbl "(%%r1), %%r1\n"		\
+	"\tbv,n %%r0(%%r1)\n"
 #endif
 
 /* 1111 1100 0000 0000 0001 0011 1100 0000 */
@@ -134,15 +141,19 @@ static int emulate_ldh(struct pt_regs *r
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
@@ -175,15 +186,19 @@ static int emulate_ldw(struct pt_regs *r
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
@@ -222,15 +237,19 @@ static int emulate_ldd(struct pt_regs *r
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
@@ -250,17 +269,20 @@ static int emulate_ldd(struct pt_regs *r
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
@@ -296,15 +318,19 @@ static int emulate_sth(struct pt_regs *r
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
@@ -346,15 +372,19 @@ static int emulate_stw(struct pt_regs *r
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
@@ -399,19 +429,23 @@ static int emulate_std(struct pt_regs *r
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
@@ -438,21 +472,25 @@ static int emulate_std(struct pt_regs *r
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
Index: arch/parisc/lib/Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/lib/Makefile,v
retrieving revision 1.2
diff -u -p -r1.2 Makefile
--- arch/parisc/lib/Makefile	1 Jul 2004 18:30:36 -0000	1.2
+++ arch/parisc/lib/Makefile	14 Sep 2004 02:34:06 -0000
@@ -2,6 +2,6 @@
 # Makefile for parisc-specific library files
 #
 
-lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o
+lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o fixup.o
 
 lib-$(CONFIG_SMP) += debuglocks.o
Index: arch/parisc/lib/fixup.S
===================================================================
RCS file: arch/parisc/lib/fixup.S
diff -N arch/parisc/lib/fixup.S
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ arch/parisc/lib/fixup.S	14 Sep 2004 02:34:06 -0000
@@ -0,0 +1,89 @@
+/*
+ * Linux/PA-RISC Project (http://www.parisc-linux.org/)
+ *
+ *  Copyright (C) 2004  Randolph Chung <tausq@debian.org>
+ *
+ *    This program is free software; you can redistribute it and/or modify
+ *    it under the terms of the GNU General Public License as published by
+ *    the Free Software Foundation; either version 2, or (at your option)
+ *    any later version.
+ *
+ *    This program is distributed in the hope that it will be useful,
+ *    but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *    GNU General Public License for more details.
+ *
+ *    You should have received a copy of the GNU General Public License
+ *    along with this program; if not, write to the Free Software
+ *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ * 
+ * Fixup routines for kernel exception handling.
+ */
+#include <linux/config.h>
+#include <asm/offsets.h>
+#include <asm/assembly.h>
+#include <asm/errno.h>
+
+#ifdef CONFIG_SMP
+	.macro  get_fault_ip t1 t2
+	addil LT%__per_cpu_offset,%r27
+	LDREG RT%__per_cpu_offset(%r1),\t1
+	/* t2 = smp_processor_id() */
+	mfctl 30,\t2
+	ldw TI_CPU(\t2),\t2
+#ifdef __LP64__
+	extrd,u \t2,63,32,\t2
+#endif
+	/* t2 = &__per_cpu_offset[smp_processor_id()]; */
+	LDREG,s \t2(\t1),\t2 
+	addil LT%per_cpu__exception_data,%r27
+	LDREG RT%per_cpu__exception_data(%r1),\t1
+	/* t1 = &__get_cpu_var(exception_data) */
+	add,l \t1,\t2,\t1
+	/* t1 = t1->fault_ip */
+	LDREG EXCDATA_IP(\t1), \t1
+	.endm
+#else
+	.macro  get_fault_ip t1 t2
+	/* t1 = &__get_cpu_var(exception_data) */
+	addil LT%per_cpu__exception_data,%r27
+	LDREG RT%per_cpu__exception_data(%r1),\t2
+	/* t1 = t2->fault_ip */
+	LDREG EXCDATA_IP(\t2), \t1
+	.endm
+#endif
+
+	.text
+	.section .fixup, "ax"
+
+	/* get_user() fixups, store -EFAULT in r8, and 0 in r9 */
+	.export fixup_get_user_skip_1
+fixup_get_user_skip_1:
+	get_fault_ip %r1,%r8
+	ldo 4(%r1), %r1
+	ldi -EFAULT, %r8
+	bv %r0(%r1)
+	copy %r0, %r9
+
+	.export fixup_get_user_skip_2
+fixup_get_user_skip_2:
+	get_fault_ip %r1,%r8
+	ldo 8(%r1), %r1
+	ldi -EFAULT, %r8
+	bv %r0(%r1)
+	copy %r0, %r9
+
+	/* put_user() fixups, store -EFAULT in r8 */
+	.export fixup_put_user_skip_1
+fixup_put_user_skip_1:
+	get_fault_ip %r1,%r8
+	ldo 4(%r1), %r1
+	bv %r0(%r1)
+	ldi -EFAULT, %r8
+
+	.export fixup_put_user_skip_2
+fixup_put_user_skip_2:
+	get_fault_ip %r1,%r8
+	ldo 8(%r1), %r1
+	bv %r0(%r1)
+	ldi -EFAULT, %r8
Index: arch/parisc/lib/lusercopy.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/lib/lusercopy.S,v
retrieving revision 1.3
diff -u -p -r1.3 lusercopy.S
--- arch/parisc/lib/lusercopy.S	17 Jan 2004 06:39:24 -0000	1.3
+++ arch/parisc/lib/lusercopy.S	14 Sep 2004 02:34:06 -0000
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
+++ arch/parisc/mm/fault.c	14 Sep 2004 02:34:06 -0000
@@ -36,6 +36,9 @@
 
 #define BITSSET		0x1c0	/* for identifying LDCW */
 
+
+DEFINE_PER_CPU(struct exception_data, exception_data);
+
 /*
  * parisc_acctyp(unsigned int inst) --
  *    Given a PA-RISC memory access instruction, determine if the
@@ -234,13 +237,16 @@ no_context:
 		fix = search_exception_tables(regs->iaoq[0]);
 
 		if (fix) {
+			struct exception_data *d;
+
+printk("applying fixup for 0x%lx, fixup at 0x%lx\n", regs->iaoq[0], fix->fixup & ~3);
 
-			if (fix->skip & 1) 
-				regs->gr[8] = -EFAULT;
-			if (fix->skip & 2)
-				regs->gr[9] = 0;
+			d = &__get_cpu_var(exception_data);
+			d->fault_ip = regs->iaoq[0];
+			d->fault_space = regs->isr;
+			d->fault_addr = regs->ior;
 
-			regs->iaoq[0] += ((fix->skip) & ~3);
+			regs->iaoq[0] = ((fix->fixup) & ~3);
 
 			/*
 			 * NOTE: In some cases the faulting instruction
Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.13
diff -u -p -r1.13 uaccess.h
--- include/asm-parisc/uaccess.h	4 Feb 2004 18:24:55 -0000	1.13
+++ include/asm-parisc/uaccess.h	14 Sep 2004 02:34:28 -0000
@@ -54,16 +54,22 @@ extern int __put_user_bad(void);
 /*
  * The exception table contains two values: the first is an address
  * for an instruction that is allowed to fault, and the second is
- * the number of bytes to skip if a fault occurs. We also support in
- * two bit flags: 0x2 tells the exception handler to clear register
- * r9 and 0x1 tells the exception handler to put -EFAULT in r8.
- * This allows us to handle the simple cases for put_user and
- * get_user without having to have .fixup sections.
+ * the address to the fixup routine. 
  */
 
 struct exception_table_entry {
 	unsigned long insn;  /* address of insn that is allowed to fault.   */
-	long skip;           /* pcoq skip | r9 clear flag | r8 -EFAULT flag */
+	long fixup;          /* fixup routine */
+};
+
+/*
+ * The page fault handler stores, in a per-cpu area, the following information
+ * if a fixup routine is available.
+ */
+struct exception_data {
+	unsigned long fault_ip;
+	unsigned long fault_space;
+	unsigned long fault_addr;
 };
 
 #define __get_user(x,ptr)                               \
@@ -97,48 +103,44 @@ struct exception_table_entry {
 #ifdef __LP64__
 #define __get_kernel_asm(ldx,ptr)                       \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
-		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.dword\t1b\n"                       \
-		 "\t.dword\t(2b-1b)+3\n"                \
-		 "\t.previous"                          \
+		"\t.section __ex_table,\"aw\"\n"        \
+		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
+		"\t.previous"                          	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err)		\
+		: "r1");
 
 #define __get_user_asm(ldx,ptr)                         \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
-		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.dword\t1b\n"                       \
-		 "\t.dword\t(2b-1b)+3\n"                \
-		 "\t.previous"                          \
+		"\t.section __ex_table,\"aw\"\n"	\
+		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
+		"\t.previous"				\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err)		\
+		: "r1");
 #else
 #define __get_kernel_asm(ldx,ptr)                       \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
-		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.word\t1b\n"                        \
-		 "\t.word\t(2b-1b)+3\n"                 \
-		 "\t.previous"                          \
+		"\t.section __ex_table,\"aw\"\n"        \
+		"\t.word\t1b,fixup_get_user_skip_1\n"	\
+		"\t.previous"                          	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err)		\
+		: "r1");
 
 #define __get_user_asm(ldx,ptr)                         \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
-		"2:\n"					\
-		"\t.section __ex_table,\"aw\"\n"         \
-		 "\t.word\t1b\n"                        \
-		 "\t.word\t(2b-1b)+3\n"                 \
+		"\t.section __ex_table,\"aw\"\n"	\
+		 "\t.word\t1b,fixup_get_user_skip_1\n"	\
 		 "\t.previous"                          \
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err)		\
+		: "r1");
 #endif /* !__LP64__ */
 
 #define __put_user(x,ptr)                                       \
 ({								\
-	register long __pu_err __asm__ ("r8") = 0;		\
+	register long __pu_err __asm__ ("r8") = 0;      	\
 								\
 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
 	    switch (sizeof(*(ptr))) {                           \
@@ -172,82 +174,73 @@ struct exception_table_entry {
 #define __put_kernel_asm(stx,x,ptr)                         \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%1)\n"                 \
-		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.dword\t1b\n"                           \
-		 "\t.dword\t(2b-1b)+1\n"                    \
-		 "\t.previous"                              \
+		"\t.section __ex_table,\"aw\"\n"            \
+		"\t.dword\t1b,fixup_put_user_skip_1\n"	    \
+		"\t.previous"                               \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
 
 #define __put_user_asm(stx,x,ptr)                           \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
-		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.dword\t1b\n"                           \
-		 "\t.dword\t(2b-1b)+1\n"                    \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.dword\t1b,fixup_put_user_skip_1\n"	    \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err))
+		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
+		: "r1")
 #else
 #define __put_kernel_asm(stx,x,ptr)                         \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%1)\n"                 \
-		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.word\t1b\n"                            \
-		 "\t.word\t(2b-1b)+1\n"                     \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.word\t1b,fixup_put_user_skip_1\n"	    \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err))
+		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
+		: "r1")
 
 #define __put_user_asm(stx,x,ptr)                           \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
-		"2:\n"					    \
-		"\t.section __ex_table,\"aw\"\n"             \
-		 "\t.word\t1b\n"                            \
-		 "\t.word\t(2b-1b)+1\n"                     \
+		"\t.section __ex_table,\"aw\"\n"            \
+		 "\t.word\t1b,fixup_put_user_skip_1\n"      \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err))
+		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
+		: "r1")
 
-static inline void __put_kernel_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%0)\n"
-		"\n2:\tstw %2,4(%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"aw\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
-
-}
-
-static inline void __put_user_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%%sr3,%0)\n"
-		"\n2:\tstw %2,4(%%sr3,%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"aw\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
-
-}
+#define __put_kernel_asm64(_x,ptr) do {		    	    \
+	u64 x = (u64)_x;				    \
+	u32 hi = x>>32;					    \
+	u32 lo = x&0xffffffff;				    \
+	__asm__ __volatile__ (				    \
+		"\n1:\tstw %2,0(%1)\n"			    \
+		"\n2:\tstw %3,4(%1)\n"			    \
+		"\t.section __ex_table,\"aw\"\n"	    \
+		 "\t.word\t1b,fixup_put_user_skip_2\n"	    \
+		 "\t.word\t2b,fixup_put_user_skip_1\n"	    \
+		 "\t.previous"				    \
+		: "=r"(__pu_err)                            \
+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err) \
+		: "r1");				    \
+} while (0)
+
+#define __put_user_asm64(_x,ptr) do {		    	    \
+	u64 x = (u64)_x;				    \
+	u32 hi = x>>32;					    \
+	u32 lo = x&0xffffffff;				    \
+	__asm__ __volatile__ (				    \
+		"\n1:\tstw %2,0(%%sr3,%1)\n"		    \
+		"\n2:\tstw %3,4(%%sr3,%1)\n"		    \
+		"\t.section __ex_table,\"aw\"\n"	    \
+		 "\t.word\t1b,fixup_get_user_skip_2\n"	    \
+		 "\t.word\t2b,fixup_get_user_skip_1\n"	    \
+		 "\t.previous"				    \
+		: "=r"(__pu_err)                            \
+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err) \
+		: "r1");				    \
+} while (0)
 
 #endif /* !__LP64__ */
 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
