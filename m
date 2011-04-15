From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 2/4] parisc: wire up clock_adjtime syscall
Date: Fri, 15 Apr 2011 08:55:45 -0700
Message-ID: <1302882947-3739-3-git-send-email-James.Bottomley@HansenPartnership.com>
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
index 09f62a6..9af5fab 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -816,8 +816,9 @@
 #define __NR_prlimit64		(__NR_Linux + 321)
 #define __NR_fanotify_init	(__NR_Linux + 322)
 #define __NR_fanotify_mark	(__NR_Linux + 323)
+#define __NR_clock_adjtime	(__NR_Linux + 324)
 
-#define __NR_Linux_syscalls	(__NR_fanotify_mark + 1)
+#define __NR_Linux_syscalls	(__NR_clock_adjtime + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index c5b01e8..473bf41 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -422,6 +422,7 @@
 	ENTRY_SAME(prlimit64)
 	ENTRY_SAME(fanotify_init)
 	ENTRY_COMP(fanotify_mark)
+	ENTRY_COMP(clock_adjtime)
 
 	/* Nothing yet */
 
-- 
1.7.2.3

