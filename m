From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] Missing POSIX_MADV_* defines in bits/mman.h
Date: Wed, 24 May 2006 01:39:30 +0200
Message-ID: <20060524013930.c0b80171.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Wed__24_May_2006_01_39_30_+0200_s/yvmlKUVFcPV_Sj"
To: parisc-linux@lists.parisc-linux.org
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

--Multipart=_Wed__24_May_2006_01_39_30_+0200_s/yvmlKUVFcPV_Sj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

I was wondering why does the hppa glibc misses all the POSIX_MADV_* defines from bits/mman.h and jbailey confirmed that it's a bug and shouldn't be missing.

This trivial copy/paste patch attached fix this lack.


Cheers,
  Guy

--Multipart=_Wed__24_May_2006_01_39_30_+0200_s/yvmlKUVFcPV_Sj
Content-Type: text/x-patch;
 name="glibc-hppa-missing-POSIX_MADV.diff"
Content-Disposition: attachment; filename="glibc-hppa-missing-POSIX_MADV.diff"
Content-Transfer-Encoding: 7bit

Add the missing POSIX bits for memory advisory information and alignment control on hppa.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

diff -uNr glibc-2.3.6.orig/sysdeps/unix/sysv/linux/hppa/bits/mman.h glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/bits/mman.h
--- glibc-2.3.6.orig/sysdeps/unix/sysv/linux/hppa/bits/mman.h	2006-05-23 23:58:44.000000000 +0200
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/bits/mman.h	2006-05-23 23:59:18.000000000 +0200
@@ -81,3 +81,12 @@
 #ifdef __USE_GNU
 # define MREMAP_MAYMOVE 1
 #endif
+
+/* The POSIX people had to invent similar names for the same things.  */
+#ifdef __USE_XOPEN2K
+# define POSIX_MADV_NORMAL	0 /* No further special treatment.  */
+# define POSIX_MADV_RANDOM	1 /* Expect random page references.  */
+# define POSIX_MADV_SEQUENTIAL	2 /* Expect sequential page references.  */
+# define POSIX_MADV_WILLNEED	3 /* Will need these pages.  */
+# define POSIX_MADV_DONTNEED	4 /* Don't need these pages.  */
+#endif

--Multipart=_Wed__24_May_2006_01_39_30_+0200_s/yvmlKUVFcPV_Sj
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Wed__24_May_2006_01_39_30_+0200_s/yvmlKUVFcPV_Sj--
