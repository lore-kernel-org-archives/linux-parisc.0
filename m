From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix fanotify_mark() syscall on 32bit compat kernel
Date: Thu, 10 Jul 2014 18:07:17 +0200
Message-ID: <20140710160717.GA14169@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On parisc we can not use the existing compat implementation for fanotify_mark()
because for the 64bit mask parameter the higher and lower 32bits are ordered
differently than what the compat function expects from big endian
architectures.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index bb9f3b6..93c1963 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2000-2001 Hewlett Packard Company
  * Copyright (C) 2000 John Marvin
  * Copyright (C) 2001 Matthew Wilcox
+ * Copyright (C) 2014 Helge Deller <deller@gmx.de>
  *
  * These routines maintain argument size conversion between 32bit and 64bit
  * environment. Based heavily on sys_ia32.c and sys_sparc32.c.
@@ -57,3 +22,12 @@ asmlinkage long sys32_unimplemented(int r26, int r25, int r24, int r23,
     	current->comm, current->pid, r20);
     return -ENOSYS;
 }
+
+asmlinkage long sys32_fanotify_mark(compat_int_t fanotify_fd, compat_uint_t flags,
+	compat_uint_t mask0, compat_uint_t mask1, compat_int_t dfd,
+	const char  __user * pathname)
+{
+	return sys_fanotify_mark(fanotify_fd, flags,
+			((__u64)mask1 << 32) | mask0,
+			 dfd, pathname);
+}
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index c5fa7a6..84c5d3a 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -418,7 +418,7 @@
 	ENTRY_SAME(accept4)		/* 320 */
 	ENTRY_SAME(prlimit64)
 	ENTRY_SAME(fanotify_init)
-	ENTRY_COMP(fanotify_mark)
+	ENTRY_DIFF(fanotify_mark)
 	ENTRY_COMP(clock_adjtime)
 	ENTRY_SAME(name_to_handle_at)	/* 325 */
 	ENTRY_COMP(open_by_handle_at)
