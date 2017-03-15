From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up statx system call
Date: Wed, 15 Mar 2017 21:10:17 +0100
Message-ID: <20170315201017.GA14493@p100.box>
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
index 6b0741e..667c994 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -362,8 +362,9 @@
 #define __NR_copy_file_range	(__NR_Linux + 346)
 #define __NR_preadv2		(__NR_Linux + 347)
 #define __NR_pwritev2		(__NR_Linux + 348)
+#define __NR_statx		(__NR_Linux + 349)
 
-#define __NR_Linux_syscalls	(__NR_pwritev2 + 1)
+#define __NR_Linux_syscalls	(__NR_statx + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 3cfef1d..44aeaa9 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -444,6 +444,7 @@
 	ENTRY_SAME(copy_file_range)
 	ENTRY_COMP(preadv2)
 	ENTRY_COMP(pwritev2)
+	ENTRY_SAME(statx)
 
 
 .ifne (. - 90b) - (__NR_Linux_syscalls * (91b - 90b))
