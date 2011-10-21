From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: glibc-ports update for hppa.
Date: Fri, 21 Oct 2011 11:57:37 -0400
Message-ID: <CADZpyiy52SW5+c2ez0RPx8nt_wr3OYpfAHP74buakNimkc+1zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Team,

I've pushed out 9 commits for glibc-ports that help bring hppa closer
to building directly from upstream source.

These commits have been a part of the debian patch set for a long time
now and are very stable.

Thank you for your patience.

Cheers,
Carlos.

---------- Forwarded message ----------
=46rom:  <carlos@sourceware.org>
Date: Fri, Oct 21, 2011 at 11:53 AM
Subject: Community source repository for glibc add-on ports branch,
master, updated. glibc-2.14-35-g8cb8321
To: glibc-cvs@sourceware.org


This is an automated email from the git hooks/post-receive script. It w=
as
generated because a ref change was pushed to the repository containing
the project "Community source repository for glibc add-on ports".

The branch, master has been updated
=A0 =A0 =A0 via =A08cb8321faf2edcf36d5061e8fc4c8fec4b23fd39 (commit)
=A0 =A0 =A0 via =A0f84ed6825441096273a893b66a769e37ef68f2f3 (commit)
=A0 =A0 =A0 via =A025f991b858ffc104a5b6720ae229cee4e88c976f (commit)
=A0 =A0 =A0 via =A09dd87de7ff43261dc83c74cc561ae392a405663f (commit)
=A0 =A0 =A0 via =A0930046be6fedf95d9fce6548bf58ad5e33023d67 (commit)
=A0 =A0 =A0 via =A05ce24e77ed89f2a6c11175e3798050246dfd9c04 (commit)
=A0 =A0 =A0 via =A02ab0965cb022dfdbd397eb88f96447393b4118b7 (commit)
=A0 =A0 =A0 via =A0451398f8b87c2a7c6bed7d6650a6cfbca43f9189 (commit)
=A0 =A0 =A0 via =A0ab653f4dbe37d6244057f3f2ab33078357b6d708 (commit)
=A0 =A0 =A0from =A0db6a567d0ddd816b1134651ddb66b66dbea2f40d (commit)

Those revisions listed above that are new to this repository have
not appeared on any other notification email; so we list those
revisions in full, below.

- Log -----------------------------------------------------------------
http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D8cb8321faf2edcf36d5061e8fc4c8fec4b23fd39

commit 8cb8321faf2edcf36d5061e8fc4c8fec4b23fd39
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Fri Oct 21 10:08:04 2011 -0400

=A0 =A0Update cancellable assembly system call wrappers.

=A0 =A0This patch updates sysdep-cancel.h to include the
=A0 =A0new no-cancel wrapper and provides CFI directives
=A0 =A0for all of the assembly. The CFI directives should
=A0 =A0allow unwinding information to be generated.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@sytemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index b83f4f0..564ca0f 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,24 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h: Upda=
te copyright
+ =A0 =A0 =A0 year.
+ =A0 =A0 =A0 (PSEUDO): Define __*_nocancel version. Add CFI directives=
 to
__*_nocancel
+ =A0 =A0 =A0 and normal version.
+ =A0 =A0 =A0 (PUSHARGS_1): Add CFI directive.
+ =A0 =A0 =A0 (PUSHARGS_2): Likewise.
+ =A0 =A0 =A0 (PUSHARGS_3): Likewise.
+ =A0 =A0 =A0 (PUSHARGS_4): Likewise.
+ =A0 =A0 =A0 (PUSHARGS_5): Likewise.
+ =A0 =A0 =A0 (PUSHARGS_6): Likewise.
+ =A0 =A0 =A0 (POPARGS_1): Likewise.
+ =A0 =A0 =A0 (POPARGS_2): Likewise.
+ =A0 =A0 =A0 (POPARGS_3): Likewise.
+ =A0 =A0 =A0 (POPARGS_4): Likewise.
+ =A0 =A0 =A0 (POPARGS_5): Likewise.
+ =A0 =A0 =A0 (POPARGS_6): Likewise.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_cancel.c=
: Remove.
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/initspi=
n.h: Remove.
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthread=
types.h: Remove.
diff --git a/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h
b/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h
index 6cffa76..d704345 100644
--- a/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h
+++ b/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h
@@ -1,4 +1,4 @@
-/* Copyright (C) 2005 Free Software Foundation, Inc.
+/* Copyright (C) 2005, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.

=A0 =A0The GNU C Library is free software; you can redistribute it and/=
or
@@ -61,11 +61,53 @@

=A0# undef PSEUDO
=A0# define PSEUDO(name, syscall_name, args) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
+ =A0 =A0 =A0 ENTRY (__##syscall_name##_nocancel) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
+ =A0 =A0 =A0 DOARGS_##args =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 stwm TREG, 64(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_offset TREG, 0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_adjust_cfa_offset 64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 stw %sp, -4(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_offset 30, -4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 stw %r19, -32(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_offset 19, -32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Save r19 */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 SAVE_PIC(TREG) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Do syscall, delay loads # */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ble =A00x100(%sr2,%r0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ldi SYS_ify (syscall_name), %r20 /* delay */ =A0 =A0ASM_L=
INE_SEP =A0 =A0\
+ =A0 =A0 =A0 ldi NO_ERROR,%r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 cmpb,>>=3D,n %r1,%ret0,L(pre_nc_end) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Restore r19 from TREG */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 LOAD_PIC(TREG) /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 SYSCALL_ERROR_HANDLER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Use TREG for temp storage */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 copy %ret0, TREG /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* OPTIMIZE: Don't reload r19 */ =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* do a -1*syscall_ret0 */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 sub %r0, TREG, TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Store into errno location */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 stw TREG, 0(%sr0,%ret0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* return -1 as error */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ldi -1, %ret0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+L(pre_nc_end): =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* No need to LOAD_PIC */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Undo frame */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ldwm -64(%sp),TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_adjust_cfa_offset -64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /* Restore rp before exit */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ldw -20(%sp), %rp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_restore 2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 ret =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 END(__##syscall_name##_nocancel) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 /**********************************************/ASM_LINE_=
SEP =A0 =A0\
=A0 =A0 =A0 =A0ENTRY (name) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
=A0 =A0 =A0 =A0DOARGS_##args =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0stwm TREG, 64(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_adjust_cfa_offset 64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0stw %sp, -4(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_offset 30, -4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0stw %r19, -32(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_offset 19, -32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0/* Done setting up frame, continue... */ =A0 =A0 =A0 =A0=
ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0SINGLE_THREAD_P =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0cmpib,<>,n 0,%ret0,L(pseudo_cancel) =A0 =A0 =A0 =A0 =A0 =
=A0 ASM_LINE_SEP =A0 =A0\
@@ -128,26 +170,40 @@ L(pre_end):
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0/* No need to LOAD_PIC */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0/* Undo frame */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0ldwm -64(%sp),TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_adjust_cfa_offset -64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
=A0 =A0 =A0 =A0/* Restore rp before exit */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw -20(%sp), %rp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+ =A0 =A0 =A0 ldw -20(%sp), %rp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 .cfi_restore 2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP

=A0/* Save arguments into our frame */
=A0# define PUSHARGS_0 =A0 =A0/* nothing to do */
-# define PUSHARGS_1 =A0 =A0PUSHARGS_0 stw %r26, -36(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_2 =A0 =A0PUSHARGS_1 stw %r25, -40(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_3 =A0 =A0PUSHARGS_2 stw %r24, -44(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_4 =A0 =A0PUSHARGS_3 stw %r23, -48(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_5 =A0 =A0PUSHARGS_4 stw %r22, -52(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_6 =A0 =A0PUSHARGS_5 stw %r21, -56(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
+# define PUSHARGS_1 =A0 =A0PUSHARGS_0 stw %r26, -36(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 26, -36 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define PUSHARGS_2 =A0 =A0PUSHARGS_1 stw %r25, -40(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 25, -40 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define PUSHARGS_3 =A0 =A0PUSHARGS_2 stw %r24, -44(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 24, -44 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define PUSHARGS_4 =A0 =A0PUSHARGS_3 stw %r23, -48(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 23, -48 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define PUSHARGS_5 =A0 =A0PUSHARGS_4 stw %r22, -52(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 22, -52 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define PUSHARGS_6 =A0 =A0PUSHARGS_5 stw %r21, -56(%sr0,%sp)
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_offset 21, -56 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP

=A0/* Bring them back from the stack */
=A0# define POPARGS_0 =A0 =A0 /* nothing to do */
-# define POPARGS_1 =A0 =A0 POPARGS_0 ldw -36(%sr0,%sp), %r26 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_2 =A0 =A0 POPARGS_1 ldw -40(%sr0,%sp), %r25 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_3 =A0 =A0 POPARGS_2 ldw -44(%sr0,%sp), %r24 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_4 =A0 =A0 POPARGS_3 ldw -48(%sr0,%sp), %r23 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_5 =A0 =A0 POPARGS_4 ldw -52(%sr0,%sp), %r22 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_6 =A0 =A0 POPARGS_5 ldw -56(%sr0,%sp), %r21 =A0 =A0 =A0=
 ASM_LINE_SEP
+# define POPARGS_1 =A0 =A0 POPARGS_0 ldw -36(%sr0,%sp), %r26
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 26 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define POPARGS_2 =A0 =A0 POPARGS_1 ldw -40(%sr0,%sp), %r25
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 25 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define POPARGS_3 =A0 =A0 POPARGS_2 ldw -44(%sr0,%sp), %r24
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 24 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define POPARGS_4 =A0 =A0 POPARGS_3 ldw -48(%sr0,%sp), %r23
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 23 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define POPARGS_5 =A0 =A0 POPARGS_4 ldw -52(%sr0,%sp), %r22
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 22 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP
+# define POPARGS_6 =A0 =A0 POPARGS_5 ldw -56(%sr0,%sp), %r21
ASM_LINE_SEP =A0 =A0\
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfi_restore 21 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP

=A0# ifdef IS_IN_libpthread
=A0# =A0ifdef PIC

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3Df84ed6825441096273a893b66a769e37ef68f2f3

commit f84ed6825441096273a893b66a769e37ef68f2f3
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 15:09:24 2011 -0400

=A0 =A0Update ChangeLog.hppa.

=A0 =A0Add missing entries to ChangeLog.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 01e7d1a..b83f4f0 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -6,6 +6,9 @@
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-machi=
ne.h: Remove.
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-initfini.=
c: Remove.
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cance=
l.h: Remove.
+ =A0 =A0 =A0 * sysdeps/hppa/linuxthreads/pspinlock.c: Remove.
+ =A0 =A0 =A0 * sysdeps/hppa/linuxthreads/pt-machine.h: Remove.
+ =A0 =A0 =A0 * sysdeps/hppa/linuxthreads/tls.h: Remove.

=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>


http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D25f991b858ffc104a5b6720ae229cee4e88c976f

commit 25f991b858ffc104a5b6720ae229cee4e88c976f
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:49:52 2011 -0400

=A0 =A0Remove hppa linuxthreads support.

=A0 =A0We now require NPTL and TLS to build glibc therefore
=A0 =A0the hppa linuxthreads support is no longer needed.
=A0 =A0Debian has already transitioned to NPTL support and
=A0 =A0we will continue to work out NPTL issues.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 2038513..01e7d1a 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,14 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_cancel.c:=
 Remove.
