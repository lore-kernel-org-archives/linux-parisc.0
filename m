From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH 11/20] parisc: change to new flag variable
Date: Wed, 22 Sep 2010 23:51:05 -0700
Message-ID: <1285224665-29831-1-git-send-email-mfm@muteddisk.com>
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/parisc/math-emu/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/math-emu/Makefile b/arch/parisc/math-emu/Makefile
index 1f3f225..0bd63b0 100644
--- a/arch/parisc/math-emu/Makefile
+++ b/arch/parisc/math-emu/Makefile
@@ -3,7 +3,7 @@
 #
 
 # See arch/parisc/math-emu/README
-EXTRA_CFLAGS += -Wno-parentheses -Wno-implicit-function-declaration \
+ccflags-y := -Wno-parentheses -Wno-implicit-function-declaration \
 	-Wno-uninitialized -Wno-strict-prototypes -Wno-return-type \
 	-Wno-implicit-int
 
-- 
1.7.2.1
