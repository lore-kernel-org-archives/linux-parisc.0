From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: hpux - Do not compile hpux subdirectory
Date: Mon, 16 Feb 2015 22:18:24 +0100
Message-ID: <20150216211824.GA1772@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 5db8882..91fbb6e 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -84,7 +84,6 @@ head-y			:= arch/parisc/kernel/head.o
 KBUILD_CFLAGS	+= $(cflags-y)
 
 kernel-y			:= mm/ kernel/ math-emu/
-kernel-$(CONFIG_HPUX)		+= hpux/
 
 core-y	+= $(addprefix arch/parisc/, $(kernel-y))
 libs-y	+= arch/parisc/lib/ $(LIBGCC)
