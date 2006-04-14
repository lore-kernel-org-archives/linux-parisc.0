From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] [PATCH] kernel-features.h for hppa
Date: Fri, 14 Apr 2006 18:29:51 -0400
Message-ID: <119aab440604141529p4a9bf2a9r33e6ebbb1138acc9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_1572_1900494.1145053791226"
To: libc-ports@sources.redhat.com,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

------=_Part_1572_1900494.1145053791226
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This keeps hppa up to date on the recent kernel-features.h removal of
all ports arches.

Ok to commit?

Cheers,
Carlos.

2006-04-14  Carlos O'Donell  <carlos@systemhalted.org>

=09* sysdeps/unix/sysv/linux/hppa/kernel-features.h: New file.

------=_Part_1572_1900494.1145053791226
Content-Type: text/x-patch;
	name=patch-import-kernel-features-2006-04-14.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_em13cj7s
Content-Disposition: attachment;
	filename="patch-import-kernel-features-2006-04-14.diff"

Index: ChangeLog.hppa
===================================================================
RCS file: /cvs/glibc/ports/ChangeLog.hppa,v
retrieving revision 1.2
diff -u -p -r1.2 ChangeLog.hppa
--- ChangeLog.hppa	28 Feb 2006 22:20:13 -0000	1.2
+++ ChangeLog.hppa	14 Apr 2006 22:26:30 -0000
@@ -1,3 +1,8 @@
+2006-04-14  Carlos O'Donell  <carlos@systemhalted.org>
+
+	* sysdeps/unix/sysv/linux/hppa/kernel-features.h: New file.
+
+
 2006-02-28  Roland McGrath  <roland@redhat.com>
 
 	* sysdeps/hppa/shlib-versions: New file.
Index: sysdeps/unix/sysv/linux/hppa/kernel-features.h
===================================================================
RCS file: sysdeps/unix/sysv/linux/hppa/kernel-features.h
diff -N sysdeps/unix/sysv/linux/hppa/kernel-features.h
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ sysdeps/unix/sysv/linux/hppa/kernel-features.h	14 Apr 2006 22:26:30 -0000
@@ -0,0 +1,34 @@
+/* Set flags signalling availability of kernel features based on given
+   kernel version number.
+   Copyright (C) 2006 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+
+/* There are an infinite number of PA-RISC kernel versions numbered
+   2.4.0.  But they've not really been released as such.  We require
+   and expect the final version here.  */
+# define __ASSUME_32BITUIDS		1
+# define __ASSUME_TRUNCATE64_SYSCALL	1
+# define __ASSUME_MMAP2_SYSCALL		1
+# define __ASSUME_STAT64_SYSCALL	1
+# define __ASSUME_IPC64			1
+# define __ASSUME_ST_INO_64_BIT		1
+# define __ASSUME_FCNTL64		1
+# define __ASSUME_GETDENTS64_SYSCALL	1
+
+#include_next <kernel-features.h>

------=_Part_1572_1900494.1145053791226
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_1572_1900494.1145053791226--
