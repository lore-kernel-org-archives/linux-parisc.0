From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add CONFIG_MLONGCALLS option to enable linkage of
 huge vmlinux executables
Date: Thu, 31 Jan 2013 22:44:28 +0100
Message-ID: <20130131214428.GA8928@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When building a 64bit kernel which includes all necessary drivers and
filesystems the vmlinux kernel often gets so huge, that the linker won't
be able to resolve the branch stubs. This patch overcomes this limit by
providing an option to compile the kernel with the -mlong-calls compiler
option.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b77feff..3df1c35 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -161,6 +161,23 @@ config PREFETCH
 	def_bool y
 	depends on PA8X00 || PA7200
 
+config MLONGCALLS
+	bool "Enable the -mlong-calls compiler option for big kernels"
+	def_bool y if (!MODULES)
+	depends on PA8X00
+	help
+	  If you configure the kernel to include many drivers built-in instead
+	  as modules, the kernel executable may become too big, so that the
+	  linker will not be able to resolve some long branches and fails to link
+	  your vmlinux kernel. In that case enabling this option will help you
+	  to overcome this limit by using the -mlong-calls compiler option.
+
+	  Usually you want to say N here, unless you e.g. want to build
+	  a kernel which includes all necessary drivers built-in and which can
+	  be used for TFTP booting without the need to have an initrd ramdisk.
+
+	  Enabling this option will probably slow down your kernel.
+
 config 64BIT
 	bool "64-bit kernel"
 	depends on PA8X00
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 5707f1a..ed9a14c 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -65,6 +64,10 @@ ifndef CONFIG_FUNCTION_TRACER
   cflags-y	+= -ffunction-sections
 endif
 
+# Use long jumps instead of long branches (needed if your linker fails to
+# link a too big vmlinux executable)
+cflags-$(CONFIG_MLONGCALLS)	+= -mlong-calls
+
 # select which processor to optimise for
 cflags-$(CONFIG_PA7100)		+= -march=1.1 -mschedule=7100
 cflags-$(CONFIG_PA7200)		+= -march=1.1 -mschedule=7200
