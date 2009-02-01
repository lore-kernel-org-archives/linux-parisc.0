From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: define SRCARCH=parisc for parisc64 builds
Date: Mon, 02 Feb 2009 00:24:01 +0100
Message-ID: <49862F11.5000808@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The parisc64 target (HP PARISC, 64bit kernel) is similar to the sparc64 or 
m68knommu targets, as it shares all sources for 32- and 64-bit in one single
source path which is arch/parisc/.
This patch now allows one to use ARCH=parisc64 and just directly build the
64bit kernel without creating symlinks in arch/ and include/asm-* manually
the same way as it's done for sparc64 and m68knommu.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/Makefile b/Makefile
index cf9e20d..3582985 100644
--- a/Makefile
+++ b/Makefile
@@ -210,6 +210,11 @@ ifeq ($(ARCH),sparc64)
        SRCARCH := sparc
 endif
 
+# Additional ARCH settings for parisc
+ifeq ($(ARCH),parisc64)
+       SRCARCH := parisc
+endif
+
 # Where to locate arch specific headers
 hdr-arch  := $(SRCARCH)
 
