From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: make default cross compiler search more robust (v3)
Date: Sat, 11 May 2013 21:04:09 +0200
Message-ID: <20130511190409.GA5110@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Mike Frysinger <vapier@gentoo.org>,
	Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

People/distros vary how they prefix the toolchain name for 64bit builds.
Rather than enforce one convention over another, add a for loop which
does a search for all the general prefixes.

For 64bit builds, we now search for (in order):
	hppa64-unknown-linux-gnu
	hppa64-linux-gnu
	hppa64-linux

For 32bit builds, we look for:
	hppa-unknown-linux-gnu
	hppa-linux-gnu
	hppa-linux
	hppa1.1-unknown-linux-gnu
	hppa1.1-linux-gnu
	hppa1.1-linux
	hppa2.0-unknown-linux-gnu
	hppa2.0-linux-gnu
	hppa2.0-linux

This patch was initiated by Mike Frysinger, with feedback from Jeroen
Roovers, John David Anglin and Helge Deller.

Signed-off-by: Helge Deller <deller@gmx.de>
CC: Mike Frysinger <vapier@gentoo.org>
CC: Jeroen Roovers <jer@gentoo.org>
CC: John David Anglin <dave.anglin@bell.net>


diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 2f967cc..4e5b7b5 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -23,24 +23,21 @@ NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-MACHINE		:= $(shell uname -m)
-NATIVE		:= $(if $(filter parisc%,$(MACHINE)),1,0)
-
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
-WIDTH		:= 64
+CC_ARCHES	= hppa64
 else # 32-bit
-WIDTH		:=
+CC_ARCHES	= hppa hppa1.1 hppa2.0
 endif
 
-# attempt to help out folks who are cross-compiling
-ifeq ($(NATIVE),1)
-CROSS_COMPILE	:= hppa$(WIDTH)-linux-
-else
- ifeq ($(CROSS_COMPILE),)
- CROSS_COMPILE	:= hppa$(WIDTH)-linux-gnu-
- endif
+ifneq ($(SUBARCH),$(ARCH))
+	ifeq ($(CROSS_COMPILE),)
+		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
+		CROSS_COMPILE := $(call cc-cross-prefix, \
+			$(foreach a,$(CC_ARCHES), \
+			$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
+	endif
 endif
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
