Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC647482A
	for <parisc-linux@parisc-linux.org>; Tue, 10 Apr 2001 14:30:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14n4m5-0006H2-00
	for parisc-linux@parisc-linux.org; Tue, 10 Apr 2001 21:30:05 +0100
Date: Tue, 10 Apr 2001 21:30:05 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010410213005.D25123@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] pread/pwrite
List-ID: <linux-parisc.vger.kernel.org>

Could those who're having problems with pread/pwrite try the following patch?

Index: fs/read_write.c
===================================================================
RCS file: /home/cvs/parisc/linux/fs/read_write.c,v
retrieving revision 1.6
diff -u -p -r1.6 read_write.c
--- fs/read_write.c	2000/11/10 21:43:50	1.6
+++ fs/read_write.c	2001/04/10 20:21:01
@@ -315,8 +315,8 @@ bad_file:
    lseek back to original location.  They fail just like lseek does on
    non-seekable files.  */
 
-asmlinkage ssize_t sys_pread(unsigned int fd, char * buf,
-			     size_t count, loff_t pos)
+static inline
+ssize_t do_pread(unsigned int fd, char * buf, size_t count, loff_t pos)
 {
 	ssize_t ret;
 	struct file * file;
@@ -346,8 +346,8 @@ bad_file:
 	return ret;
 }
 
-asmlinkage ssize_t sys_pwrite(unsigned int fd, const char * buf,
-			      size_t count, loff_t pos)
+static inline
+ssize_t do_pwrite(unsigned int fd, const char * buf, size_t count, loff_t pos)
 {
 	ssize_t ret;
 	struct file * file;
@@ -377,3 +377,35 @@ out:
 bad_file:
 	return ret;
 }
+
+#if BITS_PER_LONG == 32
+#ifdef __BIG_ENDIAN
+#define LOFF_T(high, low) unsigned int high, unsigned int low
+#else
+#define LOFF_T(high, low) unsigned int low, unsigned int high
+#endif
+
+asmlinkage
+ssize_t sys_pread(unsigned int fd, char *buf, size_t count, LOFF_T(high, low))
+{
+	return do_pread(fd, buf, count, (loff_t)high << 32 | low);
+}
+
+ssize_t sys_pwrite(unsigned int fd, char *buf, size_t count, LOFF_T(high, low))
+{
+	return do_pwrite(fd, buf, count, (loff_t)high << 32 | low);
+}
+
+
+#else /* BITS_PER_LONG != 32 */
+asmlinkage
+ssize_t sys_pread(unsigned int fd, char *buf, size_t count, loff_t pos)
+{
+	return do_pread(fd, buf, count, pos);
+}
+
+ssize_t sys_pwrite(unsigned int fd, char *buf, size_t count, loff_t pos)
+{
+	return do_pwrite(fd, buf, count, pos);
+}
+#endif

-- 
Revolutions do not require corporate support.