+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/initspin=
=2Eh: Remove.
+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadt=
ypes.h: Remove.
+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-machin=
e.h: Remove.
+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-initfini.c=
: Remove.
+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel=
=2Eh: Remove.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/hppa/stackinfo.h: Update copyright year.
=A0 =A0 =A0 =A0Include elf.h and define DEFAULT_STACK_PERMS.

diff --git a/sysdeps/hppa/linuxthreads/pspinlock.c
b/sysdeps/hppa/linuxthreads/pspinlock.c
deleted file mode 100644
index e5a5545..0000000
--- a/sysdeps/hppa/linuxthreads/pspinlock.c
+++ /dev/null
@@ -1,82 +0,0 @@
-/* POSIX spinlock implementation. =A0hppa version.
- =A0 Copyright (C) 2000 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public Licens=
e as
- =A0 published by the Free Software Foundation; either version 2.1 of =
the
- =A0 License, or (at your option) any later version.
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; see the file COPYING.LIB. =A0=
If not,
- =A0 write to the Free Software Foundation, Inc., 59 Temple Place - Su=
ite 330,
- =A0 Boston, MA 02111-1307, USA. =A0*/
-
-#include <errno.h>
-#include <pthread.h>
-#include "internals.h"
-
-int
-__pthread_spin_lock (pthread_spinlock_t *lock)
-{
- =A0volatile unsigned int *addr =3D __ldcw_align (lock);
-
- =A0while (__ldcw (addr) =3D=3D 0)
- =A0 =A0while (*addr =3D=3D 0) ;
-
- =A0return 0;
-}
-weak_alias (__pthread_spin_lock, pthread_spin_lock)
-
-
-int
-__pthread_spin_trylock (pthread_spinlock_t *lock)
-{
- =A0volatile unsigned int *a =3D __ldcw_align (lock);
-
- =A0return __ldcw (a) ? 0 : EBUSY;
-}
-weak_alias (__pthread_spin_trylock, pthread_spin_trylock)
-
-
-int
-__pthread_spin_unlock (pthread_spinlock_t *lock)
-{
- =A0volatile unsigned int *a =3D __ldcw_align (lock);
- =A0int tmp =3D 1;
- =A0/* This should be a memory barrier to newer compilers */
- =A0__asm__ __volatile__ ("stw,ma %1,0(%0)"
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: : "r" (a), "r" (tmp)=
 : "memory");
- =A0return 0;
-}
-weak_alias (__pthread_spin_unlock, pthread_spin_unlock)
-
-
-int
-__pthread_spin_init (pthread_spinlock_t *lock, int pshared)
-{
- =A0/* We can ignore the `pshared' parameter. =A0Since we are busy-wai=
ting
- =A0 =A0 all processes which can access the memory location `lock' poi=
nts
- =A0 =A0 to can use the spinlock. =A0*/
- =A0volatile unsigned int *a =3D __ldcw_align (lock);
- =A0int tmp =3D 1;
- =A0/* This should be a memory barrier to newer compilers */
- =A0__asm__ __volatile__ ("stw,ma %1,0(%0)"
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: : "r" (a), "r" (tmp)=
 : "memory");
- =A0return 0;
-}
-weak_alias (__pthread_spin_init, pthread_spin_init)
-
-
-int
-__pthread_spin_destroy (pthread_spinlock_t *lock)
-{
- =A0/* Nothing to do. =A0*/
- =A0return 0;
-}
-weak_alias (__pthread_spin_destroy, pthread_spin_destroy)
diff --git a/sysdeps/hppa/linuxthreads/pt-machine.h
b/sysdeps/hppa/linuxthreads/pt-machine.h
deleted file mode 100644
index f35523f..0000000
--- a/sysdeps/hppa/linuxthreads/pt-machine.h
+++ /dev/null
@@ -1,134 +0,0 @@
-/* Machine-dependent pthreads configuration and inline functions.
- =A0 hppa version.
- =A0 Copyright (C) 2000, 2002, 2003 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
- =A0 Contributed by Richard Henderson <rth@tamu.edu>.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public Licens=
e as
- =A0 published by the Free Software Foundation; either version 2.1 of =
the
- =A0 License, or (at your option) any later version.
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; see the file COPYING.LIB. =A0=
If not,
- =A0 write to the Free Software Foundation, Inc., 59 Temple Place - Su=
ite 330,
- =A0 Boston, MA 02111-1307, USA. =A0*/
-
-#ifndef _PT_MACHINE_H
-#define _PT_MACHINE_H =A0 1
-
-#include <sys/types.h>
-#include <bits/initspin.h>
-
-#ifndef PT_EI
-# define PT_EI extern inline __attribute__ ((always_inline))
-#endif
-
-extern inline long int testandset (__atomic_lock_t *spinlock);
-extern inline int __compare_and_swap (long int *p, long int oldval,
long int newval);
-extern inline int lock_held (__atomic_lock_t *spinlock);
-extern inline int __load_and_clear (__atomic_lock_t *spinlock);
-
-/* Get some notion of the current stack. =A0Need not be exactly the to=
p
- =A0 of the stack, just something somewhere in the current frame. =A0*=
/
-#define CURRENT_STACK_FRAME =A0stack_pointer
-register char * stack_pointer __asm__ ("%r30");
-
-/* Get/Set thread-specific pointer. =A0We have to call into the kernel=
 to
- * modify it, but we can read it in user mode. =A0*/
-#ifndef THREAD_SELF
-#define THREAD_SELF __get_cr27()
-#endif
-
-#ifndef SET_THREAD_SELF
-#define SET_THREAD_SELF(descr) __set_cr27(descr)
-#endif
-/* Use this to determine type */
-struct _pthread_descr_struct *__thread_self;
-
-static inline struct _pthread_descr_struct * __get_cr27(void)
-{
- =A0long cr27;
- =A0asm ("mfctl %%cr27, %0" : "=3Dr" (cr27) : );
- =A0return (struct _pthread_descr_struct *) cr27;
-}
-
-#ifndef INIT_THREAD_SELF
-#define INIT_THREAD_SELF(descr, nr) __set_cr27(descr)
-#endif
-
-static inline void __set_cr27(struct _pthread_descr_struct * cr27)
-{
- =A0asm ( "ble =A0 0xe0(%%sr2, %%r0)\n\t"
- =A0 =A0 =A0 "copy =A0 %0, %%r26"
- =A0 =A0 =A0 : : "r" (cr27) : "r26" );
-}
-
-/* We want the OS to assign stack addresses. =A0*/
-#define FLOATING_STACKS =A0 =A0 =A0 =A01
-#define ARCH_STACK_MAX_SIZE =A0 =A08*1024*1024
-
-/* The hppa only has one atomic read and modify memory operation,
- =A0 load and clear, so hppa spinlocks must use zero to signify that
- =A0 someone is holding the lock. =A0The address used for the ldcw
- =A0 semaphore must be 16-byte aligned. =A0*/
-#define __ldcw(a) \
-({ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
- =A0unsigned int __ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0__asm__ __volatile__("ldcw 0(%1),%0" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3Dr" (__ret) : "r" (a)=
 : "memory"); =A0 =A0 =A0 =A0 =A0 =A0\
- =A0__ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
-})
-
-/* Strongly ordered lock reset */
-#define __lock_reset(lock_addr, tmp) \
-({
 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 __asm__ __volatile__ ("stw,ma %1,0(%0)"
 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : : "r" (=
lock_addr), "r" (tmp) :
"memory"); =A0 =A0 \
-})
-
-/* Because malloc only guarantees 8-byte alignment for malloc'd data,
- =A0 and GCC only guarantees 8-byte alignment for stack locals, we can=
't
- =A0 be assured of 16-byte alignment for atomic lock data even if we
- =A0 specify "__attribute ((aligned(16)))" in the type declaration. =A0=
So,
- =A0 we use a struct containing an array of four ints for the atomic l=
ock
- =A0 type and dynamically select the 16-byte aligned int from the arra=
y
- =A0 for the semaphore. =A0*/
-#define __PA_LDCW_ALIGNMENT 16
-#define __ldcw_align(a) ({ \
- =A0volatile unsigned int __ret =3D (unsigned int) a; =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0if ((__ret & ~(__PA_LDCW_ALIGNMENT - 1)) < (unsigned int) a) =A0 =A0=
 =A0 =A0 \
