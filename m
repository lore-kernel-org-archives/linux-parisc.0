From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop alloc_hugepages and free_hugepages syscalls
Date: Sun, 20 Mar 2016 12:20:31 +0100
Message-ID: <20160320112031.GA3504@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Those syscalls were never implemented and don't exists in other arches
either.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index b75039f..fdb3c4e 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -235,8 +235,8 @@
 #define __NR_io_getevents       (__NR_Linux + 217)
 #define __NR_io_submit          (__NR_Linux + 218)
 #define __NR_io_cancel          (__NR_Linux + 219)
-#define __NR_alloc_hugepages    (__NR_Linux + 220)
-#define __NR_free_hugepages     (__NR_Linux + 221)
+#define __NR_alloc_hugepages    (__NR_Linux + 220) /* not used */
+#define __NR_free_hugepages     (__NR_Linux + 221) /* not used */
 #define __NR_exit_group         (__NR_Linux + 222)
 #define __NR_lookup_dcookie     (__NR_Linux + 223)
 #define __NR_epoll_create       (__NR_Linux + 224)
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 5aba01a..0a393a0 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -368,16 +368,6 @@ asmlinkage long parisc_fallocate(int fd, int mode, u32 offhi, u32 offlo,
                              ((u64)lenhi << 32) | lenlo);
 }
 
-asmlinkage unsigned long sys_alloc_hugepages(int key, unsigned long addr, unsigned long len, int prot, int flag)
-{
-	return -ENOMEM;
-}
-
-asmlinkage int sys_free_hugepages(unsigned long addr)
-{
-	return -EINVAL;
-}
