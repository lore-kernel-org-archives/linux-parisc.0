From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH, v2] parisc: Add compile-time check when adding new
 syscalls
Date: Sun, 15 Mar 2015 21:32:12 +0100
Message-ID: <20150315203212.GA452@ls3530.box>
References: <20150314203416.GA10789@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150314203416.GA10789@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 5a8997d..0959fcc 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -55,6 +55,7 @@
 #define ENTRY_COMP(_name_) .word sys_##_name_
 #endif
 
+99:
 	ENTRY_SAME(restart_syscall)	/* 0 */
 	ENTRY_SAME(exit)
 	ENTRY_SAME(fork_wrapper)
@@ -439,6 +440,15 @@
 	ENTRY_SAME(bpf)
 	ENTRY_COMP(execveat)
 
+
+#if defined(CONFIG_64BIT)
+.ifne (. - 99b) - (__NR_Linux_syscalls * 8)
+#else /* !defined(CONFIG_64BIT) */
+.ifne (. - 99b) - (__NR_Linux_syscalls * 4)
+#endif
+.error "size of syscall table does not fit value of __NR_Linux_syscalls"
+.endif
+
 	/* Nothing yet */
 
 #undef ENTRY_SAME
