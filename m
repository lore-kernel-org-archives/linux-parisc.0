From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up userfaultfd syscall
Date: Tue, 8 Sep 2015 15:45:32 +0200
Message-ID: <20150908134532.GA11965@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 2e639d7..e24dcc6 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -358,8 +358,9 @@
 #define __NR_memfd_create	(__NR_Linux + 340)
 #define __NR_bpf		(__NR_Linux + 341)
 #define __NR_execveat		(__NR_Linux + 342)
+#define __NR_userfaultfd	(__NR_Linux + 343)
 
-#define __NR_Linux_syscalls	(__NR_execveat + 1)
+#define __NR_Linux_syscalls	(__NR_userfaultfd + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 8eefb12..2b7db74 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -438,6 +438,7 @@
 	ENTRY_SAME(memfd_create)	/* 340 */
 	ENTRY_SAME(bpf)
 	ENTRY_COMP(execveat)
+	ENTRY_SAME(userfaultfd)
 
 
 .ifne (. - 90b) - (__NR_Linux_syscalls * (91b - 90b))
