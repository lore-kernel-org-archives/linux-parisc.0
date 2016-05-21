From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0208/1529] Fix typo
Date: Sat, 21 May 2016 14:03:14 +0200
Message-ID: <20160521120314.10762-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jejb@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/uapi/asm/pdc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 702498f..0609ff1 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -59,7 +59,7 @@
 #define PDC_MODEL_GET_BOOT__OP	8	/* returns boot test options	*/
 #define PDC_MODEL_SET_BOOT__OP	9	/* set boot test options	*/
 
-#define PA89_INSTRUCTION_SET	0x4	/* capatibilies returned	*/
+#define PA89_INSTRUCTION_SET	0x4	/* capabilities returned	*/
 #define PA90_INSTRUCTION_SET	0x8
 
 #define PDC_CACHE	5		/* return/set cache (& TLB) info*/
-- 
2.8.2.534.g1f66975

