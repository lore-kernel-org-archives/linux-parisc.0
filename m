From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] updated tulip workqueue patch
Date: Sat, 29 Apr 2006 23:36:00 -0400
Message-ID: <20060430033600.GA1358@skunkworks.cabal.ca>
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

Updated version of Francois Romieu <romieu <at> fr.zoreil.com>'s patch
to convert tulip to use workqueues.

diff --git a/drivers/net/tulip/21142.c b/drivers/net/tulip/21142.c
index 683f14b..ffba0c1 100644
--- a/drivers/net/tulip/21142.c
+++ b/drivers/net/tulip/21142.c
@@ -26,9 +26,9 @@ static u16 t21142_csr15[] = { 0x0008, 0x
 
 /* Handle the 21143 uniquely: do autoselect with NWay, not the EEPROM list
    of available transceivers.  */
-void t21142_timer(unsigned long data)
+void t21142_media_task(void *data)
 {
-	struct net_device *dev = (struct net_device *)data;
+	struct net_device *dev = data;
 	struct tulip_private *tp = netdev_priv(dev);
 	void __iomem *ioaddr = tp->base_addr;
 	int csr12 = ioread32(ioaddr + CSR12);
diff --git a/drivers/net/tulip/media.c b/drivers/net/tulip/media.c
index f53396f..75c7659 100644
--- a/drivers/net/tulip/media.c
+++ b/drivers/net/tulip/media.c
@@ -44,8 +44,10 @@ static const unsigned char comet_miireg2
 
 /* MII transceiver control section.
    Read and write the MII registers using software-generated serial
-   MDIO protocol.  See the MII specifications or DP83840A data sheet
-   for details. */
+   MDIO protocol.
+   See IEEE 802.3-2002.pdf (Section 2, Chapter "22.2.4 Management functions")
+   or DP83840A data sheet for more details.
+   */
 
 int tulip_mdio_read(struct net_device *dev, int phy_id, int location)
 {
@@ -261,24 +263,56 @@ void tulip_select_media(struct net_devic
 				u16 *reset_sequence = &((u16*)(p+3))[init_length];
 				int reset_length = p[2 + init_length*2];
 				misc_info = reset_sequence + reset_length;
-				if (startup)
+				if (startup) {
+					int timeout = 10;	/* max 1 ms */
 					for (i = 0; i < reset_length; i++)
 						iowrite32(get_u16(&reset_sequence[i]) << 16, ioaddr + CSR15);
+				
+					/* flush posted writes */
+					ioread32(ioaddr + CSR15);
+
+					/* Sect 3.10.3 in DP83840A.pdf (p39) */
+					msleep(1);
+
+					/* Section 4.2 in DP83840A.pdf (p43) */
+					/* and IEEE 802.3 "22.2.4.1.1 Reset" */
+					while (timeout-- &&
+						(tulip_mdio_read (dev, phy_num, MII_BMCR) & BMCR_RESET))
+						msleep(1);
+				}
 				for (i = 0; i < init_length; i++)
 					iowrite32(get_u16(&init_sequence[i]) << 16, ioaddr + CSR15);
+
+				ioread32(ioaddr + CSR15);	/* flush posted writes */
 			} else {
 				u8 *init_sequence = p + 2;
 				u8 *reset_sequence = p + 3 + init_length;
 				int reset_length = p[2 + init_length];
 				misc_info = (u16*)(reset_sequence + reset_length);
 				if (startup) {
+					int timeout = 10;	/* max 1 ms */
 					iowrite32(mtable->csr12dir | 0x100, ioaddr + CSR12);
 					for (i = 0; i < reset_length; i++)
 						iowrite32(reset_sequence[i], ioaddr + CSR12);
+
+					/* flush posted writes */
+					ioread32(ioaddr + CSR12);
+
+					/* Sect 3.10.3 in DP83840A.pdf (p39) */
+					msleep(1);
+
+					/* Section 4.2 in DP83840A.pdf (p43) */
+					/* and IEEE 802.3 "22.2.4.1.1 Reset" */
+					while (timeout-- &&
+						(tulip_mdio_read (dev, phy_num, MII_BMCR) & BMCR_RESET))
+						msleep(1);
 				}
 				for (i = 0; i < init_length; i++)
 					iowrite32(init_sequence[i], ioaddr + CSR12);
+
+				ioread32(ioaddr + CSR12);	/* flush posted writes */
 			}
+
 			tmp_info = get_u16(&misc_info[1]);
 			if (tmp_info)
 				tp->advertising[phy_num] = tmp_info | 1;
diff --git a/drivers/net/tulip/timer.c b/drivers/net/tulip/timer.c
index e058a9f..272ef62 100644
--- a/drivers/net/tulip/timer.c
+++ b/drivers/net/tulip/timer.c
@@ -18,13 +18,14 @@
 #include "tulip.h"
 
 
-void tulip_timer(unsigned long data)
+void tulip_media_task(void *data)
 {
-	struct net_device *dev = (struct net_device *)data;
+	struct net_device *dev = data;
 	struct tulip_private *tp = netdev_priv(dev);
 	void __iomem *ioaddr = tp->base_addr;
 	u32 csr12 = ioread32(ioaddr + CSR12);
 	int next_tick = 2*HZ;
+	unsigned long flags;
 
 	if (tulip_debug > 2) {
 		printk(KERN_DEBUG "%s: Media selection tick, %s, status %8.8x mode"
@@ -126,6 +127,15 @@ void tulip_timer(unsigned long data)
 	}
 	break;
 	}
+
+
+	spin_lock_irqsave(&tp->lock, flags);
+	if (tp->timeout_recovery) {
+		tulip_tx_timeout_complete(tp, ioaddr);
+		tp->timeout_recovery = 0;
+	}
+	spin_unlock_irqrestore(&tp->lock, flags);
+
 	/* mod_timer synchronizes us with potential add_timer calls
 	 * from interrupts.
 	 */
diff --git a/drivers/net/tulip/tulip.h b/drivers/net/tulip/tulip.h
index 05d2d96..c35ccf4 100644
--- a/drivers/net/tulip/tulip.h
+++ b/drivers/net/tulip/tulip.h
@@ -46,6 +46,7 @@ struct tulip_chip_table {
 	int valid_intrs;	/* CSR7 interrupt enable settings */
 	int flags;
 	void (*media_timer) (unsigned long data);
+	void (*media_task) (void *);
 };
 
 
@@ -367,6 +368,7 @@ struct tulip_private {
 	unsigned int medialock:1;	/* Don't sense media type. */
 	unsigned int mediasense:1;	/* Media sensing in progress. */
 	unsigned int nway:1, nwayset:1;		/* 21143 internal NWay. */
+	unsigned int timeout_recovery:1;
 	unsigned int csr0;	/* CSR0 setting. */
 	unsigned int csr6;	/* Current CSR6 control settings. */
 	unsigned char eeprom[EEPROM_SIZE];	/* Serial EEPROM contents. */
@@ -385,6 +387,7 @@ struct tulip_private {
 	void __iomem *base_addr;
 	int csr12_shadow;
 	int pad0;		/* Used for 8-byte alignment */
+	struct work_struct media_work;
 };
 
 
@@ -399,7 +402,7 @@ struct eeprom_fixup {
 
 /* 21142.c */
 extern u16 t21142_csr14[];
-void t21142_timer(unsigned long data);
+void t21142_media_task(void *data);
 void t21142_start_nway(struct net_device *dev);
 void t21142_lnk_change(struct net_device *dev, int csr5);
 
@@ -437,7 +440,7 @@ void pnic_lnk_change(struct net_device *
 void pnic_timer(unsigned long data);
 
 /* timer.c */
-void tulip_timer(unsigned long data);
+void tulip_media_task(void *data);
 void mxic_timer(unsigned long data);
 void comet_timer(unsigned long data);
 
@@ -486,4 +489,14 @@ static inline void tulip_restart_rxtx(st
 	tulip_start_rxtx(tp);
 }
 
+static inline void tulip_tx_timeout_complete(struct tulip_private *tp, void __iomem *ioaddr)
+{
+	/* Stop and restart the chip's Tx processes. */
+	tulip_restart_rxtx(tp);
+	/* Trigger an immediate transmit demand. */
+	iowrite32(0, ioaddr + CSR1);
+
+	tp->stats.tx_errors++;
+}
+
 #endif /* __NET_TULIP_H__ */
diff --git a/drivers/net/tulip/tulip_core.c b/drivers/net/tulip/tulip_core.c
index c67c912..d067e91 100644
--- a/drivers/net/tulip/tulip_core.c
+++ b/drivers/net/tulip/tulip_core.c
@@ -131,7 +131,16 @@ int tulip_debug = TULIP_DEBUG;
 int tulip_debug = 1;
 #endif
 
+static struct workqueue_struct *ktulipd_workqueue;
 
+static void tulip_timer(unsigned long data)
+{
+	struct net_device *dev = (struct net_device *)data;
+	struct tulip_private *tp = netdev_priv(dev);
+
+	if (netif_running(dev))
+		queue_work(ktulipd_workqueue, &tp->media_work);
+}
 
 /*
  * This table use during operation for capabilities and media timer.
@@ -145,59 +154,60 @@ struct tulip_chip_table tulip_tbl[] = {
 
   /* DC21140 */
   { "Digital DS21140 Tulip", 128, 0x0001ebef,
-	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | HAS_PCI_MWI, tulip_timer },
+	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | HAS_PCI_MWI, tulip_timer,
+	tulip_media_task },
 
   /* DC21142, DC21143 */
   { "Digital DS21143 Tulip", 128, 0x0801fbff,
 	HAS_MII | HAS_MEDIA_TABLE | ALWAYS_CHECK_MII | HAS_ACPI | HAS_NWAY
-	| HAS_INTR_MITIGATION | HAS_PCI_MWI, t21142_timer },
+	| HAS_INTR_MITIGATION | HAS_PCI_MWI, tulip_timer, t21142_media_task },
 
   /* LC82C168 */
   { "Lite-On 82c168 PNIC", 256, 0x0001fbef,
-	HAS_MII | HAS_PNICNWAY, pnic_timer },
+	HAS_MII | HAS_PNICNWAY, pnic_timer, },
 
   /* MX98713 */
   { "Macronix 98713 PMAC", 128, 0x0001ebef,
-	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM, mxic_timer },
+	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM, mxic_timer, },
 
   /* MX98715 */
   { "Macronix 98715 PMAC", 256, 0x0001ebef,
-	HAS_MEDIA_TABLE, mxic_timer },
+	HAS_MEDIA_TABLE, mxic_timer, },
 
   /* MX98725 */
   { "Macronix 98725 PMAC", 256, 0x0001ebef,
-	HAS_MEDIA_TABLE, mxic_timer },
+	HAS_MEDIA_TABLE, mxic_timer, },
 
   /* AX88140 */
   { "ASIX AX88140", 128, 0x0001fbff,
 	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | MC_HASH_ONLY
-	| IS_ASIX, tulip_timer },
+	| IS_ASIX, tulip_timer, tulip_media_task },
 
   /* PNIC2 */
   { "Lite-On PNIC-II", 256, 0x0801fbff,
-	HAS_MII | HAS_NWAY | HAS_8023X | HAS_PCI_MWI, pnic2_timer },
+	HAS_MII | HAS_NWAY | HAS_8023X | HAS_PCI_MWI, pnic2_timer, },
 
   /* COMET */
   { "ADMtek Comet", 256, 0x0001abef,
-	HAS_MII | MC_HASH_ONLY | COMET_MAC_ADDR, comet_timer },
+	HAS_MII | MC_HASH_ONLY | COMET_MAC_ADDR, comet_timer, },
 
   /* COMPEX9881 */
   { "Compex 9881 PMAC", 128, 0x0001ebef,
-	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM, mxic_timer },
+	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM, mxic_timer, },
 
   /* I21145 */
   { "Intel DS21145 Tulip", 128, 0x0801fbff,
 	HAS_MII | HAS_MEDIA_TABLE | ALWAYS_CHECK_MII | HAS_ACPI
-	| HAS_NWAY | HAS_PCI_MWI, t21142_timer },
+	| HAS_NWAY | HAS_PCI_MWI, tulip_timer, tulip_media_task },
 
   /* DM910X */
   { "Davicom DM9102/DM9102A", 128, 0x0001ebef,
 	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | HAS_ACPI,
-	tulip_timer },
+	tulip_timer, tulip_media_task },
 
   /* RS7112 */
   { "Conexant LANfinity", 256, 0x0001ebef,
-	HAS_MII | HAS_ACPI, tulip_timer },
+	HAS_MII | HAS_ACPI, tulip_timer, tulip_media_task },
 
 };
 
