From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 176/199] arch/parisc/math-emu/driver.c: Checkpatch cleanup
Date: Sun, 23 May 2010 22:02:03 +0200
Message-ID: <1274644930-26600-19-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/math-emu/driver.c:90: ERROR: trailing whitespace
arch/parisc/math-emu/driver.c:118: WARNING: suspect code indent for conditional statements (8, 12)

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/math-emu/driver.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/math-emu/driver.c b/arch/parisc/math-emu/driver.c
index 09ef413..273006e 100644
--- a/arch/parisc/math-emu/driver.c
+++ b/arch/parisc/math-emu/driver.c
@@ -87,7 +87,7 @@ handle_fpe(struct pt_regs *regs)
 	 * code expects an artificial last entry which contains zero
 	 *
 	 * also, the passed in fr registers contain one word that defines
-	 * the fpu type. the fpu type information is constructed 
+	 * the fpu type. the fpu type information is constructed
 	 * inside the emulation code
 	 */
 	__u64 frcopy[36];
-- 
1.7.1.251.gf80a2