- =A0 =A0__ret =3D (__ret & ~(__PA_LDCW_ALIGNMENT - 1)) + __PA_LDCW_ALI=
GNMENT; \
- =A0(unsigned int *) __ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
-})
-
-/* Spinlock implementation; required. =A0*/
-PT_EI int
-__load_and_clear (__atomic_lock_t *spinlock)
-{
- =A0volatile unsigned int *a =3D __ldcw_align (spinlock);
-
- =A0return __ldcw (a);
-}
-
-/* Emulate testandset */
-PT_EI long int
-testandset (__atomic_lock_t *spinlock)
-{
- =A0return (__load_and_clear(spinlock) =3D=3D 0);
-}
-
-PT_EI int
-lock_held (__atomic_lock_t *spinlock)
-{
- =A0volatile unsigned int *a =3D __ldcw_align (spinlock);
-
- =A0return *a =3D=3D 0;
-}
-
-#endif /* pt-machine.h */
diff --git a/sysdeps/hppa/linuxthreads/tls.h b/sysdeps/hppa/linuxthread=
s/tls.h
deleted file mode 100644
index 3d33a18..0000000
--- a/sysdeps/hppa/linuxthreads/tls.h
+++ /dev/null
@@ -1,163 +0,0 @@
-/* Definition for thread-local data handling. =A0linuxthreads/hppa ver=
sion.
- =A0 Copyright (C) 2005 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public
- =A0 License as published by the Free Software Foundation; either
- =A0 version 2.1 of the License, or (at your option) any later version=
=2E
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; if not, write to the Free
- =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
- =A0 02111-1307 USA. =A0*/
-
-#ifndef _TLS_H
-#define _TLS_H
-
-#ifndef __ASSEMBLER__
-# include <pt-machine.h>
-# include <stdbool.h>
-# include <stddef.h>
-
-/* Type for the dtv. =A0*/
-typedef union dtv
-{
- =A0size_t counter;
- =A0struct
- =A0{
- =A0 =A0void *val;
- =A0 =A0bool is_static;
- =A0} pointer;
-} dtv_t;
-
-#else /* __ASSEMBLER__ */
-# include <tcb-offsets.h>
-#endif /* __ASSEMBLER__ */
-
-
-#if defined HAVE_TLS_SUPPORT
-
-/* Signal that TLS support is available. =A0*/
-# define USE_TLS =A0 =A0 =A0 1
-
-# ifndef __ASSEMBLER__
-
-typedef struct
-{
- =A0dtv_t *dtv;
- =A0void *private;
-} tcbhead_t;
-
-/* Include some syscall information for other headers */
-# =A0include <sysdep.h>
-
-/* This is the size of the initial TCB. =A0*/
-# =A0define TLS_INIT_TCB_SIZE sizeof (tcbhead_t)
-
-/* Alignment requirements for the initial TCB. =A0*/
-# =A0define TLS_INIT_TCB_ALIGN __alignof__ (tcbhead_t)
-
-/* This is the size of the TCB. =A0*/
-# =A0define TLS_TCB_SIZE sizeof (tcbhead_t)
-
-/* This is the size we need before TCB. =A0*/
-# =A0define TLS_PRE_TCB_SIZE sizeof (struct _pthread_descr_struct)
-
-/* Alignment requirements for the TCB. =A0*/
-# =A0define TLS_TCB_ALIGN __alignof__ (struct _pthread_descr_struct)
-
-/* The TLS blocks start right after the TCB. =A0*/
-# =A0define TLS_DTV_AT_TP =A0 =A0 =A0 =A01
-
-/* Return the thread descriptor for the current thread. =A0*/
-# =A0undef THREAD_SELF
-# =A0define THREAD_SELF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0\
- =A0({ struct _pthread_descr_struct *__self; =A0 =A0 \
- =A0 =A0 =A0 __self =3D __get_cr27(); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0\
- =A0 =A0 =A0 __self - 1; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
- =A0 })
-
-# =A0undef INIT_THREAD_SELF
-# =A0define INIT_THREAD_SELF(descr, nr) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0\
- =A0({ struct _pthread_descr_struct *__self =3D (void *)descr; =A0 =A0=
 \
- =A0 =A0 =A0 __set_cr27(__self + 1); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 })
-
-/* Access to data in the thread descriptor is easy. =A0*/
-#define THREAD_GETMEM(descr, member) \
- =A0((void) sizeof (descr), THREAD_SELF->member)
-#define THREAD_GETMEM_NC(descr, member) \
- =A0((void) sizeof (descr), THREAD_SELF->member)
-#define THREAD_SETMEM(descr, member, value) \
- =A0((void) sizeof (descr), THREAD_SELF->member =3D (value))
-#define THREAD_SETMEM_NC(descr, member, value) \
- =A0((void) sizeof (descr), THREAD_SELF->member =3D (value))
-
-/* Install the dtv pointer. =A0The pointer passed is to the element wi=
th
- =A0 index -1 which contain the length. =A0*/
-# =A0define INSTALL_DTV(tcbp, dtvp) \
- =A0((tcbhead_t *) (tcbp))->dtv =3D dtvp + 1
-
-/* Install new dtv for current thread. =A0*/
-# =A0define INSTALL_NEW_DTV(dtv) \
- =A0({ tcbhead_t *__tcbp =3D (tcbhead_t *)__get_cr27(); =A0 =A0\
- =A0 =A0 =A0 __tcbp->dtv =3D dtv; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0\
- =A0 })
-
-/* Return dtv of given thread descriptor. =A0*/
-# =A0define GET_DTV(tcbp) \
- =A0(((tcbhead_t *) (tcbp))->dtv)
-
-/* Code to initially initialize the thread pointer. =A0This might need
- =A0 special attention since 'errno' is not yet available and if the
- =A0 operation can cause a failure 'errno' must not be touched. =A0*/
-# =A0define TLS_INIT_TP(tcbp, secondcall) \
- =A0({ __set_cr27(tcbp); 0; })
-
-/* Return the address of the dtv for the current thread. =A0*/
-# =A0define THREAD_DTV() =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
- =A0({ tcbhead_t *__tcbp =3D (tcbhead_t *)__get_cr27(); =A0 =A0\
- =A0 =A0 =A0 __tcbp->dtv; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 })
-
-# define TLS_MULTIPLE_THREADS_IN_TCB 1
-
-/* Get the thread descriptor definition. =A0This must be after the
- =A0 the definition of THREAD_SELF for TLS. =A0*/
-# =A0include <linuxthreads/descr.h>
-
-# endif /* __ASSEMBLER__ */
-
-#else
-
-# ifndef __ASSEMBLER__
-
-typedef struct
-{
- =A0void *tcb;
- =A0dtv_t *dtv;
- =A0void *self;
- =A0int multiple_threads;
-} tcbhead_t;
-
-/* Get the thread descriptor definition. =A0*/
-# =A0include <linuxthreads/descr.h>
-
-# =A0define NONTLS_INIT_TP \
- =A0do {
 =A0 =A0 =A0 =A0 \
- =A0 =A0static const tcbhead_t nontls_init_tp =3D { .multiple_threads =
=3D 0 }; \
- =A0 =A0INIT_THREAD_SELF(&nontls_init_tp, 0); =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0} while (0)
-
-# endif /* __ASSEMBLER__ */
-
-#endif /* HAVE_TLS_SUPPORT */
-
-#endif /* tls.h */
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_cancel.c
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_cancel.c
deleted file mode 100644
index 0d6da82..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_cancel.c
+++ /dev/null
@@ -1,33 +0,0 @@
-#include <shlib-compat.h>
-
-#define aio_cancel64 XXX
-#include <aio.h>
-#undef aio_cancel64
-#include <errno.h>
-
-extern __typeof (aio_cancel) __new_aio_cancel;
-extern __typeof (aio_cancel) __old_aio_cancel;
-
-#define aio_cancel =A0 =A0 __new_aio_cancel
-
-#include <sysdeps/pthread/aio_cancel.c>
-
-#undef aio_cancel
-strong_alias (__new_aio_cancel, __new_aio_cancel64);
-versioned_symbol (librt, __new_aio_cancel, aio_cancel, GLIBC_2_3);
-versioned_symbol (librt, __new_aio_cancel64, aio_cancel64, GLIBC_2_3);
-
-#if SHLIB_COMPAT (librt, GLIBC_2_1, GLIBC_2_3)
-
-#undef ECANCELED
-#define aio_cancel =A0 =A0 __old_aio_cancel
-#define ECANCELED =A0 =A0 =A0125
-
-#include <sysdeps/pthread/aio_cancel.c>
-
-#undef aio_cancel
-strong_alias (__old_aio_cancel, __old_aio_cancel64);
-compat_symbol (librt, __old_aio_cancel, aio_cancel, GLIBC_2_1);
-compat_symbol (librt, __old_aio_cancel64, aio_cancel64, GLIBC_2_1);
-
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/initspin.h
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/initspin.h
deleted file mode 100644
index ff0ec20..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/initspin.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* PA-RISC specific definitions for spinlock initializers.
- =A0 Copyright (C) 2000, 2001 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public Licens=
e as
- =A0 published by the Free Software Foundation; either version 2.1 of =
the
- =A0 License, or (at your option) any later version.
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; see the file COPYING.LIB. =A0=
If not,
- =A0 write to the Free Software Foundation, Inc., 59 Temple Place - Su=
ite 330,
- =A0 Boston, MA 02111-1307, USA. =A0*/
-
-/* Initial value of a spinlock. =A0PA-RISC only implements atomic load
- =A0 and clear so this must be non-zero. */
-#define __LT_SPINLOCK_INIT ((__atomic_lock_t) { { 1, 1, 1, 1 } })
-
-/* Initialize global spinlocks without cast, generally macro wrapped *=
/
-#define __LT_SPINLOCK_ALT_INIT { { 1, 1, 1, 1 } }
-
-/* Macros for lock initializers, not using the above definition.
- =A0 The above definition is not used in the case that static initiali=
zers
- =A0 use this value. */
-#define __LOCK_ALT_INITIALIZER { __LT_SPINLOCK_ALT_INIT, 0 }
-
-/* Used to initialize _pthread_fastlock's in non-static case */
-#define __LOCK_INITIALIZER ((struct _pthread_fastlock){
__LT_SPINLOCK_INIT, 0 })
-
-/* Used in pthread_atomic initialization */
-#define __ATOMIC_INITIALIZER { 0, __LT_SPINLOCK_ALT_INIT }
-
-/* Tell the rest of the code that the initializer is non-zero without
- =A0 explaining it's internal structure */
-#define __LT_INITIALIZER_NOT_ZERO
-
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtype=
s.h
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtypes.h
deleted file mode 100644
index 7173718..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtypes.h
+++ /dev/null
@@ -1,159 +0,0 @@
-/* Linuxthreads - a simple clone()-based implementation of Posix =A0 =A0=
 =A0 =A0*/
-/* threads for Linux. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
-/* Copyright (C) 1996 Xavier Leroy (Xavier.Leroy@inria.fr) =A0 =A0 =A0=
 =A0 =A0 =A0 =A0*/
-/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
*/
-/* This program is free software; you can redistribute it and/or =A0 =A0=
 =A0 =A0*/
-/* modify it under the terms of the GNU Library General Public License=
 =A0*/
-/* as published by the Free Software Foundation; either version 2 =A0 =
=A0 =A0 */
-/* of the License, or (at your option) any later version. =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 */
-/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
*/
-/* This program is distributed in the hope that it will be useful, =A0=
 =A0 =A0*/
-/* but WITHOUT ANY WARRANTY; without even the implied warranty of =A0 =
=A0 =A0 */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =A0=
 =A0 =A0 =A0*/
