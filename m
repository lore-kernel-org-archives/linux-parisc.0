Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA09181
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jul 2000 17:45:09 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 7 Jul 2000 23:46:34 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13AhoS-0002SB-00
	for <parisc-linux@thepuffingroup.com>; Fri, 07 Jul 2000 19:45:40 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 07 Jul 2000 19:45:39 -0400
Message-ID: <87r995mrmk.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GCC 2.96 merge (Linux/ELF, 32-bit for the time being)
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've merged the relevant bits from the puffin.external.hp.com CVS tree
with the current GCC 2.96 from sourceware.cygnus.com.

I've tested this by building the kernel with it (it prints a number of
warnings but is otherwise okay), building glibc with it, building ash
with that glibc, and running that ash binary.

Here is the diff against a checkout of current sourceware CVS.  I
don't expect this to be merged with mainline GCC as it is still pretty
messy, but I wanted to put the patch out for discussion.  (That's
partly why there is no ChangeLog entry with it, as a lot of this stuff
may change again in the near future when I add Linux/ELF64 support).

There are also two small generic updates in this patch, which
constitute the entirety of the changes to gcc/config/pa/pa.[ch].  The
first one (in pa.c) is from prumpf, it corrects a condition code
specifier, and the second one (in pa.h) is from me, to silence a
warning when processing the pa.md file.  These are at the top of the
patch.

I've had to do a lot of "conflict resolution" between the HP/SOM style
of assembly language dictated by the other PA-RISC configuration files
and headers in GCC and the semi-GNU/ELF style accepted by our current
binutils and dictated by the generic Linux configuration files and
headers.

The issues in particular are:

1) How global labels are declared.

2) Whether labels use colons.

3) The format of local labels.

I believe the comments in the patch below explain these issues so I
won't rehash them here.

This also is a statement of my intention to branch off the current
puffin.external.hp.com tree.  The branch tag for the old stuff is
'gcc-2_9-hppa-20000707'.  I'll add a new vendor tag for the vanilla
sourceware tree and put the modified version at the head either
tonight or tomorrow morning.

diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/pa.c gcc-puffin/gcc/config/pa/pa.c
--- gcc-sourceware/gcc/config/pa/pa.c	Fri Jul  7 19:13:26 2000
+++ gcc-puffin/gcc/config/pa/pa.c	Thu Jul  6 17:12:36 2000
@@ -3944,7 +3944,7 @@
       switch (GET_CODE (x))
 	{
 	case EQ:
-	  fputs ("!=", file);  break;
+	  fputs ("<>", file);  break; /* this was "!=" which is bogus.  prumpf */
 	case NE:
 	  fputs ("=", file);  break;
 	case GT:
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/pa.h gcc-puffin/gcc/config/pa/pa.h
--- gcc-sourceware/gcc/config/pa/pa.h	Fri Jul  7 19:14:41 2000
+++ gcc-puffin/gcc/config/pa/pa.h	Fri Jul  7 12:08:47 2000
@@ -2044,4 +2044,5 @@
   {"basereg_operand", {REG}},						\
   {"div_operand", {REG, CONST_INT}},					\
   {"ireg_operand", {REG}},						\
-  {"movb_comparison_operator", {EQ, NE, LT, GE}},
+  {"movb_comparison_operator", {EQ, NE, LT, GE}},			\
+  {"cmpib_comparison_operator", {EQ, NE, GT, GE, GTU, LT, LE, LEU}},
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/pa-linux.h gcc-puffin/gcc/config/pa/pa-linux.h
--- gcc-sourceware/gcc/config/pa/pa-linux.h	Fri Jul  7 19:12:24 2000
+++ gcc-puffin/gcc/config/pa/pa-linux.h	Fri Jul  7 18:30:44 2000
@@ -18,9 +18,28 @@
 the Free Software Foundation, 59 Temple Place - Suite 330,
 Boston, MA 02111-1307, USA.  */
 
-/* FIXME - this doesn't seem to be used anywhere */
+/* FIXME: This doesn't seem to be used anywhere. */
 #define LINUX_DEFAULT_ELF
 
+/* FIXME: elfos.h doesn't #undef this.  We may want to remove the
+   other stuff from the tm_file definition in configure.in and just
+   include them manually here like i386 does. */
+#undef SELECT_SECTION
+
+#include <linux.h>
+
+/* sibcalls, stubs, and elf sections don't play well */
+#undef FUNCTION_OK_FOR_SIBCALL
+#define FUNCTION_OK_FOR_SIBCALL(x) 0
+
+#define TEXT_SECTION_ASM_OP "\t.text"
+#define DATA_SECTION_ASM_OP "\t.data"
+#define BSS_SECTION_ASM_OP "\t.section\t.bss"
+
+#undef SKIP_ASM_OP
+#define SKIP_ASM_OP ".blockz"
+
+/* FIXME: obviously this is just not going to work for hppa64-linux. */
 #undef SIZE_TYPE
 #define SIZE_TYPE "unsigned int"
 
@@ -30,13 +49,41 @@
 #undef CPP_PREDEFINES
 #define CPP_PREDEFINES "-D__ELF__ -Dunix -D__hppa__ -Dlinux -Asystem(unix) -Asystem(posix) -Acpu(hppa) -Amachine(hppa) -Amachine(bigendian)"
 
+/* On the other hand, neither is this. */
 #undef CPP_SPEC
-#define CPP_SPEC "%{posix:-D_POSIX_SOURCE}\
- %{msnake:-D_PA_RISC1_1}\
- %{mpa-risc-1-1:-D_PA_RISC1_1}"
+#define CPP_SPEC "%{fPIC:-D__PIC__ -D__pic__} %{fpic:-D__PIC__ -D__pic__} %{mhppa:-D__hppa__} %{posix:-D_POSIX_SOURCE} -D__hp9000s700 -D_PA_RISC1_1"
 
 #undef	LIB_SPEC
-#define LIB_SPEC "%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p} -lmilli"
+#define LIB_SPEC "%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p}"
+
+#undef ASM_SPEC
+#define ASM_SPEC \
+  "%{v:-V} %{n} %{T} %{Ym,*} %{Yd,*} %{Wa,*:%*}"
+
+/* Define the strings used for the special svr4 .type and .size directives.
+   These strings generally do not vary from one system running svr4 to
+   another, but if a given system (e.g. m88k running svr) needs to use
+   different pseudo-op names for these, they may be overridden in the
+   file which includes this one.  */
+
+#define TYPE_ASM_OP	".type"
+#define SIZE_ASM_OP	".size"
+#define SET_ASM_OP	".set"
+
+#undef STRING_ASM_OP
+#define STRING_ASM_OP   ".stringz"
+
+/* Output a definition */
+#define ASM_OUTPUT_DEF(FILE,LABEL1,LABEL2)				\
+do									\
+{									\
+    fprintf ((FILE), "\t%s\t", SET_ASM_OP);				\
+    assemble_name (FILE, LABEL1);					\
+    fprintf (FILE, ",");						\
+    assemble_name (FILE, LABEL2);					\
+    fprintf (FILE, "\n");						\
+    }									\
+while (0)
 
 /* How to renumber registers for dbx and gdb.
 
@@ -53,3 +100,65 @@
 #define DBX_REGISTER_NUMBER(REGNO) \
   ((REGNO) <= 31 ? (REGNO) :						\
    ((REGNO) > 31 && (REGNO) <= 87 ? (REGNO) + 40 : 32))
+
+/* Redefine these to generate the Linux/ELF/SysV style of internal
+   labels all the time - i.e. to be compatible with
+   ASM_GENERATE_INTERNAL_LABEL in <elfos.h>.  Compare these with the
+   ones in pa.h and note the lack of dollar signs in these.  FIXME:
+   shouldn't we fix pa.h to use ASM_GENERATE_INTERNAL_LABEL instead? */
+
+#undef ASM_OUTPUT_ADDR_VEC_ELT
+#define ASM_OUTPUT_ADDR_VEC_ELT(FILE, VALUE)  \
+  if (TARGET_BIG_SWITCH)                                        \
+    fprintf (FILE, "\tstw %%r1,-16(%%r30)\n\tldil LR'.L%d,%%r1\n\tbe RR'.L%d(%%sr4,%%r1)\n\tldw -16(%%r30),%%r1\n", VALUE, VALUE);               \
+  else                                                          \
+    fprintf (FILE, "\tb .L%d\n\tnop\n", VALUE)
+
+
+#undef ASM_OUTPUT_ADDR_DIFF_ELT
+#define ASM_OUTPUT_ADDR_DIFF_ELT(FILE, BODY, VALUE, REL)  \
+  if (TARGET_BIG_SWITCH)                                        \
+    fprintf (FILE, "\tstw %%r1,-16(%%r30)\n\tldw T'.L%d(%%r19),%%r1\n\tbv %%r0(%%r1)\n\tldw -16(%%r30),%%r1\n", VALUE);                            \
+  else                                                          \
+    fprintf (FILE, "\tb .L%d\n\tnop\n", VALUE)
+
+/* FIXME: The Linux/parisc gas does not enjoy labels without colons.
+   We haven't really decided on all the details of our assembly
+   dialect, and the ELF and Linux configuration we 'mix in' here does
+   generate colons, so for the time being we'll just go with the flow.
+   - dhd@linuxcare.com, 2000-07-06 */
+
+/* This is how to output the definition of a user-level label named NAME,
+   such as the label on a static function or variable NAME.  */
+
+#undef ASM_OUTPUT_LABEL
+#define ASM_OUTPUT_LABEL(FILE, NAME)	\
+  do { assemble_name (FILE, NAME); 	\
+       fputs (":\n", FILE); } while (0)
+
+/* NOTE: ASM_OUTPUT_INTERNAL_LABEL() is defined for us by elfos.h, and
+   does what we want (i.e. uses colons).  It must be compatible with
+   ASM_GENERATE_INTERNAL_LABEL(), so do not define it here. */
+
+/* FIXME: Yes, our dialect of assembly language gets more specific by
+   the minute.  <pa/pa.h> makes ASM_GLOBALIZE_LABEL a no-op for
+   functions, because the SOM code globalizes functions as part of
+   ASM_DECLARE_FUNCTION_NAME.  However, this breaks anything that uses
+   symbol references, glibc for instance.  Because .globl works just
+   fine in our assembler, we will use the default
+   ASM_DECLARE_FUNCTION_NAME from <elfos.h>, which uses
+   ASM_GLOBALIZE_NAME, which needs to be defined here.
+
+   This is another 'mix-in' problem, of course.
+
+   Previously in the puffin tree we had hacked <pa/pa.h> to use .globl
+   and to globalize all labels.  This may be the Right Thing to do,
+   but I don't know if it will break the SOM stuff (which arguably
+   should be overriding it anyway).  Expect the way this is handled to
+   change in the future.  For now I just want glibc to work again.
+
+   - dhd@linuxcare.com, 2000-07-07 */
+
+#undef ASM_GLOBALIZE_LABEL
+#define ASM_GLOBALIZE_LABEL(FILE, NAME)					\
+	(fputs (".globl ", FILE), assemble_name (FILE, NAME), fputs ("\n", FILE))
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/t-linux gcc-puffin/gcc/config/pa/t-linux
--- gcc-sourceware/gcc/config/pa/t-linux	Fri Jul  7 19:14:50 2000
+++ gcc-puffin/gcc/config/pa/t-linux	Thu Jul  6 17:08:59 2000
@@ -1 +1,12 @@
+CROSS_LIBGCC1 = libgcc1-asm.a
+LIB1ASMSRC = pa/lib1linux.asm
+LIB1ASMFUNCS = _divI _divU _remI _remU _multiply
+
 ADA_CFLAGS=-mdisable-indexing
+LIB2FUNCS_EXTRA=lib2funcs-elf.S
+
+lib2funcs-elf.S: $(srcdir)/config/pa/lib2funcs-elf.S
+	rm -f lib2funcs-elf.S
+	cp $(srcdir)/config/pa/lib2funcs-elf.S .
+
+TARGET_LIBGCC2_CFLAGS = 
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/configure.in gcc-puffin/gcc/configure.in
--- gcc-sourceware/gcc/configure.in	Fri Jul  7 19:12:24 2000
+++ gcc-puffin/gcc/configure.in	Fri Jul  7 18:30:34 2000
@@ -992,12 +992,13 @@
 	h8300-*-*)
 		float_format=i32
 		;;
