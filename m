From: Kyle McMartin <kyle@mcmartin.ca>
Subject: parisc: fix io accessors for generic byteorder.h
Date: Sun, 7 Dec 2008 23:43:17 -0500
Message-ID: <20081208044317.GB9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Harvey Harrison <harvey.harrison@gmail.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

These were using __fswabX which is marooned in <linux/byteorder/swab.h>
instead we'll just use the __arch_swabX defines from <asm/byteorder.h>

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/include/asm/io.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 55ddb18..6943135 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -2,6 +2,7 @@
 #define _ASM_IO_H
 
 #include <linux/types.h>
+#include <asm/byteorder.h>
 #include <asm/pgtable.h>
 
 extern unsigned long parisc_vmerge_boundary;
@@ -180,11 +181,10 @@ static inline void __raw_writeq(unsigned long long b, volatile void __iomem *add
 	*(volatile unsigned long long __force *) addr = b;
 }
 
-/* readb can never be const, so use __fswab instead of le*_to_cpu */
 #define readb(addr) __raw_readb(addr)
-#define readw(addr) __fswab16(__raw_readw(addr))
-#define readl(addr) __fswab32(__raw_readl(addr))
-#define readq(addr) __fswab64(__raw_readq(addr))
+#define readw(addr) __arch_swab16(__raw_readw(addr))
+#define readl(addr) __arch_swab32(__raw_readl(addr))
+#define readq(addr) __arch_swab64(__raw_readq(addr))
 #define writeb(b, addr) __raw_writeb(b, addr)
 #define writew(b, addr) __raw_writew(cpu_to_le16(b), addr)
 #define writel(b, addr) __raw_writel(cpu_to_le32(b), addr)
-- 
1.5.6.5