-/* GNU Library General Public License for more details. =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 */
-
-#if !defined _BITS_TYPES_H && !defined _PTHREAD_H
-# error "Never include <bits/pthreadtypes.h> directly; use
<sys/types.h> instead."
-#endif
-
-#ifndef _BITS_PTHREADTYPES_H
-#define _BITS_PTHREADTYPES_H =A0 1
-
-#define __need_schedparam
-#include <bits/sched.h>
-
-/* We need 128-bit alignment for the ldcw semaphore. =A0At most, we ar=
e
- =A0 assured of 64-bit alignment for stack locals and malloc'd data. =A0=
Thus,
- =A0 we use a struct with four ints for the atomic lock type. =A0The l=
ocking
- =A0 code will figure out which of the four to use for the ldcw semaph=
ore. =A0*/
-typedef volatile struct {
- =A0int lock[4];
-} __attribute__ ((aligned(16))) __atomic_lock_t;
-
-/* Fast locks (not abstract because mutexes and conditions aren't abst=
ract). */
-struct _pthread_fastlock
-{
- =A0__atomic_lock_t __spinlock; =A0/* Used by compare_and_swap emulati=
on. =A0Also,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ad=
aptive SMP lock stores spin count here. */
- =A0long int __status; =A0 =A0 =A0 =A0 =A0 /* "Free" or "taken" or hea=
d of waiting list */
-};
-
-#ifndef _PTHREAD_DESCR_DEFINED
-/* Thread descriptors */
-typedef struct _pthread_descr_struct *_pthread_descr;
-# define _PTHREAD_DESCR_DEFINED
-#endif
-
-
-/* Attributes for threads. =A0*/
-typedef struct __pthread_attr_s
-{
- =A0int __detachstate;
- =A0int __schedpolicy;
- =A0struct __sched_param __schedparam;
- =A0int __inheritsched;
- =A0int __scope;
- =A0size_t __guardsize;
- =A0int __stackaddr_set;
- =A0void *__stackaddr;
- =A0size_t __stacksize;
-} pthread_attr_t;
-
-
-/* Conditions (not abstract because of PTHREAD_COND_INITIALIZER */
-
-#ifdef __GLIBC_HAVE_LONG_LONG
-__extension__ typedef long long __pthread_cond_align_t;
-#else
-typedef long __pthread_cond_align_t;
-#endif
-
-typedef struct
-{
- =A0struct _pthread_fastlock __c_lock; /* Protect against concurrent a=
ccess */
- =A0_pthread_descr __c_waiting; =A0 =A0 =A0 =A0/* Threads waiting on t=
his condition */
- =A0char __padding[48 - sizeof (struct _pthread_fastlock)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0- sizeof (_pthread_descr) - sizeof (__=
pthread_cond_align_t)];
- =A0__pthread_cond_align_t __align;
-} pthread_cond_t;
-
-
-/* Attribute for conditionally variables. =A0*/
-typedef struct
-{
- =A0int __dummy;
-} pthread_condattr_t;
-
-/* Keys for thread-specific data */
-typedef unsigned int pthread_key_t;
-
-
-/* Mutexes (not abstract because of PTHREAD_MUTEX_INITIALIZER). =A0*/
-/* (The layout is unnatural to maintain binary compatibility
- =A0 =A0with earlier releases of LinuxThreads.) */
-typedef struct
-{
- =A0int __m_reserved; =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Reserved for futu=
re use */
- =A0int __m_count; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Depth of recu=
rsive locking */
- =A0_pthread_descr __m_owner; =A0 =A0 =A0 /* Owner thread (if recursiv=
e or errcheck) */
- =A0int __m_kind; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Mutex kind: f=
ast, recursive or errcheck */
- =A0struct _pthread_fastlock __m_lock; /* Underlying fast lock */
-} pthread_mutex_t;
-
-
-/* Attribute for mutex. =A0*/
-typedef struct
-{
- =A0int __mutexkind;
-} pthread_mutexattr_t;
-
-
-/* Once-only execution */
-typedef int pthread_once_t;
-
-#if defined __USE_UNIX98 || defined __USE_XOPEN2K
-/* Read-write locks. =A0*/
-typedef struct _pthread_rwlock_t
-{
- =A0struct _pthread_fastlock __rw_lock; /* Lock to guarantee mutual ex=
clusion */
- =A0int __rw_readers; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Number of=
 readers */
- =A0_pthread_descr __rw_writer; =A0 =A0 =A0 =A0 /* Identity of writer,=
 or NULL if none */
- =A0_pthread_descr __rw_read_waiting; =A0 /* Threads waiting for readi=
ng */
- =A0_pthread_descr __rw_write_waiting; =A0/* Threads waiting for writi=
ng */
- =A0int __rw_kind; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Reade=
r/Writer preference selection */
- =A0int __rw_pshared; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Shared be=
tween processes or not */
-} pthread_rwlock_t;
-
-
-/* Attribute for read-write locks. =A0*/
-typedef struct
-{
- =A0int __lockkind;
- =A0int __pshared;
-} pthread_rwlockattr_t;
-#endif
-
-#ifdef __USE_XOPEN2K
-/* POSIX spinlock data type. =A0*/
-typedef __atomic_lock_t pthread_spinlock_t;
-
-/* POSIX barrier. */
-typedef struct {
- =A0struct _pthread_fastlock __ba_lock; /* Lock to guarantee mutual ex=
clusion */
- =A0int __ba_required; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Threads n=
eeded for completion */
- =A0int __ba_present; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Threads w=
aiting */
- =A0_pthread_descr __ba_waiting; =A0 =A0 =A0 =A0/* Queue of waiting th=
reads */
-} pthread_barrier_t;
-
-/* barrier attribute */
-typedef struct {
- =A0int __pshared;
-} pthread_barrierattr_t;
-
-#endif
-
-
-/* Thread identifiers */
-typedef unsigned long int pthread_t;
-
-#endif /* bits/pthreadtypes.h */
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-machine.h
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-machine.h
deleted file mode 100644
index 5dc6e6f..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-machine.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* HP-PARISC macro definitions for mutexes, thread-specific data
- =A0 and parameters for malloc.
- =A0 Copyright (C) 2003 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
- =A0 Contributed by Carlos O'Donell <carlos@baldric.uwo.ca>, 2003.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public
- =A0 License as published by the Free Software Foundation; either
- =A0 version 2.1 of the License, or (at your option) any later version=
=2E
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; if not, write to the Free
- =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
- =A0 02111-1307 USA. =A0*/
-
-#ifndef _MALLOC_MACHINE_H
-#define _MALLOC_MACHINE_H
-
-#undef thread_atfork_static
-
-#include <atomic.h>
-#include <bits/libc-lock.h>
-
-__libc_lock_define (typedef, mutex_t)
-
-/* Since our lock structure does not tolerate being initialized to
zero, we must
- =A0 modify the standard function calls made by malloc */
-# =A0define mutex_init(m) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 __libc_maybe_call (__pthread_mutex_init, (m, NULL), \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((m)->__m_lock.__spinlock =3D
__LT_SPINLOCK_INIT),(*(int *)(m))) )
-# =A0define mutex_lock(m) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 __libc_maybe_call (__pthread_mutex_lock, (m), \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (__load_and_clear(&((m)->=
__m_lock.__spinlock)), 0))
-# =A0define mutex_trylock(m) =A0 =A0 \
- =A0 =A0 =A0 __libc_maybe_call (__pthread_mutex_trylock, (m), \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (*(int *)(m) ? 1 :
(__load_and_clear(&((m)->__m_lock.__spinlock)), 0)))
-# =A0define mutex_unlock(m) =A0 =A0 =A0\
- =A0 =A0 =A0 __libc_maybe_call (__pthread_mutex_unlock, (m), \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((m)->__m_lock.__spinloc=
k =3D
__LT_SPINLOCK_INIT), (*(int *)(m))) )
-
-/* This is defined by newer gcc version unique for each module. =A0*/
-extern void *__dso_handle __attribute__ ((__weak__));
-
-#include <fork.h>
-
-#ifdef SHARED
-# define thread_atfork(prepare, parent, child) \
- =A0 __register_atfork (prepare, parent, child, __dso_handle)
-#else
-# define thread_atfork(prepare, parent, child) \
- =A0 __register_atfork (prepare, parent, child, =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &__dso_handle =3D=3D NULL ? N=
ULL : __dso_handle)
-#endif
-
-/* thread specific data for glibc */
-
-#include <bits/libc-tsd.h>
-
-typedef int tsd_key_t[1]; =A0 =A0 =A0/* no key data structure, libc ma=
gic does it */
-__libc_tsd_define (static, void *, MALLOC) =A0 =A0 /* declaration/comm=
on
definition */
-#define tsd_key_create(key, destr) =A0 =A0 ((void) (key))
-#define tsd_setspecific(key, data) =A0 =A0 __libc_tsd_set (void *, MAL=
LOC, (data))
-#define tsd_getspecific(key, vptr) =A0 =A0 ((vptr) =3D __libc_tsd_get =
(void
*, MALLOC))
-
-#include <sysdeps/generic/malloc-machine.h>
-
-#endif /* !defined(_MALLOC_MACHINE_H) */
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-initfini.c
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-initfini.c
deleted file mode 100644
index 27f850c..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-initfini.c
+++ /dev/null
@@ -1,109 +0,0 @@
-/* Special .init and .fini section support for HPPA. =A0Linuxthreads v=
ersion.
- =A0 Copyright (C) 2001, 2003 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
-
- =A0 The GNU C Library is free software; you can redistribute it
- =A0 and/or modify it under the terms of the GNU Lesser General Public
- =A0 License as published by the Free Software Foundation; either
- =A0 version 2.1 of the License, or (at your option) any later version=
=2E
-
- =A0 In addition to the permissions in the GNU Lesser General Public
- =A0 License, the Free Software Foundation gives you unlimited
- =A0 permission to link the compiled version of this file with other
- =A0 programs, and to distribute those programs without any restrictio=
n
- =A0 coming from the use of this file. =A0(The Lesser General Public
- =A0 License restrictions do apply in other respects; for example, the=
y
- =A0 cover modification of the file, and distribution when not linked
- =A0 into another program.)
-
- =A0 The GNU C Library is distributed in the hope that it will be
- =A0 useful, but WITHOUT ANY WARRANTY; without even the implied warran=
ty
- =A0 of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See th=
e
- =A0 GNU Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; see the file COPYING.LIB. =A0=
If not,
- =A0 write to the Free Software Foundation, 59 Temple Place - Suite 33=
0,
- =A0 Boston, MA 02111-1307, USA. =A0*/
-
-/* This file is compiled into assembly code which is then munged by a =
sed
- =A0 script into two files: crti.s and crtn.s.
-
- =A0 * crti.s puts a function prologue at the beginning of the
- =A0 .init and .fini sections and defines global symbols for
- =A0 those addresses, so they can be called as functions.
-
- =A0 * crtn.s puts the corresponding function epilogues
- =A0 in the .init and .fini sections. */
-
-/* If we use the standard C version, the linkage table pointer won't
- =A0 be properly preserved due to the splitting up of function prologu=
es
- =A0 and epilogues. =A0Therefore we write these in assembly to make su=
re
- =A0 they do the right thing. =A0*/
-
-__asm__ (
-"#include \"defs.h\"\n"
-"\n"
-"/*@HEADER_ENDS*/\n"
-"\n"
-"/*@_init_PROLOG_BEGINS*/\n"
-" =A0 =A0 =A0.section .init\n"
-" =A0 =A0 =A0.align 4\n"
-" =A0 =A0 =A0.globl _init\n"
-" =A0 =A0 =A0.type _init,@function\n"
-"_init:\n"
-" =A0 =A0 =A0stw =A0 =A0 %rp,-20(%sp)\n"
-" =A0 =A0 =A0stwm =A0 =A0%r4,64(%sp)\n"
-" =A0 =A0 =A0stw =A0 =A0 %r19,-32(%sp)\n"
-" =A0 =A0 =A0bl =A0 =A0 =A0__pthread_initialize_minimal,%rp\n"
-" =A0 =A0 =A0copy =A0 =A0%r19,%r4 =A0 =A0 =A0 =A0/* delay slot */\n"
-" =A0 =A0 =A0copy =A0 =A0%r4,%r19\n"
-"/*@_init_PROLOG_ENDS*/\n"
-"\n"
-"/*@_init_EPILOG_BEGINS*/\n"
-"/* Here is the tail end of _init. =A0*/\n"
-" =A0 =A0 =A0.section .init\n"
-" =A0 =A0 =A0ldw =A0 =A0 -84(%sp),%rp\n"
-" =A0 =A0 =A0copy =A0 =A0%r4,%r19\n"
-" =A0 =A0 =A0bv =A0 =A0 =A0%r0(%rp)\n"
-"_end_init:\n"
-" =A0 =A0 =A0ldwm =A0 =A0-64(%sp),%r4\n"
-"\n"
-"/* Our very own unwind info, because the assembler can't handle\n"
-" =A0 functions split into two or more pieces. =A0*/\n"
-" =A0 =A0 =A0.section .PARISC.unwind,\"a\",@progbits\n"
-" =A0 =A0 =A0.extern _init\n"
-" =A0 =A0 =A0.word =A0 _init, _end_init\n"
-" =A0 =A0 =A0.byte =A0 0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\=
n"
-"\n"
-"/*@_init_EPILOG_ENDS*/\n"
-"\n"
-"/*@_fini_PROLOG_BEGINS*/\n"
-" =A0 =A0 =A0.section .fini\n"
-" =A0 =A0 =A0.align 4\n"
-" =A0 =A0 =A0.globl _fini\n"
-" =A0 =A0 =A0.type _fini,@function\n"
-"_fini:\n"
-" =A0 =A0 =A0stw =A0 =A0 %rp,-20(%sp)\n"
-" =A0 =A0 =A0stwm =A0 =A0%r4,64(%sp)\n"
-" =A0 =A0 =A0stw =A0 =A0 %r19,-32(%sp)\n"
-" =A0 =A0 =A0copy =A0 =A0%r19,%r4\n"
-"/*@_fini_PROLOG_ENDS*/\n"
-"\n"
-"/*@_fini_EPILOG_BEGINS*/\n"
-" =A0 =A0 =A0.section .fini\n"
-" =A0 =A0 =A0ldw =A0 =A0 -84(%sp),%rp\n"
-" =A0 =A0 =A0copy =A0 =A0%r4,%r19\n"
-" =A0 =A0 =A0bv =A0 =A0 =A0%r0(%rp)\n"
-"_end_fini:\n"
-" =A0 =A0 =A0ldwm =A0 =A0-64(%sp),%r4\n"
-"\n"
-" =A0 =A0 =A0.section .PARISC.unwind,\"a\",@progbits\n"
-" =A0 =A0 =A0.extern _fini\n"
-" =A0 =A0 =A0.word =A0 _fini, _end_fini\n"
-" =A0 =A0 =A0.byte =A0 0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\=
n"
-"\n"
-"/*@_fini_EPILOG_ENDS*/\n"
-"\n"
-"/*@TRAILER_BEGINS*/\n"
-);
diff --git a/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h
b/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h
deleted file mode 100644
index 51d6cf3..0000000
--- a/sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-cancel.h
+++ /dev/null
@@ -1,242 +0,0 @@
-/* cancellable system calls for Linux/HPPA.
- =A0 Copyright (C) 2003 Free Software Foundation, Inc.
- =A0 This file is part of the GNU C Library.
- =A0 Contributed by Carlos O'Donell <carlos@baldric.uwo.ca>, 2003.
-
- =A0 The GNU C Library is free software; you can redistribute it and/o=
r
- =A0 modify it under the terms of the GNU Lesser General Public
- =A0 License as published by the Free Software Foundation; either
- =A0 version 2.1 of the License, or (at your option) any later version=
=2E
-
- =A0 The GNU C Library is distributed in the hope that it will be usef=
ul,
- =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
- =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
- =A0 Lesser General Public License for more details.
-
- =A0 You should have received a copy of the GNU Lesser General Public
- =A0 License along with the GNU C Library; if not, write to the Free
- =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
- =A0 02111-1307 USA. =A0*/
-
-#include <sysdep.h>
-#include <tls.h>
-#ifndef __ASSEMBLER__
-# include <linuxthreads/internals.h>
-#endif
-
-#if !defined NOT_IN_libc || defined IS_IN_libpthread || defined IS_IN_=
librt
-
-# ifndef NO_ERROR
-# =A0define NO_ERROR -0x1000
-# endif
-
-/* The syscall cancellation mechanism requires userspace
- =A0 assistance, the following code does roughly this:
-
- =A0 =A0 =A0 do arguments (read arg5 and arg6 to registers)
- =A0 =A0 =A0 setup frame
-
- =A0 =A0 =A0 check if there are threads, yes jump to pseudo_cancel
-
- =A0 =A0 =A0 unthreaded:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 syscall
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 check syscall return (jump to pre_end)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 set errno
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 set return to -1
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 (jump to pre_end)
-
- =A0 =A0 =A0 pseudo_cancel:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 cenable
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 syscall
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 cdisable
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 check syscall return (jump to pre_end)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 set errno
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 set return to -1
-
- =A0 =A0 =A0 pre_end
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 restore stack
-
- =A0 =A0 =A0 It is expected that 'ret' and 'END' macros will
- =A0 =A0 =A0 append an 'undo arguments' and 'return' to the
- =A0 =A0 =A0 this PSEUDO macro. */
-
-# undef PSEUDO
-# define PSEUDO(name, syscall_name, args) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 ENTRY (name) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 DOARGS_##args =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 copy TREG, %r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 copy %sp, TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stwm %r1, 64(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stw %rp, -20(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stw TREG, -4(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Done setting up frame, continue... */ =A0 =A0 =A0 =A0A=
SM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 SINGLE_THREAD_P =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 cmpib,<>,n 0,%ret0,L(pseudo_cancel) =A0 =A0 =A0 =A0 =A0 =A0=
 ASM_LINE_SEP =A0 =A0\
