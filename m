From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] parisc: make NO_IRQ 0 as it should be
Date: Tue, 06 Dec 2011 11:24:33 +0000
Message-ID: <20111206112412.14035.13990.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
To: linux-parisc@vger.kernel.org, jejb@parisc-linux.org,
	kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Alan Cox <alan@linux.intel.com>

PA-RISC doesn't use a real IRQ 0 and James says

"To be honest, we don't care very much.  Parisc interrupts are cascading
and mostly software assigned (except our EIEM which we keep internal).
We use a base offset at 16 or 64 (depending on GSC presence or not) so
IRQs 0-15 aren't legal on parisc either (we frob some of the hard coded
ISA interrupts on the WAX eisa bus).

We use NO_IRQ as an IRQ assignment error return and that's about it (and
that error shouldn't ever really occur)."

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/parisc/include/asm/irq.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 1073599..fcf6edd 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -10,7 +10,7 @@
 #include <linux/cpumask.h>
 #include <asm/types.h>
 
-#define NO_IRQ		(-1)
+#define NO_IRQ		0
 
 #ifdef CONFIG_GSC
 #define GSC_IRQ_BASE	16

