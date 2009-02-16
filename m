From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: autoselect 32/64bit compiler
Date: Mon, 16 Feb 2009 22:47:34 +0100
Message-ID: <4999DEF6.4070300@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Automatically select correct 32- or 64bit (cross) compiler, independent if
the kernel is built locally (e.g. 64bit kernel target on 32bit userspace) or 
cross-compiled from another architecture. This patch allows one to just
run 
	make ARCH=parisc	when run as cross compiler, or just
	make 			when run locally.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index da6f669..9d0bd90 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -22,23 +22,12 @@ KBUILD_DEFCONFIG := default_defconfig
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 
-MACHINE		:= $(shell uname -m)
-ifeq ($(MACHINE),parisc*)
-NATIVE		:= 1
-endif
-
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
-WIDTH		:= 64
 CROSS_COMPILE	:= hppa64-linux-gnu-
 else # 32-bit
-WIDTH		:=
-endif
