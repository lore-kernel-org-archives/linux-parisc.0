From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up copy_file_range syscall
Date: Tue, 1 Mar 2016 23:18:43 +0100
Message-ID: <20160301221843.GA6940@ls3530.box>
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
index 35bdccb..b75039f 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -361,8 +361,9 @@
 #define __NR_membarrier		(__NR_Linux + 343)
 #define __NR_userfaultfd	(__NR_Linux + 344)
 #define __NR_mlock2		(__NR_Linux + 345)
+#define __NR_copy_file_range	(__NR_Linux + 346)
 
-#define __NR_Linux_syscalls	(__NR_mlock2 + 1)
+#define __NR_Linux_syscalls	(__NR_copy_file_range + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index d4ffcfb..585d50f 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -441,6 +441,7 @@
 	ENTRY_SAME(membarrier)
 	ENTRY_SAME(userfaultfd)
 	ENTRY_SAME(mlock2)		/* 345 */
+	ENTRY_SAME(copy_file_range)
 
 
 .ifne (. - 90b) - (__NR_Linux_syscalls * (91b - 90b))
