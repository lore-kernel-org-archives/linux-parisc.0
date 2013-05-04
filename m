From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] parisc: fix NATIVE set up in build
Date: Sat,  4 May 2013 12:50:58 -0400
Message-ID: <1367686258-28525-1-git-send-email-vapier@gentoo.org>
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The ifeq operator does not accept globs, so this little bit of code will
never match (unless uname literally prints out "parsic*").  Rewrite to
use a pattern matching operator so that NATIVE is set to 1 on parisc.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 arch/parisc/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 113e282..2f967cc 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -24,9 +24,7 @@ CHECKFLAGS	+= -D__hppa__=1
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
 MACHINE		:= $(shell uname -m)
-ifeq ($(MACHINE),parisc*)
-NATIVE		:= 1
-endif
+NATIVE		:= $(if $(filter parisc%,$(MACHINE)),1,0)
 
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
-- 
1.8.2.1

