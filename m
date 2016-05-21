From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0206/1529] Fix typo
Date: Sat, 21 May 2016 14:02:59 +0200
Message-ID: <20160521120259.10661-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jejb@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/asm/eisa_eeprom.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/eisa_eeprom.h b/arch/parisc/include/asm/eisa_eeprom.h
index 8ce8b85..5637ac9 100644
--- a/arch/parisc/include/asm/eisa_eeprom.h
+++ b/arch/parisc/include/asm/eisa_eeprom.h
@@ -99,7 +99,7 @@ struct eeprom_eisa_slot_info
 #define HPEE_MEMORY_DECODE_24BITS 0x04
 #define HPEE_MEMORY_DECODE_32BITS 0x08
 /* byte 2 and 3 are a 16bit LE value
- * containging the memory size in kilobytes */
+ * containing the memory size in kilobytes */
 /* byte 4,5,6 are a 24bit LE value
  * containing the memory base address */
 
@@ -135,7 +135,7 @@ struct eeprom_eisa_slot_info
 #define HPEE_PORT_SHARED    0x40
 #define HPEE_PORT_MORE      0x80
 /* byte 1 and 2 is a 16bit LE value
- * conating the start port number */
+ * containing the start port number */
 
 #define HPEE_PORT_INIT_MAX_LEN     60 /* in bytes here */
 /* port init entry byte 0 */
-- 
2.8.2.534.g1f66975

