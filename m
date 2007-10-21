From: Sam Ravnborg <sam@ravnborg.org>
Subject: [parisc-linux] [PATCH][PARISC] Introduce cc-cross-prefix and clean
	up Makefile a bit
Date: Sun, 21 Oct 2007 20:34:30 +0200
Message-ID: <20071021183430.GA5881__5171.37383944846$1416624448$gmane$org@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>,
 Grant Grundler <grundler@parisc-linux.org>,
 Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Introduce cc-cross-prefix to improve compatibility
with diverse cross compile environments.

In the same process arch/parisc/Makefile was
beautified a little - with no functional changes.

In my setup I now avoid the error message from
"which palo" because I have no palo installed.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
partly tested. My hppa toolchain is busted but
I could test most of the changes.

IMHO the end-result is much easier to read.
I had to compromise on the indent where I did the CROSS_COMPILE
stuff - 3x8 was too much.

Please review my selected set of possible cross compile
prefixes. It is not a direct 1:1 from the original Makefile.

	Sam

 Makefile |   65 +++++++++++++++++++++++++++------------------------------------
 1 file changed, 28 insertions(+), 37 deletions(-)


diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index ae4a9b3..516a60f 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -18,28 +18,24 @@
 #
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
-
-MACHINE		:= $(shell uname -m)
-ifeq ($(MACHINE),parisc*)
-NATIVE		:= 1
-endif
+OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
 
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
-WIDTH		:= 64
-CROSS_COMPILE	:= hppa64-linux-gnu-
+ifneq ($(SUBARCH),$(ARCH))
+        ifeq ($(CROSS_COMPILE),)
+                CROSS_COMPILE := $(call cc-cross-prefix, hppa64-linux-gnu- hppa64-linux-)
+        endif
+endif
 else # 32-bit
-WIDTH		:=
+ifneq ($(SUBARCH),$(ARCH))
+        ifeq ($(CROSS_COMPILE),)
+                CROSS_COMPILE := $(call cc-cross-prefix, hppa-linux-gnu- hppa-linux-)
+        endif
 endif
-
-# attempt to help out folks who are cross-compiling
-ifeq ($(NATIVE),1)
-CROSS_COMPILE	:= hppa$(WIDTH)-linux-
 endif
 
-OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
-
 cflags-y	:= -pipe
 
 # These flags should be implied by an hppa-linux configuration, but they
@@ -62,46 +58,43 @@ cflags-$(CONFIG_PA7100LC)	+= -march=1.1 -mschedule=7100LC
 cflags-$(CONFIG_PA7300LC)	+= -march=1.1 -mschedule=7300
 cflags-$(CONFIG_PA8X00)		+= -march=2.0 -mschedule=8000
 
-head-y			:= arch/parisc/kernel/head.o 
-
 KBUILD_CFLAGS	+= $(cflags-y)
 
-kernel-y			:= mm/ kernel/ math-emu/ kernel/init_task.o
+head-y				:= arch/parisc/kernel/head.o 
+kernel-y			:= arch/parisc/mm/
+kernel-y			+= arch/parisc/kernel/
+kernel-y			+= arch/parisc/math-emu/
+kernel-y			+= arch/parisc/kernel/init_task.o
 kernel-$(CONFIG_HPUX)		+= hpux/
+libs-y				+= arch/parisc/lib/
+drivers-$(CONFIG_OPROFILE)	+= arch/parisc/oprofile/
 
-core-y	+= $(addprefix arch/parisc/, $(kernel-y))
-libs-y	+= arch/parisc/lib/
-
-drivers-$(CONFIG_OPROFILE)		+= arch/parisc/oprofile/
-
-PALO := $(shell if which palo; then : ; \
-	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
-	fi)
-
-PALOCONF := $(shell if [ -f $(src)/palo.conf ]; then echo $(src)/palo.conf; \
-	else echo $(obj)/palo.conf; \
+PALO := $(shell                         \
+	if (which palo)  2>&1 ; then : ; \
+	elif [ -x /sbin/palo ]; then     \
+		echo /sbin/palo;         \
 	fi)
 
 palo: vmlinux
-	@if test ! -x "$(PALO)"; then \
+	$(Q)if test ! -x "$(PALO)"; then \
 		echo 'ERROR: Please install palo first (apt-get install palo)';\
 		echo 'or build it from source and install it somewhere in your $$PATH';\
 		false; \
 	fi
-	@if test ! -f "$(PALOCONF)"; then \
+	$(Q)if test ! -f "$(obj)/palo.conf"; then \
 		cp $(src)/arch/parisc/defpalo.conf $(obj)/palo.conf; \
 		echo 'A generic palo config file ($(obj)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
 		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
 		false; \
 	fi
-	$(PALO) -f $(PALOCONF)
+	$(PALO) -f $(obj)/palo.conf
 
 # Shorthands for known targets not supported by parisc, use vmlinux as default
 Image zImage bzImage: vmlinux
 
 kernel_install: vmlinux
-	sh $(src)/arch/parisc/install.sh \
+	sh $(srctree)/$(src)/arch/parisc/install.sh \
 			$(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
 
 install: kernel_install modules_install
@@ -119,10 +112,8 @@ define archhelp
 endef
 
 # we require gcc 3.3 or above to compile the kernel
-archprepare: checkbin
-checkbin:
-	@if test "$(call cc-version)" -lt "0303"; then \
-		echo -n "Sorry, GCC v3.3 or above is required to build " ; \
-		echo "the kernel." ; \
+archprepare:
+	$(Q)if test "$(call cc-version)" -lt "0303"; then \
+		echo "Sorry, GCC v3.3 or above is required to build the kernel." ; \
 		false ; \
 	fi
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
