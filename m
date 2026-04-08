Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADC3AA4E4;
	Wed,  8 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672371; cv=none; b=nKDKaEcLcg23qI0TOQnnFJVNru1wFFr+JYjNyDKXKD0JR3UHjIBEHqnzPeeB+j/8JL5RVxs4jfn8Cen4PQkXZhMO6symQFFihTSoMq84L3MIn9tjhnqN1E6MwBKJJprGyBSbuQrQWMYyl/JqedbaLS/I/UqI1TsVwpZeIsxyCek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672371; c=relaxed/simple;
	bh=IDlueQMvRY1IKD3JHLnZbBTtli7lXKkj6EB8pyD431U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKIsEx9e4MZb2SU2QBb4f9Sh7y0KtT3hl0Uee74UYvMpFA6BtYyz3x5FA7QXn1rDO6LGRbF3RNYrtHgdbPurnejSq/iiSK98bEiJzNp/GZ727cBfSVAk1MBSgQwFQQg2uyL1n/6Ao/VtNqrhRLWaVuQ1TH9pQY/lEbazG6BypN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NQLwA5Dw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NQLwA5Dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775672361;
	bh=IDlueQMvRY1IKD3JHLnZbBTtli7lXKkj6EB8pyD431U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NQLwA5DwKnFHe5EO4WqfRy1J+pMEe3AJD2DxGpGzOFHYleY8g3n0RqmEEs/aVcnWy
	 UpYn0efeKOcdLDWcrFPEaE3iHpBrzT++aa45YJDRD19UxVl1MACxRHvcBUQ70F2rNa
	 aFGDzN1IXaT+t3gnh+M5NpCX3R57GodvbROKJfIU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 20:18:44 +0200
Subject: [PATCH v2 4/4] tools/nolibc: add support for 32-bit parisc
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-nolibc-hppa-v2-4-7fe404cb61e3@weissschuh.net>
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
In-Reply-To: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775672360; l=14307;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IDlueQMvRY1IKD3JHLnZbBTtli7lXKkj6EB8pyD431U=;
 b=GYrfixImi68ILsb1HF6/HLr4i5rhVuv2CQ9ByawzqFYUVjQeIf21Ce/REHvqvdAkjd7YnE/p9
 laEj/Yf1bCLDw5VaHvoWJxTeZAy0De0mbtnHEezMhehpGkfOS8tRlUF
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile                  |   2 +-
 tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/run-tests.sh    |   4 +-
 5 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 7455097cff69..81187126bf93 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -17,7 +17,7 @@ endif
 # it defaults to this nolibc directory.
 OUTPUT ?= $(CURDIR)/
 
-architectures := arm arm64 loongarch m68k mips powerpc riscv s390 sh sparc x86
+architectures := arm arm64 loongarch m68k mips parisc powerpc riscv s390 sh sparc x86
 arch_files := arch.h $(addsuffix .h, $(addprefix arch-, $(architectures)))
 all_files := \
 		byteswap.h \
diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/arch-parisc.h
new file mode 100644
index 000000000000..8580be5c9c58
--- /dev/null
+++ b/tools/include/nolibc/arch-parisc.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * parisc/hppa (32-bit) specific definitions for NOLIBC
+ * Copyright (C) 2026 Thomas Weißschuh <linux@weissschuh.net>
+ */
+
+#ifndef _NOLIBC_ARCH_PARISC_H
+#define _NOLIBC_ARCH_PARISC_H
+
+#if defined(__LP64__)
+#error 64-bit not supported
+#endif
+
+#include "compiler.h"
+#include "crt.h"
+
+/* Syscalls for parisc :
+ *   - syscall number is passed in r20
+ *   - arguments are in r26 to r21
+ *   - the system call is performed by calling "ble 0x100(%sr2, %r0)",
+ *     the instruction after that is executed first, use it to load the number
+ *   - syscall return comes in r28
+ *   - the arguments are cast to long and assigned into the target
+ *     registers which are then simply passed as registers to the asm code,
+ *     so that we don't have to experience issues with register constraints.
+ */
+
+#define _NOLIBC_SYSCALL_CLOBBERLIST \
+	"memory", "%r1", "%r2", "%r4", "%r20", "%r29", "%r31"
+
+#define __nolibc_syscall0(num)                                                \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %1, %%r20\n\t"                                           \
+		: "=r"(_ret)                                                  \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall1(num, arg1)                                          \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %2, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1)                                                 \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall2(num, arg1, arg2)                                    \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+	register long _arg2 __asm__ ("r25") = (long)(arg2);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %3, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1), "+r"(_arg2)                                    \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall3(num, arg1, arg2, arg3)                              \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+	register long _arg2 __asm__ ("r25") = (long)(arg2);		      \
+	register long _arg3 __asm__ ("r24") = (long)(arg3);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %4, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3)                       \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall4(num, arg1, arg2, arg3, arg4)                        \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+	register long _arg2 __asm__ ("r25") = (long)(arg2);		      \
+	register long _arg3 __asm__ ("r24") = (long)(arg3);		      \
+	register long _arg4 __asm__ ("r23") = (long)(arg4);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %5, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4)          \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)                  \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+	register long _arg2 __asm__ ("r25") = (long)(arg2);		      \
+	register long _arg3 __asm__ ("r24") = (long)(arg3);		      \
+	register long _arg4 __asm__ ("r23") = (long)(arg4);		      \
+	register long _arg5 __asm__ ("r22") = (long)(arg5);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %6, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4),         \
+		  "+r"(_arg5)                                                 \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#define __nolibc_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)            \
+({                                                                            \
+	register long _ret __asm__ ("r28");                                   \
+	register long _arg1 __asm__ ("r26") = (long)(arg1);		      \
+	register long _arg2 __asm__ ("r25") = (long)(arg2);		      \
+	register long _arg3 __asm__ ("r24") = (long)(arg3);		      \
+	register long _arg4 __asm__ ("r23") = (long)(arg4);		      \
+	register long _arg5 __asm__ ("r22") = (long)(arg5);		      \
+	register long _arg6 __asm__ ("r21") = (long)(arg6);		      \
+									      \
+	__asm__ volatile (                                                    \
+		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
+		"ldi %7, %%r20\n\t"                                           \
+		: "=r"(_ret),                                                 \
+		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4),         \
+		  "+r"(_arg5), "+r"(_arg6)                                    \
+		: "i"(num)                                                    \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_ret;                                                                 \
+})
+
+#ifndef NOLIBC_NO_RUNTIME
+/* startup code */
+void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
+{
+	__asm__ volatile (
+		".import $global$\n"           /* Set up the dp register */
+		"ldil L%$global$, %dp\n"
+		"ldo R%$global$(%r27), %dp\n"
+
+		"ldo -4(%r24), %r26\n"         /* The sp register is special on parisc.
+						* r24 points to argv. Subtract 4 to get &argc.
+						* Pass that as first argument to _start_c.
+						*/
+
+		"b,n _start_c\n"
+	);
+	__nolibc_entrypoint_epilogue();
+}
+#endif /* NOLIBC_NO_RUNTIME */
+
+#endif /* _NOLIBC_ARCH_PARISC_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index a3adaf433f2c..6dc45a78e972 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -28,6 +28,8 @@
 #include "arch-m68k.h"
 #elif defined(__sh__)
 #include "arch-sh.h"
