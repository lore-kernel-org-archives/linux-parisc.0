Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70ABA482A
	for <parisc-linux@parisc-linux.org>; Wed, 22 Aug 2001 01:39:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ZSbM-0002pt-00
	for parisc-linux@parisc-linux.org; Wed, 22 Aug 2001 08:39:00 +0100
Date: Wed, 22 Aug 2001 08:39:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010822083900.A3558@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] STI initialisation cleanup
List-ID: <linux-parisc.vger.kernel.org>

get_pa_dev is going away as part of the iotree rewrite, and since STI is
the only part of the kernel still using it, here's a patch to eliminate
it.  This converts sticore to use the normal parisc_device API rather
than attempting to find devices by itself (moral: leave matchmaking to
the experts).  I did some minor cleanups, renaming & so on.

Comments welcome, testers more welcome :-)  As usual, it compiles, but
no warranty beyond that.  Ryan tried an earlier version of this patch in
his iotree-hacked kernel, and it seemed to work OK.  I can see a fair
few more things which need to get simplified & fixed in this driver,
but let's save that for the next round of patches.

Index: drivers/video/sti/sticore.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/sti/sticore.c,v
retrieving revision 1.21
diff -u -p -r1.21 sticore.c
--- sticore.c	2001/08/14 16:54:59	1.21
+++ sticore.c	2001/08/22 07:28:38
@@ -826,51 +826,29 @@ out_err:
 }
 
 
