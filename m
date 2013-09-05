From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] parisc: Export flush_cache_page() (needed by lustre)
Date: Thu,  5 Sep 2013 11:33:15 +0200
Message-ID: <1378373595-29471-1-git-send-email-geert@linux-m68k.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

ERROR: "flush_cache_page" [drivers/staging/lustre/lustre/libcfs/libcfs.ko] undefined!

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/parisc/kernel/cache.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c035673..b521c0a 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -602,6 +602,7 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 	}
 }
+EXPORT_SYMBOL_GPL(flush_cache_page);
 
 #ifdef CONFIG_PARISC_TMPALIAS
 
-- 
1.7.9.5

