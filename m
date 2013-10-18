From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: make "make install" not depend on vmlinux
Date: Fri, 18 Oct 2013 21:18:46 +0200
Message-ID: <20131018191846.GA31987@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Install targets (install, zinstall, uinstall) on parisc have a
dependency to vmlinux. This may cause parts of the kernel to be rebuilt
during installation. We must avoid this since this may run as root.
Install targets "ABSOLUTELY MUST NOT MODIFY THE SOURCE TREE." as Linus
emphasized this in:

http://lkml.org/lkml/2013/7/10/600

So on parisc and maybe other archs we need the same as for x86:

1648e4f8 x86, kbuild: make "make install" not depend on vmlinux

This parisc patch was inspired by:

19514fc6 arm, kbuild: make "make install" not depend on vmlinux

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index e02f665..7187664 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -94,7 +94,7 @@ PALOCONF := $(shell if [ -f $(src)/palo.conf ]; then echo $(src)/palo.conf; \
 	else echo $(obj)/palo.conf; \
 	fi)
 
-palo: vmlinuz
+palo lifimage: vmlinuz
 	@if test ! -x "$(PALO)"; then \
 		echo 'ERROR: Please install palo first (apt-get install palo)';\
 		echo 'or build it from source and install it somewhere in your $$PATH';\
@@ -109,16 +109,23 @@ palo: vmlinuz
 	fi
 	$(PALO) -f $(PALOCONF)
 
-# Shorthands for known targets not supported by parisc, use vmlinux/vmlinuz as default
+BOOT_TARGETS    = zImage Image palo lifimage
+INSTALL_TARGETS = zinstall install
+
+PHONY += bzImage $(BOOT_TARGETS) $(INSTALL_TARGETS)
+
+bzImage zImage: vmlinuz
 Image: vmlinux
-zImage bzImage: vmlinuz
 
 vmlinuz: vmlinux
 	@gzip -cf -9 $< > $@
 
-install: vmlinuz
-	sh $(src)/arch/parisc/install.sh \
-			$(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
+install:
+	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+			$(KERNELRELEASE) vmlinux System.map "$(INSTALL_PATH)"
+zinstall:
+	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+			$(KERNELRELEASE) vmlinuz System.map "$(INSTALL_PATH)"
 
 CLEAN_FILES	+= lifimage
 MRPROPER_FILES	+= palo.conf
@@ -127,10 +134,11 @@ define archhelp
 	@echo  '* vmlinux	- Uncompressed kernel image (./vmlinux)'
 	@echo  '  vmlinuz	- Compressed kernel image (./vmlinuz)'
 	@echo  '  palo		- Bootable image (./lifimage)'
-	@echo  '  install	- Install kernel using'
+	@echo  '  install	- Install uncompressed vmlinux kernel using'
 	@echo  '		  (your) ~/bin/$(INSTALLKERNEL) or'
 	@echo  '		  (distribution) /sbin/$(INSTALLKERNEL) or'
 	@echo  '		  copy to $$(INSTALL_PATH)'
+	@echo  '  zinstall	- Install compressed vmlinuz kernel'
 endef
 
 # we require gcc 3.3 or above to compile the kernel
diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index 4da682b..6f68784 100644
--- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -19,20 +19,48 @@
 #   $4 - default install path (blank if root directory)
 #
 
+verify () {
+	if [ ! -f "$1" ]; then
+		echo ""                                                   1>&2
+		echo " *** Missing file: $1"                              1>&2
+		echo ' *** You need to run "make" before "make install".' 1>&2
+		echo ""                                                   1>&2
+		exit 1
+	fi
+}
+
+# Make sure the files actually exist
+
+verify "$2"
+verify "$3"
+
 # User may have a custom install script
 
-if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
-if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
+if [ -n "${INSTALLKERNEL}" ]; then
+  if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
+  if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
+fi
 
 # Default install
 
-if [ -f $4/vmlinuz ]; then
-	mv $4/vmlinuz $4/vmlinuz.old
+if [ "$(basename $2)" = "zImage" ]; then
+# Compressed install
+  echo "Installing compressed kernel"
+  base=vmlinuz
+else
+# Normal install
+  echo "Installing normal kernel"
+  base=vmlinux
+fi
+
+if [ -f $4/$base-$1 ]; then
+  mv $4/$base-$1 $4/$base-$1.old
 fi
+cat $2 > $4/$base-$1
 
-if [ -f $4/System.map ]; then
-	mv $4/System.map $4/System.old
+# Install system map file
+if [ -f $4/System.map-$1 ]; then
+  mv $4/System.map-$1 $4/System.map-$1.old
 fi
+cp $3 $4/System.map-$1
 
-cat $2 > $4/vmlinuz
-cp $3 $4/System.map
