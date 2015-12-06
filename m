From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up mlock2 syscall
Date: Sun,  6 Dec 2015 21:57:19 +0100
Message-ID: <1449435439-20306-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/uapi/asm/unistd.h | 3 ++-
 arch/parisc/kernel/syscall_table.S    | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 3317038..35bdccb 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -360,8 +360,9 @@
 #define __NR_execveat		(__NR_Linux + 342)
 #define __NR_membarrier		(__NR_Linux + 343)
 #define __NR_userfaultfd	(__NR_Linux + 344)
+#define __NR_mlock2		(__NR_Linux + 345)
 
-#define __NR_Linux_syscalls	(__NR_userfaultfd + 1)
+#define __NR_Linux_syscalls	(__NR_mlock2 + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 78c3ef8..d4ffcfb 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -440,6 +440,7 @@
 	ENTRY_COMP(execveat)
 	ENTRY_SAME(membarrier)
 	ENTRY_SAME(userfaultfd)
+	ENTRY_SAME(mlock2)		/* 345 */
 
 
 .ifne (. - 90b) - (__NR_Linux_syscalls * (91b - 90b))
-- 
2.1.0

