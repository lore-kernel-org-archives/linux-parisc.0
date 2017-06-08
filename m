From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Don't hardcode value of PSW_SM_D in gsc_*() functions
Date: Thu, 8 Jun 2017 22:09:18 +0200
Message-ID: <20170608200918.GA26075@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 1a16f1d..af98254 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -34,10 +34,10 @@ static inline unsigned char gsc_readb(unsigned long addr)
 	unsigned char ret;
 
 	__asm__ __volatile__(
-	"	rsm	2,%0\n"
+	"	rsm	%3,%0\n"
 	"	ldbx	0(%2),%1\n"
 	"	mtsm	%0\n"
-	: "=&r" (flags), "=r" (ret) : "r" (addr) );
+	: "=&r" (flags), "=r" (ret) : "r" (addr), "i" (PSW_SM_D) );
 
 	return ret;
 }
@@ -48,10 +48,10 @@ static inline unsigned short gsc_readw(unsigned long addr)
 	unsigned short ret;
 
 	__asm__ __volatile__(
-	"	rsm	2,%0\n"
+	"	rsm	%3,%0\n"
 	"	ldhx	0(%2),%1\n"
 	"	mtsm	%0\n"
-	: "=&r" (flags), "=r" (ret) : "r" (addr) );
+	: "=&r" (flags), "=r" (ret) : "r" (addr), "i" (PSW_SM_D) );
 
 	return ret;
 }
@@ -87,20 +87,20 @@ static inline void gsc_writeb(unsigned char val, unsigned long addr)
 {
 	long flags;
 	__asm__ __volatile__(
-	"	rsm	2,%0\n"
+	"	rsm	%3,%0\n"
 	"	stbs	%1,0(%2)\n"
 	"	mtsm	%0\n"
-	: "=&r" (flags) :  "r" (val), "r" (addr) );
+	: "=&r" (flags) :  "r" (val), "r" (addr), "i" (PSW_SM_D) );
 }
 
 static inline void gsc_writew(unsigned short val, unsigned long addr)
 {
 	long flags;
 	__asm__ __volatile__(
-	"	rsm	2,%0\n"
+	"	rsm	%3,%0\n"
 	"	sths	%1,0(%2)\n"
 	"	mtsm	%0\n"
-	: "=&r" (flags) :  "r" (val), "r" (addr) );
+	: "=&r" (flags) :  "r" (val), "r" (addr), "i" (PSW_SM_D) );
 }
 
 static inline void gsc_writel(unsigned int val, unsigned long addr)
