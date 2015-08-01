From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] parisc: Define ioremap_uc and ioremap_wc
Date: Fri, 31 Jul 2015 19:34:46 -0700
Message-ID: <1438396486-20937-1-git-send-email-linux@roeck-us.net>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	"Luis R. Rodriguez" <mcgrof@suse.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole
with strong UC") introduces calls to ioremap_wc and ioremap_uc. This
causes build failures with parisc:allmodconfig. Map the missing
functions to ioremap_nocache.

Fixes: 3cc2dac5be3f ("drivers/video/fbdev/atyfb:
	Replace MTRR UC hole with strong UC")
Cc: Luis R. Rodriguez <mcgrof@suse.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/include/asm/io.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 8cd0abf28ffb..1a16f1d1075f 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -137,6 +137,8 @@ static inline void __iomem * ioremap(unsigned long offset, unsigned long size)
 	return __ioremap(offset, size, _PAGE_NO_CACHE);
 }
 #define ioremap_nocache(off, sz)	ioremap((off), (sz))
+#define ioremap_wc			ioremap_nocache
+#define ioremap_uc			ioremap_nocache
 
 extern void iounmap(const volatile void __iomem *addr);
 
-- 
2.1.4

