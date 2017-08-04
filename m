From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Enable UBSAN support
Date: Fri, 4 Aug 2017 23:46:16 +0200
Message-ID: <20170804214616.GA9270@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 7d2faf7..9db4b4f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -9,6 +9,8 @@ config PARISC
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_WANTS_UBSAN_NO_NULL
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
