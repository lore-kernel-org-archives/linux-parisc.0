From: Kyle McMartin <kyle@mcmartin.ca>
Subject: parisc: add barriers to mmio accessors
Date: Tue, 3 Jun 2008 01:42:12 -0400
Message-ID: <20080603054212.GA31771@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Prevents GCC from reordering mmio accesses with regular memory
accesses.

They're in assembly since I felt like maybe using the strongly
ordered completer on the instructions, so they would be more obvious
in disassembly. (Yes, I know there's no weakly ordered PA
implementation...)


diff --git a/include/asm-parisc/io.h b/include/asm-parisc/io.h
index 55ddb18..e5ce0a9 100644
--- a/include/asm-parisc/io.h
+++ b/include/asm-parisc/io.h
@@ -148,36 +148,82 @@ extern void iounmap(const volatile void __iomem *addr);
 
 static inline unsigned char __raw_readb(const volatile void __iomem *addr)
 {
-	return (*(volatile unsigned char __force *) (addr));
+	unsigned char c;
+	asm volatile(
+	"	ldb	0(%0), %1\n"
+	: : "r"(addr), "r"(c) : "memory");
+	return c;
 }
+
 static inline unsigned short __raw_readw(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned short __force *) addr;
+	unsigned short s;
+	asm volatile(
+	"	lds	0(%0), %1\n"
+	: : "r"(addr), "r"(s) : "memory");
+	return s;
 }
+
 static inline unsigned int __raw_readl(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned int __force *) addr;
+	unsigned int i;
+	asm volatile(
+	"	ldw	0(%0), %1\n"
+	: : "r"(addr), "r"(i) : "memory");
+	return i;
 }
+
 static inline unsigned long long __raw_readq(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned long long __force *) addr;
+	unsigned long long q;
+
+#ifdef CONFIG_64BIT
+	asm volatile(
+	"	ldq	0(%0), %1\n"
+	: : "r"(addr), "r"(q) : "memory");
+#else
+	unsigned int q_lo, q_hi;
+	q_hi = __raw_readl(addr);
+	q_lo = __raw_readl(addr+4);
+	q = (unsigned long long)(q_hi << 32) | (q_lo);
+#endif
+
+	return q;
 }
 
-static inline void __raw_writeb(unsigned char b, volatile void __iomem *addr)
+static inline void __raw_writeb(unsigned char c, volatile void __iomem *addr)
 {
-	*(volatile unsigned char __force *) addr = b;
+	asm volatile(
+	"	stb	%1, 0(%0)\n"
+	: : "r"(addr), "r"(c) : "memory");
 }
-static inline void __raw_writew(unsigned short b, volatile void __iomem *addr)
+
+static inline void __raw_writew(unsigned short s, volatile void __iomem *addr)
 {
-	*(volatile unsigned short __force *) addr = b;
+	asm volatile(
+	"	sts	%1, 0(%0)\n"
+	: : "r"(addr), "r"(s) : "memory");
 }
-static inline void __raw_writel(unsigned int b, volatile void __iomem *addr)
+
+static inline void __raw_writel(unsigned int i, volatile void __iomem *addr)
 {
-	*(volatile unsigned int __force *) addr = b;
+	asm volatile(
+	"	stw	%1, 0(%0)\n"
+	: : "r"(addr), "r"(i) : "memory");
 }
-static inline void __raw_writeq(unsigned long long b, volatile void __iomem *addr)
+
+static inline void __raw_writeq(unsigned long long q, volatile void __iomem *addr)
 {
-	*(volatile unsigned long long __force *) addr = b;
+#ifdef CONFIG_64BIT
+	asm volatile(
+	"	stq	%1, 0(%0)\n"
+	: : "r"(addr), "r"(q) : "memory");
+#else
+	unsigned int q_hi = (q >> 32) & ~0UL;
+	unsigned int q_lo = (q) & ~0UL;
+	__raw_writel(q_hi, addr);
+	__raw_writel(q_lo, addr+4);
+#endif
 }
 
 /* readb can never be const, so use __fswab instead of le*_to_cpu */
