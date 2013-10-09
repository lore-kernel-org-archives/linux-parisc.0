From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: let probe_kernel_read() capture access to page zero
Date: Wed, 9 Oct 2013 23:53:18 +0200
Message-ID: <20131009215318.GA30131@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index ac4370b..b5507ec 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -56,7 +56,7 @@
 #ifdef __KERNEL__
 #include <linux/module.h>
 #include <linux/compiler.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 #define s_space "%%sr1"
 #define d_space "%%sr2"
 #else
@@ -524,4 +524,17 @@ EXPORT_SYMBOL(copy_to_user);
 EXPORT_SYMBOL(copy_from_user);
 EXPORT_SYMBOL(copy_in_user);
 EXPORT_SYMBOL(memcpy);
+
+long probe_kernel_read(void *dst, const void *src, size_t size)
+{
+	unsigned long addr = (unsigned long)src;
+
+	if (size < 0 || addr < PAGE_SIZE)
+		return -EFAULT;
+
+	/* check for I/O space F_EXTEND(0xfff00000) access as well? */
+
+	return __probe_kernel_read(dst, src, size);
+}
+
 #endif
