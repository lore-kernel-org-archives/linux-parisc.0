From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC][PATCH] parisc: Add support for self-extracting kernel
Date: Mon, 21 Aug 2017 16:24:34 +0200
Message-ID: <20170821142434.GA7148@p100.box>
References: <20170820085222.GA10546@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170820085222.GA10546@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The patch below is missing on top of the old patch I sent.
It's needed to avoid usage of fp registers.
This patch unbreaks booting the lzma variants (XZ, LZO, LZMA,...)

Signed-off-by: Helge Deller <deller@gmx.de>

Helge

diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index 9b2d304..5450a11 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -15,8 +15,7 @@ targets += misc.o piggy.o sizes.h head.o real2.o firmware.o
 KBUILD_CFLAGS := -D__KERNEL__ -O2 -DBOOTLOADER
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += $(cflags-y) -fno-delete-null-pointer-checks
-KBUILD_CFLAGS += $(call cc-option,-mpacked-stack)
-KBUILD_CFLAGS += -fno-PIE -mno-space-regs
+KBUILD_CFLAGS += -fno-PIE -mno-space-regs -mdisable-fpregs
 ifndef CONFIG_64BIT
 KBUILD_CFLAGS += -mfast-indirect-calls
 endif
