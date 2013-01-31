From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: enhance automatic CONFIG_CROSS_COMPILE detection
Date: Thu, 31 Jan 2013 23:04:12 +0100
Message-ID: <20130131220412.GA15355@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The current Makefile will only choose the hppa64 cross compiler when
running natively on hppa in a 32bit userspace.
This patch additionally chooses the correct 32/64 bit hppa compiler even
when doing real cross compiling to hppa/hppa64 from another architecture.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 5707f1a..ed9a14c 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -32,11 +32,6 @@ ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
 WIDTH		:= 64
