Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67FE0482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 17:51:44 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id yauwkaaa for parisc-linux@lists.parisc-linux.org; Sat, 19 Jan 2002 17:51:42 -0700
Date: Sat, 19 Jan 2002 16:51:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] journaling filesystem on parisc?
Message-ID: <20020120005117.GK21816@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <15429.47940.937550.926908@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <15429.47940.937550.926908@gargle.gargle.HOWL>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

In reference to a message from Matthias Klose, dated Jan 16:
> Did not see this mentioned on the list or the site. Any experiences on
> hppa? Does XFS work?

well, it does work with some small tweaks.

i've put a patch out at:
ftp://ftp.parisc-linux.org/patches/xfs-1.0.2-hppa-2.4.17-pa11.diff.gz

it seems to work ok here. i've done some kernel compiles and ran
bonnie++ on it.

I'd like to get some comments on some of the magic numbers in the patch,
and then I hope to commit the parisc specific pieces of the patch since
they aren't really xfs specific. (the following three plus exporting
lclear_user)

first, syscall numbers... are these numbers ok?

--- arch/parisc/kernel/syscall.S	2001/12/11 17:14:06	1.74
+++ arch/parisc/kernel/syscall.S	2002/01/20 00:40:33
@@ -593,6 +593,9 @@ sys_call_table:
 	ENTRY_DIFF(ftruncate64)	/* 200 */
 	ENTRY_SAME(getdents64)
 	ENTRY_DIFF(fcntl64)
+	ENTRY_SAME(attrctl)
+	ENTRY_SAME(acl_get)
+	ENTRY_SAME(acl_set)                     /* 205 */
 
 .end
--- include/asm-parisc/unistd.h	2001/10/09 19:43:37	1.23
+++ include/asm-parisc/unistd.h	2002/01/20 00:40:40
@@ -695,8 +695,11 @@
 #define __NR_ftruncate64        (__NR_Linux + 200)
 #define __NR_getdents64         (__NR_Linux + 201)
 #define __NR_fcntl64            (__NR_Linux + 202)
+#define __NR_attrctl            (__NR_Linux + 203)
+#define __NR_acl_get            (__NR_Linux + 204)
+#define __NR_acl_set            (__NR_Linux + 205)
 
-#define __NR_Linux_syscalls     202
+#define __NR_Linux_syscalls     205
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
 #define LINUX_GATEWAY_ADDR      0x100
 
 
and then a new fcntl flag. these are defined differently for i386 and
ia64 (the two officially supported xfs architectures)

--- include/asm-parisc/fcntl.h	2000/11/10 21:44:44	1.2
+++ include/asm-parisc/fcntl.h	2002/01/20 00:40:39
@@ -24,6 +24,7 @@
 #define O_DIRECT	00040000 /* direct disk access hint - currently ignored */
 #define O_DIRECTORY	00010000 /* must be a directory */
 #define O_NOFOLLOW	00000200 /* don't follow links */
+#define O_INVISIBLE     04000000 /* invisible I/O, for DMAPI/XDSM */
 
 #define F_DUPFD		0	/* dup */
 #define F_GETFD		1	/* get f_flags */

have fun! :-)
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
