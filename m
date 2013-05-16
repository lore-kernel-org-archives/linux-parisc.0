From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: make default cross compiler search more robust
Date: Thu, 16 May 2013 21:32:20 +0200
Message-ID: <20130516193138.GA392@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: stable@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <stable-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>

please add to stable kernel v3.9
this patch is a merge of upstream commits 
	93782eba49e23c3f311a6b05a19ba15927ec4e8b
and
	6880b0150a7c25fd75c5ece80abc49ebf53c38c1


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
	hppa2.0-unknown-linux-gnu
	hppa2.0-linux-gnu
	hppa2.0-linux
	hppa1.1-unknown-linux-gnu
	hppa1.1-linux-gnu
	hppa1.1-linux

This patch was initiated by Mike Frysinger, with feedback from Jeroen
Roovers, John David Anglin and Helge Deller.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Jeroen Roovers <jer@gentoo.org>
Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 113e282..1976900 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -23,26 +23,21 @@ NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-MACHINE		:= $(shell uname -m)
-ifeq ($(MACHINE),parisc*)
-NATIVE		:= 1
-endif
-
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
-WIDTH		:= 64
+CC_ARCHES	= hppa64
 else # 32-bit
-WIDTH		:=
+CC_ARCHES	= hppa hppa2.0 hppa1.1
 endif
 
-# attempt to help out folks who are cross-compiling
-ifeq ($(NATIVE),1)
-CROSS_COMPILE	:= hppa$(WIDTH)-linux-
-else
- ifeq ($(CROSS_COMPILE),)
- CROSS_COMPILE	:= hppa$(WIDTH)-linux-gnu-
- endif
+ifneq ($(SUBARCH),$(UTS_MACHINE))
+	ifeq ($(CROSS_COMPILE),)
+		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
+		CROSS_COMPILE := $(call cc-cross-prefix, \
+			$(foreach a,$(CC_ARCHES), \
+			$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
+	endif
 endif
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
