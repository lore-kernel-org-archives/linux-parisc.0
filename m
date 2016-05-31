From: "George Spelvin" <linux@sciencehorizons.net>
Subject: [DRAFT PATCH] parisc: add <asm/hash.h>
Date: 31 May 2016 09:41:56 -0400
Message-ID: <20160531134156.878.qmail@ns.sciencehorizons.net>
References: <20160531132300.21122.qmail@ns.sciencehorizons.net>
Cc: dave.anglin@bell.net, jejb@parisc-linux.org
To: deller@gmx.de, linux-parisc@vger.kernel.org,
	linux@sciencehorizons.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160531132300.21122.qmail@ns.sciencehorizons.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PA-RISC is interesting; integer multiplies are implemented in
the FPU, so are painful in the kernel.  But it tries to be
friendly to shift-and-add sequences.

__hash_32 is implemented using the same shift-and-add sequence as
Microblaze, just scheduled for the PA7100.  (It's 2-way superscalar
but in-order, like the Pentium.)

hash_64 was tricky.  My tools can't find good shift-and-add sequence
for the large multiplier, but the multiplier can be factored and two
sequences for smaller multipliers cascaded.

An alternative implementation is included, but not enabled by default:
Thomas Wang's 64-to-32-bit hash.  This is more compact than the multiply,
but has the same length dependency chain.

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
Definitely an interesting architecture.  How did I do?
This should pass the self-test in test_hash.ko.

 arch/parisc/Kconfig            |   1 +
 arch/parisc/include/asm/hash.h | 164 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/parisc/include/asm/hash.h

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 88cfaa8..8ed2a44 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -30,6 +30,7 @@ config PARISC
 	select TTY # Needed for pdc_cons.c
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HASH
 	select HAVE_ARCH_SECCOMP_FILTER
 	select ARCH_NO_COHERENT_DMA_MMAP
 
