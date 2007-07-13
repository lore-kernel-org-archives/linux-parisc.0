From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] [PATCH] Fix debugging interface for nptl
Date: Fri, 13 Jul 2007 01:33:56 +0000
Message-ID: <20070713013356.GD16077__1432.00616953454$1416624410$gmane$org@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="CUfgB8w4ZwR/yMy5"
To: parisc-linux@lists.parisc-linux.org,
 libc-ports@sourceware.org
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


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Jeff mentioned recently that with a NPTL-enabled glibc, gdb debugging of
any threaded app fails. For example:

(gdb) run
Starting program: /home/tausq/userspace/thread_test2
[Thread debugging using libthread_db enabled]
Error while reading shared library symbols:
find_new_threads_callback: cannot get thread info: generic error

Two fixes, one in glibc and one in gdb, are required to fix this. The
attached patch is the glibc portion.

2007-07-12  Randolph Chung  <tausq@debian.org>

	* sysdeps/hppa/nptl/tls.h (DB_THREAD_SELF): Fix definition.

Please apply if ok.

randolph

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="local-threaddb.diff"

Fix the register offset for libthread_db to do THREAD_SELF properly.

--- ports/sysdeps/hppa/nptl/tls.h.orig	2007-07-11 22:57:36.000000000 +0000
+++ ports/sysdeps/hppa/nptl/tls.h	2007-07-11 22:57:50.000000000 +0000
@@ -117,10 +117,11 @@
    	__self - 1;				\
    })
 
-/* FIXME */
-/* Magic for libthread_db to know how to do THREAD_SELF.  */
+/* Magic for libthread_db to know how to do THREAD_SELF.
+   Our thread pointer is stored in cr27.  See asm/elf.h for the offset into
+   elf_gregset_t.  The thread descriptor is sizeof (struct pthread) away.  */
 # define DB_THREAD_SELF \
-  REGISTER (32, 32, 32 * 4, -sizeof (struct pthread))
+  REGISTER (32, 32, 53 * 4, -sizeof (struct pthread))
 
 /* Access to data in the thread descriptor is easy.  */
 # define THREAD_GETMEM(descr, member) \

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--CUfgB8w4ZwR/yMy5--