-	hppa*-*-linux*)
+	hppa1.1-*-linux*)
 		target_cpu_default="(MASK_PA_11 | MASK_GAS | MASK_JUMP_IN_DELAY)"
-		tm_file="${tm_file} pa/elf.h linux.h pa/pa-linux.h"
-		tmake_file="t-linux pa/t-linux"
-		extra_parts="crtbegin.o crtend.o"
-		xmake_file=none
+		tm_file="${tm_file} pa/pa32-regs.h pa/pa-linux.h"
+		xm_file=pa/xm-linux.h
+		tmake_file=pa/t-linux
+		xmake_file=x-linux
+		extra_parts="crtbegin.o crtbeginS.o crtend.o crtendS.o"
 		gas=yes gnu_ld=yes
  		if test x$enable_threads = xyes; then
  			thread_file='posix'
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/lib1linux.asm gcc-puffin/gcc/config/pa/lib1linux.asm
--- gcc-sourceware/gcc/config/pa/lib1linux.asm	Wed Dec 31 19:00:00 1969
+++ gcc-puffin/gcc/config/pa/lib1linux.asm	Thu Jul  6 17:07:01 2000
@@ -0,0 +1,1117 @@
+/*  Low level integer divide, multiply, remainder, etc routines for the HPPA.
+ *  Copyright (C) 1995 Free Software Foundation, Inc.
+
+ *  This file is part of GNU CC.
+
+ *  GNU CC is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2, or (at your option)
+ *  any later version.
+
+ * In addition to the permissions in the GNU General Public License, the
+ * Free Software Foundation gives you unlimited permission to link the
+ * compiled version of this file with other programs, and to distribute
+ * those programs without any restriction coming from the use of this
+ * file.  (The General Public License restrictions do apply in other
+ * respects; for example, they cover modification of the file, and
+ * distribution when not linked into another program.)
+
+ *  GNU CC is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+
+ *  You should have received a copy of the GNU General Public License
+ *  along with GNU CC; see the file COPYING.  If not, write to
+ *  the Free Software Foundation, 59 Temple Place - Suite 330,
+ *  Boston, MA 02111-1307, USA.
+ */
+
+#ifdef L_dyncall
+	.text
+	.export	$$dyncall
+$$dyncall:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	bb,>=,n	%r22,30,L$1		;! branch if not plabel address
+	depi	0,31,2,%r22		;! clear the two least significant bits
+	ldw	4(%sr0,%r22),%r19	;! load new LTP value
+	ldw	0(%sr0,%r22),%r22	;! load address of target
+L$1	ldsid	(%sr0,%r22),%r1		;! get the "space ident" selected by r22
+	mtsp	%r1,%sr0		;! move that space identifier into sr0
+	be	0(%sr0,%r22)		;! branch to the real target
+	stw	%r2,-24(%sr0,%r30)	;! save return address into frame marker
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_multiply
+#define	op0	%r26
+#define	op1	%r25
+#define res	%r29
+#define ret	%r31
+#define tmp	%r1
+	.text
+	.align 4
+	.export	$$mulU
+	.export	$$mulI
+$$mulU:
+$$mulI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	addi,tr		0,%r0,res	;! clear out res, skip next insn
+L$loop:	zdep		op1,26,27,op1	;! shift up op1 by 5
+L$lo:	zdep		op0,30,5,tmp	;! extract next 5 bits and shift up
+	blr		tmp,%r0
+	extru		op0,26,27,op0	;! shift down op0 by 5
+L$0:	comib,<>	0,op0,L$lo
+	zdep		op1,26,27,op1	;! shift up op1 by 5
+	bv		%r0(ret)
+	nop
+L$1:	b		L$loop
+	addl		op1,res,res
+	nop
+	nop
+L$2:	b		L$loop
+	sh1addl		op1,res,res
+	nop
+	nop
+L$3:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$4:	b		L$loop
+	sh2addl		op1,res,res
+	nop
+	nop
+L$5:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$6:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$7:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	addl		tmp,res,res
+L$8:	b		L$loop
+	sh3addl		op1,res,res
+	nop
+	nop
+L$9:	sh3addl		op1,op1,tmp	;! 9x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$10:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$11:	sh2addl		op1,op1,tmp	;! 5x
+	sh1addl		tmp,op1,tmp	;! 11x
+	b		L$loop
+	addl		tmp,res,res
+L$12:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh2addl		tmp,res,res
+	nop
+L$13:	sh1addl		op1,op1,tmp	;! 3x
+	sh2addl		tmp,op1,tmp	;! 13x
+	b		L$loop
+	addl		tmp,res,res
+L$14:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	sh1addl		tmp,res,res
+L$15:	zdep		op1,27,28,tmp	;! 16x
+	sub		tmp,op1,tmp	;! 15x
+	b		L$loop
+	addl		tmp,res,res
+L$16:	zdep		op1,27,28,tmp	;! 16x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$17:	zdep		op1,27,28,tmp	;! 16x
+	addl		tmp,op1,tmp	;! 17x
+	b		L$loop
+	addl		tmp,res,res
+L$18:	sh3addl		op1,op1,tmp	;! 9x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$19:	sh3addl		op1,op1,tmp	;! 9x
+	sh1addl		tmp,op1,tmp	;! 19x
+	b		L$loop
+	addl		tmp,res,res
+L$20:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	sh2addl		tmp,res,res
+	nop
+L$21:	sh2addl		op1,op1,tmp	;! 5x
+	sh2addl		tmp,op1,tmp	;! 21x
+	b		L$loop
+	addl		tmp,res,res
+L$22:	sh2addl		op1,op1,tmp	;! 5x
+	sh1addl		tmp,op1,tmp	;! 11x
+	b		L$loop
+	sh1addl		tmp,res,res
+L$23:	sh1addl		op1,op1,tmp	;! 3x
+	sh3addl		tmp,res,res	;! += 8x3
+	b		L$loop
+	sub		res,op1,res	;! -= x
+L$24:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh3addl		tmp,res,res	;! += 8x3
+	nop
+L$25:	sh2addl		op1,op1,tmp	;! 5x
+	sh2addl		tmp,tmp,tmp	;! 25x
+	b		L$loop
+	addl		tmp,res,res
+L$26:	sh1addl		op1,op1,tmp	;! 3x
+	sh2addl		tmp,op1,tmp	;! 13x
+	b		L$loop
+	sh1addl		tmp,res,res	;! += 2x13
+L$27:	sh1addl		op1,op1,tmp	;! 3x
+	sh3addl		tmp,tmp,tmp	;! 27x
+	b		L$loop
+	addl		tmp,res,res
+L$28:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	sh2addl		tmp,res,res	;! += 4x7
+L$29:	sh1addl		op1,op1,tmp	;! 3x
+	sub		res,tmp,res	;! -= 3x
+	b		L$foo
+	zdep		op1,26,27,tmp	;! 32x
+L$30:	zdep		op1,27,28,tmp	;! 16x
+	sub		tmp,op1,tmp	;! 15x
+	b		L$loop
+	sh1addl		tmp,res,res	;! += 2x15
+L$31:	zdep		op1,26,27,tmp	;! 32x
+	sub		tmp,op1,tmp	;! 31x
+L$foo:	b		L$loop
+	addl		tmp,res,res
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divU
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define quotient %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU
+$$divU:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	comb,<		divisor,0,L$largedivisor
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,quotient
+	ds		%r1,divisor,%r1
+	bv		%r0(ret)
+	addc		quotient,quotient,quotient
+L$largedivisor:
+	comclr,<<	dividend,divisor,quotient
+	ldi		1,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_remU
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$remU
+$$remU:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	comb,<		divisor,0,L$largedivisor
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,quotient
+	ds		%r1,divisor,%r1
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	bv		%r0(ret)
+	copy		%r1,quotient
+L$largedivisor:
+	sub,>>=		dividend,divisor,quotient
+	copy		dividend,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divI
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divI
+$$divI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	xor		dividend,divisor,quotient	;! result sign
+	comclr,>=	divisor,%r0,%r0			;! get absolute values
+	sub		%r0,divisor,divisor
+	comclr,>=	dividend,%r0,%r0
+	sub		%r0,dividend,dividend
+
+	comb,<		divisor,0,L$largedivisor
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	comclr,>=	quotient,%r0,%r0	;! skip of no need to negate
+	sub		%r0,dividend,dividend
+	bv		%r0(ret)
+	copy		dividend,quotient
+L$largedivisor:
+	comclr,<<	dividend,divisor,quotient
+	ldi		1,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_remI
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$remI
+$$remI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	xor		dividend,%r0,quotient		;! result sign
+	comclr,>=	divisor,%r0,%r0			;! get absolute values
+	sub		%r0,divisor,divisor
+	comclr,>=	dividend,%r0,%r0
+	sub		%r0,dividend,dividend
+
+	comb,<		divisor,0,L$largedivisor
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	comclr,>=	quotient,%r0,%r0	;! skip of no need to negate
+	sub		%r0,%r1,%r1
+	bv		%r0(ret)
+	copy		%r1,quotient
+L$largedivisor:
+	sub,>>=		dividend,divisor,quotient
+	copy		dividend,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_3) && !defined (SMALL_LIB)
+#undef L_divU_3
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_3
+$$divU_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,30,31,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_5) && !defined (SMALL_LIB)
+#undef L_divU_5
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_5
+$$divU_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh1add	%r26,%r26,%r29		;! r29 = lo(11 x r)
+	shd	%r0,%r26,31,%r1		;!  r1 = hi(10 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(11 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh2add	%r29,%r26,%r0		;!  r0 = lo(1000 x r) + dividend
+	shd	%r1,%r29,30,%r29	;! r29 = hi(1000 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,29,30,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_6) && !defined (SMALL_LIB)
+#undef L_divU_6
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_6
+$$divU_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,29,30,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_9) && !defined (SMALL_LIB)
+#undef L_divU_9
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_9
+$$divU_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	zdep	%r26,28,29,%r29
+	sub	%r29,%r26,%r29
+	shd	0,%r26,29,%r1
+	subb	%r1,0,%r1		/* 111 */
+
+	zdep	%r29,25,26,%r25
+	add	%r25,%r29,%r25
+	shd	%r1,%r29,26,%r29
+	addc	%r29,%r1,%r29		/* 111000111 */
+
+	sh3add	%r25,%r26,%r1
+	shd	%r29,%r25,29,%r25
+	addc	%r25,0,%r25		/* 111000111001 */
+
+	zdep	%r1,16,17,%r29
+	sub	%r29,%r1,%r29
+	shd	%r25,%r1,17,%r1
+	subb	%r1,%r25,%r1		/* 111000111000111000111000111 */
+
+	sh3add	%r29,%r26,%r0
+	shd	%r1,%r29,29,%r29
+	addc	%r29,0,%r29		/* 111000111000111000111000111001 */
+	bv	%r0(ret)
+	extru	%r29,30,31,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_10) && !defined (SMALL_LIB)
+#undef L_divU_10
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_10
+$$divU_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh1add	%r26,%r26,%r29		;! r29 = lo(11 x r)
+	shd	%r0,%r26,31,%r1		;!  r1 = hi(10 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(11 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh2add	%r29,%r26,%r0		;!  r0 = lo(1000 x r) + dividend
+	shd	%r1,%r29,30,%r29	;! r29 = hi(1000 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,28,29,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_12) && !defined (SMALL_LIB)
+#undef L_divU_12
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_12
+$$divU_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,28,29,result
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divU_3
+	.text
+	.align	4
+	.export	$$divU_3
+$$divU_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		3,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_5
+	.text
+	.align	4
+	.export	$$divU_5
+$$divU_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		5,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_6
+	.text
+	.align	4
+	.export	$$divU_6
+$$divU_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		6,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_7
+	.text
+	.align	4
+	.export	$$divU_7
+$$divU_7:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		7,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_9
+	.text
+	.align	4
+	.export	$$divU_9
+$$divU_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		9,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_10
+	.text
+	.align	4
+	.export	$$divU_10
+$$divU_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		10,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_12
+	.text
+	.align	4
+	.export	$$divU_12
+$$divU_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		12,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_14
+	.text
+	.align	4
+	.export	$$divU_14
+$$divU_14:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		14,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_15
+	.text
+	.align	4
+	.export	$$divU_15
+$$divU_15:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		15,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divI_3
+	.text
+	.align	4
+	.export	$$divI_3
+$$divI_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		3,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_5
+	.text
+	.align	4
+	.export	$$divI_5
+$$divI_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		5,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_6
+	.text
+	.align	4
+	.export	$$divI_6
+$$divI_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		6,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_7
+	.text
+	.align	4
+	.export	$$divI_7
+$$divI_7:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		7,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_9
+	.text
+	.align	4
+	.export	$$divI_9
+$$divI_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		9,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_10
+	.text
+	.align	4
+	.export	$$divI_10
+$$divI_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		10,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_12
+	.text
+	.align	4
+	.export	$$divI_12
+$$divI_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		12,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_14
+	.text
+	.align	4
+	.export	$$divI_14
+$$divI_14:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		14,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_15
+	.text
+	.align	4
+	.export	$$divI_15
+$$divI_15:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		15,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
diff --exclude=CVS --exclude=configure -urN gcc-sourceware/gcc/config/pa/lib2funcs-elf.S gcc-puffin/gcc/config/pa/lib2funcs-elf.S
--- gcc-sourceware/gcc/config/pa/lib2funcs-elf.S	Wed Dec 31 19:00:00 1969
+++ gcc-puffin/gcc/config/pa/lib2funcs-elf.S	Thu Jul  6 18:05:26 2000
@@ -0,0 +1,1221 @@
+;!  Subroutines for calling unbound dynamic functions from within GDB for HPPA.
+;!  Subroutines for out of line prologues and epilogues on for the HPPA
+;!  Copyright (C) 1994, 1995, 1996 Free Software Foundation, Inc.
+
+;!  This file is part of GNU CC.
+
+;!  GNU CC is free software; you can redistribute it and/or modify
+;!  it under the terms of the GNU General Public License as published by
+;!  the Free Software Foundation; either version 2, or (at your option)
+;!  any later version.
+
+;!  GNU CC is distributed in the hope that it will be useful,
+;!  but WITHOUT ANY WARRANTY; without even the implied warranty of
+;!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+;!  GNU General Public License for more details.
+
+;! In addition to the permissions in the GNU General Public License, the
+;! Free Software Foundation gives you unlimited permission to link the
+;! compiled version of this file with other programs, and to distribute
+;! those programs without any restriction coming from the use of this
+;! file.  (The General Public License restrictions do apply in other
+;! respects; for example, they cover modification of the file, and
+;! distribution when not linked into another program.)
+
+;!  You should have received a copy of the GNU General Public License
+;!  along with GNU CC; see the file COPYING.  If not, write to
+;!  the Free Software Foundation, 59 Temple Place - Suite 330,
+;!  Boston, MA 02111-1307, USA.
+
+;! gcc_compiled.:
+	.text
+
+;! Simply call with the address of the desired import stub in %r22 and
+;! arguments in the normal place (%r26-%r23 and stack slots).
+;!
+	.align 4
+	.EXPORT __gcc_plt_call,ENTRY,PRIV_LEV=3,RTNVAL=GR
+__gcc_plt_call:
+	.PROC
+	.CALLINFO
+	.ENTRY
+	;! Our return address comes in %r31, not %r2!
+	stw %r31,-8(%r30)
+
+	;! An inline version of dyncall so we do not have to worry
+	;! about long calls to millicode, PIC and other complexities.
+	bb,>=,n %r22,30,L$foo
+        depi 0,31,2,%r22
+        ldw 4(%r22),%r19
+        ldw 0(%r22),%r22
+L$foo:
+        ldsid (%r22),%r1
+        mtsp %r1,%sr0
+        ble 0(%sr0,%r22)
+	copy %r31,%r2
+	ldw -8(%r30),%r2
+
+	;! We are going to be returning to a stack address, so we
+	;! need to do an intra-space return.
+	ldsid (%rp),%r1
+	mtsp %r1,%sr0
+	be,n 0(%sr0,%rp)
+	.EXIT
+	.PROCEND
+;!  Low level integer divide, multiply, remainder, etc routines for the HPPA.
+;!  Copyright (C) 1995 Free Software Foundation, Inc.
+
+;!  This file is part of GNU CC.
+
+;!  GNU CC is free software; you can redistribute it and/or modify
+;!  it under the terms of the GNU General Public License as published by
+;!  the Free Software Foundation; either version 2, or (at your option)
+;!  any later version.
+
+;! In addition to the permissions in the GNU General Public License, the
+;! Free Software Foundation gives you unlimited permission to link the
+;! compiled version of this file with other programs, and to distribute
+;! those programs without any restriction coming from the use of this
+;! file.  (The General Public License restrictions do apply in other
+;! respects; for example, they cover modification of the file, and
+;! distribution when not linked into another program.)
+
+;!  GNU CC is distributed in the hope that it will be useful,
+;!  but WITHOUT ANY WARRANTY; without even the implied warranty of
+;!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+;!  GNU General Public License for more details.
+
+;!  You should have received a copy of the GNU General Public License
+;!  along with GNU CC; see the file COPYING.  If not, write to
+;!  the Free Software Foundation, 59 Temple Place - Suite 330,
+;!  Boston, MA 02111-1307, USA.
+
+/* I don't know why these routines are #ifdef-ed, but this'll probably work */
+/* -PB */
+/* I have little confidence in this millicode file -- it was missing */
+/* sh_func_adrs... */
+#define L_dyncall
+#undef L_multiply
+#undef L_divU
+#undef L_remU
+#undef L_divI
+#undef L_remI
+#define L_divU_3
+#define L_divU_5
+#define L_divU_6
+#define L_divU_7
+#define L_divU_9
+#define L_divU_10
+#define L_divU_12
+#define L_divU_14
+#define L_divU_15
+#define L_divI_3
+#define L_divI_5
+#define L_divI_6
+#define L_divI_7
+#define L_divI_9
+#define L_divI_10
+#define L_divI_12
+#define L_divI_14
+#define L_divI_15
+
+#ifdef L_dyncall
+	.text
+	.export	$$dyncall
+$$dyncall:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	bb,>=,n	%r22,30,L$1		;! branch if not plabel address
+	depi	0,31,2,%r22		;! clear the two least significant bits
+	ldw	4(%sr0,%r22),%r19	;! load new LTP value
+	ldw	0(%sr0,%r22),%r22	;! load address of target
+L$1:	ldsid	(%sr0,%r22),%r1		;! get the "space ident" selected by r22
+	mtsp	%r1,%sr0		;! move that space identifier into sr0
+	be	0(%sr0,%r22)		;! branch to the real target
+	stw	%r2,-24(%sr0,%r30)	;! save return address into frame marker
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_multiply
+#define	op0	%r26
+#define	op1	%r25
+#define res	%r29
+#define ret	%r31
+#define tmp	%r1
+	.text
+	.align 4
+	.export	$$mulU
+	.export	$$mulI
+$$mulU:
+$$mulI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	addi,tr		0,%r0,res	;! clear out res, skip next insn
+L$loop:	zdep		op1,26,27,op1	;! shift up op1 by 5
+L$lo:	zdep		op0,30,5,tmp	;! extract next 5 bits and shift up
+	blr		tmp,%r0
+	extru		op0,26,27,op0	;! shift down op0 by 5
+L$0:	comib,<>	0,op0,L$lo
+	zdep		op1,26,27,op1	;! shift up op1 by 5
+	bv		%r0(ret)
+	nop
+L$1_2:	b		L$loop
+	addl		op1,res,res
+	nop
+	nop
+L$2:	b		L$loop
+	sh1addl		op1,res,res
+	nop
+	nop
+L$3:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$4:	b		L$loop
+	sh2addl		op1,res,res
+	nop
+	nop
+L$5:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$6:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$7:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	addl		tmp,res,res
+L$8:	b		L$loop
+	sh3addl		op1,res,res
+	nop
+	nop
+L$9:	sh3addl		op1,op1,tmp	;! 9x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$10:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$11:	sh2addl		op1,op1,tmp	;! 5x
+	sh1addl		tmp,op1,tmp	;! 11x
+	b		L$loop
+	addl		tmp,res,res
+L$12:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh2addl		tmp,res,res
+	nop
+L$13:	sh1addl		op1,op1,tmp	;! 3x
+	sh2addl		tmp,op1,tmp	;! 13x
+	b		L$loop
+	addl		tmp,res,res
+L$14:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	sh1addl		tmp,res,res
+L$15:	zdep		op1,27,28,tmp	;! 16x
+	sub		tmp,op1,tmp	;! 15x
+	b		L$loop
+	addl		tmp,res,res
+L$16:	zdep		op1,27,28,tmp	;! 16x
+	b		L$loop
+	addl		tmp,res,res
+	nop
+L$17:	zdep		op1,27,28,tmp	;! 16x
+	addl		tmp,op1,tmp	;! 17x
+	b		L$loop
+	addl		tmp,res,res
+L$18:	sh3addl		op1,op1,tmp	;! 9x
+	b		L$loop
+	sh1addl		tmp,res,res
+	nop
+L$19:	sh3addl		op1,op1,tmp	;! 9x
+	sh1addl		tmp,op1,tmp	;! 19x
+	b		L$loop
+	addl		tmp,res,res
+L$20:	sh2addl		op1,op1,tmp	;! 5x
+	b		L$loop
+	sh2addl		tmp,res,res
+	nop
+L$21:	sh2addl		op1,op1,tmp	;! 5x
+	sh2addl		tmp,op1,tmp	;! 21x
+	b		L$loop
+	addl		tmp,res,res
+L$22:	sh2addl		op1,op1,tmp	;! 5x
+	sh1addl		tmp,op1,tmp	;! 11x
+	b		L$loop
+	sh1addl		tmp,res,res
+L$23:	sh1addl		op1,op1,tmp	;! 3x
+	sh3addl		tmp,res,res	;! += 8x3
+	b		L$loop
+	sub		res,op1,res	;! -= x
+L$24:	sh1addl		op1,op1,tmp	;! 3x
+	b		L$loop
+	sh3addl		tmp,res,res	;! += 8x3
+	nop
+L$25:	sh2addl		op1,op1,tmp	;! 5x
+	sh2addl		tmp,tmp,tmp	;! 25x
+	b		L$loop
+	addl		tmp,res,res
+L$26:	sh1addl		op1,op1,tmp	;! 3x
+	sh2addl		tmp,op1,tmp	;! 13x
+	b		L$loop
+	sh1addl		tmp,res,res	;! += 2x13
+L$27:	sh1addl		op1,op1,tmp	;! 3x
+	sh3addl		tmp,tmp,tmp	;! 27x
+	b		L$loop
+	addl		tmp,res,res
+L$28:	zdep		op1,28,29,tmp	;! 8x
+	sub		tmp,op1,tmp	;! 7x
+	b		L$loop
+	sh2addl		tmp,res,res	;! += 4x7
+L$29:	sh1addl		op1,op1,tmp	;! 3x
+	sub		res,tmp,res	;! -= 3x
+	b		L$foo2
+	zdep		op1,26,27,tmp	;! 32x
+L$30:	zdep		op1,27,28,tmp	;! 16x
+	sub		tmp,op1,tmp	;! 15x
+	b		L$loop
+	sh1addl		tmp,res,res	;! += 2x15
+L$31:	zdep		op1,26,27,tmp	;! 32x
+	sub		tmp,op1,tmp	;! 31x
+L$foo2:	b		L$loop
+	addl		tmp,res,res
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divU
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define quotient %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU
+$$divU:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	comb,<		divisor,0,L$largedivisor
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,quotient
+	ds		%r1,divisor,%r1
+	bv		%r0(ret)
+	addc		quotient,quotient,quotient
+L$largedivisor:
+	comclr,<<	dividend,divisor,quotient
+	ldi		1,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_remU
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$remU
+$$remU:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	comb,<		divisor,0,L$largedivisor2
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,quotient
+	ds		%r1,divisor,%r1
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	bv		%r0(ret)
+	copy		%r1,quotient
+L$largedivisor2:
+	sub,>>=		dividend,divisor,quotient
+	copy		dividend,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divI
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divI
+$$divI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	xor		dividend,divisor,quotient	;! result sign
+	comclr,>=	divisor,%r0,%r0			;! get absolute values
+	sub		%r0,divisor,divisor
+	comclr,>=	dividend,%r0,%r0
+	sub		%r0,dividend,dividend
+
+	comb,<		divisor,0,L$largedivisor3
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	comclr,>=	quotient,%r0,%r0	;! skip of no need to negate
+	sub		%r0,dividend,dividend
+	bv		%r0(ret)
+	copy		dividend,quotient
+L$largedivisor3:
+	comclr,<<	dividend,divisor,quotient
+	ldi		1,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_remI
+#define dividend %r26
+#define divisor %r25
+#define quotient %r29
+#define tmp %r1
+#define ret %r31
+	.text
+	.align 4
+	.export	$$remI
+$$remI:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	xor		dividend,%r0,quotient		;! result sign
+	comclr,>=	divisor,%r0,%r0			;! get absolute values
+	sub		%r0,divisor,divisor
+	comclr,>=	dividend,%r0,%r0
+	sub		%r0,dividend,dividend
+
+	comb,<		divisor,0,L$largedivisor4
+	 sub		%r0,divisor,%r1		;! clear cy as side-effect
+	ds		%r0,%r1,%r0
+	addc		dividend,dividend,dividend
+	ds		%r0,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	ds		%r1,divisor,%r1
+	addc		dividend,dividend,dividend
+	comclr,>=	%r1,%r0,%r0
+	addl		%r1,divisor,%r1
+	comclr,>=	quotient,%r0,%r0	;! skip of no need to negate
+	sub		%r0,%r1,%r1
+	bv		%r0(ret)
+	copy		%r1,quotient
+L$largedivisor4:
+	sub,>>=		dividend,divisor,quotient
+	copy		dividend,quotient
+	bv,n		%r0(ret)
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_3) && !defined (SMALL_LIB)
+#undef L_divU_3
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_3
+$$divU_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,30,31,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_5) && !defined (SMALL_LIB)
+#undef L_divU_5
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_5
+$$divU_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh1add	%r26,%r26,%r29		;! r29 = lo(11 x r)
+	shd	%r0,%r26,31,%r1		;!  r1 = hi(10 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(11 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh2add	%r29,%r26,%r0		;!  r0 = lo(1000 x r) + dividend
+	shd	%r1,%r29,30,%r29	;! r29 = hi(1000 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,29,30,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_6) && !defined (SMALL_LIB)
+#undef L_divU_6
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_6
+$$divU_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,29,30,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_9) && !defined (SMALL_LIB)
+#undef L_divU_9
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_9
+$$divU_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	zdep	%r26,28,29,%r29
+	sub	%r29,%r26,%r29
+	shd	0,%r26,29,%r1
+	subb	%r1,0,%r1		/* 111 */
+
+	zdep	%r29,25,26,%r25
+	add	%r25,%r29,%r25
+	shd	%r1,%r29,26,%r29
+	addc	%r29,%r1,%r29		/* 111000111 */
+
+	sh3add	%r25,%r26,%r1
+	shd	%r29,%r25,29,%r25
+	addc	%r25,0,%r25		/* 111000111001 */
+
+	zdep	%r1,16,17,%r29
+	sub	%r29,%r1,%r29
+	shd	%r25,%r1,17,%r1
+	subb	%r1,%r25,%r1		/* 111000111000111000111000111 */
+
+	sh3add	%r29,%r26,%r0
+	shd	%r1,%r29,29,%r29
+	addc	%r29,0,%r29		/* 111000111000111000111000111001 */
+	bv	%r0(ret)
+	extru	%r29,30,31,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_10) && !defined (SMALL_LIB)
+#undef L_divU_10
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_10
+$$divU_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh1add	%r26,%r26,%r29		;! r29 = lo(11 x r)
+	shd	%r0,%r26,31,%r1		;!  r1 = hi(10 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(11 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh2add	%r29,%r26,%r0		;!  r0 = lo(1000 x r) + dividend
+	shd	%r1,%r29,30,%r29	;! r29 = hi(1000 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,28,29,result
+	.exit
+	.procend
+#endif
+
+
+#if defined (L_divU_12) && !defined (SMALL_LIB)
+#undef L_divU_12
+#define dividend %r26
+#define divisor %r25
+#define tmp %r1
+#define result %r29
+#define ret %r31
+	.text
+	.align 4
+	.export	$$divU_12
+$$divU_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	sh2add	%r26,%r26,%r29		;! r29 = lo(101 x r)
+	shd	%r0,%r26,30,%r1		;!  r1 = hi(100 x r)
+	addc	%r1,%r0,%r1		;!  r1 = hi(101 x r)
+;! r in r1,,r29
+	zdep	%r29,27,28,%r25		;! r25 = lo(10000 x r)
+	add	%r25,%r29,%r25		;! r25 = lo(10001 x r)
+	shd	%r1,%r29,28,%r29	;! r29 = hi(10000 x r)
+	addc	%r29,%r1,%r29		;! r29 = hi(10001 x r)
+;! r in r29,,r25
+	zdep	%r25,23,24,%r1		;!  r1 = lo(100000000 x r)
+	add	%r1,%r25,%r1		;!  r1 = lo(100000001 x r)
+	shd	%r29,%r25,24,%r25	;! r25 = hi(100000000 x r)
+	addc	%r25,%r29,%r25		;! r25 = hi(100000001 x r)
+;! r in r25,,r1
+	zdep	%r1,15,16,%r29
+	add	%r29,%r1,%r29
+	shd	%r25,%r1,16,%r1
+	addc	%r1,%r25,%r1
+;! r in r1,,r29
+	sh1add	%r29,%r26,%r0		;!  r0 = lo(10 x r) + dividend
+	shd	%r1,%r29,31,%r29	;! r29 = hi(10 x r)
+	addc	%r29,%r0,%r29
+	bv	%r0(ret)
+	extru	%r29,28,29,result
+	.exit
+	.procend
+#endif
+
+
+#ifdef L_divU_3
+	.text
+	.align	4
+	.export	$$divU_3
+$$divU_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		3,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_5
+	.text
+	.align	4
+	.export	$$divU_5
+$$divU_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		5,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_6
+	.text
+	.align	4
+	.export	$$divU_6
+$$divU_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		6,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_7
+	.text
+	.align	4
+	.export	$$divU_7
+$$divU_7:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		7,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_9
+	.text
+	.align	4
+	.export	$$divU_9
+$$divU_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		9,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_10
+	.text
+	.align	4
+	.export	$$divU_10
+$$divU_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		10,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_12
+	.text
+	.align	4
+	.export	$$divU_12
+$$divU_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		12,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_14
+	.text
+	.align	4
+	.export	$$divU_14
+$$divU_14:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		14,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divU_15
+	.text
+	.align	4
+	.export	$$divU_15
+$$divU_15:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divU
+	ldi		15,%r25
+	.exit
+	.procend
+	.import		$$divU,MILLICODE
+#endif
+
+#ifdef L_divI_3
+	.text
+	.align	4
+	.export	$$divI_3
+$$divI_3:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		3,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_5
+	.text
+	.align	4
+	.export	$$divI_5
+$$divI_5:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		5,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_6
+	.text
+	.align	4
+	.export	$$divI_6
+$$divI_6:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		6,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_7
+	.text
+	.align	4
+	.export	$$divI_7
+$$divI_7:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		7,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_9
+	.text
+	.align	4
+	.export	$$divI_9
+$$divI_9:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		9,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_10
+	.text
+	.align	4
+	.export	$$divI_10
+$$divI_10:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		10,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_12
+	.text
+	.align	4
+	.export	$$divI_12
+$$divI_12:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		12,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_14
+	.text
+	.align	4
+	.export	$$divI_14
+$$divI_14:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		14,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+#ifdef L_divI_15
+	.text
+	.align	4
+	.export	$$divI_15
+$$divI_15:
+	.proc
+	.callinfo	frame=0,no_calls
+	.entry
+	b		$$divI
+	ldi		15,%r25
+	.exit
+	.procend
+	.import		$$divI,MILLICODE
+#endif
+
+$$sh_func_adrs:       
+        .proc
+        .callinfo NO_CALLS
+        .export $$sh_func_adrs,MILLICODE
+        ldo     0(%r26),%ret1
+        dep     %r0,30,1,%r26
+        probew  (%r26),%r31,%r22
+        extru,= %r22,31,1,%r22
+        ldws    0(%r26),%ret1
+        bv,n    %r0(%r31)
+        .procend
