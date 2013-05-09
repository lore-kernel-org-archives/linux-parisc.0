From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] parisc: make default cross compiler search more robust
Date: Thu,  9 May 2013 01:08:35 -0400
Message-ID: <1368076115-22262-1-git-send-email-vapier@gentoo.org>
Cc: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

People/distros vary how they prefix the toolchain name for 64bit builds.
Rather than enforce one convention over another, add a for loop which
does a search for all the general prefixes.  This code will run for both
native and cross builds when CROSS_COMPILE isn't explicitly set.

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

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 arch/parisc/Makefile | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 2f967cc..523ae34 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -23,9 +23,6 @@ NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-MACHINE		:= $(shell uname -m)
-NATIVE		:= $(if $(filter parisc%,$(MACHINE)),1,0)
-
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
@@ -35,12 +32,17 @@ WIDTH		:=
 endif
 
 # attempt to help out folks who are cross-compiling
-ifeq ($(NATIVE),1)
-CROSS_COMPILE	:= hppa$(WIDTH)-linux-
-else
- ifeq ($(CROSS_COMPILE),)
- CROSS_COMPILE	:= hppa$(WIDTH)-linux-gnu-
- endif
+ifeq ($(CROSS_COMPILE),)
+CROSS_COMPILE := $(shell \
+	arches="hppa$(WIDTH)"; \
+	[ -z "$(WIDTH)" ] && arches="$$a hppa1.1 hppa2.0"; \
+	for a in $$arches; do \
+		for p in unknown-linux-gnu linux-gnu linux; do \
+			c="$$a-$$p-"; \
+			command -v $${c}gcc >/dev/null 2>&1 && echo $$c && break 2; \
+		done; \
+	done \
+)
 endif
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
-- 
1.8.2.1

