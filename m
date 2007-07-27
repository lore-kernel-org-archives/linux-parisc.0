From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] [PATCH] Fix hppa glibc build in HEAD and
	glibc-2_6-branch
Date: Fri, 27 Jul 2007 20:34:53 +0200
Message-ID: <20070727183453.GL32467__25389.6479066045$1416624419$gmane$org@hall.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: libc-ports@sourceware.org
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

The patch below is necessary to make the hppa glibc buildable in HEAD
and glibc-2_6-branch wrt recent changes that have been done in NPTL
code.


2007-07-27  Aurelien Jarno  <aurelien@aurel32.net>

	* sysdeps/hppa/nptl/tls.h (THREAD_GSCOPE_FLAG_UNUSED,
	THREAD_GSCOPE_FLAG_USED, THREAD_GSCOPE_FLAG_WAIT): Define.
	(THREAD_GSCOPE_RESET_FLAG, THREAD_GSCOPE_SET_FLAG,
	THREAD_GSCOPE_WAIT): Define.

--- ports/sysdeps/hppa/nptl/tls.h.orig	2007-07-27 08:17:35.000000000 -0600
+++ ports/sysdeps/hppa/nptl/tls.h	2007-07-27 08:18:39.000000000 -0600
@@ -147,6 +147,29 @@
 	: : "r" (cr27) : "r26" );
 }
 
+/* Get and set the global scope generation counter in struct pthread.  */
+#define THREAD_GSCOPE_FLAG_UNUSED 0
+#define THREAD_GSCOPE_FLAG_USED   1
+#define THREAD_GSCOPE_FLAG_WAIT   2
+#define THREAD_GSCOPE_RESET_FLAG() \
+  do									     \
+    { int __res								     \
+	= atomic_exchange_rel (&THREAD_SELF->header.gscope_flag,	     \
+			       THREAD_GSCOPE_FLAG_UNUSED);		     \
+      if (__res == THREAD_GSCOPE_FLAG_WAIT)				     \
+	lll_futex_wake (&THREAD_SELF->header.gscope_flag, 1);		     \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_SET_FLAG() \
+  do									     \
+    {									     \
+      THREAD_SELF->header.gscope_flag = THREAD_GSCOPE_FLAG_USED;	     \
+      atomic_write_barrier ();						     \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_WAIT() \
+  GL(dl_wait_lookup_done) ()
+
 #endif /* __ASSEMBLER__ */
 
 #endif	/* tls.h */

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
