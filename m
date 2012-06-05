From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 3/3] fix code to find libgcc
Date: Tue, 05 Jun 2012 13:54:09 +0900
Message-ID: <1338872049.5176.11.camel@dabdike>
References: <1338871679.5176.7.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Sam Ravnborg <sam@ravnborg.org>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1338871679.5176.7.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sam broke this with

commit 1f2bfbd00e466ff3489b2ca5cc75b1cccd14c123
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sat May 5 10:18:41 2012 +0200

    kbuild: link of vmlinux moved to a script

But we should be deriving the location of libgcc in the same way as all
the other archs, so fix by adding a LIBGCC variable which is evaluated
in the makefile
---
 arch/parisc/Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index dbc3850..5707f1a 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -21,6 +21,7 @@ KBUILD_DEFCONFIG := default_defconfig
 
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
+LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
 MACHINE		:= $(shell uname -m)
 ifeq ($(MACHINE),parisc*)
@@ -79,7 +80,7 @@ kernel-y			:= mm/ kernel/ math-emu/
 kernel-$(CONFIG_HPUX)		+= hpux/
 
 core-y	+= $(addprefix arch/parisc/, $(kernel-y))
-libs-y	+= arch/parisc/lib/ `$(CC) -print-libgcc-file-name`
+libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
 drivers-$(CONFIG_OPROFILE)		+= arch/parisc/oprofile/
 
-- 
1.7.4.1



