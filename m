From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 1/4] parisc: wire up fanotify syscalls
Date: Fri, 15 Apr 2011 08:55:44 -0700
Message-ID: <1302882947-3739-2-git-send-email-James.Bottomley@HansenPartnership.com>
References: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/parisc/include/asm/unistd.h   |    4 +++-
 arch/parisc/kernel/sys_parisc32.c  |    8 ++++++++
 arch/parisc/kernel/syscall_table.S |    2 ++
 3 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 3eb82c2..09f62a6 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -814,8 +814,10 @@
 #define __NR_recvmmsg		(__NR_Linux + 319)
 #define __NR_accept4		(__NR_Linux + 320)
 #define __NR_prlimit64		(__NR_Linux + 321)
+#define __NR_fanotify_init	(__NR_Linux + 322)
+#define __NR_fanotify_mark	(__NR_Linux + 323)
 
-#define __NR_Linux_syscalls	(__NR_prlimit64 + 1)
+#define __NR_Linux_syscalls	(__NR_fanotify_mark + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 88a0ad1..dc9a624 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -228,3 +228,11 @@ asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offhi, u32 offlo,
         return sys_fallocate(fd, mode, ((loff_t)offhi << 32) | offlo,
                              ((loff_t)lenhi << 32) | lenlo);
 }
+
+asmlinkage long compat_sys_fanotify_mark(int fan_fd, int flags, u32 mask_hi,
+					 u32 mask_lo, int fd,
+					 const char __user *pathname)
+{
+	return sys_fanotify_mark(fan_fd, flags, ((u64)mask_hi << 32) | mask_lo,
+				 fd, pathname);
+}
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 4be85ee..c5b01e8 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -420,6 +420,8 @@
 	ENTRY_COMP(recvmmsg)
 	ENTRY_SAME(accept4)		/* 320 */
 	ENTRY_SAME(prlimit64)
+	ENTRY_SAME(fanotify_init)
+	ENTRY_COMP(fanotify_mark)
 
 	/* Nothing yet */
 
-- 
1.7.2.3

