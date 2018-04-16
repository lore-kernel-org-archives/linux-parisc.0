From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH 2/2] parisc: use the asm-generic version for readX()
Date: Mon, 16 Apr 2018 18:01:16 -0400
Message-ID: <1523916078-23049-2-git-send-email-okaya@codeaurora.org>
References: <1523916078-23049-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sinan Kaya <okaya@codeaurora.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: linux-parisc@linux-mips.org, arnd@arndb.de, timur@codeaurora.org,
        sulrich@codeaurora.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523916078-23049-1-git-send-email-okaya@codeaurora.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc architecture seems to be mapping readX() and readX_relaxed() APIs
to __raw_readX() API.

__raw_readX() API doesn't provide any kind of ordering guarantees.
commit 032d59e1cde9 ("io: define stronger ordering for the default readX()
implementation") changed asm-generic implementation to use a more
conservative approach towards the readX() API.

Drop the arch specific version and rely on the asm-generic version for
parisc since it doesn't seem to do anything special with these macros.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 arch/parisc/include/asm/io.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index ef04864..7e60642 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -177,31 +177,6 @@ static inline void __raw_writeq(unsigned long long b, volatile void __iomem *add
 	*(volatile unsigned long long __force *) addr = b;
 }
 
-static inline unsigned char readb(const volatile void __iomem *addr)
-{
-	return __raw_readb(addr);
-}
-static inline unsigned short readw(const volatile void __iomem *addr)
-{
-	return le16_to_cpu((__le16 __force) __raw_readw(addr));
-}
-static inline unsigned int readl(const volatile void __iomem *addr)
-{
-	return le32_to_cpu((__le32 __force) __raw_readl(addr));
-}
-static inline unsigned long long readq(const volatile void __iomem *addr)
-{
-	return le64_to_cpu((__le64 __force) __raw_readq(addr));
-}
-
-#define	readb	readb
-#define	readw	readw
-#define	readl	readl
-#define readq	readq
-#define readb_relaxed(addr)	readb(addr)
-#define readw_relaxed(addr)	readw(addr)
-#define readl_relaxed(addr)	readl(addr)
-#define readq_relaxed(addr)	readq(addr)
 #define mmiowb() do { } while (0)
 
 void memset_io(volatile void __iomem *addr, unsigned char val, int count);
-- 
2.7.4
