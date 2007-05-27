From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] Wire up
	utimensat/signalfd/timerfd/eventfd syscalls
Date: Sun, 27 May 2007 21:15:49 +0200
Message-ID: <200705272115.49834.deller__25515.4867460535$1416624371$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

[PARISC] Wire up utimensat/signalfd/timerfd/eventfd syscalls and mark select/fadvise64/utimes to be ignored by checksyscalls.sh

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 7e04db6..627f3c2 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -401,6 +401,11 @@
 	ENTRY_COMP(statfs64)
 	ENTRY_COMP(fstatfs64)
 	ENTRY_COMP(kexec_load)		/* 300 */
+	ENTRY_COMP(utimensat)
+	ENTRY_COMP(signalfd)
+	ENTRY_COMP(timerfd)
+	ENTRY_SAME(eventfd)
+
 	/* Nothing yet */
 
 #undef ENTRY_SAME
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index 693743f..f74099b 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -793,8 +793,18 @@
 #define __NR_statfs64		(__NR_Linux + 298)
 #define __NR_fstatfs64		(__NR_Linux + 299)
 #define __NR_kexec_load		(__NR_Linux + 300)
+#define __NR_utimensat		(__NR_Linux + 301)
+#define __NR_signalfd		(__NR_Linux + 302)
+#define __NR_timerfd		(__NR_Linux + 303)
+#define __NR_eventfd		(__NR_Linux + 304)
+
+#define __NR_Linux_syscalls	(__NR_eventfd + 1)
+
+
+#define __IGNORE_select		/* newselect */
+#define __IGNORE_fadvise64	/* fadvise64_64 */
+#define __IGNORE_utimes		/* utime */
 
-#define __NR_Linux_syscalls     (__NR_kexec_load + 1)
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
 #define LINUX_GATEWAY_ADDR      0x100

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
