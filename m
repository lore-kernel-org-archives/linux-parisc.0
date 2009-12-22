From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add strict copy size checks
Date: Tue, 22 Dec 2009 23:56:49 +0100
Message-ID: <20091222225649.GA7050@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add CONFIG_DEBUG_STRICT_USER_COPY_CHECKS, copied from the x86
implementation.

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -12,4 +12,18 @@ config DEBUG_RODATA
          portion of the kernel code won't be covered by a TLB anymore.
          If in doubt, say "N".
 
+config DEBUG_STRICT_USER_COPY_CHECKS
+	bool "Strict copy size checks"
+	depends on DEBUG_KERNEL && !TRACE_BRANCH_PROFILING
+	---help---
+	  Enabling this option turns a certain set of sanity checks for user
+	  copy operations into compile time failures.
+
+	  The copy_from_user() etc checks are there to help test if there
+	  are sufficient security checks on the length argument of
+	  the copy operation, by having gcc prove that the argument is
+	  within bounds.
+
+	  If unsure, or if you run an older (pre 4.4) gcc, say N.
+
 endmenu
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -7,6 +7,7 @@
 #include <asm/page.h>
 #include <asm/system.h>
 #include <asm/cache.h>
+#include <asm/errno.h>
 #include <asm-generic/uaccess-unaligned.h>
 
 #define VERIFY_READ 0
@@ -234,13 +235,35 @@ extern long lstrnlen_user(const char __user *,long);
 
 unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len);
 #define __copy_to_user copy_to_user
-unsigned long copy_from_user(void *dst, const void __user *src, unsigned long len);
-#define __copy_from_user copy_from_user
+unsigned long __copy_from_user(void *dst, const void __user *src, unsigned long len);
 unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len);
 #define __copy_in_user copy_in_user
 #define __copy_to_user_inatomic __copy_to_user
 #define __copy_from_user_inatomic __copy_from_user
 
+extern void copy_from_user_overflow(void)
+#ifdef CONFIG_DEBUG_STRICT_USER_COPY_CHECKS
+        __compiletime_error("copy_from_user() buffer size is not provably correct")
+#else
+        __compiletime_warning("copy_from_user() buffer size is not provably correct")
+#endif
+;
+
+static inline unsigned long __must_check copy_from_user(void *to,
+                                          const void __user *from,
+                                          unsigned long n)
+{
+        int sz = __compiletime_object_size(to);
+        int ret = -EFAULT;
+
+        if (likely(sz == -1 || sz >= n))
+                ret = __copy_from_user(to, from, n);
+        else
+                copy_from_user_overflow();
+
+        return ret;
+}
+
 struct pt_regs;
 int fixup_exception(struct pt_regs *regs);
 
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -475,7 +475,8 @@ unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len)
 	return pa_memcpy((void __force *)dst, src, len);
 }
 
-unsigned long copy_from_user(void *dst, const void __user *src, unsigned long len)
+EXPORT_SYMBOL(__copy_from_user);
+unsigned long __copy_from_user(void *dst, const void __user *src, unsigned long len)
 {
 	mtsp(get_user_space(), 1);
 	mtsp(get_kernel_space(), 2);

