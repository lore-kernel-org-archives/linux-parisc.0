From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: implement atomic64_dec_if_positive()
Date: Mon, 6 May 2013 21:13:33 +0200
Message-ID: <20130506191333.GA17146@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 0339181..967d727 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -12,6 +12,7 @@ config PARISC
 	select BUG
 	select HAVE_PERF_EVENTS
 	select GENERIC_ATOMIC64 if !64BIT
+	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 	select HAVE_GENERIC_HARDIRQS
 	select BROKEN_RODATA
 	select GENERIC_IRQ_PROBE
diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index f38e198..472886c 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -229,6 +229,29 @@ static __inline__ int atomic64_add_unless(atomic64_t *v, long a, long u)
 
 #define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
 
+/*
+ * atomic64_dec_if_positive - decrement by 1 if old value positive
+ * @v: pointer of type atomic_t
+ *
+ * The function returns the old value of *v minus 1, even if
+ * the atomic variable, v, was not decremented.
+ */
+static inline long atomic64_dec_if_positive(atomic64_t *v)
+{
+	long c, old, dec;
+	c = atomic64_read(v);
+	for (;;) {
+		dec = c - 1;
+		if (unlikely(dec < 0))
+			break;
+		old = atomic64_cmpxchg((v), c, dec);
+		if (likely(old == c))
+			break;
+		c = old;
+	}
+	return dec;
+}
+
 #endif /* !CONFIG_64BIT */
 
 
