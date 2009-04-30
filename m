From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 3/5] parisc: use new macros for .data.init_task.
Date: Thu, 30 Apr 2009 19:55:17 -0400
Message-ID: <1241135719-9286-4-git-send-email-tabbott@mit.edu>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
 <1241135719-9286-2-git-send-email-tabbott@mit.edu>
 <1241135719-9286-3-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-3-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

.data.init_task should not need a separate output section; this change
moves it into the .data section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/init_task.c   |    2 +-
 arch/parisc/kernel/vmlinux.lds.S |   10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/kernel/init_task.c b/arch/parisc/kernel/init_task.c
index 1e25a45..8ee17ea 100644
--- a/arch/parisc/kernel/init_task.c
+++ b/arch/parisc/kernel/init_task.c
@@ -48,7 +48,7 @@ EXPORT_SYMBOL(init_mm);
  * "init_task" linker map entry..
  */
 union thread_union init_thread_union
-	__attribute__((aligned(128))) __attribute__((__section__(".data.init_task"))) =
+	__attribute__((aligned(128))) __init_task_data =
 		{ INIT_THREAD_INFO(init_task) };
 
 #if PT_NLEVELS == 3
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index b5936c9..c8a528d 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -103,6 +103,8 @@ SECTIONS
 	. = ALIGN(L1_CACHE_BYTES);
 	/* Data */
 	.data : {
+		/* assembler code expects init_task to be 16k aligned */
+		INIT_TASK_DATA(16384)
 		NOSAVE_DATA
 		CACHELINE_ALIGNED_DATA(L1_CACHE_BYTES)
 		DATA_DATA
@@ -133,14 +135,6 @@ SECTIONS
 	}
 	__bss_stop = .;
 
-
-	/* assembler code expects init_task to be 16k aligned */
-	. = ALIGN(16384);
-	/* init_task */
-	.data.init_task : {
-		*(.data.init_task)
-	}
