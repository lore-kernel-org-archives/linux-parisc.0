Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 497A9482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 17:15:39 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BIyGh-00082a-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 19:15:07 -0400
Date: Wed, 28 Apr 2004 19:15:07 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040428231506.GJ6936@baldric.uwo.ca>
References: <20040428231338.BB0124945C3@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040428231338.BB0124945C3@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Apr 28, 2004 at 05:13:38PM -0600, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/04/28 17:13:38
> 
> Modified files:
> 	arch/parisc/kernel: syscall_table.S 
> 	include/asm-parisc: unistd.h 
> 	ipc            : compat_mq.c 
>
> Log message:
> First cut to get mq_* functions working in userspace. 
> Fix CONFIG_POSIX_MQUEUE build. Connect mq_* syscalls. 
> Make our syscall_table match unistd.h definitions. 
> Boots on my A500, testing new glibc build as we speak.

Not too much glue required.

Index: arch/parisc/kernel/syscall_table.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall_table.S,v
retrieving revision 1.6
diff -u -p -r1.6 syscall_table.S
--- a/arch/parisc/kernel/syscall_table.S	29 Mar 2004 12:51:52 -0000	1.6
+++ b/arch/parisc/kernel/syscall_table.S	28 Apr 2004 23:09:07 -0000
@@ -334,3 +334,12 @@
 	ENTRY_SAME(epoll_ctl)		/* 225 */
 	ENTRY_SAME(epoll_wait)
  	ENTRY_SAME(remap_file_pages)
+  ENTRY_SAME(semtimedop)
+  ENTRY_SAME(mq_open)
+  ENTRY_SAME(mq_unlink)   /* 230 */
+  ENTRY_SAME(mq_timedsend)
+  ENTRY_SAME(mq_timedreceive)
+  ENTRY_SAME(mq_notify)
+  ENTRY_SAME(mq_getsetattr)
+  /* Nothing yet */       /* 235 */
+
Index: include/asm-parisc/unistd.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/unistd.h,v
retrieving revision 1.4
diff -u -p -r1.4 unistd.h
--- a/include/asm-parisc/unistd.h	16 Mar 2004 15:40:38 -0000	1.4
+++ b/include/asm-parisc/unistd.h	28 Apr 2004 23:09:07 -0000
@@ -700,30 +700,35 @@
 #define __NR_acl_set            (__NR_Linux + 205)
 #define __NR_gettid             (__NR_Linux + 206)
 #define __NR_readahead          (__NR_Linux + 207)
-#define __NR_tkill		(__NR_Linux + 208)
-#define __NR_sendfile64		(__NR_Linux + 209)
-#define __NR_futex		(__NR_Linux + 210)
-#define __NR_sched_setaffinity	(__NR_Linux + 211)
-#define __NR_sched_getaffinity	(__NR_Linux + 212)
-#define __NR_set_thread_area	(__NR_Linux + 213)
-#define __NR_get_thread_area	(__NR_Linux + 214)
-#define __NR_io_setup		(__NR_Linux + 215)
-#define __NR_io_destroy		(__NR_Linux + 216)
-#define __NR_io_getevents	(__NR_Linux + 217)
-#define __NR_io_submit		(__NR_Linux + 218)
-#define __NR_io_cancel		(__NR_Linux + 219)
-#define __NR_alloc_hugepages	(__NR_Linux + 220)
-#define __NR_free_hugepages	(__NR_Linux + 221)
-#define __NR_exit_group		(__NR_Linux + 222)
-#define __NR_lookup_dcookie	(__NR_Linux + 223)
-#define __NR_epoll_create	(__NR_Linux + 224)
-#define __NR_epoll_ctl		(__NR_Linux + 225)
-#define __NR_epoll_wait		(__NR_Linux + 226)
-#define __NR_remap_file_pages	(__NR_Linux + 227)
-#define __NR_semtimedop		(__NR_Linux + 228)
+#define __NR_tkill              (__NR_Linux + 208)
+#define __NR_sendfile64         (__NR_Linux + 209)
+#define __NR_futex              (__NR_Linux + 210)
+#define __NR_sched_setaffinity  (__NR_Linux + 211)
+#define __NR_sched_getaffinity  (__NR_Linux + 212)
+#define __NR_set_thread_area    (__NR_Linux + 213)
+#define __NR_get_thread_area    (__NR_Linux + 214)
+#define __NR_io_setup           (__NR_Linux + 215)
+#define __NR_io_destroy         (__NR_Linux + 216)
+#define __NR_io_getevents       (__NR_Linux + 217)
+#define __NR_io_submit          (__NR_Linux + 218)
+#define __NR_io_cancel          (__NR_Linux + 219)
+#define __NR_alloc_hugepages    (__NR_Linux + 220)
+#define __NR_free_hugepages     (__NR_Linux + 221)
+#define __NR_exit_group         (__NR_Linux + 222)
+#define __NR_lookup_dcookie     (__NR_Linux + 223)
+#define __NR_epoll_create       (__NR_Linux + 224)
+#define __NR_epoll_ctl          (__NR_Linux + 225)
+#define __NR_epoll_wait         (__NR_Linux + 226)
+#define __NR_remap_file_pages   (__NR_Linux + 227)
+#define __NR_semtimedop         (__NR_Linux + 228)
+#define __NR_mq_open            (__NR_Linux + 229) /* Keep the mq_* syscalls together */
+#define __NR_mq_unlink          (__NR_Linux + 230)
+#define __NR_mq_timedsend       (__NR_Linux + 231)
+#define __NR_mq_timedreceive    (__NR_Linux + 232)
+#define __NR_mq_notify          (__NR_Linux + 233)
+#define __NR_mq_getsetattr      (__NR_Linux + 234)
 
-
-#define __NR_Linux_syscalls     228
+#define __NR_Linux_syscalls     235
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
 #define LINUX_GATEWAY_ADDR      0x100
Index: ipc/compat_mq.c
===================================================================
RCS file: /var/cvs/linux-2.6/ipc/compat_mq.c,v
retrieving revision 1.2
diff -u -p -r1.2 compat_mq.c
--- a/ipc/compat_mq.c	15 Apr 2004 18:05:29 -0000	1.2
+++ b/ipc/compat_mq.c	28 Apr 2004 23:09:07 -0000
@@ -7,6 +7,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/compat_siginfo.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/mqueue.h>
