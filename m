Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB97F482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 04:29:52 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1AEDBB007; Wed, 11 Apr 2001 11:30:39 +0100 (BST)
Date: Wed, 11 Apr 2001 11:30:39 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pread/pwrite
Message-ID: <20010411113039.U6992@linuxcare.com>
References: <20010410213005.D25123@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010410213005.D25123@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, Apr 10, 2001 at 09:30:05PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Hi Willy,

> Could those who're having problems with pread/pwrite try the following patch?

  I don't see how this is supposed to work with a 32 bit userspace and 64
bit kernel.  Do we also need syscall wrappers for pread/pwrite, something
like this:

Index: arch/parisc/kernel/sys_parisc32.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/sys_parisc32.c,v
retrieving revision 1.4
diff -u -r1.4 sys_parisc32.c
--- sys_parisc32.c	2001/04/10 20:05:24	1.4
+++ sys_parisc32.c	2001/04/11 10:18:17
@@ -2727,3 +2727,19 @@
 	}
 	sys_fcntl(fd, cmd, arg);
 }
+
+
+asmlinkage int sys32_pread(int fd, void *buf, size_t count, unsigned int high, unsigned int low)
+{
+	extern asmlinkage ssize_t sys_pread(unsigned int, char *, size_t, loff_t);
+
+	return sys_pread(fd, buf, count, (loff_t)high << 32 | low);
+}
+
+asmlinkage int sys32_pwrite(int fd, void *buf, size_t count, unsigned int high, unsigned int low)
+{
+	extern asmlinkage ssize_t sys_pwrite(unsigned int, char *, size_t, loff_t);
+
+	return sys_pwrite(fd, buf, count, (loff_t)high << 32 | low);
+}
+
Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/syscall.S,v
retrieving revision 1.60
diff -u -r1.60 syscall.S
--- syscall.S	2001/04/10 20:05:24	1.60
+++ syscall.S	2001/04/11 10:18:18
@@ -441,8 +441,8 @@
 	ENTRY_SAME(getitimer)	/* 105 */
 	ENTRY_SAME(capget)
 	ENTRY_SAME(capset)
-	ENTRY_SAME(pread)
-	ENTRY_SAME(pwrite)
+	ENTRY_DIFF(pread)
+	ENTRY_DIFF(pwrite)
 	ENTRY_SAME(getcwd)		/* 110 */
 	ENTRY_SAME(vhangup)
 	ENTRY_SAME(fstat64)
