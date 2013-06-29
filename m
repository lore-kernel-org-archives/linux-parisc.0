From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: switch to gzip-compressed vmlinuz kernel
Date: Sat, 29 Jun 2013 13:31:24 +0200
Message-ID: <20130629113124.GA1320@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The latest palo (PA-RISC Boot Loader) allows loading of a
gzip-compressed vmlinuz kernel. So let's switch to build a vmlinuz file
when we build a palo boot image.

PALO version 1.9 (or higher) is required for this which is available in
the dev_gzip branch of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git 

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 6507dab..c88c147 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -3,6 +3,7 @@ config PARISC
 	select ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS
 	select HAVE_IDE
 	select HAVE_OPROFILE
+	select HAVE_KERNEL_GZIP
 	select HAVE_FUNCTION_TRACER if 64BIT
 	select HAVE_FUNCTION_GRAPH_TRACER if 64BIT
 	select HAVE_FUNCTION_TRACE_MCOUNT_TEST if 64BIT
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 96ec398..6666133 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -17,6 +17,8 @@
 # Mike Shaver, Helge Deller and Martin K. Petersen
 #
 
+KBUILD_IMAGE := $(objtree)/vmlinuz
+
 KBUILD_DEFCONFIG := default_defconfig
 
 NM		= sh $(srctree)/arch/parisc/nm
@@ -92,7 +94,7 @@ PALOCONF := $(shell if [ -f $(src)/palo.conf ]; then echo $(src)/palo.conf; \
 	else echo $(obj)/palo.conf; \
 	fi)
 
-palo: vmlinux
+palo: vmlinuz
 	@if test ! -x "$(PALO)"; then \
 		echo 'ERROR: Please install palo first (apt-get install palo)';\
 		echo 'or build it from source and install it somewhere in your $$PATH';\
@@ -107,10 +109,10 @@ palo: vmlinux
 	fi
 	$(PALO) -f $(PALOCONF)
 
-# Shorthands for known targets not supported by parisc, use vmlinux as default
-Image zImage bzImage: vmlinux
+vmlinuz: vmlinux
+	@gzip -cf -9 $< > $@
 
-install: vmlinux
+install: vmlinuz
 	sh $(src)/arch/parisc/install.sh \
 			$(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
 
@@ -119,6 +121,7 @@ MRPROPER_FILES	+= palo.conf
 
 define archhelp
 	@echo  '* vmlinux	- Uncompressed kernel image (./vmlinux)'
+	@echo  '  vmlinuz	- Compressed kernel image (./vmlinuz)'
 	@echo  '  palo		- Bootable image (./lifimage)'
 	@echo  '  install	- Install kernel using'
 	@echo  '		  (your) ~/bin/$(INSTALLKERNEL) or'
diff --git a/arch/parisc/defpalo.conf b/arch/parisc/defpalo.conf
index 4e1ae25..fac130a 100644
--- a/arch/parisc/defpalo.conf
+++ b/arch/parisc/defpalo.conf
@@ -4,7 +4,7 @@
 # Most people using 'make palo' want a bootable file, usable for
 # network or tape booting for example.
 --init-tape=lifimage
---recoverykernel=vmlinux
+--recoverykernel=vmlinuz
 
 ########## Pick your ROOT here! ##########
 # You need at least one 'root='!
@@ -12,10 +12,10 @@
 # If you want a root ramdisk, use the next 2 lines
 #   (Edit the ramdisk image name!!!!)
 --ramdisk=ram-disk-image-file
---commandline=0/vmlinux HOME=/ root=/dev/ram initrd=0/ramdisk
+--commandline=0/vmlinuz HOME=/ root=/dev/ram initrd=0/ramdisk
 
 # If you want NFS root, use the following command line (Edit the HOSTNAME!!!)
-#--commandline=0/vmlinux HOME=/ root=/dev/nfs nfsroot=HOSTNAME ip=bootp
+#--commandline=0/vmlinuz HOME=/ root=/dev/nfs nfsroot=HOSTNAME ip=bootp
 
 # If you have root on a disk partition, use this (Edit the partition name!!!)
-#--commandline=0/vmlinux HOME=/ root=/dev/sda1
+#--commandline=0/vmlinuz HOME=/ root=/dev/sda1
diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index e593fc8..4da682b 100644
--- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -26,13 +26,13 @@ if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
 
 # Default install
 
-if [ -f $4/vmlinux ]; then
-	mv $4/vmlinux $4/vmlinux.old
+if [ -f $4/vmlinuz ]; then
+	mv $4/vmlinuz $4/vmlinuz.old
 fi
 
 if [ -f $4/System.map ]; then
 	mv $4/System.map $4/System.old
 fi
 
-cat $2 > $4/vmlinux
+cat $2 > $4/vmlinuz
 cp $3 $4/System.map
