From: Jeroen Roovers <jer@gentoo.org>
Subject: [PATCH] Do not set CROSS_COMPILE but let CONFIG_CROSS_COMPILE
 handle it all.
Date: Tue, 24 May 2011 19:47:01 +0200
Message-ID: <20110524194701.6a4c1bd4@epia.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Do not set CROSS_COMPILE but let CONFIG_CROSS_COMPILE handle it all.
The problem this fixes manifests itself when you try to build a 64-bit kernel
on a distro which does not provide hppa$(WIDTH)-linux-gnu- but perhaps
hppa$(WIDTH)-unknown-linux-gnu- instead, like Gentoo Linux.

Signed-off-by: Jeroen Roovers <jer@gentoo.org>
---

--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -31,16 +31,10 @@
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
 WIDTH		:= 64
-CROSS_COMPILE	:= hppa64-linux-gnu-
 else # 32-bit
 WIDTH		:=
 endif
 
-# attempt to help out folks who are cross-compiling
-ifeq ($(NATIVE),1)
-CROSS_COMPILE	:= hppa$(WIDTH)-linux-
-endif
