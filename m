From: akpm@linux-foundation.org
Subject: [patch 1/1] parisc: remove obsolete hw_interrupt_type
Date: Wed, 10 Jun 2009 12:56:04 -0700
Message-ID: <200906101956.n5AJu4gQ009106@imap1.linux-foundation.org>
Cc: linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	tglx@linutronix.de
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

The defines and typedefs (hw_interrupt_type, no_irq_type, irq_desc_t) have
been kept around for migration reasons.  After more than two years it's
time to remove them finally.

This patch cleans up one of the remaining users.  When all such patches
hit mainline we can remove the defines and typedefs finally.

Impact: cleanup

Convert the last remaining users to struct irq_chip and remove the
define.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/kernel/irq.c |    2 +-
 drivers/parisc/dino.c    |    2 +-
 drivers/parisc/eisa.c    |    2 +-
 drivers/parisc/gsc.c     |    4 ++--
 drivers/parisc/gsc.h     |    2 +-
 drivers/parisc/iosapic.c |    2 +-
 drivers/parisc/superio.c |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff -puN arch/parisc/kernel/irq.c~parisc-remove-obsolete-hw_interrupt_type arch/parisc/kernel/irq.c
--- a/arch/parisc/kernel/irq.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/arch/parisc/kernel/irq.c
@@ -144,7 +144,7 @@ static int cpu_set_affinity_irq(unsigned
 }
 #endif
 
-static struct hw_interrupt_type cpu_interrupt_type = {
+static struct irq_chip cpu_interrupt_type = {
 	.typename	= "CPU",
 	.startup	= cpu_startup_irq,
 	.shutdown	= cpu_disable_irq,
diff -puN drivers/parisc/dino.c~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/dino.c
--- a/drivers/parisc/dino.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/dino.c
@@ -353,7 +353,7 @@ static unsigned int dino_startup_irq(uns
 	return 0;
 }
 
-static struct hw_interrupt_type dino_interrupt_type = {
+static struct irq_chip dino_interrupt_type = {
 	.typename	= "GSC-PCI",
 	.startup	= dino_startup_irq,
 	.shutdown	= dino_disable_irq,
diff -puN drivers/parisc/eisa.c~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/eisa.c
--- a/drivers/parisc/eisa.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/eisa.c
@@ -188,7 +188,7 @@ static unsigned int eisa_startup_irq(uns
 	return 0;
 }
 
-static struct hw_interrupt_type eisa_interrupt_type = {
+static struct irq_chip eisa_interrupt_type = {
 	.typename =	"EISA",
 	.startup =	eisa_startup_irq,
 	.shutdown =	eisa_disable_irq,
diff -puN drivers/parisc/gsc.c~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/gsc.c
--- a/drivers/parisc/gsc.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/gsc.c
@@ -148,7 +148,7 @@ static unsigned int gsc_asic_startup_irq
 	return 0;
 }
 
-static struct hw_interrupt_type gsc_asic_interrupt_type = {
+static struct irq_chip gsc_asic_interrupt_type = {
 	.typename =	"GSC-ASIC",
 	.startup =	gsc_asic_startup_irq,
 	.shutdown =	gsc_asic_disable_irq,
@@ -158,7 +158,7 @@ static struct hw_interrupt_type gsc_asic
 	.end =		no_end_irq,
 };
 
-int gsc_assign_irq(struct hw_interrupt_type *type, void *data)
+int gsc_assign_irq(struct irq_chip *type, void *data)
 {
 	static int irq = GSC_IRQ_BASE;
 	struct irq_desc *desc;
diff -puN drivers/parisc/gsc.h~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/gsc.h
--- a/drivers/parisc/gsc.h~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/gsc.h
@@ -38,7 +38,7 @@ struct gsc_asic {
 int gsc_common_setup(struct parisc_device *parent, struct gsc_asic *gsc_asic);
 int gsc_alloc_irq(struct gsc_irq *dev);			/* dev needs an irq */
 int gsc_claim_irq(struct gsc_irq *dev, int irq);	/* dev needs this irq */
-int gsc_assign_irq(struct hw_interrupt_type *type, void *data);
+int gsc_assign_irq(struct irq_chip *type, void *data);
 int gsc_find_local_irq(unsigned int irq, int *global_irq, int limit);
 void gsc_fixup_irqs(struct parisc_device *parent, void *ctrl,
 		void (*choose)(struct parisc_device *child, void *ctrl));
diff -puN drivers/parisc/iosapic.c~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/iosapic.c
--- a/drivers/parisc/iosapic.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/iosapic.c
@@ -729,7 +729,7 @@ static int iosapic_set_affinity_irq(unsi
 }
 #endif
 
-static struct hw_interrupt_type iosapic_interrupt_type = {
+static struct irq_chip iosapic_interrupt_type = {
 	.typename =	"IO-SAPIC-level",
 	.startup =	iosapic_startup_irq,
 	.shutdown =	iosapic_disable_irq,
diff -puN drivers/parisc/superio.c~parisc-remove-obsolete-hw_interrupt_type drivers/parisc/superio.c
--- a/drivers/parisc/superio.c~parisc-remove-obsolete-hw_interrupt_type
+++ a/drivers/parisc/superio.c
@@ -325,7 +325,7 @@ static unsigned int superio_startup_irq(
 	return 0;
 }
 
-static struct hw_interrupt_type superio_interrupt_type = {
+static struct irq_chip superio_interrupt_type = {
 	.typename =	SUPERIO,
 	.startup =	superio_startup_irq,
 	.shutdown =	superio_disable_irq,
_
