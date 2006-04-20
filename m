From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] split out opl3 stuff
Date: Thu, 20 Apr 2006 11:25:20 -0400
Message-ID: <20060420152520.GA22181@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

Reduces the amount of hand editing diffs I need to do...

Index: include/sound/opl3.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/sound/opl3.h,v
retrieving revision 1.6
diff -u -d -p -r1.6 opl3.h
--- include/sound/opl3.h	3 Apr 2006 13:46:08 -0000	1.6
+++ include/sound/opl3.h	20 Apr 2006 15:20:02 -0000
@@ -261,11 +261,10 @@ struct snd_opl3_voice {
 };
 
 struct snd_opl3 {
-	void __iomem *l_port;
-	void __iomem *r_port;
+	unsigned long l_port;
+	unsigned long r_port;
 	struct resource *res_l_port;
 	struct resource *res_r_port;
-	int unmap_on_free;
 	unsigned short hardware;
 	/* hardware access */
 	void (*command) (struct snd_opl3 * opl3, unsigned short cmd, unsigned char val);
@@ -326,9 +325,6 @@ int snd_opl3_create(struct snd_card *car
 		    unsigned short hardware,
 		    int integrated,
 		    struct snd_opl3 ** opl3);
-int snd_opl3_create_mapped(struct snd_card *card,
-			   void __iomem *l_port, void __iomem *r_port,
-			   unsigned short hardware, struct snd_opl3 **opl3);
 int snd_opl3_timer_new(struct snd_opl3 * opl3, int timer1_dev, int timer2_dev);
 int snd_opl3_hwdep_new(struct snd_opl3 * opl3, int device, int seq_device,
 		       struct snd_hwdep ** rhwdep);
Index: sound/drivers/opl3/opl3_lib.c
===================================================================
RCS file: /var/cvs/linux-2.6/sound/drivers/opl3/opl3_lib.c,v
retrieving revision 1.15
diff -u -d -p -r1.15 opl3_lib.c
--- sound/drivers/opl3/opl3_lib.c	3 Apr 2006 13:46:33 -0000	1.15
+++ sound/drivers/opl3/opl3_lib.c	20 Apr 2006 15:20:03 -0000
@@ -40,7 +40,7 @@ extern char snd_opl3_regmap[MAX_OPL2_VOI
 static void snd_opl2_command(struct snd_opl3 * opl3, unsigned short cmd, unsigned char val)
 {
 	unsigned long flags;
-	void __iomem *port;
+	unsigned long port;
 
 	/*
 	 * The original 2-OP synth requires a quite long delay
@@ -51,10 +51,10 @@ static void snd_opl2_command(struct snd_
 
 	spin_lock_irqsave(&opl3->reg_lock, flags);
 
-	iowrite8((unsigned char) cmd, port);
+	outb((unsigned char) cmd, port);
 	udelay(10);
 
-	iowrite8((unsigned char) val, port + 1);
+	outb((unsigned char) val, port + 1);
 	udelay(30);
 
 	spin_unlock_irqrestore(&opl3->reg_lock, flags);
@@ -63,7 +63,7 @@ static void snd_opl2_command(struct snd_
 static void snd_opl3_command(struct snd_opl3 * opl3, unsigned short cmd, unsigned char val)
 {
 	unsigned long flags;
-	void __iomem *port;
+	unsigned long port;
 
 	/*
 	 * The OPL-3 survives with just two INBs
@@ -74,13 +74,13 @@ static void snd_opl3_command(struct snd_
 
 	spin_lock_irqsave(&opl3->reg_lock, flags);
 
-	iowrite8((unsigned char) cmd, port);
-	ioread8(opl3->l_port);
-	ioread8(opl3->l_port);
+	outb((unsigned char) cmd, port);
+	inb(opl3->l_port);
+	inb(opl3->l_port);
 
-	iowrite8((unsigned char) val, port + 1);
-	ioread8(opl3->l_port);
-	ioread8(opl3->l_port);
+	outb((unsigned char) val, port + 1);
+	inb(opl3->l_port);
+	inb(opl3->l_port);
 
 	spin_unlock_irqrestore(&opl3->reg_lock, flags);
 }
@@ -104,7 +104,7 @@ static int snd_opl3_detect(struct snd_op
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, OPL3_TIMER1_MASK | OPL3_TIMER2_MASK);
 	/* Reset the IRQ of the FM chip */
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, OPL3_IRQ_RESET);
-	signature = stat1 = ioread8(opl3->l_port);	/* Status register */
+	signature = stat1 = inb(opl3->l_port);	/* Status register */
 	if ((stat1 & 0xe0) != 0x00) {	/* Should be 0x00 */
 		snd_printd("OPL3: stat1 = 0x%x\n", stat1);
 		return -ENODEV;
@@ -116,7 +116,7 @@ static int snd_opl3_detect(struct snd_op
 	/* Now we have to delay at least 80us */
 	udelay(200);
 	/* Read status after timers have expired */
-	stat2 = ioread8(opl3->l_port);
+	stat2 = inb(opl3->l_port);
 	/* Stop the timers */
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, OPL3_TIMER1_MASK | OPL3_TIMER2_MASK);
 	/* Reset the IRQ of the FM chip */
@@ -299,7 +299,7 @@ void snd_opl3_interrupt(struct snd_hwdep
 		return;
 
 	opl3 = hw->private_data;
-	status = ioread8(opl3->l_port);
+	status = inb(opl3->l_port);
 #if 0
 	snd_printk("AdLib IRQ status = 0x%x\n", status);
 #endif
@@ -327,10 +327,6 @@ static int snd_opl3_free(struct snd_opl3
 		opl3->private_free(opl3);
 	release_and_free_resource(opl3->res_l_port);
 	release_and_free_resource(opl3->res_r_port);
-	if (opl3->unmap_on_free) {
-		iounmap(opl3->l_port);
-		iounmap(opl3->r_port);
-	}
 	kfree(opl3);
 	return 0;
 }
@@ -397,14 +393,12 @@ int snd_opl3_init(struct snd_opl3 *opl3)
 	return 0;
 }
 
-static int snd_opl3_create_main(struct snd_card * card,
-				void __iomem *l_port,
-				void __iomem *r_port,
-				int unmap_on_free,
-				struct resource *res_l_port,
-				struct resource *res_r_port,
-				unsigned short hardware,
-				struct snd_opl3 **ropl3)
+int snd_opl3_create(struct snd_card *card,
+		    unsigned long l_port,
+		    unsigned long r_port,
+		    unsigned short hardware,
+		    int integrated,
+		    struct snd_opl3 ** ropl3)
 {
 	struct snd_opl3 *opl3;
 	int err;
@@ -412,11 +406,21 @@ static int snd_opl3_create_main(struct s
 	*ropl3 = NULL;
 	if ((err = snd_opl3_new(card, hardware, &opl3)) < 0)
 		return err;
+	if (! integrated) {
+		if ((opl3->res_l_port = request_region(l_port, 2, "OPL2/3 (left)")) == NULL) {
+			snd_printk(KERN_ERR "opl3: can't grab left port 0x%lx\n", l_port);
+			snd_device_free(card, opl3);
+			return -EBUSY;
+		}
+		if (r_port != 0 &&
+		    (opl3->res_r_port = request_region(r_port, 2, "OPL2/3 (right)")) == NULL) {
+			snd_printk(KERN_ERR "opl3: can't grab right port 0x%lx\n", r_port);
+			snd_device_free(card, opl3);
+			return -EBUSY;
+		}
+	}
 	opl3->l_port = l_port;
 	opl3->r_port = r_port;
-	opl3->unmap_on_free = unmap_on_free;
-	opl3->res_l_port = res_l_port;
-	opl3->res_r_port = res_r_port;
 
 	switch (opl3->hardware) {
 	/* some hardware doesn't support timers */
@@ -447,61 +451,6 @@ static int snd_opl3_create_main(struct s
 	return 0;
 }
 
-int snd_opl3_create_mapped(struct snd_card *card,
-			   void __iomem *l_port,
-			   void __iomem *r_port,
-			   unsigned short hardware,
-			   struct snd_opl3 **ropl3)
-{
-	return snd_opl3_create_main(card, l_port, r_port, 0, NULL, NULL, hardware, ropl3);
-}
-
-int snd_opl3_create(struct snd_card * card,
-		    unsigned long l_port,
-		    unsigned long r_port,
-		    unsigned short hardware,
-		    int integrated,
-		    struct snd_opl3 **ropl3) {
-	struct resource *res_l_port = NULL;
-	struct resource *res_r_port = NULL;
-	void __iomem *l_mapped = NULL;
-	void __iomem *r_mapped = NULL;
-	
-	if (!integrated) {
-		if ((res_l_port = request_region(l_port, 2, "OPL2/3 (left)")) == NULL) {
-			snd_printk(KERN_ERR "opl3: can't grab left port 0x%lx\n", l_port);
-			goto fail;
-		}
-		if (r_port != 0 &&
-		    (res_r_port = request_region(r_port, 2, "OPL2/3 (right)")) == NULL) {
-			snd_printk(KERN_ERR "opl3: can't grab right port 0x%lx\n", r_port);
-			goto fail;
-		}
-	}
-	
-	l_mapped = ioport_map(l_port, 2);
-	if (l_mapped == NULL) {
-		snd_printk(KERN_ERR "opl3: failed to map port 0x%lx\n", l_port);
-		goto fail;
-	}
-	r_mapped = ioport_map(r_port, 2);
-	if (r_mapped == NULL) {
-		snd_printk(KERN_ERR "opl3: failed to map port 0x%lx\n", r_port);
-		goto fail;
-	}
-	
-	return snd_opl3_create_main(card, l_mapped, r_mapped, 1, res_l_port, res_r_port, hardware, ropl3);
-
-fail:
-	release_and_free_resource(res_l_port);
-	release_and_free_resource(res_r_port);
-	if (l_mapped)
-		iounmap(l_mapped);
-	if (r_mapped)
-		iounmap(r_mapped);
-	return -EBUSY;
-}
-
 int snd_opl3_timer_new(struct snd_opl3 * opl3, int timer1_dev, int timer2_dev)
 {
 	int err;
@@ -581,7 +530,6 @@ EXPORT_SYMBOL(snd_opl3_interrupt);
 EXPORT_SYMBOL(snd_opl3_new);
 EXPORT_SYMBOL(snd_opl3_init);
 EXPORT_SYMBOL(snd_opl3_create);
-EXPORT_SYMBOL(snd_opl3_create_mapped);
 EXPORT_SYMBOL(snd_opl3_timer_new);
 EXPORT_SYMBOL(snd_opl3_hwdep_new);
 
Index: sound/pci/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/sound/pci/Kconfig,v
retrieving revision 1.27
diff -u -d -p -r1.27 Kconfig
--- sound/pci/Kconfig	3 Apr 2006 13:46:39 -0000	1.27
+++ sound/pci/Kconfig	20 Apr 2006 15:20:03 -0000
@@ -15,14 +15,6 @@ config SND_AD1889
 	  To compile this as a module, choose M here: the module
 	  will be called snd-ad1889.
 
-config SND_AD1889_OPL3
-	bool "Analog Devices AD1889 OPL3 Support (Experimental)"
-	depends on SND_AD1889 && EXPERIMENTAL
-	select SND_OPL3_LIB
-	help
-	  Say Y here to include support for the OPL3-compatible interface
-	  provided on an Analog Devices AD1889.
-
 config SND_ALS300
         tristate "Avance Logic ALS300/ALS300+"
         depends on SND
Index: sound/pci/ad1889.c
===================================================================
RCS file: /var/cvs/linux-2.6/sound/pci/ad1889.c,v
retrieving revision 1.37
diff -u -d -p -r1.37 ad1889.c
--- sound/pci/ad1889.c	3 Apr 2006 13:46:39 -0000	1.37
+++ sound/pci/ad1889.c	20 Apr 2006 15:20:03 -0000
@@ -47,10 +47,6 @@
 #include <sound/initval.h>
 #include <sound/ac97_codec.h>
 
-#ifdef CONFIG_SND_AD1889_OPL3
-#include <sound/opl3.h>
-#endif
-
 #include <asm/io.h>
 
 #include "ad1889.h"
@@ -61,7 +57,6 @@
 MODULE_AUTHOR("Kyle McMartin <kyle@parisc-linux.org>, Thibaut Varene <t-bone@parisc-linux.org>");
 MODULE_DESCRIPTION("Analog Devices AD1889 ALSA sound driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(AD1889_DRVVER);
 MODULE_SUPPORTED_DEVICE("{{Analog Devices,AD1889}}");
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
@@ -101,14 +96,6 @@ struct snd_ad1889 {
 	unsigned long bar;
 	void __iomem *iobase;
 
-#ifdef CONFIG_SND_AD1889_OPL3
-	unsigned long opl3_bar;
-	void __iomem *opl3_iobase;
-
-	struct snd_opl3 *opl3;
-	struct snd_hwdep *opl3hwdep;
-#endif
-
 	struct snd_ac97 *ac97;
 	struct snd_ac97_bus *ac97_bus;
 	struct snd_pcm *pcm;
@@ -887,11 +874,6 @@ skip_hw:
 	if (chip->iobase)
 		iounmap(chip->iobase);
 
-#ifdef CONFIG_SND_AD1889_OPL3
-	if (chip->opl3_iobase)
-		iounmap(chip->opl3_iobase);
-#endif
-	
 	pci_release_regions(chip->pci);
 	pci_disable_device(chip->pci);
 
@@ -972,17 +954,6 @@ snd_ad1889_create(struct snd_card *card,
 
 	spin_lock_init(&chip->lock);	/* only now can we call ad1889_free */
 
-#ifdef CONFIG_SND_AD1889_OPL3
-	chip->opl3_bar = pci_resource_start(pci, 1);
-	chip->opl3_iobase = ioremap_nocache(chip->opl3_bar, 
-					   pci_resource_len(pci, 1));
-	if (chip->opl3_iobase == NULL) {
-		printk(KERN_ERR PFX "unable to reserve region.\n");
-		snd_ad1889_free(chip);
-		return -EBUSY;
-	}
-#endif
-
 	if (request_irq(pci->irq, snd_ad1889_interrupt,
 			SA_INTERRUPT|SA_SHIRQ, card->driver, (void*)chip)) {
 		printk(KERN_ERR PFX "cannot obtain IRQ %d\n", pci->irq);
@@ -1058,22 +1029,6 @@ snd_ad1889_probe(struct pci_dev *pci,
 	if (err < 0)
 		goto free_and_ret;
 	
-#ifdef CONFIG_SND_AD1889_OPL3
-	err = snd_opl3_create_mapped(card, chip->opl3_iobase,
-				     chip->opl3_iobase + 2, OPL3_HW_OPL3,
-				     &chip->opl3);
-	if (err) {
-		printk(KERN_ERR PFX "failed to create opl3\n");
-		goto free_and_ret;
-	}
-
-	err = snd_opl3_hwdep_new(chip->opl3, 0, 0, &chip->opl3hwdep);
-	if (err) {
-		printk(KERN_ERR PFX "failed to create opl3hwdep\n");
-		goto free_and_ret;
-	}
-#endif
