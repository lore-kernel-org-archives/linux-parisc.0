Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07189482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Apr 2002 09:50:57 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g3DFonFN006095
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Apr 2002 11:50:50 -0400 (EDT)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id g3DFon53006093
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Apr 2002 11:50:49 -0400 (EDT)
Message-Id: <200204131550.g3DFon53006093@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 13 Apr 2002 11:50:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Patch to debina glibc-2.2.5 for gcc-3.2 build
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

This fixes a couple of problems:

1) Multi line string literals are gone gcc 3.2.
2) configure needs to link in libgcc_eh in check for __register_frame_info.

Maybe this should go to debian list but it is mostly PA specific.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2002-04-13  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* configure.in (libc_cv_gcc_dwarf2_unwind_info): Add "-lgcc_eh" to
	libraries to link with.
	* configure: Rebuilt
	* sysdeps/hppa/elf/initfini.c: Don't use multi line string literal.
	* linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c: Likewise.

--- ./configure.in.orig	Thu Dec 20 07:50:32 2001
+++ ./configure.in	Wed Mar 27 12:49:36 2002
@@ -1341,11 +1341,12 @@
 free () {}
 abort () {}
 __bzero () {}
+dl_iterate_phdr () {}
 EOF
 dnl No \ in command here because it ends up inside ''.
 if AC_TRY_COMMAND([${CC-cc} $CFLAGS -DCHECK__register_frame_info
 			    -nostdlib -nostartfiles
-			    -o conftest conftest.c -lgcc >&AC_FD_CC]); then
+			    -o conftest conftest.c -lgcc_eh -lgcc >&AC_FD_CC]); then
   libc_cv_gcc_dwarf2_unwind_info=static
 else
   libc_cv_gcc_dwarf2_unwind_info=no
@@ -1353,7 +1354,7 @@
 if test $libc_cv_gcc_dwarf2_unwind_info = no; then
   if AC_TRY_COMMAND([${CC-cc} $CFLAGS -DCHECK__register_frame
 			      -nostdlib -nostartfiles
-			      -o conftest conftest.c -lgcc >&AC_FD_CC]); then
+			      -o conftest conftest.c -lgcc_eh -lgcc >&AC_FD_CC]); then
     libc_cv_gcc_dwarf2_unwind_info=yes
   else
     libc_cv_gcc_dwarf2_unwind_info=no
--- ./sysdeps/hppa/elf/initfini.c.orig	Mon Jul  9 17:56:22 2001
+++ ./sysdeps/hppa/elf/initfini.c	Fri Apr 12 18:49:26 2002
@@ -39,84 +39,84 @@
    making the comparison and indirect call is quite expensive (see the
    comment in sysdeps/generic/initfini.c). */
 
