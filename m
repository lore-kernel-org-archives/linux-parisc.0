From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add hardened usercopy feature
Date: Thu, 6 Oct 2016 09:07:30 +0200
Message-ID: <20161006070730.GA24780@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add hardened usercopy checks to parisc architecture and clean up
indenting.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index af12c2d..393c730 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -24,6 +24,7 @@ config PARISC
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_MOD_ARCH_SPECIFIC
+	select HAVE_ARCH_HARDENED_USERCOPY
 	select VIRT_TO_BUS
 	select MODULES_USE_ELF_RELA
 	select CLONE_BACKWARDS
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 4828478..9a2aee1 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -11,6 +11,7 @@
 
 #include <linux/bug.h>
 #include <linux/string.h>
+#include <linux/thread_info.h>
 
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1
@@ -201,10 +202,12 @@ extern long lstrnlen_user(const char __user *, long);
 #define clear_user lclear_user
 #define __clear_user lclear_user
 
-unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len);
-#define __copy_to_user copy_to_user
-unsigned long __copy_from_user(void *dst, const void __user *src, unsigned long len);
-unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len);
+unsigned long __must_check __copy_to_user(void __user *dst, const void *src,
+					  unsigned long len);
+unsigned long __must_check __copy_from_user(void *dst, const void __user *src,
+					  unsigned long len);
+unsigned long copy_in_user(void __user *dst, const void __user *src,
+			   unsigned long len);
 #define __copy_in_user copy_in_user
 #define __copy_to_user_inatomic __copy_to_user
 #define __copy_from_user_inatomic __copy_from_user
@@ -217,23 +220,40 @@ static inline void copy_user_overflow(int size, unsigned long count)
 	WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
 }
 
-static inline unsigned long __must_check copy_from_user(void *to,
-                                          const void __user *from,
-                                          unsigned long n)
+static __always_inline unsigned long __must_check
+copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-        int sz = __compiletime_object_size(to);
-        unsigned long ret = n;
+	int sz = __compiletime_object_size(to);
+	unsigned long ret = n;
 
-        if (likely(sz == -1 || sz >= n))
-                ret = __copy_from_user(to, from, n);
-        else if (!__builtin_constant_p(n))
+	if (likely(sz < 0 || sz >= n)) {
+		check_object_size(to, n, false);
+		ret = __copy_from_user(to, from, n);
+	} else if (!__builtin_constant_p(n))
 		copy_user_overflow(sz, n);
 	else
-                __bad_copy_user();
+		__bad_copy_user();
 
 	if (unlikely(ret))
 		memset(to + (n - ret), 0, ret);
-        return ret;
+
+	return ret;
+}
+
+static __always_inline unsigned long __must_check
+copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	int sz = __compiletime_object_size(from);
+
+	if (likely(sz < 0 || sz >= n)) {
+		check_object_size(from, n, true);
+		n = __copy_to_user(to, from, n);
+	} else if (!__builtin_constant_p(n))
+		copy_user_overflow(sz, n);
+	else
+		__bad_copy_user();
+
+	return n;
 }
 
 struct pt_regs;
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index b2b441b..f82ff10 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -489,20 +489,23 @@ static unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
 }
 
 #ifdef __KERNEL__
-unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len)
+unsigned long __copy_to_user(void __user *dst, const void *src,
+			     unsigned long len)
 {
 	mtsp(get_kernel_space(), 1);
 	mtsp(get_user_space(), 2);
 	return pa_memcpy((void __force *)dst, src, len);
 }
+EXPORT_SYMBOL(__copy_to_user);
 
-EXPORT_SYMBOL(__copy_from_user);
-unsigned long __copy_from_user(void *dst, const void __user *src, unsigned long len)
+unsigned long __copy_from_user(void *dst, const void __user *src,
+			       unsigned long len)
 {
 	mtsp(get_user_space(), 1);
 	mtsp(get_kernel_space(), 2);
 	return pa_memcpy(dst, (void __force *)src, len);
 }
+EXPORT_SYMBOL(__copy_from_user);
 
 unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len)
 {
@@ -520,8 +523,6 @@ void * memcpy(void * dst,const void *src, size_t count)
 	return dst;
 }
 
-EXPORT_SYMBOL(copy_to_user);
-EXPORT_SYMBOL(copy_from_user);
 EXPORT_SYMBOL(copy_in_user);
 EXPORT_SYMBOL(memcpy);
 