diff --git a/arch/parisc/include/asm/hash.h b/arch/parisc/include/asm/hash.h
new file mode 100644
index 0000000..e28462c
--- /dev/null
+++ b/arch/parisc/include/asm/hash.h
@@ -0,0 +1,164 @@
+#ifndef _ASM_HASH_H
+#define _ASM_HASH_H
+
+/*
+ * HP-PA only implements integer multiply in the FPU.  However, for
+ * integer multiplies by constant, it has a number of shift-and-add
+ * (but no shift-and-subtract, sigh!) instructions that a compiler
+ * can synthesize a code sequence with.
+ *
+ * Unfortunately, GCC isn't very efficient at using them.  For example
+ * it uses three instructions for "x *= 21" when only two are needed.
+ * But we can find a sequence manually.
+ */
+
+#define HAVE_ARCH__HASH_32 1
+
+/*
+ * This is a multiply by GOLDEN_RATIO_32 = 0x61C88647 optimized for the
+ * PA7100 pairing rules.  This is an in-order 2-way superscalar processor.
+ * Only one instruction in a pair may be a shift (by more than 3 bits),
+ * but other than that, simple ALU ops (including shift-and-add by up
+ * to 3 bits) may be paired arbitrarily.
+ *
+ * PA8xxx processors are out of order and don't need such careful
+ * scheduling.
+ *
+ * This 6-step sequence was found by Yevgen Voronenko's implementation
+ * of the Hcub algorithm at http://spiral.ece.cmu.edu/mcm/gen.html.
+ */
+static inline u32 __attribute_const__ __hash_32(u32 x)
+{
+	u32 a, b, c;
+
+	/*
+	 * Phase 1: Compute  a = (x << 19) + x,
+	 * b = (x << 9) + a, c = (x << 23) + b.
+	 */
+	a = x << 19;		/* Two shifts can't be paired */
+	b = x << 9;	a += x;
+	c = x << 23;	b += a;
+			c += b;
+	/* Phase 2: Return (b<<11) + (c<<6) + (a<<3) - c */
+	b <<= 11;
+	a += c << 3;	b -= c;
+	return (a << 3) + b;
+}
+
+#if BITS_PER_LONG == 64
+
+#define HAVE_ARCH_HASH_64 1
+
+#if HAVE_ARCH_HASH_64 == 1
+/*
+ * Multiply by GOLDEN_RATIO_64.  This number factors as:
+ *   0x0x61C8864680B583EB
+ * = 7046029254386353131
+ * = 3 * 3 * 53 * 2237 * 22739 * 290394721
+ * = 9 * 2695958579 * 290394721
+ * = 2695958579 * 2613552489
+ *
+ * While the Hcub software crashes on numbers too close to 64 bits,
+ * and finds crappy solutions for numbers much more than 32 bits, it
+ * can find decent sequences for those two values.  So cascade the two.
+ *
+ * Here's an alternative sequence for step 2, based on
+ * a 6-shift 6-add sequence for 290394721 (sign-flipped so the one
+ * small shift is in an add) followed by a multiply by 9:
+ *	a = x - (x << 7);
+ *	b = (a << 16) + a - (x << 20);
+ *	c = (x << 3) + b;
+ *	x = (a << 10) - (c << 5) + b;
+ *	x *= 9;
+ * ... however, it's not clear which is better.
+ *
+ * The asm("" : "=r" () : "0" (...)) statements are simply assignment
+ * statments, but they stop GCC from doing stupid things.
+ * Any time GCC sees two consecutive shifts, it insists on trying to
+ * merge them, even at the expense of another temporary and going out
+ * of short shift range.
+ * Likewise, it tries to combine adds and subtracts without considering
+ * that PA has shift-and-add but not shift-and-subtract.  So "x = -x;
+ * a = (a << 1) + x" is the same two instructions as "a <<= 1; a -= x",
+ * but the latter is a 2-cycle dependency chain on a, while the former
+ * is only one.
+ */
+static __always_inline u32 __attribute_const__
+hash_64(u64 x, unsigned int bits)
+{
+	u64 a, b, c;
+
+	/* Step 1: Multiply by 2695958579 */
+	/* 6 shifts + 6 adds, one is small enough for shladd */
+	/* 6 cycle dependency chain */
+	a = (x << 20) + x;
+	b = x << 29;
+	a += (x << 4);
+	x <<= 11;
+	b = a - b;
+	a += x;
+	b *= 3;
+	x = (a << 12) + b;
+
+	/* Step 2: Multiply by 2613552489 */
+	/* 7 shift + 7 adds, three are small enough for shladd */
+	/* 6 cycle dependency chain (via a) */
+	a = (x << 19) + x;
+	asm("" : "=r" (c) : "0" (x << 9));
+	asm("" : "=r" (b) : "0" (a + (c << 3)));
+	asm("" : "=r" (x) : "0" (-x));
+	asm("" : "=r" (a) : "0" (a << 7));
+	b = a - b;
+	a = (a << 1) + x;
+	c -= b;
+	a = (a << 1) + b;
+	x = (a << 3) + c;
+
+	return x >> (64 - bits);
+}
+#else /* HAVE_ARCH_HASH_64 != 1 */
+/*
+ * If we don't care about matching the generic function, here's an
+ * alternative hash function; Thomas Wang's 64-to-32 bit hash function.
+ * https://web.archive.org/web/2011/http://www.concentric.net/~Ttwang/tech/inthash.htm
+ * http://burtleburtle.net/bob/hash/integer.html
+ *
+ * This algorithm concentrates the entropy in the low bits of the output,
+ * so they are returned.
+ *
+ * The code is smaller than the multiply, but each instruction (there
+ * are usually 2 per line) is sequentially dependent, so it's also a
+ * 12-cycle dependency chain.
+ */
+static __always_inline u32 __attribute_const__
+hash_64(u64 x, unsigned int bits)
+{
+	u64 y;
+
+	if (!__builtin_constant_p(bits))
+		asm("mtsarcm %1" : "=q" (bits) : "r" (bits));
+
+	x = ~x + (x << 18);
+	x ^= x >> 31;
+	y = x * 5;	/* GCC uses 3 instructions for "x *= 21" */
+	x += y << 2;
+	x ^= x >> 11;
+	x += x << 6;
+	x ^= x >> 22;
+
+	if (__builtin_constant_p(bits)) {
+		x = x >> (64 - bits) << (64 - bits);
+	} else {
+		asm("depdi,z 0x1F,%%sar,63,%0" : "=r" (y) : "q" (bits));
+		x &= ~y;
+	}
+
+	return x;
+}
+
+#endif /* HAVE_ARCH_HASH_64 */
+#endif /* BITS_PER_LONG == 64 */
+
+#endif /* _ASM_HASH_H */
+
+
-- 
2.8.1

