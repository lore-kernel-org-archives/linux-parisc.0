From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: switch to available compat_sched_rr_get_interval
 implementation
Date: Tue, 19 Feb 2013 21:45:04 +0100
Message-ID: <20130219204504.GA20560@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 569d66d55af40773eb50062f331ef3fffc754849
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 19 21:42:45 2013 +0100

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 3043194..f2e390f 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -149,6 +149,7 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
 #define __ARCH_WANT_SYS_SIGNAL
 #define __ARCH_WANT_SYS_TIME
 #define __ARCH_WANT_COMPAT_SYS_TIME
+#define __ARCH_WANT_COMPAT_SYS_SCHED_RR_GET_INTERVAL
 #define __ARCH_WANT_SYS_UTIME
 #define __ARCH_WANT_SYS_WAITPID
 #define __ARCH_WANT_SYS_SOCKETCALL
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 9862944..0115eac 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -60,18 +60,6 @@ asmlinkage long sys32_unimplemented(int r26, int r25, int r24, int r23,
     return -ENOSYS;
 }
 
-asmlinkage long sys32_sched_rr_get_interval(pid_t pid,
-	struct compat_timespec __user *interval)
-{
-	struct timespec t;
-	int ret;
-
-	KERNEL_SYSCALL(ret, sys_sched_rr_get_interval, pid, (struct timespec __user *)&t);
-	if (put_compat_timespec(&t, interval))
-		return -EFAULT;
-	return ret;
-}