+#elif defined(__hppa__)
+#include "arch-parisc.h"
 #else
 #error Unsupported Architecture
 #endif
diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index f30bc68470cc..e9494f3cbc03 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -64,6 +64,7 @@ ARCH_s390x       = s390
 ARCH_sparc32     = sparc
 ARCH_sparc64     = sparc
 ARCH_sh4         = sh
+ARCH_parisc32    = parisc
 ARCH            := $(or $(ARCH_$(XARCH)),$(XARCH))
 
 # kernel image names by architecture
@@ -92,6 +93,7 @@ IMAGE_sparc32    = arch/sparc/boot/image
 IMAGE_sparc64    = arch/sparc/boot/image
 IMAGE_m68k       = vmlinux
 IMAGE_sh4        = arch/sh/boot/zImage
+IMAGE_parisc32   = vmlinux
 IMAGE            = $(objtree)/$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
@@ -121,6 +123,7 @@ DEFCONFIG_sparc32    = sparc32_defconfig
 DEFCONFIG_sparc64    = sparc64_defconfig
 DEFCONFIG_m68k       = virt_defconfig
 DEFCONFIG_sh4        = rts7751r2dplus_defconfig
+DEFCONFIG_parisc32   = defconfig
 DEFCONFIG            = $(DEFCONFIG_$(XARCH))
 
 EXTRACONFIG_x32       = -e CONFIG_X86_X32_ABI
@@ -159,6 +162,7 @@ QEMU_ARCH_sparc32    = sparc
 QEMU_ARCH_sparc64    = sparc64
 QEMU_ARCH_m68k       = m68k
 QEMU_ARCH_sh4        = sh4
+QEMU_ARCH_parisc32   = hppa
 QEMU_ARCH            = $(QEMU_ARCH_$(XARCH))
 
 QEMU_ARCH_USER_ppc64le = ppc64le
@@ -199,6 +203,7 @@ QEMU_ARGS_sparc32    = -M SS-5 -m 256M -append "console=ttyS0,115200 panic=-1 $(
 QEMU_ARGS_sparc64    = -M sun4u -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_sh4        = -M r2d -serial file:/dev/stdout -append "console=ttySC1,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_parisc32   = -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
@@ -215,6 +220,7 @@ CFLAGS_i386 = $(call cc-option,-m32)
 CFLAGS_x32 = -mx32
 CFLAGS_arm = -marm
 CFLAGS_armthumb = -mthumb -march=armv6t2
+CFLAGS_parisc32 = -mfast-indirect-calls
 CFLAGS_ppc = -m32 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
 CFLAGS_ppc64 = -m64 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
 CFLAGS_ppc64le = -m64 -mlittle-endian -mno-vsx $(call cc-option,-mabi=elfv2)
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 3917cfb8fdc4..981a680cebfb 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -28,6 +28,7 @@ all_archs=(
 	sparc32 sparc64
 	m68k
 	sh4
+	parisc32
 )
 archs="${all_archs[@]}"
 
@@ -116,6 +117,7 @@ crosstool_arch() {
 	s390*) echo s390;;
 	sparc*) echo sparc64;;
 	x32*) echo x86_64;;
+	parisc32) echo hppa;;
 	*) echo "$1";;
 	esac
 }
@@ -185,7 +187,7 @@ test_arch() {
 			exit 1
 	esac
 	printf '%-15s' "$arch:"
-	if [ "$arch" = "m68k" -o "$arch" = "sh4" ] && [ "$llvm" = "1" ]; then
+	if [ "$arch" = "m68k" -o "$arch" = "sh4" -o "$arch" = "parisc32" ] && [ "$llvm" = "1" ]; then
 		echo "Unsupported configuration"
 		return
 	fi

-- 
2.53.0