-__asm__ ("
-
-#include \"defs.h\"
-
-/*@HEADER_ENDS*/
-
-/*@_init_PROLOG_BEGINS*/
-	.section .init
-	.align 4
-	.globl _init
-	.type _init,@function
-_init:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	bl	__gmon_start__,%rp
-	copy	%r19,%r4	/* delay slot */
-	copy	%r4,%r19
-/*@_init_PROLOG_ENDS*/
-
-/*@_init_EPILOG_BEGINS*/
-        .text
-        .align 4
-        .weak   __gmon_start__
-        .type    __gmon_start__,@function
-__gmon_start__:
-	.proc
-	.callinfo
-	.entry
-        bv,n %r0(%r2)
-	.exit
-	.procend
-
-/* Here is the tail end of _init.  We put __gmon_start before this so
-   that the assembler creates the .PARISC.unwind section for us, ie.
-   with the right attributes.  */
-	.section .init
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_init:
-	ldwm	-64(%sp),%r4
-
-/* Our very own unwind info, because the assembler can't handle
-   functions split into two or more pieces.  */
-	.section .PARISC.unwind
-	.extern _init
-	.word	_init, _end_init
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_init_EPILOG_ENDS*/
-
-/*@_fini_PROLOG_BEGINS*/
-	.section .fini
-	.align 4
-	.globl _fini
-	.type _fini,@function
-_fini:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	copy	%r19,%r4
-/*@_fini_PROLOG_ENDS*/
-
-/*@_fini_EPILOG_BEGINS*/
-	.section .fini
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_fini:
-	ldwm	-64(%sp),%r4
-
-	.section .PARISC.unwind
-	.extern _fini
-	.word	_fini, _end_fini
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_fini_EPILOG_ENDS*/
-
-/*@TRAILER_BEGINS*/
+__asm__ ("\n\
+\n\
+#include \"defs.h\"\n\
+\n\
+/*@HEADER_ENDS*/\n\
+\n\
+/*@_init_PROLOG_BEGINS*/\n\
+	.section .init\n\
+	.align 4\n\
+	.globl _init\n\
+	.type _init,@function\n\
+_init:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	bl	__gmon_start__,%rp\n\
+	copy	%r19,%r4	/* delay slot */\n\
+	copy	%r4,%r19\n\
+/*@_init_PROLOG_ENDS*/\n\
+\n\
+/*@_init_EPILOG_BEGINS*/\n\
+        .text\n\
+        .align 4\n\
+        .weak   __gmon_start__\n\
+        .type    __gmon_start__,@function\n\
+__gmon_start__:\n\
+	.proc\n\
+	.callinfo\n\
+	.entry\n\
+        bv,n %r0(%r2)\n\
+	.exit\n\
+	.procend\n\
+\n\
+/* Here is the tail end of _init.  We put __gmon_start before this so\n\
+   that the assembler creates the .PARISC.unwind section for us, ie.\n\
+   with the right attributes.  */\n\
+	.section .init\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_init:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+/* Our very own unwind info, because the assembler can't handle\n\
+   functions split into two or more pieces.  */\n\
+	.section .PARISC.unwind\n\
+	.extern _init\n\
+	.word	_init, _end_init\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_init_EPILOG_ENDS*/\n\
+\n\
+/*@_fini_PROLOG_BEGINS*/\n\
+	.section .fini\n\
+	.align 4\n\
+	.globl _fini\n\
+	.type _fini,@function\n\
+_fini:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	copy	%r19,%r4\n\
+/*@_fini_PROLOG_ENDS*/\n\
+\n\
+/*@_fini_EPILOG_BEGINS*/\n\
+	.section .fini\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_fini:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+	.section .PARISC.unwind\n\
+	.extern _fini\n\
+	.word	_fini, _end_fini\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_fini_EPILOG_ENDS*/\n\
+\n\
+/*@TRAILER_BEGINS*/\n\
 ");
--- ./linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c.orig	Thu Jun  7 00:28:55 2001
+++ ./linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c	Fri Apr 12 22:25:59 2002
@@ -41,70 +41,70 @@
    and epilogues.  Therefore we write these in assembly to make sure
    they do the right thing.  */
 
-__asm__ ("
-
-#include \"defs.h\"
-
-/*@HEADER_ENDS*/
-
-/*@_init_PROLOG_BEGINS*/
-	.section .init
-	.align 4
-	.globl _init
-	.type _init,@function
-_init:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	bl	__pthread_initialize_minimal,%rp
-	copy	%r19,%r4	/* delay slot */
-	copy	%r4,%r19
-/*@_init_PROLOG_ENDS*/
-
-/*@_init_EPILOG_BEGINS*/
-/* Here is the tail end of _init.  */
-	.section .init
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_init:
-	ldwm	-64(%sp),%r4
-
-/* Our very own unwind info, because the assembler can't handle
-   functions split into two or more pieces.  */
-	.section .PARISC.unwind,\"a\",@progbits
-	.extern _init
-	.word	_init, _end_init
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_init_EPILOG_ENDS*/
-
-/*@_fini_PROLOG_BEGINS*/
-	.section .fini
-	.align 4
-	.globl _fini
-	.type _fini,@function
-_fini:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	copy	%r19,%r4
-/*@_fini_PROLOG_ENDS*/
-
-/*@_fini_EPILOG_BEGINS*/
-	.section .fini
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_fini:
-	ldwm	-64(%sp),%r4
-
-	.section .PARISC.unwind,\"a\",@progbits
-	.extern _fini
-	.word	_fini, _end_fini
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_fini_EPILOG_ENDS*/
-
-/*@TRAILER_BEGINS*/
+__asm__ ("\n\
+\n\
+#include \"defs.h\"\n\
+\n\
+/*@HEADER_ENDS*/\n\
+\n\
+/*@_init_PROLOG_BEGINS*/\n\
+	.section .init\n\
+	.align 4\n\
+	.globl _init\n\
+	.type _init,@function\n\
+_init:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	bl	__pthread_initialize_minimal,%rp\n\
+	copy	%r19,%r4	/* delay slot */\n\
+	copy	%r4,%r19\n\
+/*@_init_PROLOG_ENDS*/\n\
+\n\
+/*@_init_EPILOG_BEGINS*/\n\
+/* Here is the tail end of _init.  */\n\
+	.section .init\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_init:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+/* Our very own unwind info, because the assembler can't handle\n\
+   functions split into two or more pieces.  */\n\
+	.section .PARISC.unwind,\"a\",@progbits\n\
+	.extern _init\n\
+	.word	_init, _end_init\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_init_EPILOG_ENDS*/\n\
+\n\
+/*@_fini_PROLOG_BEGINS*/\n\
+	.section .fini\n\
+	.align 4\n\
+	.globl _fini\n\
+	.type _fini,@function\n\
+_fini:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	copy	%r19,%r4\n\
+/*@_fini_PROLOG_ENDS*/\n\
+\n\
+/*@_fini_EPILOG_BEGINS*/\n\
+	.section .fini\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_fini:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+	.section .PARISC.unwind,\"a\",@progbits\n\
+	.extern _fini\n\
+	.word	_fini, _end_fini\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_fini_EPILOG_ENDS*/\n\
+\n\
+/*@TRAILER_BEGINS*/\n\
 ");
