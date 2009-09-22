From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: [PATCH] PARISC: includecheck fix: signal.c
Date: Tue, 22 Sep 2009 19:05:32 +0530
Message-ID: <1253626532.3784.17.camel@ht.satnam>
Mime-Version: 1.0
Content-Type: text/plain
To: Kyle McMartin <kyle@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


fix the following 'make includecheck' warning:

  arch/parisc/kernel/signal.c: linux/compat.h is included more than once.

Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
---
 arch/parisc/kernel/signal.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 8eb3c63..5d5a710 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -34,7 +34,6 @@
 #include <asm/asm-offsets.h>
 
 #ifdef CONFIG_COMPAT
-#include <linux/compat.h>
 #include "signal32.h"
 #endif
 
-- 
1.6.0.6


