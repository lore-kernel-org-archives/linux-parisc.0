From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc-3_3-branch] bootstrap failure on hppa-linux
Date: Sat, 28 Dec 2002 18:45:23 -0500
Message-ID: <20021228234523.GA4443__43171.4338054464$1416622058$gmane$org@hiauly1.hia.nrc.ca>
References: <15884.48522.342368.76461@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: gcc@gcc.gnu.org, parisc-linux@lists.parisc-linux.org,
	gcc-patches@gcc.gnu.org, John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <15884.48522.342368.76461@gargle.gargle.HOWL>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> $ gcc-3.2    -g -DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long -fno-common  -DHAVE_CONFIG_H -o cc1 c-parse.o c-lang.o c-pretty-print.o attribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o c-opts.o c-format.o c-semantics.o c-objc-common.o c-dump.o libcpp.a  main.o libbackend.a   ../libiberty/libiberty.a
> /usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot reach 000002c9_$$dyncall+0, recompile with -ffunction-sections
> /usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot handle R_PARISC_PCREL17F for $$dyncall

I confirmed the above problem and installed the enclosed patch on the 3.2
branch to correct it.  pa_output_function_prologue is changed so that the
total number of code bytes in the translation unit is accumulated on
hppa-linux except when doing function sections.  This is a backport of
a portion of a patch previously installed on the main.

Tested on hppa-unknown-linux-gnu.  I also checked that the main will bootstrap
using gcc-3.2.

Dave

2002-12-28  John David Anglin  <dave.anglin@nrc.ca>

	* pa.h (TARGET_SOM): Define if not defined.
	* som.h (OBJ_SOM): Rename to TARGET_SOM.
	* pa.c (pa_output_function_prologue): Don't accumulate the total code
	bytes in the translation unit when using gas, som and not the portable
	runtime, or when using function sections.

Index: config/pa/pa.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa.h,v
retrieving revision 1.138.2.7.2.1
diff -u -3 -p -r1.138.2.7.2.1 pa.h
--- config/pa/pa.h	12 Dec 2002 22:37:08 -0000	1.138.2.7.2.1
+++ config/pa/pa.h	27 Dec 2002 22:48:57 -0000
@@ -159,6 +159,11 @@ extern int target_flags;
 #define TARGET_ELF32 0
 #endif
 
+/* Generate code for SOM ABI.  */
+#ifndef TARGET_SOM
+#define TARGET_SOM 0
+#endif
+
 /* Macro to define tables used to set the flags.
    This is a list in braces of pairs in braces,
    each pair being { "NAME", VALUE }
Index: config/pa/som.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/som.h,v
retrieving revision 1.31.2.1
diff -u -3 -p -r1.31.2.1 som.h
--- config/pa/som.h	6 Mar 2002 05:20:29 -0000	1.31.2.1
+++ config/pa/som.h	27 Dec 2002 22:48:57 -0000
@@ -19,7 +19,8 @@ the Free Software Foundation, 59 Temple 
 Boston, MA 02111-1307, USA.  */
 
 /* So we can conditionalize small amounts of code in pa.c or pa.md.  */
-#define OBJ_SOM
+#undef TARGET_SOM
+#define TARGET_SOM 1
 
 /* We do not use BINCL stabs in SOM.
    ??? If it does not hurt, we probably should to avoid useless divergence
Index: config/pa/pa.c
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa.c,v
retrieving revision 1.148.2.7
diff -u -3 -p -r1.148.2.7 pa.c
--- config/pa/pa.c	11 Jul 2002 18:22:02 -0000	1.148.2.7
+++ config/pa/pa.c	27 Dec 2002 22:48:57 -0000
@@ -3078,9 +3078,11 @@ pa_output_function_prologue (file, size)
 
   fputs ("\n\t.ENTRY\n", file);
 
-  /* If we're using GAS and not using the portable runtime model, then
-     we don't need to accumulate the total number of code bytes.  */
-  if (TARGET_GAS && ! TARGET_PORTABLE_RUNTIME)
+  /* If we're using GAS, SOM and not the portable runtime model, or if
+     we're using function sections, then we don't need to accumulate the
+     total number of code bytes in the translation unit.  */
+  if ((TARGET_GAS && TARGET_SOM && !TARGET_PORTABLE_RUNTIME)
+      || flag_function_sections)
     total_code_bytes = 0;
   else if (INSN_ADDRESSES_SET_P ())
     {