-static struct sti_struct * __init
-search_sti(unsigned long flash_sti_rom, unsigned long hpa)
-{
-    int index;
-    unsigned long rom;
-    struct sti_struct *sti; 
-    struct parisc_device *pa_dev;
-    
-    index = 0;
-    while ((pa_dev = get_pa_dev(index)) != NULL) {
-
-	if ((pa_dev->hpa == hpa) &&
-	    ((pa_dev->id.sversion == 0x85) || /* Gecko graphics (WORD MODE) */
-	     (pa_dev->id.sversion == 0x77)) ) /* Coral graphics (BYTE MODE) */
-	{
-	    /* 
-		on newer systems PDC gives the address of the ROM 
-		in the additional address field addr[1] while on
-		older Systems the PDC stores it in page0->proc_sti 
-	    */
-	    rom = pa_dev->addr[1];
-	    if (!rom)
-	    	rom = flash_sti_rom;
-	    if (!rom)
-		rom = hpa;
-	    if (rom) {
-		DPRINTK((KERN_DEBUG "Trying STI ROM at %08lx, hpa at %08lx\n",
-		    rom, hpa));
-		sti = sti_try_rom_generic(rom, hpa, NULL);
-		if (sti)
-		    return sti;
-	    } else {
-		printk(KERN_WARNING 
-		"Unable to find ROM address of graphics device at hpa %08lx\n",
-		    hpa);
-	    }
+/*
+ * on newer systems PDC gives the address of the ROM 
+ * in the additional address field addr[1] while on
+ * older Systems the PDC stores it in page0->proc_sti 
+ */
+static int __init sticore_pa_init(struct parisc_device *dev)
+{
+	unsigned long rom = dev->addr[1];
+	if (!rom) {
+		rom = PAGE0->proc_sti;
+	}
+	if (!rom) {
+		rom = dev->hpa;
 	}
-	index++;
-    }
-    return NULL;
+	DPRINTK((KERN_DEBUG "Trying STI ROM at %08lx, hpa at %08lx\n", rom, dev->hpa));
+	if (sti_try_rom_generic(rom, dev->hpa, NULL))
+		return 0;
+	return 1;
 }
 
 
-static int __devinit sticon_init_one (struct pci_dev *pd,
-				      const struct pci_device_id *ent)
+static int __devinit sticore_pci_init(struct pci_dev *pd,
+		const struct pci_device_id *ent)
 {
 	unsigned long fb_base, rom_base;
 	unsigned int fb_len, rom_len;
@@ -907,8 +885,7 @@ static int __devinit sticon_init_one (st
 	sti = sti_try_rom_generic(rom_base, fb_base, pd);
 #endif
 	if (!sti) {
-		printk(KERN_WARNING 
-			"Unable to handle STI device '%s'\n",
+		printk(KERN_WARNING "Unable to handle STI device '%s'\n",
 			pd->name);
 		return -ENODEV;
 	}
@@ -916,7 +893,7 @@ static int __devinit sticon_init_one (st
 }
 
 
-static void __devexit sticon_remove_one (struct pci_dev *pd)
+static void __devexit sticore_pci_remove(struct pci_dev *pd)
 {
 	BUG();
 }
@@ -924,69 +901,53 @@ static void __devexit sticon_remove_one 
 
 #define PCI_DEVICE_ID_VISUALIZE_EG	0x1005
 
-static struct pci_device_id sticon_pci_tbl[] __devinitdata = {
+static struct pci_device_id sti_pci_tbl[] __devinitdata = {
 	{ PCI_VENDOR_ID_HP, PCI_DEVICE_ID_VISUALIZE_EG, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
 	{ 0, } /* terminate list */
 };
-MODULE_DEVICE_TABLE(pci, sticon_pci_tbl);
+MODULE_DEVICE_TABLE(pci, sti_pci_tbl);
 
-static struct pci_driver sticon_driver = {
-	name:		"sticon",
-	id_table:	sticon_pci_tbl,
-	probe:		sticon_init_one,
-	remove:		sticon_remove_one,
+static struct pci_driver pci_sti_driver = {
+	name:		"sti (pci)",
+	id_table:	sti_pci_tbl,
+	probe:		sticore_pci_init,
+	remove:		sticore_pci_remove,
 };
-
-
-int __init sticon_pci_init(void)
-{
-	return pci_module_init (&sticon_driver);
-}
 
-
-static void __exit sticon_pci_exit(void)
-{
-	pci_unregister_driver (&sticon_driver);
-}
-
+static struct parisc_device_id sti_pa_tbl[] = {
+	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00077 },
+	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00085 },
+	{ 0, }
+};
 
+struct parisc_driver pa_sti_driver = {
+	name:		"sti (native)",
+	id_table:	sti_pa_tbl,
+	probe:		sticore_pa_init,
+};
 
-struct sti_struct * __init
-sti_init_roms(void)
+struct sti_struct * __init sti_init_roms(void)
 {
 	static int initialized;
-	unsigned long flash_rom;
 
 	if (initialized)
-	    goto out;
+		goto out;
 
-	/* 712 and on the later generation 715 and 725 products
-	 * the STI ROM is part of the regular flash and the PDC
-	 * stored a pointer to the ROM for us at PAGE0->proc_sti.
-	 * On other systems this value will be NULL */
-	flash_rom = PAGE0->proc_sti;
-
-	/* search the possible hpa locations (64bit ready)
-	   in the default order */
-	search_sti(flash_rom, (unsigned long) 0xfffffffff8000000);
-	search_sti(flash_rom, (unsigned long) 0xfffffffff4000000);
-	search_sti(flash_rom, (unsigned long) 0xfffffffff6000000);
-	search_sti(flash_rom, (unsigned long) 0xfffffffffa000000);
+	/* Register drivers for native & PCI cards */
+	register_parisc_driver(&pa_sti_driver);
+	pci_module_init (&pci_sti_driver);
 
-	/* now search for PCI graphic cards */
-	sticon_pci_init();
-	
 	/* check boot-value from "sti=<index>" */
 	if (sti_initial_index >= num_sti_roms)
-	    sti_initial_index = 0;
-	    
+		sti_initial_index = 0;
+
 	default_sti = sti_roms[sti_initial_index];
 
 out:
 	/* return default STI if available */
 	if (num_sti_roms && default_sti && default_sti->init_graph) {
-	    initialized++;
-	    return default_sti;
-	} else
-	    return NULL;
+		initialized = 1;
+		return default_sti;
+	}
+	return NULL;
 }

-- 
Revolutions do not require corporate support.