-L(unthreaded): =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Save r19 */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 SAVE_PIC(TREG) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Do syscall, delay loads # */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ble =A00x100(%sr2,%r0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldi SYS_ify (syscall_name), %r20 /* delay */ =A0 =A0ASM_L=
INE_SEP =A0 =A0\
- =A0 =A0 =A0 ldi NO_ERROR,%r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 cmpb,>>=3D,n %r1,%ret0,L(pre_end) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Restore r19 from TREG */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 LOAD_PIC(TREG) /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 SYSCALL_ERROR_HANDLER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Use TREG for temp storage */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 copy %ret0, TREG /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* OPTIMIZE: Don't reload r19 */ =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* do a -1*syscall_ret0 */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 sub %r0, TREG, TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Store into errno location */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stw TREG, 0(%sr0,%ret0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 b L(pre_end) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* return -1 as error */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldo -1(%r0), %ret0 /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ASM_LINE_SEP =A0 =A0\
-L(pseudo_cancel): =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 PUSHARGS_##args /* Save args */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Save r19 into TREG */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 CENABLE /* FUNC CALL */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 SAVE_PIC(TREG) /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* restore syscall args */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 POPARGS_##args =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* save mask from cenable (use stub rp slot) */ ASM_LINE_=
SEP =A0 =A0\
- =A0 =A0 =A0 stw %ret0, -24(%sp) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* ... SYSCALL ... */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ble 0x100(%sr2,%r0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldi SYS_ify (syscall_name), %r20 /* delay */ =A0 =A0ASM_L=
INE_SEP =A0 =A0\
- =A0 =A0 =A0 /* ............... */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 LOAD_PIC(TREG) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* pass mask as arg0 to cdisable */ =A0 =A0 =A0 =A0 =A0 =A0=
 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw -24(%sp), %r26 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 CDISABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stw %ret0, -24(%sp) /* delay */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Restore syscall return */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw -24(%sp), %ret0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* compare error */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldi NO_ERROR,%r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* branch if no error */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 cmpb,>>=3D,n %r1,%ret0,L(pre_end) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 LOAD_PIC(TREG) =A0/* cond. nullify */ =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 copy %ret0, TREG /* save syscall return */ =A0 =A0 =A0ASM=
_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 SYSCALL_ERROR_HANDLER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* make syscall res value positive */ =A0 =A0 =A0 =A0 =A0=
 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 sub %r0, TREG, TREG =A0 =A0 /* delay */ =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* No need to LOAD_PIC */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* store into errno location */ =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 stw TREG, 0(%sr0,%ret0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* return -1 */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldo -1(%r0), %ret0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
-L(pre_end): =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Restore rp before exit */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw -84(%sr0,%sp), %rp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* Undo frame */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldwm -64(%sp),TREG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 /* No need to LOAD_PIC */ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ASM_LINE_SEP
-
-/* Save arguments into our frame */
-# define PUSHARGS_0 =A0 =A0/* nothing to do */
-# define PUSHARGS_1 =A0 =A0PUSHARGS_0 stw %r26, -36(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_2 =A0 =A0PUSHARGS_1 stw %r25, -40(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_3 =A0 =A0PUSHARGS_2 stw %r24, -44(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_4 =A0 =A0PUSHARGS_3 stw %r23, -48(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_5 =A0 =A0PUSHARGS_4 stw %r22, -52(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-# define PUSHARGS_6 =A0 =A0PUSHARGS_5 stw %r21, -56(%sr0,%sp) =A0 =A0 =
=A0ASM_LINE_SEP
-
-/* Bring them back from the stack */
-# define POPARGS_0 =A0 =A0 /* nothing to do */
-# define POPARGS_1 =A0 =A0 POPARGS_0 ldw -36(%sr0,%sp), %r26 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_2 =A0 =A0 POPARGS_1 ldw -40(%sr0,%sp), %r25 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_3 =A0 =A0 POPARGS_2 ldw -44(%sr0,%sp), %r24 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_4 =A0 =A0 POPARGS_3 ldw -48(%sr0,%sp), %r23 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_5 =A0 =A0 POPARGS_4 ldw -52(%sr0,%sp), %r22 =A0 =A0 =A0=
 ASM_LINE_SEP
-# define POPARGS_6 =A0 =A0 POPARGS_5 ldw -56(%sr0,%sp), %r21 =A0 =A0 =A0=
 ASM_LINE_SEP
-
-# ifdef IS_IN_libpthread
-# =A0ifdef PIC
-# =A0 define CENABLE .import __pthread_enable_asynccancel,code ASM_LIN=
E_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __pthread_enable_async=
cancel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE .import __pthread_disable_asynccancel,code ASM_L=
INE_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __pthread_disable_asyn=
ccancel,%r2 ASM_LINE_SEP
-# =A0else
-# =A0 define CENABLE .import __pthread_enable_asynccancel,code ASM_LIN=
E_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __pthread_enable_async=
cancel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE .import __pthread_disable_asynccancel,code ASM_L=
INE_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __pthread_disable_asyn=
ccancel,%r2 ASM_LINE_SEP
-# =A0endif
-# elif !defined NOT_IN_libc
-# =A0ifdef PIC
-# =A0 define CENABLE .import __libc_enable_asynccancel,code ASM_LINE_S=
EP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __libc_enable_asynccan=
cel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE =A0 =A0.import __libc_disable_asynccancel,code A=
SM_LINE_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __libc_disable_asyncca=
ncel,%r2 ASM_LINE_SEP
-# =A0else
-# =A0 define CENABLE .import __libc_enable_asynccancel,code ASM_LINE_S=
EP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __libc_enable_asynccan=
cel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE =A0 =A0.import __libc_disable_asynccancel,code A=
SM_LINE_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __libc_disable_asyncca=
ncel,%r2 ASM_LINE_SEP
-# =A0endif
-# else
-# =A0ifdef PIC
-# =A0 define CENABLE .import __librt_enable_asynccancel,code ASM_LINE_=
SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __librt_enable_asyncca=
ncel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE .import __librt_disable_asynccancel,code ASM_LIN=
E_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __librt_disable_asyncc=
ancel,%r2 ASM_LINE_SEP
-# =A0else
-# =A0 define CENABLE .import __librt_enable_asynccancel,code ASM_LINE_=
SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __librt_enable_asyncca=
ncel,%r2 ASM_LINE_SEP
-# =A0 define CDISABLE .import __librt_disable_asynccancel,code ASM_LIN=
E_SEP \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl __librt_disable_asyncc=
ancel,%r2 ASM_LINE_SEP
-# =A0endif
-# endif
-
-/* p_header.multiple_threads is +12 from the pthread_descr struct star=
t,
- =A0 We could have called __get_cr27() but we really want less overhea=
d */
-# define MULTIPLE_THREADS_OFFSET 0xC
-
-/* cr27 has been initialized to 0x0 by kernel */
-# define NO_THREAD_CR27 0x0
-
-# ifdef IS_IN_libpthread
-# =A0define __local_multiple_threads __pthread_multiple_threads
-# elif !defined NOT_IN_libc
-# =A0define __local_multiple_threads __libc_multiple_threads
-# else
-# =A0define __local_multiple_threads __librt_multiple_threads
-# endif
-
-# ifndef __ASSEMBLER__
-# =A0if !defined NOT_IN_libc || defined IS_IN_libpthread
-extern int __local_multiple_threads attribute_hidden;
-# =A0else
-extern int __local_multiple_threads;
-# =A0endif
-# =A0define SINGLE_THREAD_P __builtin_expect (__local_multiple_threads=
 =3D=3D 0, 1)
-# else
-/* This ALT version requires newer kernel support */
-# =A0define SINGLE_THREAD_P_MFCTL
=A0 =A0 =A0 =A0 =A0\
- =A0 =A0 =A0 mfctl %cr27, %ret0
ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 cmpib,=3D NO_THREAD_CR27,%ret0,L(stp)
ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 nop
ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw MULTIPLE_THREADS_OFFSET(%sr0,%ret0),%ret0
ASM_LINE_SEP =A0 =A0\
-L(stp):
=A0ASM_LINE_SEP
-# =A0ifdef PIC
-/* Slower version uses GOT to get value of __local_multiple_threads */
-# =A0 define SINGLE_THREAD_P
 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 addil LT%__local_multiple_threads, %r19
ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw RT%__local_multiple_threads(%sr0,%r1), %ret0
ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw 0(%sr0,%ret0), %ret0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_LINE_SEP
-# =A0else
-/* Slow non-pic version using DP */
-# =A0 define SINGLE_THREAD_P
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
- =A0 =A0 =A0 addil LR%__local_multiple_threads-$global$,%r27
 ASM_LINE_SEP =A0 =A0\
- =A0 =A0 =A0 ldw RR%__local_multiple_threads-$global$(%sr0,%r1),%ret0
=A0ASM_LINE_SEP
-# =A0endif
-# endif
-#elif !defined __ASSEMBLER__
-
-/* This code should never be used but we define it anyhow. =A0*/
-# define SINGLE_THREAD_P (1)
-
-#endif
-/* !defined NOT_IN_libc || defined IS_IN_libpthread */

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D9dd87de7ff43261dc83c74cc561ae392a405663f

commit 9dd87de7ff43261dc83c74cc561ae392a405663f
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:42:56 2011 -0400

=A0 =A0Define DEFAULT_STACK_PERMS.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 14abdee..2038513 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,10 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/hppa/stackinfo.h: Update copyright year.
+ =A0 =A0 =A0 Include elf.h and define DEFAULT_STACK_PERMS.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/bits/fcntl.h: Synchronize
=A0 =A0 =A0 =A0with canonical fcntl.h.

diff --git a/sysdeps/hppa/stackinfo.h b/sysdeps/hppa/stackinfo.h
index 318de71..44929c4 100644
--- a/sysdeps/hppa/stackinfo.h
+++ b/sysdeps/hppa/stackinfo.h
@@ -1,4 +1,4 @@
-/* Copyright (C) 1999 Free Software Foundation, Inc.
+/* Copyright (C) 1999, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.

=A0 =A0The GNU C Library is free software; you can redistribute it and/=
or
@@ -22,6 +22,12 @@
=A0#ifndef _STACKINFO_H
=A0#define _STACKINFO_H =A0 1

+#include <elf.h>
+
+/* Default to an executable stack. =A0PF_X can be overridden if PT_GNU=
_STACK is
+ * present, but it is presumed absent. =A0*/
+#define DEFAULT_STACK_PERMS (PF_R|PF_W|PF_X)
+
=A0/* On PA the stack grows up. =A0*/
=A0#define _STACK_GROWS_UP =A0 =A0 =A0 =A01


http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D930046be6fedf95d9fce6548bf58ad5e33023d67

commit 930046be6fedf95d9fce6548bf58ad5e33023d67
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:37:02 2011 -0400

=A0 =A0Syncrhonize fcntl.h with canonical source.

=A0 =A0Update fcntl.h to match canonical i386 fcntl.h, but
=A0 =A0update constants to match hppa linux kernel values.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 41a779e..14abdee 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,10 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/bits/fcntl.h: Synchronize
+ =A0 =A0 =A0 with canonical fcntl.h.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/hppa/fpu/fegetenv.c: Add hidden alias.
=A0 =A0 =A0 =A0* sysdeps/hppa/fpu/feupdateenv.c: Likewise.
=A0 =A0 =A0 =A0* sysdeps/hppa/fpu/ftestexcept.c: Likewise.
diff --git a/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
b/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
index a2c6482..8f42111 100644
--- a/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
+++ b/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
@@ -1,5 +1,5 @@
-/* O_*, F_*, FD_* bit values for Linux/HPPA.
- =A0 Copyright (C) 1995,1996,1997,1998,1999,2000,2002,2004
+/* O_*, F_*, FD_* bit values for Linux.
+ =A0 Copyright (C) 1995-1999, 2000, 2002, 2004, 2010, 2011
=A0 =A0Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.

@@ -29,7 +29,7 @@


=A0/* open/fcntl - O_SYNC is only implemented on blocks devices and on =
files
- =A0 located on an ext2 file system */
+ =A0 located on a few file systems. =A0*/
=A0#define O_ACCMODE =A0 =A0 =A0 =A0 0003
=A0#define O_RDONLY =A0 =A0 =A0 =A0 =A0 =A000
=A0#define O_WRONLY =A0 =A0 =A0 =A0 =A0 =A001
@@ -46,13 +46,15 @@
=A0#define O_ASYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 020000
=A0#define O_BLKSEEK =A0 =A0 =A000000100 /* HPUX only */

-#ifdef __USE_GNU
-# define O_DIRECT =A0 =A0 =A0000040000 /* Direct disk access. =A0*/
+#ifdef __USE_XOPEN2K8
=A0# define O_DIRECTORY =A0 000010000 /* Must be a directory. =A0*/
=A0# define O_NOFOLLOW =A0 =A0000000200 /* Do not follow links. =A0*/
-# define O_NOATIME =A0 =A0 004000000 /* Do not set atime. =A0*/
=A0# define O_CLOEXEC =A0 =A0 010000000 /* Set close_on_exec. =A0*/
=A0#endif
+#ifdef __USE_GNU
+# define O_DIRECT =A0 =A0 =A0 040000 /* Direct disk access. =A0*/
+# define O_NOATIME =A0 =A0 004000000 /* Do not set atime. =A0*/
+#endif

=A0/* For now Linux has synchronisity options for data and read operati=
ons.
=A0 =A0We define the symbols here but let them do the same as O_SYNC si=
nce
@@ -85,7 +87,7 @@
=A0#define F_SETLK64 =A0 =A0 =A09 =A0 =A0 =A0 /* Set record locking inf=
o (non-blocking). =A0*/
=A0#define F_SETLKW64 =A0 =A0 10 =A0 =A0 =A0/* Set record locking info =
(blocking). =A0*/

-#if defined __USE_BSD || defined __USE_UNIX98
+#if defined __USE_BSD || defined __USE_UNIX98 || defined __USE_XOPEN2K=
8
=A0# define F_GETOWN =A0 =A0 =A011 =A0 =A0 =A0/* Get owner of socket (r=
eceiver of SIGIO). =A0*/
=A0# define F_SETOWN =A0 =A0 =A012 =A0 =A0 =A0/* Set owner of socket (r=
eceiver of SIGIO). =A0*/
=A0#endif
@@ -101,6 +103,10 @@
=A0# define F_SETLEASE =A0 =A01024 =A0 =A0/* Set a lease. =A0*/
=A0# define F_GETLEASE =A0 =A01025 =A0 =A0/* Enquire what lease is acti=
ve. =A0*/
=A0# define F_NOTIFY =A0 =A0 =A01026 =A0 =A0/* Request notfications on =
a directory. =A0*/
+# define F_SETPIPE_SZ =A01031 =A0 =A0/* Set pipe page size array. =A0*=
/
+# define F_GETPIPE_SZ =A01032 =A0 =A0/* Set pipe page size array. =A0*=
/
+#endif
+#ifdef __USE_XOPEN2K8
=A0# define F_DUPFD_CLOEXEC 1030 =A0/* Duplicate file descriptor with
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clo=
se-on-exit set. =A0*/
=A0#endif
@@ -227,6 +233,19 @@ struct f_owner_ex
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 we splice from/to). =A0*/
=A0# define SPLICE_F_MORE =A0 =A0 =A0 =A0 4 =A0 =A0 =A0 /* Expect more =
data. =A0*/
=A0# define SPLICE_F_GIFT =A0 =A0 =A0 =A0 8 =A0 =A0 =A0 /* Pages passed=
 in are a gift. =A0*/
