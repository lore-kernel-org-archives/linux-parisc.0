From: Adrian Bunk <bunk@stusta.de>
Subject: [patch] fix unterminated comment in asm-parisc/som.h
Date: Fri, 8 Oct 2004 14:47:55 +0200
Message-ID: <20041008124754.GH5227__47733.6158430718$1416624493$gmane$org@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: grundler@parisc-linux.org,
 parisc-linux@parisc-linux.org,
 linux-kernel@vger.kernel.org
To: matthew@wil.cx,
 Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Return-Path: <linux-kernel-owner+deller=40gmx.de-S269883AbUJHMsg@vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


The patch below fixes an unterminated comment in 
include/asm-parisc/som.h present in both 2.4 and 2.6 .

This bug was found using David A. Wheeler's 'SLOCCount'.


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.9-rc3-mm3/include/asm-parisc/som.h.old	2004-10-08 14:38:44.000000000 +0200
+++ linux-2.6.9-rc3-mm3/include/asm-parisc/som.h	2004-10-08 14:39:10.000000000 +0200
@@ -5,4 +5,4 @@
 #include <linux/som.h>
 
 
-#endif /* _ASM_PARISC_SOM_H
+#endif /* _ASM_PARISC_SOM_H */
