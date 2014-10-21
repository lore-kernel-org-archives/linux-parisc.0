From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up bpf syscall
Date: Tue, 21 Oct 2014 21:27:06 +0200
Message-ID: <20141021192706.GA14227@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 8667f18..5f5c037 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -833,8 +833,9 @@
 #define __NR_seccomp		(__NR_Linux + 338)
 #define __NR_getrandom		(__NR_Linux + 339)
 #define __NR_memfd_create	(__NR_Linux + 340)
+#define __NR_bpf		(__NR_Linux + 341)
 
-#define __NR_Linux_syscalls	(__NR_memfd_create + 1)
+#define __NR_Linux_syscalls	(__NR_bpf + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index b563d9c..d65c50a 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -436,6 +436,7 @@
 	ENTRY_SAME(seccomp)
 	ENTRY_SAME(getrandom)
 	ENTRY_SAME(memfd_create)	/* 340 */
+	ENTRY_SAME(bpf)
 
 	/* Nothing yet */
 
