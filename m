From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix fallocate syscall
Date: Tue, 19 Feb 2013 21:31:58 +0100
Message-ID: <20130219203158.GA12965@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit c065e93d5a0fe16e6cfb81d61ab6f5aaee9c25a6
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 19 21:23:59 2013 +0100

fallocate(off_t) gets redirected by glibc to fallocate64(loff_t) where
the 64bit loff_t values get splitted into two 32bit (hi/lo) values. This
patch fixes this syscall for the 32- and 64bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index a047b32..54d619d 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -213,6 +213,13 @@ asmlinkage long parisc_sync_file_range(int fd,
 			(loff_t)hi_nbytes << 32 | lo_nbytes, flags);
 }
 
+asmlinkage long parisc_fallocate(int fd, int mode, u32 offhi, u32 offlo,
+				u32 lenhi, u32 lenlo)
+{
+        return sys_fallocate(fd, mode, ((u64)offhi << 32) | offlo,
+                             ((u64)lenhi << 32) | lenlo);
+}
+
 asmlinkage unsigned long sys_alloc_hugepages(int key, unsigned long addr, unsigned long len, int prot, int flag)
 {
 	return -ENOMEM;
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index cee60f7..9862944 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -142,13 +142,6 @@ long sys32_lookup_dcookie(u32 cookie_high, u32 cookie_low, char __user *buf,
 				  buf, len);
 }
 
-asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offhi, u32 offlo,
-				u32 lenhi, u32 lenlo)
-{
-        return sys_fallocate(fd, mode, ((loff_t)offhi << 32) | offlo,
-                             ((loff_t)lenhi << 32) | lenlo);
-}
