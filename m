From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: wire up sched_setattr and sched_getattr
Date: Fri, 31 Jan 2014 22:29:17 +0100
Message-ID: <20140131212917.GA15208@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 2c8b9bd..4270679 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -826,8 +826,10 @@
 #define __NR_process_vm_writev	(__NR_Linux + 331)
 #define __NR_kcmp		(__NR_Linux + 332)
 #define __NR_finit_module	(__NR_Linux + 333)
+#define __NR_sched_setattr	(__NR_Linux + 334)
+#define __NR_sched_getattr	(__NR_Linux + 335)
 
-#define __NR_Linux_syscalls	(__NR_finit_module + 1)
+#define __NR_Linux_syscalls	(__NR_sched_getattr + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 0c91072..8fa3fbb 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -429,6 +429,8 @@
 	ENTRY_COMP(process_vm_writev)
 	ENTRY_SAME(kcmp)
 	ENTRY_SAME(finit_module)
+	ENTRY_SAME(sched_setattr)
+	ENTRY_SAME(sched_getattr)	/* 335 */
 
 	/* Nothing yet */
 
