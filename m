From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] fix compile failure with non-modular builds
Date: Thu, 11 Sep 2008 10:56:15 -0500
Message-ID: <1221148575.3330.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit deac93df26b20cf8438339b5935b5f5643bc30c9
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Wed Sep 3 20:43:36 2008 -0500

    lib: Correct printk %pF to work on all architectures

Broke the non modular builds by moving an essential function into
modules.c.  Fix this by moving it out again and into asm/sections.h as
an inline.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/parisc/kernel/module.c   |   14 --------------
 include/asm-parisc/sections.h |   13 +++++++++++--
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 44138c3..fdacdd4 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -47,9 +47,7 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/bug.h>
-#include <linux/uaccess.h>
 
-#include <asm/sections.h>
 #include <asm/unwind.h>
 
 #if 0
@@ -862,15 +860,3 @@ void module_arch_cleanup(struct module *mod)
 	deregister_unwind_table(mod);
 	module_bug_cleanup(mod);
 }
-
-#ifdef CONFIG_64BIT
-void *dereference_function_descriptor(void *ptr)
-{
-	Elf64_Fdesc *desc = ptr;
-	void *p;
-
-	if (!probe_kernel_address(&desc->addr, p))
-		ptr = p;
-	return ptr;
-}
-#endif
diff --git a/include/asm-parisc/sections.h b/include/asm-parisc/sections.h
index 9d13c35..b08f9f8 100644
--- a/include/asm-parisc/sections.h
+++ b/include/asm-parisc/sections.h
@@ -1,12 +1,21 @@
 #ifndef _PARISC_SECTIONS_H
 #define _PARISC_SECTIONS_H
 
-/* nothing to see, move along */
+#include <linux/elf.h>
+#include <linux/uaccess.h>
 #include <asm-generic/sections.h>
 
 #ifdef CONFIG_64BIT
 #undef dereference_function_descriptor
-void *dereference_function_descriptor(void *);
+static inline void *dereference_function_descriptor(void *ptr)
+{
+	Elf64_Fdesc *desc = ptr;
+	void *p;
+
+	if (!probe_kernel_address(&desc->addr, p))
+		ptr = p;
+	return ptr;
+}
 #endif
 
 #endif
-- 
1.5.6.5



