From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0209/1529] Fix typo
Date: Sat, 21 May 2016 14:03:22 +0200
Message-ID: <20160521120322.10812-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jejb@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/math-emu/fpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/math-emu/fpu.h b/arch/parisc/math-emu/fpu.h
index 0af5c3c..46eb90e 100644
--- a/arch/parisc/math-emu/fpu.h
+++ b/arch/parisc/math-emu/fpu.h
@@ -63,9 +63,9 @@
 #define EMULATION_VERSION 4
 
 /*
- * The only was to differeniate between TIMEX and ROLEX (or PCX-S and PCX-T)
- * is thorough the potential type field from the PDC_MODEL call.  The 
- * following flags are used at assist this differeniation.
+ * The only was to differentiate between TIMEX and ROLEX (or PCX-S and PCX-T)
+ * is thorough the potential type field from the PDC_MODEL call.  The
+ * following flags are used at assist this differentiation.
  */
 
 #define ROLEX_POTENTIAL_KEY_FLAGS	PDC_MODEL_CPU_KEY_WORD_TO_IO
-- 
2.8.2.534.g1f66975

