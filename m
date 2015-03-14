From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add compile-time check when adding new syscalls
Date: Sat, 14 Mar 2015 21:34:16 +0100
Message-ID: <20150314203416.GA10789@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 5a8997d..802f807 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -41,20 +41,25 @@
 #define ENTRY_UHOH(_name_) .dword sys32_##unimplemented
 #define ENTRY_OURS(_name_) .dword parisc_##_name_
 #define ENTRY_COMP(_name_) .dword compat_sys_##_name_
+#define SYSCALLTABLE_NAME  syscall_table_compat
 #elif defined(CONFIG_64BIT) && defined(SYSCALL_TABLE_64BIT)
 #define ENTRY_SAME(_name_) .dword sys_##_name_
 #define ENTRY_DIFF(_name_) .dword sys_##_name_
 #define ENTRY_UHOH(_name_) .dword sys_##_name_
 #define ENTRY_OURS(_name_) .dword sys_##_name_
 #define ENTRY_COMP(_name_) .dword sys_##_name_
+#define SYSCALLTABLE_NAME  syscall_table_64bit
 #else
 #define ENTRY_SAME(_name_) .word sys_##_name_
 #define ENTRY_DIFF(_name_) .word sys_##_name_
 #define ENTRY_UHOH(_name_) .word sys_##_name_
 #define ENTRY_OURS(_name_) .word parisc_##_name_
 #define ENTRY_COMP(_name_) .word sys_##_name_
+#define SYSCALLTABLE_NAME  syscall_table_32bit
 #endif
 
+        .local SYSCALLTABLE_NAME
+SYSCALLTABLE_NAME:
 	ENTRY_SAME(restart_syscall)	/* 0 */
 	ENTRY_SAME(exit)
 	ENTRY_SAME(fork_wrapper)
@@ -439,8 +444,21 @@
 	ENTRY_SAME(bpf)
 	ENTRY_COMP(execveat)
 
+
+        .size SYSCALLTABLE_NAME, . - SYSCALLTABLE_NAME
+        .type SYSCALLTABLE_NAME, @object
+
+#if defined(CONFIG_64BIT)
+.ifne (. - SYSCALLTABLE_NAME) - (__NR_Linux_syscalls * 8)
+#else /* !defined(CONFIG_64BIT) */
+.ifne (. - SYSCALLTABLE_NAME) - (__NR_Linux_syscalls * 4)
+#endif
+.error "syscall table not in sync with value of __NR_Linux_syscalls"
+.endif
+
 	/* Nothing yet */
 
+#undef SYSCALLTABLE_NAME
 #undef ENTRY_SAME
 #undef ENTRY_DIFF
 #undef ENTRY_UHOH
