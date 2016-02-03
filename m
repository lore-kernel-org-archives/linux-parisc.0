From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use parentheses around expression in floppy.h
Date: Wed, 3 Feb 2016 20:54:56 +0100
Message-ID: <20160203195456.GA18035@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Binderman <dcb314@hotmail.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

David Binderman reported a style issue in the floppy.h header file:
arch/parisc/include/asm/floppy.h:221: (style) Boolean result is used in bitwise
  operation. Clarify expression with parentheses.

Reported-by: David Binderman <dcb314@hotmail.com>
Cc: David Binderman <dcb314@hotmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index f84ff12..6d8276cd 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -33,7 +33,7 @@
  * floppy accesses go through the track buffer.
  */
 #define _CROSS_64KB(a,s,vdma) \
-(!vdma && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+(!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
 
 #define CROSS_64KB(a,s) _CROSS_64KB(a,s,use_virtual_dma & 1)
 
