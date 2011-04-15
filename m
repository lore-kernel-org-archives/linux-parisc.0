From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 3/4] parisc: wire up the fhandle syscalls
Date: Fri, 15 Apr 2011 08:55:46 -0700
Message-ID: <1302882947-3739-4-git-send-email-James.Bottomley@HansenPartnership.com>
References: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/parisc/include/asm/unistd.h   |    4 +++-
 arch/parisc/kernel/syscall_table.S |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 9af5fab..4266e44 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -817,8 +817,10 @@
 #define __NR_fanotify_init	(__NR_Linux + 322)
 #define __NR_fanotify_mark	(__NR_Linux + 323)
 #define __NR_clock_adjtime	(__NR_Linux + 324)
+#define __NR_name_to_handle_at	(__NR_Linux + 325)
+#define __NR_open_by_handle_at	(__NR_Linux + 326)
 
-#define __NR_Linux_syscalls	(__NR_clock_adjtime + 1)
+#define __NR_Linux_syscalls	(__NR_open_by_handle_at + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 473bf41..b5d2982 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -423,6 +423,8 @@
 	ENTRY_SAME(fanotify_init)
 	ENTRY_COMP(fanotify_mark)
 	ENTRY_COMP(clock_adjtime)
+	ENTRY_SAME(name_to_handle_at)	/* 325 */
+	ENTRY_COMP(open_by_handle_at)
 
 	/* Nothing yet */
 
-- 
1.7.2.3

