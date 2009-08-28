From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH] fix unaligned access in 64-bit apply_relocate_add
Date: Fri, 28 Aug 2009 15:24:25 -0400
Message-ID: <20090828192425.GH19494@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Assuming, of course, that loc64 shouldn't be 8-byte masked, and that the
relocation address was correct.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 61ee0ee..eea810c 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -63,6 +63,7 @@
 #include <linux/bug.h>
 
 #include <asm/unwind.h>
+#include <asm/unaligned.h>
 
 #if 0
 #define DEBUGP printk
@@ -799,7 +800,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			break;
 		case R_PARISC_DIR64:
 			/* 64-bit effective address */
-			*loc64 = val + addend;
+			put_unaligned(val + addend, loc64);
 			break;
 		case R_PARISC_SEGREL32:
 			/* 32-bit segment relative address */
