From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Don't hardcode PSW values in hpmc code
Date: Thu, 8 Jun 2017 22:11:00 +0200
Message-ID: <20170608201100.GA26104@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 0fbd0a0..e3a8e5e 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -44,6 +44,7 @@
 
 #include <asm/assembly.h>
 #include <asm/pdc.h>
+#include <asm/psw.h>
 
 #include <linux/linkage.h>
 #include <linux/init.h>
@@ -135,7 +136,7 @@ ENTRY_CFI(os_hpmc)
 	 * So turn on the Q bit and turn off the M bit.
 	 */
 
-	ldo     8(%r0),%r4                       /* PSW Q on, PSW M off */
+	ldi     PSW_SM_Q,%r4                   /* PSW Q on, PSW M off */
 	mtctl   %r4,ipsw
 	mtctl   %r0,pcsq
 	mtctl   %r0,pcsq
@@ -257,7 +258,7 @@ os_hpmc_5:
 
 	tovirt_r1 %r30      /* make sp virtual */
 
-	rsm 8,%r0           /* Clear Q bit */
+	rsm     PSW_SM_Q,%r0           /* Clear Q bit */
 	ldi     1,%r8       /* Set trap code to "1" for HPMC */
 	load32	PA(intr_save),%r1
 	be      0(%sr7,%r1)
