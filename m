From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] parisc: remove check for minimum required GCC version
Date: Mon, 27 Aug 2018 11:28:08 +0900
Message-ID: <1535336888-12183-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
To: "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
bumped the minimum GCC version to 4.6 for all architectures.

The version check in arch/parisc/Makefile is obsolete now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/parisc/Makefile | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 5ce0302..d047a09 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -156,12 +156,3 @@ define archhelp
 	@echo  '		  copy to $$(INSTALL_PATH)'
 	@echo  '  zinstall	- Install compressed vmlinuz kernel'
 endef
-
-# we require gcc 3.3 or above to compile the kernel
-archprepare: checkbin
-checkbin:
-	@if test "$(cc-version)" -lt "0303"; then \
-		echo -n "Sorry, GCC v3.3 or above is required to build " ; \
-		echo "the kernel." ; \
-		false ; \
-	fi
-- 
2.7.4
