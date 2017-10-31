From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] parisc: pass endianness info to sparse
Date: Tue, 31 Oct 2017 18:21:59 +0100
Message-ID: <20171031172200.9793-1-luc.vanoostenryck@gmail.com>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-parisc@vger.kernel.org
To: James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc is big-endian only but sparse assumes the same endianness
as the building machine.
This is problematic for code which expect __BYTE_ORDER__ being
correctly predefined by the compiler which sparse can then
pre-process differently from what gcc would.

Fix this by letting sparse know about the architecture endianness.

To: James Bottomley <jejb@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
CC: linux-parisc@vger.kernel.org
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/parisc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 01946ebaf..e2364ff59 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -22,7 +22,7 @@ KBUILD_IMAGE := vmlinuz
 KBUILD_DEFCONFIG := default_defconfig
 
 NM		= sh $(srctree)/arch/parisc/nm
-CHECKFLAGS	+= -D__hppa__=1
+CHECKFLAGS	+= -D__hppa__=1 -mbig-endian
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 export LIBGCC
 
-- 
2.14.0

