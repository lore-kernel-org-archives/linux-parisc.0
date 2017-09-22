From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Unbreak bootloader due to gcc-7 optimizations
Date: Fri, 22 Sep 2017 21:57:11 +0200
Message-ID: <20170922195711.GA28303@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

gcc-7 optimizes the byte-wise accesses of get_unaligned_le32() into
word-wise accesses if the 32-bit integer output_len is declared as
external. This panics then the bootloader since we don't have the
unaligned access fault trap handler installed during boot time.

Avoid this optimization by declaring output_len as byte-aligned and thus
unbreak the bootloader code.

Additionally, compile the boot code optimized for size.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index 5450a11c9d10..7d7e594bda36 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -15,7 +15,7 @@ targets += misc.o piggy.o sizes.h head.o real2.o firmware.o
 KBUILD_CFLAGS := -D__KERNEL__ -O2 -DBOOTLOADER
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += $(cflags-y) -fno-delete-null-pointer-checks
-KBUILD_CFLAGS += -fno-PIE -mno-space-regs -mdisable-fpregs
+KBUILD_CFLAGS += -fno-PIE -mno-space-regs -mdisable-fpregs -Os
 ifndef CONFIG_64BIT
 KBUILD_CFLAGS += -mfast-indirect-calls
 endif
diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
index 13a4bf9ac4da..a32325914429 100644
--- a/arch/parisc/boot/compressed/misc.c
+++ b/arch/parisc/boot/compressed/misc.c
@@ -24,7 +26,8 @@
 /* Symbols defined by linker scripts */
 extern char input_data[];
 extern int input_len;
-extern __le32 output_len;	/* at unaligned address, little-endian */
+/* output_len is inserted by the linker possibly at an unaligned address */
+extern __le32 output_len __aligned(1);
 extern char _text, _end;
 extern char _bss, _ebss;
 extern char _startcode_end;
