From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: arch/parisc/kernel/signal.c: Removed duplicated include
Date: Fri, 25 Jul 2008 23:30:10 +0800
Message-ID: <20080725224619.9137.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Removed duplicated include file <linux/compat.h> in 
arch/parisc/kernel/signal.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 06213d1..71ab17a 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -33,7 +33,6 @@
 #include <asm/asm-offsets.h>

 #ifdef CONFIG_COMPAT
-#include <linux/compat.h>
 #include "signal32.h"
 #endif


