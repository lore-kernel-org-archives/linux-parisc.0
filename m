From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 4/4] parisc: wire up syncfs syscall
Date: Fri, 15 Apr 2011 08:55:47 -0700
Message-ID: <1302882947-3739-5-git-send-email-James.Bottomley@HansenPartnership.com>
References: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/parisc/include/asm/unistd.h   |    3 ++-
 arch/parisc/kernel/syscall_table.S |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 4266e44..9cbc2c3 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -819,8 +819,9 @@
 #define __NR_clock_adjtime	(__NR_Linux + 324)
 #define __NR_name_to_handle_at	(__NR_Linux + 325)
 #define __NR_open_by_handle_at	(__NR_Linux + 326)
+#define __NR_syncfs		(__NR_Linux + 327)
 
-#define __NR_Linux_syscalls	(__NR_open_by_handle_at + 1)
+#define __NR_Linux_syscalls	(__NR_syncfs + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index b5d2982..a5b02ce 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -425,6 +425,7 @@
 	ENTRY_COMP(clock_adjtime)
 	ENTRY_SAME(name_to_handle_at)	/* 325 */
 	ENTRY_COMP(open_by_handle_at)
+	ENTRY_SAME(syncfs)
 
 	/* Nothing yet */
 
-- 
1.7.2.3

