From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Reintroduce option to gzip-compress the kernel
Date: Fri, 22 Sep 2017 22:24:02 +0200
Message-ID: <20170922202402.GA21262@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

By adding the feature to build the kernel as self-extracting
executeable, the possibility to simply compress the kernel with gzip was
lost.

This patch now reintroduces this possibilty again and leaves it up to
the user to decide how the kernel should be built.

The palo bootloader is able to natively load both formats.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bb8ed34024ef..cce21a159fe7 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -258,6 +258,18 @@ config PARISC_PAGE_SIZE_64KB
 
 endchoice
 
+config PARISC_SELF_EXTRACT
+	bool "Build kernel as self-extracting executable"
+	default y
+	help
+	  Say Y if you want to build the parisc kernel as a kind of
+	  self-extracting executable.
+
+	  If you say N here, the kernel will be compressed with gzip
+	  which can be loaded by the palo bootloader directly too.
+
+	  If you don't know what to do here, say Y.
+
 config SMP
 	bool "Symmetric multi-processing support"
 	---help---
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 58fae5d2449d..01946ebaff72 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -129,8 +129,13 @@ Image: vmlinux
 bzImage: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
+ifdef CONFIG_PARISC_SELF_EXTRACT
 vmlinuz: bzImage
 	$(OBJCOPY) $(boot)/bzImage $@
+else
+vmlinuz: vmlinux
+	@gzip -cf -9 $< > $@
+endif
 
 install:
 	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
