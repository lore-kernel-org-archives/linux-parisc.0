From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move hpmc stack into page aligned bss section
Date: Wed, 5 Oct 2016 22:05:39 +0200
Message-ID: <20161005200539.GA2983@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Do not reserve space in data section for hpmc stack, instead move it
into the page aligned bss section.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index e158b6f..1bd0e09 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -41,12 +41,12 @@
  */
 
 	.level		1.1
-	.data
 
 #include <asm/assembly.h>
 #include <asm/pdc.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	/*
 	 * stack for os_hpmc, the HPMC handler.
@@ -55,6 +55,7 @@
 	 * IODC requires 7K byte stack.  That leaves 1K byte for os_hpmc.
 	 */
 
+	__PAGE_ALIGNED_BSS
 	.align 4096
 hpmc_stack:
 	.block 16384
@@ -65,6 +66,7 @@ hpmc_stack:
 hpmc_iodc_buf:
 	.block HPMC_IODC_BUF_SIZE
 
+	.section .bss
 	.align 8
 hpmc_raddr:
 	.block 128
@@ -297,9 +299,9 @@ os_hpmc_6:
 	nop
 ENDPROC(os_hpmc)
 .os_hpmc_end:
-	nop
-.data
-.align 4
+
+
+	__INITRODATA
 	.export os_hpmc_size
 os_hpmc_size:
 	.word .os_hpmc_end-.os_hpmc
