From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: sendfile and sendfile64 syscall cleanups
Date: Tue, 19 Feb 2013 23:01:03 +0100
Message-ID: <20130219220103.GA937@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 375e130d5c9809c99afe56d6640b70f3c002e8ac
Date:   Tue Feb 19 22:55:17 2013 +0100

Utilize the existing compat_sys_sendfile function for 64bit kernel and add
wrappers for sendfile and sendfile64 to correctly handle the 32/64 bit sign
extension.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index f2e390f..74f801e 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -167,6 +167,7 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_VFORK
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_COMPAT_SYS_SENDFILE
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 0115eac..eca69bb 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -60,42 +60,23 @@ asmlinkage long sys32_unimplemented(int r26, int r25, int r24, int r23,
     return -ENOSYS;
 }
 
-asmlinkage int sys32_sendfile(int out_fd, int in_fd, compat_off_t __user *offset, s32 count)
+/* Note: it is necessary to treat out_fd and in_fd as unsigned ints, with the
+ * corresponding cast to a signed int to insure that the proper conversion
+ * (sign extension) between the register representation of a signed int (msr in
+ * 32-bit mode) and the register representation of a signed int (msr in 64-bit
+ * mode) is performed.
+ */
+asmlinkage long sys32_sendfile(u32 out_fd, u32 in_fd,
+			       compat_off_t __user *offset, compat_size_t count)
 {
-        mm_segment_t old_fs = get_fs();
-        int ret;
-        off_t of;
-
-        if (offset && get_user(of, offset))
-                return -EFAULT;
-
-        set_fs(KERNEL_DS);
-        ret = sys_sendfile(out_fd, in_fd, offset ? (off_t __user *)&of : NULL, count);
-        set_fs(old_fs);
-
-        if (offset && put_user(of, offset))
-                return -EFAULT;
-
-        return ret;
+	return compat_sys_sendfile((int)out_fd, (int)in_fd, offset, count);
 }
 
-asmlinkage int sys32_sendfile64(int out_fd, int in_fd, compat_loff_t __user *offset, s32 count)
+asmlinkage long sys32_sendfile64(u32 out_fd, u32 in_fd,
+				 compat_loff_t __user *offset, compat_size_t count)
 {
-	mm_segment_t old_fs = get_fs();
-	int ret;
-	loff_t lof;
-	
-	if (offset && get_user(lof, offset))
-		return -EFAULT;
-		
-	set_fs(KERNEL_DS);
-	ret = sys_sendfile64(out_fd, in_fd, offset ? (loff_t __user *)&lof : NULL, count);
-	set_fs(old_fs);
-	
-	if (offset && put_user(lof, offset))
-		return -EFAULT;
-		
-	return ret;
+	return sys_sendfile64((int)out_fd, (int)in_fd,
+				(loff_t __user *)offset, count);
 }
 
 
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 9180719..129fd47 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -304,7 +304,7 @@
 	ENTRY_SAME(gettid)
 	ENTRY_OURS(readahead)
 	ENTRY_SAME(tkill)
-	ENTRY_SAME(sendfile64)
+	ENTRY_DIFF(sendfile64)
 	ENTRY_COMP(futex)		/* 210 */
 	ENTRY_COMP(sched_setaffinity)
 	ENTRY_COMP(sched_getaffinity)
