From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: wire up sys_utimes
Date: Sun, 23 Mar 2014 15:24:40 +0100
Message-ID: <20140323142440.GA3433@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We seem to be nearly the only platform which does not provide the
sys_utimes syscall.  Adding it now makes our life much easier with
userspace applications (like dietlibc and e2fsprogs) since we then
behave like all other platforms too and don't need extra patches which
are hard to get upstream anyway because we are not a mainstream
architecture.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 4270679..265ae51 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -828,13 +828,13 @@
 #define __NR_finit_module	(__NR_Linux + 333)
 #define __NR_sched_setattr	(__NR_Linux + 334)
 #define __NR_sched_getattr	(__NR_Linux + 335)
+#define __NR_utimes		(__NR_Linux + 336)
 
-#define __NR_Linux_syscalls	(__NR_sched_getattr + 1)
+#define __NR_Linux_syscalls	(__NR_utimes + 1)
 
 
 #define __IGNORE_select		/* newselect */
 #define __IGNORE_fadvise64	/* fadvise64_64 */
-#define __IGNORE_utimes		/* utime */
 
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 8fa3fbb..80e5dd2 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -431,6 +431,7 @@
 	ENTRY_SAME(finit_module)
 	ENTRY_SAME(sched_setattr)
 	ENTRY_SAME(sched_getattr)	/* 335 */
+	ENTRY_COMP(utimes)
 
 	/* Nothing yet */
 
