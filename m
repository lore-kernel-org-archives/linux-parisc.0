From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Don't use BITS_PER_LONG in userspace-exported swab.h
 header
Date: Sat, 28 Jan 2017 11:52:02 +0100
Message-ID: <20170128105202.GA8664@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Henderson <rth@twiddle.net>
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In swab.h the "#if BITS_PER_LONG > 32" breaks compiling userspace programs if
BITS_PER_LONG is #defined by userspace with the sizeof() compiler builtin.

Solve this problem by using __BITS_PER_LONG instead.  Since we now
#include asm/bitsperlong.h avoid further potential userspace pollution
by moving the #define of SHIFT_PER_LONG to bitops.h which is not
exported to userspace.

This patch unbreaks compiling qemu on hppa/parisc.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org>

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bitops.h
index 3f9406d..da87943 100644
--- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -6,7 +6,7 @@
 #endif
 
 #include <linux/compiler.h>
-#include <asm/types.h>		/* for BITS_PER_LONG/SHIFT_PER_LONG */
+#include <asm/types.h>
 #include <asm/byteorder.h>
 #include <asm/barrier.h>
 #include <linux/atomic.h>
@@ -17,6 +17,12 @@
  * to include/asm-i386/bitops.h or kerneldoc
  */
 
+#if __BITS_PER_LONG == 64
+#define SHIFT_PER_LONG 6
+#else
+#define SHIFT_PER_LONG 5
+#endif
+
 #define CHOP_SHIFTCOUNT(x) (((unsigned long) (x)) & (BITS_PER_LONG - 1))
 
 
diff --git a/arch/parisc/include/uapi/asm/bitsperlong.h b/arch/parisc/include/uapi/asm/bitsperlong.h
index e0a23c7..07fa7e5 100644
--- a/arch/parisc/include/uapi/asm/bitsperlong.h
+++ b/arch/parisc/include/uapi/asm/bitsperlong.h
@@ -3,10 +3,8 @@
 
 #if defined(__LP64__)
 #define __BITS_PER_LONG 64
-#define SHIFT_PER_LONG 6
 #else
 #define __BITS_PER_LONG 32
-#define SHIFT_PER_LONG 5
 #endif
 
 #include <asm-generic/bitsperlong.h>
diff --git a/arch/parisc/include/uapi/asm/swab.h b/arch/parisc/include/uapi/asm/swab.h
index e78403b..928e1bb 100644
--- a/arch/parisc/include/uapi/asm/swab.h
+++ b/arch/parisc/include/uapi/asm/swab.h
@@ -1,6 +1,7 @@
 #ifndef _PARISC_SWAB_H
 #define _PARISC_SWAB_H
 
+#include <asm/bitsperlong.h>
 #include <linux/types.h>
 #include <linux/compiler.h>
 
@@ -38,7 +39,7 @@ static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
 }
 #define __arch_swab32 __arch_swab32
 
-#if BITS_PER_LONG > 32
+#if __BITS_PER_LONG > 32
 /*
 ** From "PA-RISC 2.0 Architecture", HP Professional Books.
 ** See Appendix I page 8 , "Endian Byte Swapping".
@@ -61,6 +62,6 @@ static inline __attribute_const__ __u64 __arch_swab64(__u64 x)
 	return x;
 }
 #define __arch_swab64 __arch_swab64
-#endif /* BITS_PER_LONG > 32 */
+#endif /* __BITS_PER_LONG > 32 */
 
 #endif /* _PARISC_SWAB_H */
