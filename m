Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA23115
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Apr 2000 16:00:08 -0600
From: 5116@telia.com
Received: from zaphod.halden.lillfab.se (t5o70p86.telia.com [195.67.239.86])
	by mailf.telia.com (8.9.3/8.9.3) with ESMTP id AAA25291
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Apr 2000 00:00:03 +0200 (CEST)
Received: (from danne@localhost)
	by zaphod.halden.lillfab.se (8.9.3/8.9.3) id AAA14260
	for parisc-linux@thepuffingroup.com; Tue, 11 Apr 2000 00:00:01 +0200
Message-Id: <200004102200.AAA14260@zaphod.halden.lillfab.se>
Date: Tue, 11 Apr 2000 00:00:00 +0200 (CEST)
Reply-To: 5116@telia.com
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: TEXT/plain; charset=iso-8859-1
Subject: [parisc-linux] ASP patchlet
List-ID: <linux-parisc.vger.kernel.org>

Hello, all

With this patch I get some noises from the core LAN in my old ASP 715.
It dont seem to get anny interrupts yes though, any comments?

82596.c: MAC of HP700 LAN blidely read from prom !
eth0: 82596 at 0xf0826000, 08 00 09 62 71 EA IRQ 535.
lasi_82596.c:v1.2 02/13/2000
eth0: lp at 0xc2fcc000 (1720 bytes), lp->scb at 0xc2fcc014
request_irq(535, c01b1a64, 0x0, i82596, c2fecc00)
lasi_enable_irq(c2fe9080, 23) IMR 0x100 addr f0800004
lasi_disable_irq(c2fe9080, 23) IMR 0x00
eth0: i82596 initialization timed out with status 0000, cmd 0000.
lasi_enable_irq(c2fe9080, 23) IMR 0x100 addr f0800004 
eth0: receive unit start timed out with status 0000, cmd 0100.
about to RX_START status 0000
i82596 init timed out with status 0000, cmd 0010.
Sending BOOTP requests............. timed out!
IP-Config: Auto-configuration of network failed.
RTNL: assertion failed at devinet.c(785):inetdev_event
eth0: close1 timed out with status 0000, cmd 0010.
eth0: close2 timed out with status 0000, cmd 0440.
i596_cleanup_cmd
i596_cleanup_cmd timed out with status 0000, cmd 0440.
lasi_disable_irq(c2fe9080, 23) IMR 0x00
RTNL: assertion failed at devinet.c(785):inetdev_event  

/Daniel
                                                                                                       
--- drivers/gsc/lasi.c	Mon Apr 10 23:46:13 2000
+++ drivers/gsc/lasi.c.de	Mon Apr 10 23:43:40 2000
@@ -148,6 +148,11 @@
 	while (lasi &&
 		(((unsigned int) lasi->hpa & ~0xffff) != ((unsigned int) dev->hpa & ~0xffff)))
 	{
+	        if ((unsigned int)lasi->hpa == 0xf0800000 && 
+		    ((unsigned int)dev->hpa & 0xffff0000) == 0xf0820000) {
+		    /* Special case: the ASP do not follow later LASI rules */
+		    break;
+		}
 		lasi = lasi->next;
 	}
 
@@ -158,24 +163,41 @@
 		return 0;
 	}
 
-	/*
-	** "irq" bits below are numbered relative to most significant bit.
-	*/
-	switch (off) {
-	case 0x0000:	irq = 17; break; /* Lasi itself */
-	case 0x2000:	irq = 24; break; /* Centronics/Parallel Port */
-	case 0x4000:	irq = 18; break; /* Audio */
-//	case 0x4???:	irq = 13; break; /* ISDN */
-	case 0x5000:	irq = 26; break; /* RS232 */
-	case 0x6000:	irq = 22; break; /* SCSI */
-	case 0x7000:	irq = 23; break; /* LAN */
-	case 0x8000:	irq =  5; break; /* Keyboard/Mouse */
-	case 0xA000:	irq = 11; break; /* Floppy Disk Controller */
-	default: 
-		printk("Lasi: never seen the HPA offset of 0x%x.\n",off);
-		return(0);
-	}
-
+       if (lasi->hpa == 0xf0800000) {
+	  /* The ASP */
+	  switch (off) {
+	   case 0xF000:	irq = 17; break; /* ASP itself (bus error) */
+	   case 0x4000:	irq = 24; break; /* Centronics/Parallel Port */
+	   case 0x9000:	irq = 18; break; /* Audio */
+	   case 0x3000:	irq = 26; break; /* RS232 A */
+	   case 0x2000:	irq = 25; break; /* RS232 B */
+	   case 0x5000:	irq = 22; break; /* SCSI */
+	   case 0x6000:	irq = 23; break; /* LAN */
+	 
+	   default: 
+	     printk("ASP: never seen the HPA offset of 0x%x.\n",off);
+	     return(0);
+	  }
+       }else{
+	  
+	  /*
+	   ** "irq" bits below are numbered relative to most significant bit.
+	   */
+	  switch (off) {
+	   case 0x0000:	irq = 17; break; /* Lasi itself */
+	   case 0x2000:	irq = 24; break; /* Centronics/Parallel Port */
+	   case 0x4000:	irq = 18; break; /* Audio */
+	     //	case 0x4???:	irq = 13; break; /* ISDN */
+	   case 0x5000:	irq = 26; break; /* RS232 */
+	   case 0x6000:	irq = 22; break; /* SCSI */
+	   case 0x7000:	irq = 23; break; /* LAN */
+	   case 0x8000:	irq =  5; break; /* Keyboard/Mouse */
+	   case 0xA000:	irq = 11; break; /* Floppy Disk Controller */
+	   default: 
+	     printk("Lasi: never seen the HPA offset of 0x%x.\n",off);
+	     return(0);
+	  }
+       }
 printk("lasi_alloc_irq(0x%p) 0x%x + %d = %d\n", dev->hpa, lasi->lasi_region->data.irqbase, irq, lasi->lasi_region->data.irqbase + irq);
 
 	return lasi->lasi_region->data.irqbase + irq;
--- drivers/net/lasi_82596.c	Mon Apr 10 23:46:11 2000
+++ drivers/net/lasi_82596.c.de	Mon Apr 10 23:44:01 2000
@@ -115,6 +115,8 @@
 #define pdc(addr) asm volatile("pdc (%%sr1, %0)" : : "r" (addr))
 #define fic(addr) asm volatile("fic (%%sr1, %0)" : : "r" (addr))
 
+#define LAN_PROM_ADDR	0xF0810000
+
 void _dma_cache_wback(void *addr, int len)	/* addr = virtual adress */
 {	
     unsigned old_sr1;
@@ -1122,8 +1124,14 @@
 	    return ENODEV;
 
 	if (!pdc_lan_station_id( (char*)&eth_addr, (void*)dev->base_addr)) {
-	    printk("82596.c: MAC of HP700 LAN could not be read !\n");
-	    return ENODEV;
+	   for(i=0;i<6;i++)
+	       eth_addr[i] = gsc_readb(LAN_PROM_ADDR+i);
+	   printk("82596.c: MAC of HP700 LAN blindely read from the prom!\n");
+	    
+#if 0
+	   printk("82596.c: MAC of HP700 LAN could not be read !\n");
+	   return ENODEV;
+#endif
 	}
 
 	ether_setup(dev);

-- 
Daniel Engström - Lilla Fabriken AB - Technical Support
daniel@lillfab.se - Work related.  5116@telia.com - Private.
