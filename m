Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Sun, 07 Feb 1999 22:36:54 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36BE5BD6.BB9F62B4@ottawa.com>
MIME-version: 1.0
Content-type: MULTIPART/MIXED; BOUNDARY="Boundary_(ID_iKuLW8+X/q9BiAGUh3Kc5Q)"
Subject: [hppa-linux] Preliminary patch for egcs-1.1.1
Resent-Message-ID: <"oxwC1.0.5O.GMdls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_iKuLW8+X/q9BiAGUh3Kc5Q)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit

Here is a first patch for egcs-1.1.1 to support hppa1.1-hp-linux. 
I've gotten it to cross-compile into the libgcc2.a but the GNU assembler
fails because it doesn't recognize the ";" character as a comment.

						- Paul

--Boundary_(ID_iKuLW8+X/q9BiAGUh3Kc5Q)
Content-type: text/plain; name=egcs-1.1.1-patch1; charset=us-ascii
Content-disposition: inline; filename=egcs-1.1.1-patch1
Content-transfer-encoding: 7bit

diff -P -u -r egcs-orig/gcc/config/pa/linux.h egcs-1.1.1/gcc/config/pa/linux.h
--- egcs-orig/gcc/config/pa/linux.h	Wed Dec 31 19:00:00 1969
+++ egcs-1.1.1/gcc/config/pa/linux.h	Sun Feb  7 19:07:06 1999
@@ -0,0 +1,75 @@
+/* Definitions for PA_RISC with ELF format
+   Copyright (C) 1994, 1995 Free Software Foundation, Inc.
+
+This file is part of GNU CC.
+
+GNU CC is free software; you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation; either version 2, or (at your option)
+any later version.
+
+GNU CC is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License
+along with GNU CC; see the file COPYING.  If not, write to
+the Free Software Foundation, 59 Temple Place - Suite 330,
+Boston, MA 02111-1307, USA.  */
+
+#define TARGET_DEFAULT 0x89	/* TARGET_SNAKE + TARGET_GAS + TARGET_JUMP_IN_DELAY */
+#define LINUX_DEFAULT_ELF
+
+#include <pa/pa.h>	/* Base target machine definitions */
+
+#undef SIZE_TYPE
+#define SIZE_TYPE "unsigned int"
+
+#undef PTRDIFF_TYPE
+#define PTRDIFF_TYPE "int"
+
+#undef CPP_PREDEFINES
+#define CPP_PREDEFINES "-D__ELF__ -Dunix -Dhppa -Dlinux -Asystem(unix) -Asystem(posix) -Acpu(hppa) -Amachine(hppa) -Amachine(bigendian)"
+
+#undef CPP_SPEC
+#define CPP_SPEC "%{fPIC:-D__PIC__ -D__pic__} %{fpic:-D__PIC__ -D__pic__} %{mhppa:-D__hppa__} %{posix:-D_POSIX_SOURCE} -D__hp9000s700 -D_PA_RISC1_1"
+
+#undef	LIB_SPEC
+#define LIB_SPEC "%{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p} -lmilli"
+
+/* Handle #pragma weak and #pragma pack.  */
+
+#define HANDLE_SYSV_PRAGMA
+
+/* should be auto defined in defaults.h */
+#define SUPPORTS_WEAK	1
+
+/* This is how we tell the assembler that a symbol is weak.  */
+
+#define ASM_WEAKEN_LABEL(FILE,NAME) \
+  do { fputs ("\t.weak\t", FILE); assemble_name (FILE, NAME); \
+       fputc ('\n', FILE); } while (0)
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
+
diff -P -u -r egcs-orig/gcc/config/pa/xm-linux.h egcs-1.1.1/gcc/config/pa/xm-linux.h
--- egcs-orig/gcc/config/pa/xm-linux.h	Wed Dec 31 19:00:00 1969
+++ egcs-1.1.1/gcc/config/pa/xm-linux.h	Sun Feb  7 19:07:04 1999
@@ -0,0 +1,47 @@
+/* Configuration for GNU C-compiler for PA-RISC.
+   Copyright (C) 1988, 1995 Free Software Foundation, Inc.
+
+This file is part of GNU CC.
+
+GNU CC is free software; you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation; either version 2, or (at your option)
+any later version.
+
+GNU CC is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License
+along with GNU CC; see the file COPYING.  If not, write to
+the Free Software Foundation, 59 Temple Place - Suite 330,
+Boston, MA 02111-1307, USA.  */
+
+
+extern int errno;
+
+/* #defines that need visibility everywhere.  */
+#define FALSE 0
+#define TRUE 1
+
+/* This describes the machine the compiler is hosted on.  */
+#define HOST_BITS_PER_CHAR 8
+#define HOST_BITS_PER_SHORT 16
+#define HOST_BITS_PER_INT 32
+#define HOST_BITS_PER_LONG 32
+#define HOST_BITS_PER_LONGLONG 64
+
+/* Doubles are stored in memory with the high order word first.  This
+   matters when cross-compiling.  */
+#define HOST_WORDS_BIG_ENDIAN 1
+
+/* target machine dependencies.
+   tm.h is a symbolic link to the actual target specific file.   */
+#include "tm.h"
+
+/* Arguments to use with `exit'.  */
+#define SUCCESS_EXIT_CODE 0
+#define FATAL_EXIT_CODE 33
+
+#include <xm-linux.h>
diff -P -u -r egcs-orig/gcc/configure egcs-1.1.1/gcc/configure
--- egcs-orig/gcc/configure	Wed Dec  2 14:22:52 1998
+++ egcs-1.1.1/gcc/configure	Sun Feb  7 18:59:15 1999
@@ -2649,6 +2649,18 @@
 		use_collect2=yes
 		fixincludes=Makefile.in
 		;;
+	hppa*-*-linux*)
+		cpu_type=pa
+		xm_file=pa/xm-linux.h
+		xmake_file=x-linux
+		tm_file=pa/linux.h
+		fixindlues=Makefile.in #On Linux, the headers are ok already.
+		broken_install=yes
+		gnu_ld=yes
+		# Don't use it. Linux uses a slightly different one.
+		# The real one comes with the Linux C library.
+		#extra_parts="crtbegin.o crtend.o"
+		;;
 	i370-*-mvs*)
 		;;
 	i[34567]86-ibm-aix*)		# IBM PS/2 running AIX

--Boundary_(ID_iKuLW8+X/q9BiAGUh3Kc5Q)--

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
