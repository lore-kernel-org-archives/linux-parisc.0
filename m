From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 240/493] parisc: remove use of __devinit
Date: Mon, 19 Nov 2012 13:23:09 -0500
Message-ID: <1353349642-3677-240-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: gregkh@linuxfoundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devinit is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org> 
Cc: Helge Deller <deller@gmx.de> 
Cc: linux-parisc@vger.kernel.org 
---
 arch/parisc/include/asm/parport.h | 2 +-
 arch/parisc/kernel/hardware.c     | 3 +--
 drivers/parisc/dino.c             | 2 +-
 drivers/parisc/lba_pci.c          | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/parport.h b/arch/parisc/include/asm/parport.h
index 00d9cc3..c391d7c 100644
--- a/arch/parisc/include/asm/parport.h
+++ b/arch/parisc/include/asm/parport.h
@@ -8,7 +8,7 @@
 #define _ASM_PARPORT_H 1
 
 
-static int __devinit parport_pc_find_nonpci_ports (int autoirq, int autodma)
+static int parport_pc_find_nonpci_ports (int autoirq, int autodma)
 {
 	/* nothing ! */
 	return 0;
diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index f48a640..80e4135 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -1327,8 +1327,7 @@ const char * const cpu_name_version[][2] = {
 	[mako2] = { "PA8900 (Shortfin)",	"2.0" }
 };
 
-const char * __devinit
-parisc_hardware_description(struct parisc_device_id *id)
+const char *parisc_hardware_description(struct parisc_device_id *id)
 {
 	struct hp_hardware *listptr;
 	
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index fb6a1fe..8e4e86b 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -430,7 +430,7 @@ static void dino_choose_irq(struct parisc_device *dev, void *ctrl)
  * Cirrus 6832 Cardbus reports wrong irq on RDI Tadpole PARISC Laptop (deller@gmx.de)
  * (the irqs are off-by-one, not sure yet if this is a cirrus, dino-hardware or dino-driver problem...)
  */
-static void __devinit quirk_cirrus_cardbus(struct pci_dev *dev)
+static void quirk_cirrus_cardbus(struct pci_dev *dev)
 {
 	u8 new_irq = dev->irq - 1;
 	printk(KERN_INFO "PCI: Cirrus Cardbus IRQ fixup for %s, from %d to %d\n",
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index fdd63a6..753c548 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -34,7 +34,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
-#include <linux/init.h>		/* for __init and __devinit */
+#include <linux/init.h>		/* for __init and */
 #include <linux/pci.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
-- 
1.8.0

