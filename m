From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] glibc 2.3.2 for hppa (-rnptl)
Date: Wed, 22 Oct 2003 14:52:31 -0400
Message-ID: <20031022185231.GC26896__1018.53742166913$1416622901$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dan@debian.org
To: Jeff Bailey <jbailey@nisa.net>, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Jeff, Drow,

00list patch provided for -rnptl, and .dpatch url provided.

http://www.baldric.uwo.ca/~carlos/glibc232-hppa-full-nptl-2003-10-22.dpatch

Cheers,
Carlos.

---

2003-10-22  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* debian/patches/00list: Remove all hppa patches, leave 
	glibc23-hppa-Rminkernel, add glibc232-hppa-full-2003-10-22.

Index: 00list
===================================================================
RCS file: /cvs/glibc/glibc-package/debian/patches/Attic/00list,v
retrieving revision 1.1.2.8
diff -u -p -r1.1.2.8 00list
--- 00list	16 Oct 2003 18:25:48 -0000	1.1.2.8
+++ 00list	22 Oct 2003 18:40:19 -0000
@@ -27,8 +27,8 @@ locales-stuff
 #ldso-disable-hwcap - Will be re-enabled when it gets fixed
 librt-mips
 glibc23-ctype-compat
-glibc23-01-hppa-dl-machine
-glibc23-07-hppa-atomicity
+#CAO - Removed 2003-10-22 - glibc23-01-hppa-dl-machine
+#CAO - Removed 2003-10-22 - glibc23-07-hppa-atomicity
 #s390-types
 #glibc23-ia64-strncpy - ok to remove in 2.3.2., but it has string/bug-strncpy.c test code. need to contact to randolph chung.
 glibc23-hppa-Rminkernel
@@ -39,15 +39,15 @@ alpha-pic
 glibc23-cmov
 libgcc-compat-all
 locales-supported
-glibc23-hppa-compat
+#CAO - Removed 2003-10-22 - glibc23-hppa-compat
 libgcc-compat-other
-glibc23-00-hppa-pthreads 
-glibc23-hppa-malloc8
+#CAO - Removed 2003-10-22 - glibc23-00-hppa-pthreads 
+#CAO - Removed 2003-10-22 - glibc23-hppa-malloc8
 s390-tls
 hurd-enable-ldconfig
 30_glibc232-base
 #50_glibc232-mips-buildfix - no longer needed with CVS?  2003-10-07
-50_glibc23-hppa-entry
+#CAO - Removed 2003-10-22 - 50_glibc23-hppa-entry
 sparcv8-target
 #sparc32-buildfix
 50_glibc232-arm-dwarf2-buildfix
@@ -60,3 +60,5 @@ arm-ioperm
 #linuxthreads-big-stacks
 pthread-cleanup
 glibc-make-check-perms
+# CAO - Added 2003-10-22 - All the HPPA fixes
+glibc232-hppa-full-2003-10-22
