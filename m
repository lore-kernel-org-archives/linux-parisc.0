From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 177/199] arch/parisc/math-emu/fpbits.h: Checkpatch cleanup
Date: Sun, 23 May 2010 22:02:04 +0200
Message-ID: <1274644930-26600-20-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/math-emu/fpbits.h:51: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/math-emu/fpbits.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/math-emu/fpbits.h b/arch/parisc/math-emu/fpbits.h
index cefad06..431b571 100644
--- a/arch/parisc/math-emu/fpbits.h
+++ b/arch/parisc/math-emu/fpbits.h
@@ -48,7 +48,7 @@
  * function "DeclBitfR" except its use is restricted to occur within a larger
  * enclosing structure or union definition.  This declaration is an unnamed
  * structure with the argument, name, as the member name and the argument,
- * uname, as the element name. 
+ * uname, as the element name.
  *----------------------------------------------------------------------- */
 #define Bitfield_extract(start, length, object) 	\
     ((object) >> (HOSTWDSZ - (start) - (length)) & 	\
-- 
1.7.1.251.gf80a2

