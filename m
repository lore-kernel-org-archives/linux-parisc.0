From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] [PATCH 1/3] Delete unused irq functions on powerpc
Date: Tue,  5 Dec 2006 22:15:05 -0700
Message-ID: <11653821071704-git-send-email-matthew__12267.3802231022$1416624631$gmane$org@wil.cx>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Matthew Wilcox <matthew@wil.cx>,
 parisc-linux@parisc-linux.org
To: linux-kernel@vger.kernel.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The ack_irq macro is unused and conflicts with James' work to template
the generic irq code.  mask_irq and unmask_irq are also unused, so delete
those macros too.

Signed-off-by: Matthew Wilcox <matthew@wil.cx>
---
 include/asm-powerpc/hw_irq.h |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/include/asm-powerpc/hw_irq.h b/include/asm-powerpc/hw_irq.h
index d604863..9e4dd98 100644
--- a/include/asm-powerpc/hw_irq.h
+++ b/include/asm-powerpc/hw_irq.h
@@ -107,25 +107,6 @@ static inline void local_irq_save_ptr(un
 
 #endif /* CONFIG_PPC64 */
 
-#define mask_irq(irq)						\
-	({							\
-	 	irq_desc_t *desc = get_irq_desc(irq);		\
-		if (desc->chip && desc->chip->disable)	\
-			desc->chip->disable(irq);		\
-	})
-#define unmask_irq(irq)						\
-	({							\
-	 	irq_desc_t *desc = get_irq_desc(irq);		\
-		if (desc->chip && desc->chip->enable)	\
-			desc->chip->enable(irq);		\
-	})
-#define ack_irq(irq)						\
-	({							\
-	 	irq_desc_t *desc = get_irq_desc(irq);		\
-		if (desc->chip && desc->chip->ack)	\
-			desc->chip->ack(irq);		\
-	})
