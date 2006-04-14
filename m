From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] [PATCH] Update linux bits/* for hppa.
Date: Fri, 14 Apr 2006 18:40:15 -0400
Message-ID: <119aab440604141540s103cc86aof9cdb4a2047f4665@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_1644_8100867.1145054415037"
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

------=_Part_1644_8100867.1145054415037
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Update mman.h and fcntl.h for hppa.

This is a new mail setup for me, so please feel free to use a
cluebat if something is malformed.

Ok to checkin?

Cheers,
Carlos.

2006-04-14  Carlos O'Donell  <carlos@systemhalted.org>

=09* sysdeps/unix/sysv/linux/hppa/bits/mman.h [__USE_GNU]:
=09Define MMAP_FIXED.
=09* sysdeps/unix/sysv/linux/hppa/bits/fcntl.h [__USE_GNU]:
=09Define SYNC_FILE_RANGE_WAIT_BEFORE, SYNC_FILE_RANGE_WRITE,
=09SYNC_FILE_RANGE_WAIT_AFTER, sync_file_range, splice, tee.

------=_Part_1644_8100867.1145054415037
Content-Type: text/x-patch; name=patch-fix-linux-bits-2006-04-14.diff;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_em13or4a
Content-Disposition: attachment;
	filename="patch-fix-linux-bits-2006-04-14.diff"

Index: ChangeLog.hppa
===================================================================
RCS file: /cvs/glibc/ports/ChangeLog.hppa,v
retrieving revision 1.2
diff -u -p -r1.2 ChangeLog.hppa
--- ChangeLog.hppa	28 Feb 2006 22:20:13 -0000	1.2
+++ ChangeLog.hppa	14 Apr 2006 22:36:37 -0000
@@ -1,3 +1,11 @@
+2006-04-14  Carlos O'Donell  <carlos@systemhalted.org>
+
+	* sysdeps/unix/sysv/linux/hppa/bits/mman.h [__USE_GNU]: 
+	Define MMAP_FIXED.
+	* sysdeps/unix/sysv/linux/hppa/bits/fcntl.h [__USE_GNU]: 
+	Define SYNC_FILE_RANGE_WAIT_BEFORE, SYNC_FILE_RANGE_WRITE,
+	SYNC_FILE_RANGE_WAIT_AFTER, sync_file_range, splice, tee.
+
 2006-02-28  Roland McGrath  <roland@redhat.com>
 
 	* sysdeps/hppa/shlib-versions: New file.
Index: sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
===================================================================
RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h,v
retrieving revision 1.7
diff -u -p -r1.7 fcntl.h
--- sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	23 Aug 2004 07:28:44 -0000	1.7
+++ sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	14 Apr 2006 22:36:37 -0000
@@ -172,10 +172,38 @@ struct flock64
 # define POSIX_FADV_NOREUSE	5 /* Data will be accessed once.  */
 #endif
 
+#ifdef __USE_GNU
+# define SYNC_FILE_RANGE_WAIT_BEFORE	1 /* Wait upon writeout of all pages
+					     in the range before performing the
+					     write.  */
+# define SYNC_FILE_RANGE_WRITE		2 /* Initiate writeout of all those
+					     dirty pages in the range which are
+					     not presently under writeback.  */
+# define SYNC_FILE_RANGE_WAIT_AFTER	4 /* Wait upon writeout of all pages in
+					     the range after performing the
+					     write.  */
+#endif
+
 __BEGIN_DECLS
 
+#ifdef __USE_GNU
+
 /* Provide kernel hint to read ahead.  */
 extern ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
     __THROW;
 
+/* Selective file content synch'ing.  */
+extern int sync_file_range (int __fd, __off64_t __from, __off64_t __to,
+			    unsigned int __flags);
+
+/* Splice two files together.  */
+extern int splice (int __fdin, int __fdout, size_t __len, unsigned int __flags)
+    __THROW;
+
+/* In-kernel implementation of tee for pipe buffers.  */
+extern int tee (int __fdin, int __fdout, size_t __len, unsigned int __flags)
+    __THROW;
+    
+#endif
+    
 __END_DECLS
Index: sysdeps/unix/sysv/linux/hppa/bits/mman.h
===================================================================
RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/bits/mman.h,v
retrieving revision 1.3
diff -u -p -r1.3 mman.h
--- sysdeps/unix/sysv/linux/hppa/bits/mman.h	25 Sep 2003 16:39:38 -0000	1.3
+++ sysdeps/unix/sysv/linux/hppa/bits/mman.h	14 Apr 2006 22:36:37 -0000
@@ -80,4 +80,7 @@
 /* Flags for `mremap'.  */
 #ifdef __USE_GNU
 # define MREMAP_MAYMOVE 1
+# define MREMAP_FIXED	2
 #endif
+
+


------=_Part_1644_8100867.1145054415037
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_1644_8100867.1145054415037--