+
+
+/* File handle structure. =A0*/
+struct file_handle
+{
+ =A0unsigned int handle_bytes;
+ =A0int handle_type;
+ =A0/* File identifier. =A0*/
+ =A0unsigned char f_handle[0];
+};
+
+/* Maximum handle size (for now). =A0*/
+# define MAX_HANDLE_SZ 128
=A0#endif

=A0__BEGIN_DECLS
@@ -243,20 +262,32 @@ extern int sync_file_range (int __fd, __off64_t
__offset, __off64_t __count,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int __f=
lags);


-/* Splice address range into a pipe. =A0*/
+/* Splice address range into a pipe.
+
+ =A0 This function is a possible cancellation point and therefore not
+ =A0 marked with __THROW. =A0*/
=A0extern ssize_t vmsplice (int __fdout, const struct iovec *__iov,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t __count, unsigne=
d int __flags);

-/* Splice two files together. =A0*/
+/* Splice two files together.
+
+ =A0 This function is a possible cancellation point and therefore not
+ =A0 marked with __THROW. =A0*/
=A0extern ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __off64_t *__offout, size_t=
 __len,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int __flags);

-/* In-kernel implementation of tee for pipe buffers. =A0*/
+/* In-kernel implementation of tee for pipe buffers.
+
+ =A0 This function is a possible cancellation point and therefore not
+ =A0 marked with __THROW. =A0*/
=A0extern ssize_t tee (int __fdin, int __fdout, size_t __len,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int __flags);

-/* Reserve storage for the data of the file associated with FD. =A0*/
+/* Reserve storage for the data of the file associated with FD.
+
+ =A0 This function is a possible cancellation point and therefore not
+ =A0 marked with __THROW. =A0*/
=A0# ifndef __USE_FILE_OFFSET64
=A0extern int fallocate (int __fd, int __mode, __off_t __offset, __off_=
t __len);
=A0# else
@@ -273,6 +304,19 @@ extern int fallocate64 (int __fd, int __mode,
__off64_t __offset,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__off64_t __len);
=A0# endif

+
+/* Map file name to file handle. =A0*/
+extern int name_to_handle_at (int __dfd, const char *__name,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct file_h=
andle *__handle, int *__mnt_id,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int __flags) =
__THROW;
+
+/* Open file using the file handle.
+
+ =A0 This function is a possible cancellation point and therefore not
+ =A0 marked with __THROW. =A0*/
+extern int open_by_handle_at (int __mountdirfd, struct file_handle *__=
handle,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int __flags);
+
=A0#endif

=A0__END_DECLS

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D5ce24e77ed89f2a6c11175e3798050246dfd9c04

commit 5ce24e77ed89f2a6c11175e3798050246dfd9c04
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:30:56 2011 -0400

=A0 =A0Add hidden aliases for fenv.h functions.

=A0 =A0Add hidden aliases for fegetenv, feupdateenv, and
=A0 =A0ftestexcept. This avoids libc needing to go through
=A0 =A0the PLT for these functions.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@codesourcery.com>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 91ddf8d..41a779e 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,11 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/hppa/fpu/fegetenv.c: Add hidden alias.
+ =A0 =A0 =A0 * sysdeps/hppa/fpu/feupdateenv.c: Likewise.
+ =A0 =A0 =A0 * sysdeps/hppa/fpu/ftestexcept.c: Likewise.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/hppa/dl-tls.h: Update copyright year.
=A0 =A0 =A0 =A0Define TLS_DTV_UNALLOCATED.

