From: "George Spelvin" <linux@sciencehorizons.net>
Subject: [PATCH v2, still needs work] parisc: add <asm/hash.h>
Date: 2 Jun 2016 17:37:34 -0400
Message-ID: <20160602213734.8916.qmail@ns.sciencehorizons.net>
References: <20160531134156.878.qmail@ns.sciencehorizons.net>
Cc: dave.anglin@bell.net, jejb@parisc-linux.org
To: deller@gmx.de, linux-parisc@vger.kernel.org,
	linux@sciencehorizons.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160531134156.878.qmail@ns.sciencehorizons.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>From 76c1fedcb594fc4a75e2d836ab40e9e8ec455755 Mon Sep 17 00:00:00 2001
From: George Spelvin <linux@horizon.com>
Date: Thu, 2 Jun 2016 17:31:42 -0400
Subject: [PATCH] parisc: add <asm/hash.h>

PA-RISC is interesting; integer multiplies are implemented in the
FPU, so are painful in the kernel.  But it tries to be friendly to
shift-and-add sequences.

__hash_32 is implemented using the same shift-and-add sequence as
Microblaze, just scheduled for the PA7100.  (It's 2-way superscalar
but in-order, like the Pentium.)

hash_64 was tricky, but a suggestion from Jason Thong allowed a good
solution by breaking up the multiplier.  Unfortunately, I scheduled it
based on a serious misunderstanding of the PA8000's pipeline.  It's 4-way
superscalar, but two of those slots are reserved for load/store instructions.
Contrary to what I thought while writing the code, it can only issue 2 ALU
operations per cycle, so the 20 instructions here take 11 cycles.
(The final add can't be paired.)

An alternative implementation is included, but not enabled by default:
Thomas Wang's 64-to-32-bit hash.  This is more compact than the multiply,
but has a slightly longer dependency chain.

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
I got allexcited when I managed to schedule the multiply in 8 cycles..
then realized I misunderstood the "4-way superscalar" nature of the
PA8000.  Still, it's better than the previous one, so I'm sending it
out for comment anyway.

 arch/parisc/Kconfig            |   1 +
 arch/parisc/include/asm/hash.h | 190 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
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
index 0000000..13f8073
--- /dev/null
+++ b/arch/parisc/include/asm/hash.h
@@ -0,0 +1,190 @@
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
+ * Multiply by GOLDEN_RATIO_64.  Finding a good shift-and-add chain for
+ * this is tricky, because available software for the purpose chokes on
+ * constants this large.  (It's mostly used for compiling FIR filter
+ * coefficients into FPGAs.)
+ *
+ * However, Jason Thong pointed out a work-around.  The Hcub software
+ * (http://spiral.ece.cmu.edu/mcm/gen.html) is designed for *multiple*
+ * constant multiplication, and is good at finding shift-and-add chains
+ * which share common terms.
+ *
+ * Looking at 0x0x61C8864680B583EB in binary:
+ * 0110000111001000100001100100011010000000101101011000001111101011
+ *  \______________/    \__________/       \_______/     \________/
+ *   \____________________________/         \____________________/
+ * you can see the non-zero bits are divided into several well-separated
+ * blocks.  Hcub can find algorithms for those terms separately, which
+ * can then be shifted and added together.
+ *
+ * Various combinations all work, but using just two large blocks,
+ * 0xC3910C8D << 31 in the high bits, and 0xB583EB in the low bits,
+ * produces as good an algorithm as any, and with one more small shift
+ * than alternatives.
+ *
+ * The high bits are a larger number and more work to compute, as well
+ * as needing one extra cycle to shift left 31 bits before the final
+ * addition, so they are the critical path for scheduling.  The low bits
+ * can fit into the scheduling slots left over.
+ *
+ * This is scheduled for the PA-8xxx series, which can issue up to
+ * 2 ALU operations (including shladd) + 2 shifts per cycle.
+ *
+ * Basically, the first three cycles compute common terms used for both
+ * constants, and the computation splits starting with cycle 4.
+ *
+ * Scheduling is limited by data dependency, except for cycle 6, where the
+ * first instruction ("b += a") is delayed due to a lack of ALU resources
+ * in cycle 5.  Fortunately, that (and the following shift) isn't on the
+ * critical path and the delay is inconsequential.
+ *
+ * In several places, the construction asm("" : (+r) (dest) : "0" (src));
+ * is used.  This basically performs "dest = src", but prevents gcc from
+ * inferring anything about the value assigned to "dest".  This blocks it
+ * from some mistaken optimizations like rearranging "y += z; x -= y;"
+ * into "x -= z; x -= y;", or "x <<= 23; y += x; z += x << 1;" into
+ * "y += x << 23; z += x << 24;".
+ *
+ * Because the actual assembly generated is empty, this construct is
+ * usefully portable across all GCC platforms, and so can be test-compiled
+ * on non-PA systems.
+ *
+ * In two places, a second unused input dependency is added.  This forces
+ * GCC's scheduling so it does not rearrange instructions too much.
+ */
+static __always_inline u32 __attribute_const__
+hash_64(u64 a, unsigned int bits)
+{
+	u64 b, c, d, e;
+		/* Cycle 1 */
+	asm("" : "=r" (d) : "0" (a * 5));
+	b = a << 13;
+	c = a << 17;
+		/* Cycle 2 */
+	b += c;
+	d = (d << 2) + a;       /* = a * 21 */
+		/* Cycle 3 */
+	a = (a << 1) + d;       /* = a * 23 */
+	c = d << 7;
+	b += d;
+		/* Cycle 4 */
+	asm("" : "=r" (c) : "0" (c+d));		/* c += d */
+	d = (d << 1) + b;
+	asm("" : "=r" (e) : "0" (a << 23));     /* e = a << 23 */
+	asm("" : "=r" (a) : "0" (a << 10));	/* a <<= 10 */
+		/* Cycle 5 */
+	d += e << 1;
+	c += e;
+		/* Cycle 6 */
+	asm("" : "=r" (b) : "0" (b + a),	/* b += a */
+		 "r" (d));			/* Force scheduling */
+	a <<= 9;
+	c += d << 3;
+		/* Cycle 7 */
+	a -= b;
+	bits = 64 - bits;
+	c <<= 31;
+		/* Cycle 8 */
+	asm("" : "=r" (a) : "0" (a + c), "X" (bits));
+		/* Cycle 9 */
+	return a >> bits;
+}
+
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
+ * Compared to the multiply, this uses 2 registers (rather than 5), and
+ * 12 instructions (rather than 20), but each instruction in sequentially
+ * dependent, so it's 12 cycles (rather than 8).
+ *
+ * (In both cases, I'm not counting the final extract of the desired bits.)
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
+		asm("depdi,z -1,%%sar,64,%0" : "=r" (y) : "q" (bits));
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
-- 
2.8.1

