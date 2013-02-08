From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: wire up process_vm_readv, process_vm_writev, kcmp
 and finit_module syscalls
Date: Fri, 8 Feb 2013 21:08:25 +0100
Message-ID: <20130208200825.GA5329@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index e178f30..2c8b9bd 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -822,8 +822,12 @@
 #define __NR_syncfs		(__NR_Linux + 327)
 #define __NR_setns		(__NR_Linux + 328)
 #define __NR_sendmmsg		(__NR_Linux + 329)
+#define __NR_process_vm_readv	(__NR_Linux + 330)
+#define __NR_process_vm_writev	(__NR_Linux + 331)
+#define __NR_kcmp		(__NR_Linux + 332)
+#define __NR_finit_module	(__NR_Linux + 333)
 
-#define __NR_Linux_syscalls	(__NR_sendmmsg + 1)
+#define __NR_Linux_syscalls	(__NR_finit_module + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 54d950b..cf7094c 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -428,6 +428,10 @@
 	ENTRY_SAME(syncfs)
 	ENTRY_SAME(setns)
 	ENTRY_COMP(sendmmsg)
+	ENTRY_COMP(process_vm_readv)	/* 330 */
+	ENTRY_COMP(process_vm_writev)
+	ENTRY_SAME(kcmp)
+	ENTRY_SAME(finit_module)
 
 	/* Nothing yet */
 