diff --git a/sysdeps/hppa/fpu/fegetenv.c b/sysdeps/hppa/fpu/fegetenv.c
index fcf5d2d..aab3431 100644
--- a/sysdeps/hppa/fpu/fegetenv.c
+++ b/sysdeps/hppa/fpu/fegetenv.c
@@ -1,5 +1,5 @@
=A0/* Store current floating-point environment.
- =A0 Copyright (C) 2000 Free Software Foundation, Inc.
+ =A0 Copyright (C) 2000, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.
=A0 =A0Contributed by David Huggins-Daines <dhd@debian.org>, 2000

@@ -33,3 +33,4 @@ fegetenv (fenv_t *envp)
=A0 memcpy(envp, buf, sizeof (*envp));
=A0 return 0;
=A0}
+libm_hidden_def (fegetenv)
diff --git a/sysdeps/hppa/fpu/feupdateenv.c b/sysdeps/hppa/fpu/feupdate=
env.c
index 1714006..6e1d5d4 100644
--- a/sysdeps/hppa/fpu/feupdateenv.c
+++ b/sysdeps/hppa/fpu/feupdateenv.c
@@ -1,5 +1,5 @@
=A0/* Install given floating-point environment and raise exceptions.
- =A0 Copyright (C) 2000 Free Software Foundation, Inc.
+ =A0 Copyright (C) 2000, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.
=A0 =A0Contributed by David Huggins-Daines <dhd@debian.org>, 2000

@@ -38,3 +38,4 @@ feupdateenv (const fenv_t *envp)
=A0 /* Success. =A0*/
=A0 return 0;
=A0}
+libm_hidden_def (feupdateenv)
diff --git a/sysdeps/hppa/fpu/ftestexcept.c b/sysdeps/hppa/fpu/ftestexc=
ept.c
index ac6d4b2..c031ffe 100644
--- a/sysdeps/hppa/fpu/ftestexcept.c
+++ b/sysdeps/hppa/fpu/ftestexcept.c
@@ -1,5 +1,5 @@
=A0/* Test exception in current environment.
- =A0 Copyright (C) 2000 Free Software Foundation, Inc.
+ =A0 Copyright (C) 2000, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.
=A0 =A0Contributed by David Huggins-Daines <dhd@debian.org>, 2000

@@ -32,3 +32,4 @@ fetestexcept (int excepts)

=A0 return (s.sw[0] >> 27) & excepts & FE_ALL_EXCEPT;
=A0}
+libm_hidden_def (fetestexcept)

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D2ab0965cb022dfdbd397eb88f96447393b4118b7

commit 2ab0965cb022dfdbd397eb88f96447393b4118b7
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:21:00 2011 -0400

=A0 =A0Define TLS_DTV_UNALLOCATED for hppa.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 3913e61..91ddf8d 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,10 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/hppa/dl-tls.h: Update copyright year.
+ =A0 =A0 =A0 Define TLS_DTV_UNALLOCATED.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/hppa/elf/configure.in: Always test for TLS sup=
port
=A0 =A0 =A0 =A0and error out if missing.
=A0 =A0 =A0 =A0* sysdeps/hppa/elf/configure: Regenerate.
diff --git a/sysdeps/hppa/dl-tls.h b/sysdeps/hppa/dl-tls.h
index 1bc9aae..91c3d44 100644
--- a/sysdeps/hppa/dl-tls.h
+++ b/sysdeps/hppa/dl-tls.h
@@ -1,5 +1,5 @@
=A0/* Thread-local storage handling in the ELF dynamic linker. =A0hppa =
version.
- =A0 Copyright (C) 2003 Free Software Foundation, Inc.
+ =A0 Copyright (C) 2003, 2011 Free Software Foundation, Inc.
=A0 =A0This file is part of the GNU C Library.

=A0 =A0The GNU C Library is free software; you can redistribute it and/=
or
@@ -27,3 +27,6 @@ typedef struct


=A0extern void *__tls_get_addr (tls_index *ti);
+
+/* Value used for dtv entries for which the allocation is delayed. =A0=
*/
+#define TLS_DTV_UNALLOCATED =A0 =A0((void *) -1l)

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3D451398f8b87c2a7c6bed7d6650a6cfbca43f9189

commit 451398f8b87c2a7c6bed7d6650a6cfbca43f9189
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 14:15:51 2011 -0400

=A0 =A0Always test for TLS support.

=A0 =A0Always test for TLS support on hppa and raise
=A0 =A0an error if the TLS support is missing.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index e37a630..3913e61 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,5 +1,12 @@
=A02011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>

+ =A0 =A0 =A0 * sysdeps/hppa/elf/configure.in: Always test for TLS supp=
ort
+ =A0 =A0 =A0 and error out if missing.
+ =A0 =A0 =A0 * sysdeps/hppa/elf/configure: Regenerate.
+ =A0 =A0 =A0 * sysdeps/hppa/configure: Regenerate.
+
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
=A0 =A0 =A0 =A0* sysdeps/hppa/nptl/tls.h: Update copyright year.
=A0 =A0 =A0 =A0Remove HAVE_TLS_SUPPORT check.

diff --git a/sysdeps/hppa/configure b/sysdeps/hppa/configure
index b50ec17..aafc420 100644
--- a/sysdeps/hppa/configure
+++ b/sysdeps/hppa/configure
@@ -1,19 +1,101 @@
+
+# as_fn_set_status STATUS
+# -----------------------
+# Set $? to STATUS, without forking.
+as_fn_set_status ()
+{
+ =A0return $1
+} # as_fn_set_status
+
+# as_fn_exit STATUS
+# -----------------
+# Exit the shell with STATUS, even in a "trap 0" or "set -e" context.
+as_fn_exit ()
+{
+ =A0set +e
+ =A0as_fn_set_status $1
+ =A0exit $1
+} # as_fn_exit
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+ =A0 test "X`expr 00001 : '.*\(...\)'`" =3D X001; then
+ =A0as_expr=3Dexpr
+else
+ =A0as_expr=3Dfalse
+fi
+
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" =3D=
 "X/"; then
+ =A0as_basename=3Dbasename
+else
+ =A0as_basename=3Dfalse
+fi
+
+as_me=3D`$as_basename -- "$0" ||
+$as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
+ =A0 =A0 =A0 =A0X"$0" : 'X\(//\)$' \| \
+ =A0 =A0 =A0 =A0X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+ =A0 =A0sed '/^.*\/\([^/][^/]*\)\/*$/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 /^X\/\(\/\/\)$/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 /^X\/\(\/\).*/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 s/.*/./; q'`
+
+
+ =A0as_lineno_1=3D$LINENO as_lineno_1a=3D$LINENO
+ =A0as_lineno_2=3D$LINENO as_lineno_2a=3D$LINENO
+ =A0eval 'test "x$as_lineno_1'$as_run'" !=3D "x$as_lineno_2'$as_run'" =
&&
+ =A0test "x`expr $as_lineno_1'$as_run' + 1`" =3D "x$as_lineno_2'$as_ru=
n'"' || {
+ =A0# Blame Lee E. McMahon (1931-1989) for sed's syntax. =A0:-)
+ =A0sed -n '
+ =A0 =A0p
+ =A0 =A0/[$]LINENO/=3D
+ =A0' <$as_myself |
+ =A0 =A0sed '
+ =A0 =A0 =A0s/[$]LINENO.*/&-/
+ =A0 =A0 =A0t lineno
+ =A0 =A0 =A0b
+ =A0 =A0 =A0:lineno
+ =A0 =A0 =A0N
+ =A0 =A0 =A0:loop
+ =A0 =A0 =A0s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
+ =A0 =A0 =A0t loop
+ =A0 =A0 =A0s/-\n.*//
+ =A0 =A0' >$as_me.lineno &&
+ =A0chmod +x "$as_me.lineno" ||
+ =A0 =A0{ $as_echo "$as_me: error: cannot create $as_me.lineno; rerun
with a POSIX shell" >&2; as_fn_exit 1; }
+
+ =A0# Don't try to exec as it changes $[0], causing all sort of proble=
ms
+ =A0# (the dirname of $[0] is not the place where we might find the
+ =A0# original and so on. =A0Autoconf is especially sensitive to this)=
=2E
+ =A0. "./$as_me.lineno"
+ =A0# Exit status is that of the last command.
+ =A0exit
+}
+
=A0# This file is generated from configure.in by Autoconf. =A0DO NOT ED=
IT!

-{ echo "$as_me:$LINENO: checking for assembler line separator" >&5
-echo $ECHO_N "checking for assembler line separator... $ECHO_C" >&6; }
-if test "${libc_cv_asm_line_sep+set}" =3D set; then
- =A0echo $ECHO_N "(cached) $ECHO_C" >&6
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for assembler line
separator" >&5
+$as_echo_n "checking for assembler line separator... " >&6; }
+if test "${libc_cv_asm_line_sep+set}" =3D set; then :
+ =A0$as_echo_n "(cached) " >&6
=A0else
=A0 cat > conftest.s <<EOF
=A0nop ; is_old_puffin
=A0EOF
=A0if { ac_try=3D'${CC-cc} -c $ASFLAGS conftest.s 1>&5'
- =A0{ (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+ =A0{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >=
&5
=A0 (eval $ac_try) 2>&5
=A0 ac_status=3D$?
- =A0echo "$as_me:$LINENO: \$? =3D $ac_status" >&5
- =A0(exit $ac_status); }; }; then
+ =A0$as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
+ =A0test $ac_status =3D 0; }; }; then
=A0 libc_cv_asm_line_sep=3D'!'
=A0else
=A0 if test -z "$enable_hacker_mode"; then
@@ -25,8 +107,8 @@ else
=A0fi
=A0rm -f conftest*
=A0fi
-{ echo "$as_me:$LINENO: result: $libc_cv_asm_line_sep" >&5
-echo "${ECHO_T}$libc_cv_asm_line_sep" >&6; }
+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_asm_line_sep=
" >&5
+$as_echo "$libc_cv_asm_line_sep" >&6; }
=A0cat >>confdefs.h <<_ACEOF
=A0#define ASM_LINE_SEP $libc_cv_asm_line_sep
=A0_ACEOF
diff --git a/sysdeps/hppa/elf/configure b/sysdeps/hppa/elf/configure
old mode 100644
new mode 100755
index ba69990..4df64a8
--- a/sysdeps/hppa/elf/configure
+++ b/sysdeps/hppa/elf/configure
@@ -1,13 +1,94 @@
+
+# as_fn_set_status STATUS
+# -----------------------
+# Set $? to STATUS, without forking.
+as_fn_set_status ()
+{
+ =A0return $1
+} # as_fn_set_status
+
+# as_fn_exit STATUS
+# -----------------
+# Exit the shell with STATUS, even in a "trap 0" or "set -e" context.
+as_fn_exit ()
+{
+ =A0set +e
+ =A0as_fn_set_status $1
+ =A0exit $1
+} # as_fn_exit
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+ =A0 test "X`expr 00001 : '.*\(...\)'`" =3D X001; then
+ =A0as_expr=3Dexpr
+else
+ =A0as_expr=3Dfalse
+fi
+
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" =3D=
 "X/"; then
