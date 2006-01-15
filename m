From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [Fwd: [patch/hppa] Floating point exception handling
	patch]
Date: Mon, 16 Jan 2006 07:38:36 +0800
Message-ID: <43CADCFC.60802@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------060606010200030503080808"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

This is a multi-part message in MIME format.
--------------060606010200030503080808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

FYI - James asked me to forward this to the parisc-linux m-l too.

randolph

-------- Original Message --------
Subject: [patch/hppa] Floating point exception handling patch
Date: Sun, 15 Jan 2006 16:44:50 +0800
From: Randolph Chung <randolph@tausq.org>
To: submit@bugs.debian.org
CC: 342545@bugs.debian.org,  debian-hppa@lists.debian.org

Package: glibc
Version: 2.3.5-11
Severity: important
Tags: patch

The attached patch fixes a problem with floating point exception
handling on hppa. This affects packages that use feholdexcept and
fesetenv, such as uic from QT. This patch fixes #342545. Carlos is on
vacation now - I'll ask him to merge this upstream when he returns,
meanwhile perhaps somebody can roll a new glibc package for debian?

randolph



--------------060606010200030503080808
Content-Type: text/plain;
 name="glibc235-hppa-fpu.dpatch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="glibc235-hppa-fpu.dpatch"

#! /bin/sh -e

# DP: Description: hppa floating point exception handling fix
# DP: Related bugs: Debian #342545
# DP: Dpatch author: Randolph Chung <tausq@debian.org>
# DP: Patch author: Randolph Chung <tausq@debian.org>
# DP: Upstream status: Pending
# DP: Status Details: to be merged by Carlos
# DP: Date: Sun, 15 Jan 2006

PATCHLEVEL=1

if [ $# -ne 2 ]; then
    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
    exit 1
fi
case "$1" in
    -patch) patch -d "$2" -f --no-backup-if-mismatch -p$PATCHLEVEL < $0;;
    -unpatch) patch -d "$2" -f --no-backup-if-mismatch -R -p$PATCHLEVEL < $0;;
    *)
	echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
	exit 1
esac
exit 0

# append the patch here and adjust the -p? flag in the patch calls.
diff -uNr glibc-2.3.5/sysdeps/hppa/fpu.orig/fegetenv.c glibc-2.3.5/sysdeps/hppa/fpu/fegetenv.c
--- glibc-2.3.5/sysdeps/hppa/fpu.orig/fegetenv.c	2006-01-14 10:17:19.000000000 -0800
+++ glibc-2.3.5/sysdeps/hppa/fpu/fegetenv.c	2006-01-14 10:19:08.000000000 -0800
@@ -27,10 +27,7 @@
   unsigned long long buf[4], *bufptr = buf;
 
   __asm__ (
-	   "fstd,ma %%fr0,8(%1)\n"
-	   "fstd,ma %%fr1,8(%1)\n"
-	   "fstd,ma %%fr2,8(%1)\n"
-	   "fstd %%fr3,0(%1)\n"
+	   "fstd %%fr0,0(%1)\n"
 	   : "=m" (buf), "+r" (bufptr));
   memcpy (envp, buf, sizeof (*envp));
   return 0;
diff -uNr glibc-2.3.5/sysdeps/hppa/fpu.orig/feholdexcpt.c glibc-2.3.5/sysdeps/hppa/fpu/feholdexcpt.c
--- glibc-2.3.5/sysdeps/hppa/fpu.orig/feholdexcpt.c	2006-01-14 10:17:19.000000000 -0800
+++ glibc-2.3.5/sysdeps/hppa/fpu/feholdexcpt.c	2006-01-14 10:20:21.000000000 -0800
@@ -30,10 +30,7 @@
   /* Store the environment.  */
   bufptr = clear.buf;
   __asm__ (
-	   "fstd,ma %%fr0,8(%1)\n"
-	   "fstd,ma %%fr1,8(%1)\n"
-	   "fstd,ma %%fr2,8(%1)\n"
-	   "fstd %%fr3,0(%1)\n"
+	   "fstd %%fr0,0(%1)\n"
 	   : "=m" (clear), "+r" (bufptr));
   memcpy (envp, &clear.env, sizeof (fenv_t));
 
@@ -47,10 +44,7 @@
   /* Load the new environment. */
   bufptr = clear.buf;
   __asm__ (
-	   "fldd,ma 8(%0),%%fr0\n"
-	   "fldd,ma 8(%0),%%fr1\n"
-	   "fldd,ma 8(%0),%%fr2\n"
-	   "fldd 0(%0),%%fr3\n"
+	   "fldd 0(%0),%%fr0\n"
 	   : : "r" (bufptr), "m" (clear));
 
   return 0;
diff -uNr glibc-2.3.5/sysdeps/hppa/fpu.orig/fesetenv.c glibc-2.3.5/sysdeps/hppa/fpu/fesetenv.c
--- glibc-2.3.5/sysdeps/hppa/fpu.orig/fesetenv.c	2006-01-14 10:17:19.000000000 -0800
+++ glibc-2.3.5/sysdeps/hppa/fpu/fesetenv.c	2006-01-14 10:20:44.000000000 -0800
@@ -34,10 +34,7 @@
      we want to use from the environment specified by the parameter.  */
   bufptr = temp.buf;
   __asm__ (
-	   "fstd,ma %%fr0,8(%1)\n"
-	   "fstd,ma %%fr1,8(%1)\n"
-	   "fstd,ma %%fr2,8(%1)\n"
-	   "fstd %%fr3,0(%1)\n"
+	   "fstd %%fr0,0(%1)\n"
 	   : "=m" (temp), "+r" (bufptr));
 
   temp.env.__status_word &= ~(FE_ALL_EXCEPT
@@ -56,9 +53,6 @@
   /* Load the new environment. */
   bufptr = temp.buf;
   __asm__ (
-	   "fldd,ma -8(%1),%%fr3\n"
-	   "fldd,ma -8(%1),%%fr2\n"
-	   "fldd,ma -8(%1),%%fr1\n"
 	   "fldd 0(%1),%%fr0\n"
 	   : "=m" (temp), "+r" (bufptr));
 



--------------060606010200030503080808
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------060606010200030503080808--
