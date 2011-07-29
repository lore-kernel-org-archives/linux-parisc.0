From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] wire up sysmmsg syscall
Date: Fri, 29 Jul 2011 18:37:02 +0400
Message-ID: <1311950222.8190.43.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: James Bottomley <JBottomley@Parallels.com>

---

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 3392de3..276df1c 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -821,8 +821,10 @@
 #define __NR_open_by_handle_at	(__NR_Linux + 326)
 #define __NR_syncfs		(__NR_Linux + 327)
 #define __NR_setns		(__NR_Linux + 328)
+#define __NR_setns		(__NR_Linux + 328)
+#define __NR_sendmmsg		(__NR_Linux + 329)
 
-#define __NR_Linux_syscalls	(__NR_setns + 1)
+#define __NR_Linux_syscalls	(__NR_sendmmsg + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 34a4f5a..e66366f 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -427,6 +427,7 @@
 	ENTRY_COMP(open_by_handle_at)
 	ENTRY_SAME(syncfs)
 	ENTRY_SAME(setns)
+	ENTRY_COMP(sendmmsg)
 
 	/* Nothing yet */
 