@@ -523,20 +533,9 @@ static void tulip_tx_timeout(struct net_
 			   "SIA %8.8x %8.8x %8.8x %8.8x, resetting...\n",
 			   dev->name, ioread32(ioaddr + CSR5), ioread32(ioaddr + CSR12),
 			   ioread32(ioaddr + CSR13), ioread32(ioaddr + CSR14), ioread32(ioaddr + CSR15));
-		if ( ! tp->medialock  &&  tp->mtable) {
-			do
-				--tp->cur_index;
-			while (tp->cur_index >= 0
-				   && (tulip_media_cap[tp->mtable->mleaf[tp->cur_index].media]
-					   & MediaIsFD));
-			if (--tp->cur_index < 0) {
-				/* We start again, but should instead look for default. */
-				tp->cur_index = tp->mtable->leafcount - 1;
-			}
-			tulip_select_media(dev, 0);
-			printk(KERN_WARNING "%s: transmit timed out, switching to %s "
-				   "media.\n", dev->name, medianame[dev->if_port]);
-		}
+		tp->timeout_recovery = 1;
+		queue_work(ktulipd_workqueue, &tp->media_work);
+		goto out_unlock;
 	} else if (tp->chip_id == PNIC2) {
 		printk(KERN_WARNING "%s: PNIC2 transmit timed out, status %8.8x, "
 		       "CSR6/7 %8.8x / %8.8x CSR12 %8.8x, resetting...\n",
@@ -576,14 +575,9 @@ static void tulip_tx_timeout(struct net_
 	}
 #endif
 
-	/* Stop and restart the chip's Tx processes . */
-
-	tulip_restart_rxtx(tp);
-	/* Trigger an immediate transmit demand. */
-	iowrite32(0, ioaddr + CSR1);
-
-	tp->stats.tx_errors++;
+	tulip_tx_timeout_complete(tp, ioaddr);
 
+out_unlock:
 	spin_unlock_irqrestore (&tp->lock, flags);
 	dev->trans_start = jiffies;
 	netif_wake_queue (dev);
@@ -733,6 +727,8 @@ static void tulip_down (struct net_devic
 	void __iomem *ioaddr = tp->base_addr;
 	unsigned long flags;
 
+	flush_workqueue(ktulipd_workqueue);
+
 	del_timer_sync (&tp->timer);
 #ifdef CONFIG_TULIP_NAPI
 	del_timer_sync (&tp->oom_timer);
@@ -1399,6 +1395,8 @@ static int __devinit tulip_init_one (str
 	tp->timer.data = (unsigned long)dev;
 	tp->timer.function = tulip_tbl[tp->chip_id].media_timer;
 
+	INIT_WORK(&tp->media_work, tulip_tbl[tp->chip_id].media_task, dev);
+
 	dev->base_addr = (unsigned long)ioaddr;
 
 #ifdef CONFIG_TULIP_MWI
@@ -1845,6 +1843,8 @@ static struct pci_driver tulip_driver = 
 
 static int __init tulip_init (void)
 {
+	int ret;
+
 #ifdef MODULE
 	printk (KERN_INFO "%s", version);
 #endif
@@ -1853,14 +1853,23 @@ static int __init tulip_init (void)
 	tulip_rx_copybreak = rx_copybreak;
 	tulip_max_interrupt_work = max_interrupt_work;
 
+	ktulipd_workqueue = create_workqueue("ktulipd");
+	if (ret < 0)
+		goto out;
+
 	/* probe for and init boards */
-	return pci_module_init (&tulip_driver);
+	ret = pci_module_init (&tulip_driver);
+	if (ret < 0)
+		destroy_workqueue(ktulipd_workqueue);
+out:
+	return ret;
 }
 
 
 static void __exit tulip_cleanup (void)
 {
 	pci_unregister_driver (&tulip_driver);
+	destroy_workqueue(ktulipd_workqueue);
 }
 
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
