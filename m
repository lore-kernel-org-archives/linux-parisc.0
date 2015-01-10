From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up execveat syscall
Date: Sat, 10 Jan 2015 22:01:21 +0100
Message-ID: <20150110210121.GA15738@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 5f5c037..abfa745 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -834,8 +834,9 @@
 #define __NR_getrandom		(__NR_Linux + 339)
 #define __NR_memfd_create	(__NR_Linux + 340)
 #define __NR_bpf		(__NR_Linux + 341)
+#define __NR_execveat		(__NR_Linux + 342)
 
-#define __NR_Linux_syscalls	(__NR_bpf + 1)
+#define __NR_Linux_syscalls	(__NR_execveat + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index fe4f0b8..5a8997d 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -437,6 +437,7 @@
 	ENTRY_SAME(getrandom)
 	ENTRY_SAME(memfd_create)	/* 340 */
 	ENTRY_SAME(bpf)
+	ENTRY_COMP(execveat)
 
 	/* Nothing yet */
 