+ =A0as_basename=3Dbasename
+else
+ =A0as_basename=3Dfalse
+fi
+
+as_me=3D`$as_basename -- "$0" ||
+$as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
+ =A0 =A0 =A0 =A0X"$0" : 'X\(//\)$' \| \
+ =A0 =A0 =A0 =A0X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+ =A0 =A0sed '/^.*\/\([^/][^/]*\)\/*$/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 /^X\/\(\/\/\)$/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 /^X\/\(\/\).*/{
+ =A0 =A0 =A0 =A0 =A0 s//\1/
+ =A0 =A0 =A0 =A0 =A0 q
+ =A0 =A0 =A0 =A0 }
+ =A0 =A0 =A0 =A0 s/.*/./; q'`
+
+
+ =A0as_lineno_1=3D$LINENO as_lineno_1a=3D$LINENO
+ =A0as_lineno_2=3D$LINENO as_lineno_2a=3D$LINENO
+ =A0eval 'test "x$as_lineno_1'$as_run'" !=3D "x$as_lineno_2'$as_run'" =
&&
+ =A0test "x`expr $as_lineno_1'$as_run' + 1`" =3D "x$as_lineno_2'$as_ru=
n'"' || {
+ =A0# Blame Lee E. McMahon (1931-1989) for sed's syntax. =A0:-)
+ =A0sed -n '
+ =A0 =A0p
+ =A0 =A0/[$]LINENO/=3D
+ =A0' <$as_myself |
+ =A0 =A0sed '
+ =A0 =A0 =A0s/[$]LINENO.*/&-/
+ =A0 =A0 =A0t lineno
+ =A0 =A0 =A0b
+ =A0 =A0 =A0:lineno
+ =A0 =A0 =A0N
+ =A0 =A0 =A0:loop
+ =A0 =A0 =A0s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
+ =A0 =A0 =A0t loop
+ =A0 =A0 =A0s/-\n.*//
+ =A0 =A0' >$as_me.lineno &&
+ =A0chmod +x "$as_me.lineno" ||
+ =A0 =A0{ $as_echo "$as_me: error: cannot create $as_me.lineno; rerun
with a POSIX shell" >&2; as_fn_exit 1; }
+
+ =A0# Don't try to exec as it changes $[0], causing all sort of proble=
ms
+ =A0# (the dirname of $[0] is not the place where we might find the
+ =A0# original and so on. =A0Autoconf is especially sensitive to this)=
=2E
+ =A0. "./$as_me.lineno"
+ =A0# Exit status is that of the last command.
+ =A0exit
+}
+
=A0# This file is generated from configure.in by Autoconf. =A0DO NOT ED=
IT!
=A0# Local configure fragment for sysdeps/hppa/elf.

-if test "$usetls" !=3D no; then
=A0# Check for support of thread-local storage handling in assembler an=
d
=A0# linker.
-{ echo "$as_me:$LINENO: checking for hppa TLS support" >&5
-echo $ECHO_N "checking for hppa TLS support... $ECHO_C" >&6; }
-if test "${libc_cv_hppa_tls+set}" =3D set; then
- =A0echo $ECHO_N "(cached) $ECHO_C" >&6
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for hppa TLS support=
" >&5
+$as_echo_n "checking for hppa TLS support... " >&6; }
+if test "${libc_cv_hppa_tls+set}" =3D set; then :
+ =A0$as_echo_n "(cached) " >&6
=A0else
=A0 cat > conftest.s <<\EOF
=A0; Setup tls data
@@ -41,23 +122,19 @@ test3:
=A0; Done all the TLS tests.
=A0EOF
=A0if { ac_try=3D'${CC-cc} -c $CFLAGS conftest.s 1>&5'
- =A0{ (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+ =A0{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >=
&5
=A0 (eval $ac_try) 2>&5
=A0 ac_status=3D$?
- =A0echo "$as_me:$LINENO: \$? =3D $ac_status" >&5
- =A0(exit $ac_status); }; }; then
+ =A0$as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
+ =A0test $ac_status =3D 0; }; }; then
=A0 libc_cv_hppa_tls=3Dyes
=A0else
=A0 libc_cv_hppa_tls=3Dno
=A0fi
=A0rm -f conftest*
=A0fi
-{ echo "$as_me:$LINENO: result: $libc_cv_hppa_tls" >&5
-echo "${ECHO_T}$libc_cv_hppa_tls" >&6; }
-if test $libc_cv_hppa_tls =3D yes; then
- =A0cat >>confdefs.h <<\_ACEOF
-#define HAVE_TLS_SUPPORT 1
-_ACEOF
-
-fi
+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_hppa_tls" >&=
5
+$as_echo "$libc_cv_hppa_tls" >&6; }
+if test $libc_cv_hppa_tls =3D no; then
+ =A0as_fn_error $? "the assembler must support TLS" "$LINENO" 5
=A0fi
diff --git a/sysdeps/hppa/elf/configure.in b/sysdeps/hppa/elf/configure=
=2Ein
index 1b70a5b..e31c880 100644
--- a/sysdeps/hppa/elf/configure.in
+++ b/sysdeps/hppa/elf/configure.in
@@ -1,7 +1,6 @@
=A0GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
=A0# Local configure fragment for sysdeps/hppa/elf.

-if test "$usetls" !=3D no; then
=A0# Check for support of thread-local storage handling in assembler an=
d
=A0# linker.
=A0AC_CACHE_CHECK(for hppa TLS support, libc_cv_hppa_tls, [dnl
@@ -43,7 +42,6 @@ else
=A0 libc_cv_hppa_tls=3Dno
=A0fi
=A0rm -f conftest*])
-if test $libc_cv_hppa_tls =3D yes; then
- =A0AC_DEFINE(HAVE_TLS_SUPPORT)
-fi
+if test $libc_cv_hppa_tls =3D no; then
+ =A0AC_MSG_ERROR([the assembler must support TLS])
=A0fi

http://sources.redhat.com/git/gitweb.cgi?p=3Dglibc-ports.git;a=3Dcommit=
diff;h=3Dab653f4dbe37d6244057f3f2ab33078357b6d708

commit ab653f4dbe37d6244057f3f2ab33078357b6d708
Author: Carlos O'Donell <carlos@systemhalted.org>
Date: =A0 Thu Oct 20 11:42:02 2011 -0400

=A0 =A0Remove check for HAVE_TLS_SUPPORT

=A0 =A0TLS support is now required, remove checks.

=A0 =A0Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index f19c693..e37a630 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,4 +1,9 @@
-2011-10-17 =A0Guy Martin <gmsoft@tuxicoman.be>
+2011-10-20 =A0Carlos O'Donell =A0<carlos@systemhalted.org>
+
+ =A0 =A0 =A0 * sysdeps/hppa/nptl/tls.h: Update copyright year.
+ =A0 =A0 =A0 Remove HAVE_TLS_SUPPORT check.
+
+2011-10-17 =A0Guy Martin =A0<gmsoft@tuxicoman.be>

=A0 =A0 =A0 =A0* sysdeps/unix/sysv/linux/hppa/sys/epoll.h
=A0 =A0 =A0 =A0Fix EPOLL_CLOEXEC and EPOLL_NONBLOCK to match kernel def=
inition.
diff --git a/sysdeps/hppa/nptl/tls.h b/sysdeps/hppa/nptl/tls.h
index 389cbb9..8af7504 100644
--- a/sysdeps/hppa/nptl/tls.h
+++ b/sysdeps/hppa/nptl/tls.h
@@ -1,5 +1,5 @@
=A0/* Definition for thread-local data handling. =A0NPTL/hppa version.
- =A0 Copyright (C) 2005, 2007, 2010 Free Software Foundation, Inc.
+ =A0 Copyright (C) 2005, 2007, 2010, 2011 Free Software Foundation, In=
c.
=A0 =A0This file is part of the GNU C Library.

=A0 =A0The GNU C Library is free software; you can redistribute it and/=
or
@@ -42,12 +42,6 @@ typedef union dtv
=A0# include <tcb-offsets.h>
=A0#endif /* __ASSEMBLER__ */

-
-/* We require TLS support in the tools. =A0*/
-#ifndef HAVE_TLS_SUPPORT
-# error "TLS support is required."
-#endif
-
=A0/* Signal that TLS support is available. =A0*/
=A0#define USE_TLS =A0 =A0 =A0 =A01


-----------------------------------------------------------------------

Summary of changes:
=A0ChangeLog.hppa =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 66 ++++++-
=A0sysdeps/hppa/configure =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0100 ++++++++-
=A0sysdeps/hppa/dl-tls.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A05 +-
=A0sysdeps/hppa/elf/configure =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0109 ++++++++--
=A0sysdeps/hppa/elf/configure.in =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A06 +-
=A0sysdeps/hppa/fpu/fegetenv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A03 +-
=A0sysdeps/hppa/fpu/feupdateenv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 +-
=A0sysdeps/hppa/fpu/ftestexcept.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 +-
=A0sysdeps/hppa/linuxthreads/pspinlock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 82 -------
=A0sysdeps/hppa/linuxthreads/pt-machine.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
134 -----------
=A0sysdeps/hppa/linuxthreads/tls.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0163 -------------
=A0sysdeps/hppa/nptl/tls.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A08 +-
=A0sysdeps/hppa/stackinfo.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A08 +-
=A0sysdeps/unix/sysv/linux/hppa/bits/fcntl.h =A0 =A0 =A0 =A0 =A0| =A0 6=
6 +++++-
=A0.../unix/sysv/linux/hppa/linuxthreads/aio_cancel.c | =A0 33 ---
=A0.../sysv/linux/hppa/linuxthreads/bits/initspin.h =A0 | =A0 41 ----
=A0.../linux/hppa/linuxthreads/bits/pthreadtypes.h =A0 =A0| =A0159 ----=
---------
=A0.../sysv/linux/hppa/linuxthreads/malloc-machine.h =A0| =A0 73 ------
=A0.../sysv/linux/hppa/linuxthreads/pt-initfini.c =A0 =A0 | =A0109 ----=
-----
=A0.../sysv/linux/hppa/linuxthreads/sysdep-cancel.h =A0 | =A0242 ------=
--------------
=A0sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h =A0| =A0 84 ++++++=
--
=A021 files changed, 394 insertions(+), 1103 deletions(-)
=A0mode change 100644 =3D> 100755 sysdeps/hppa/elf/configure
=A0delete mode 100644 sysdeps/hppa/linuxthreads/pspinlock.c
=A0delete mode 100644 sysdeps/hppa/linuxthreads/pt-machine.h
=A0delete mode 100644 sysdeps/hppa/linuxthreads/tls.h
=A0delete mode 100644 sysdeps/unix/sysv/linux/hppa/linuxthreads/aio_can=
cel.c
=A0delete mode 100644 sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/in=
itspin.h
=A0delete mode 100644
sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtypes.h
=A0delete mode 100644 sysdeps/unix/sysv/linux/hppa/linuxthreads/malloc-=
machine.h
=A0delete mode 100644 sysdeps/unix/sysv/linux/hppa/linuxthreads/pt-init=
fini.c
=A0delete mode 100644 sysdeps/unix/sysv/linux/hppa/linuxthreads/sysdep-=
cancel.h


hooks/post-receive
--
Community source repository for glibc add-on ports
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
