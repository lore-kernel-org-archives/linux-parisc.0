From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: optimize mtsp(0,sr) inline assembly
Date: Sat, 29 Jun 2013 22:08:03 +0200
Message-ID: <20130629200803.GA31030@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

If the value which should be moved into a space register is zero, we can
optimize the inline assembly to become "mtsp %r0,%srX".

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/asm/special_insns.h
index d306b75..e150930 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -32,9 +32,12 @@ static inline void set_eiem(unsigned long val)
 	cr;				\
 })
 
-#define mtsp(gr, cr) \
-	__asm__ __volatile__("mtsp %0,%1" \
+#define mtsp(val, cr) \
+	{ if (__builtin_constant_p(val) && ((val) == 0)) \
+	 __asm__ __volatile__("mtsp %%r0,%0" : : "i" (cr) : "memory"); \
+	else \
+	 __asm__ __volatile__("mtsp %0,%1" \
 		: /* no outputs */ \
-		: "r" (gr), "i" (cr) : "memory")
+		: "r" (val), "i" (cr) : "memory"); }
 
 #endif /* __PARISC_SPECIAL_INSNS_H */
