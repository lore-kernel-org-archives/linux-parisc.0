Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h83Gu0I03868;
	Wed, 3 Sep 2003 12:56:00 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030903165113.138BF494064@palinux.hppa>
References: <20030903165113.138BF494064@palinux.hppa>
Content-Type: text/plain
Date: 03 Sep 2003 12:56:00 -0400
Message-Id: <1062608161.2251.27.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 2003-09-03 at 12:51, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	03/09/03 10:51:13
> 
> Modified files:
> 	.              : Makefile 
> 	drivers/net/tulip: eeprom.c tulip.h tulip_core.c 
> 	drivers/parisc : dino.c 
> 
> Log message:
> Fix card mode dino support and make HSC FX (tulip) card work

Patch is in two parts:  dino bit just corrects some thinkos in the card
mode dino code and adds the actual dino device to the prints (useful for
debugging if you have more than one dino).

The tulip fix simply adds the card to the tulip card table and makes it
all work.

I've tested this on my C360...however, I had to hack the ccio window to
get that to work...I need more time to make this code better.

James

===== drivers/net/tulip/eeprom.c 1.9 vs edited =====
--- 1.9/drivers/net/tulip/eeprom.c	Mon Oct 28 23:14:42 2002
+++ edited/drivers/net/tulip/eeprom.c	Wed Sep  3 11:41:24 2003
@@ -93,8 +93,13 @@
 #ifdef __hppa__
 	unsigned char *ee_data = tp->eeprom;
 
-	if (ee_data[0] == 0x3c && ee_data[1] == 0x10 && 
-		(ee_data[2] == 0x63 || ee_data[2] == 0x61) && ee_data[3] == 0x10) {
+	/* NOTE: The 3x5 FF cards the ee_data is trying to recognise
+	 * need to be brought properly under the tulip initialisation
+	 * structure */
+
+	if ((tp->flags & NEEDS_FAKE_MEDIA_TABLE) 
+	    || (ee_data[0] == 0x3c && ee_data[1] == 0x10 && 
+		(ee_data[2] == 0x63 || ee_data[2] == 0x61) && ee_data[3] == 0x10)) {
 
 		static unsigned char leafdata[] =
 			{ 0x01,       /* phy number */
===== drivers/net/tulip/tulip.h 1.15 vs edited =====
--- 1.15/drivers/net/tulip/tulip.h	Sun May 25 22:14:37 2003
+++ edited/drivers/net/tulip/tulip.h	Wed Sep  3 11:27:00 2003
@@ -64,6 +64,8 @@
 	COMET_MAC_ADDR		= 0x0800,
 	HAS_PCI_MWI		= 0x1000,
 	HAS_PHY_IRQ		= 0x2000,
+	HAS_SWAPPED_SEEPROM	= 0x4000,
+	NEEDS_FAKE_MEDIA_TABLE	= 0x8000,
 };
 

@@ -86,6 +88,7 @@
 	I21145,
 	DM910X,
 	CONEXANT,
+	HP_D21140,
 };
 

===== drivers/net/tulip/tulip_core.c 1.48 vs edited =====
--- 1.48/drivers/net/tulip/tulip_core.c	Tue Aug 19 22:53:17 2003
+++ edited/drivers/net/tulip/tulip_core.c	Wed Sep  3 11:42:48 2003
@@ -191,10 +191,17 @@
   /* RS7112 */
   { "Conexant LANfinity", 256, 0x0001ebef,
 	HAS_MII | HAS_ACPI, tulip_timer },
+
+  /* HP_D21140 */
+  { "HSC 100BaseTX Workstation single port (Digital DS21140 Tulip)", 128,
+    0x0001ebef,	HAS_MII | HAS_MEDIA_TABLE | CSR12_IN_SROM | HAS_PCI_MWI 
+    | HAS_SWAPPED_SEEPROM | NEEDS_FAKE_MEDIA_TABLE, tulip_timer },
+
 };
 

 static struct pci_device_id tulip_pci_tbl[] = {
+	{ 0x1011, 0x0009, 0x103c, 0x1062, 0, 0, HP_D21140 },
 	{ 0x1011, 0x0009, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DC21140 },
 	{ 0x1011, 0x0019, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DC21143 },
 	{ 0x11AD, 0x0002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, LC82C168 },
@@ -1459,9 +1466,10 @@
 		int sa_offset = 0;
 		int ee_addr_size = tulip_read_eeprom(ioaddr, 0xff, 8) & 0x40000 ? 8 : 6;
 
-		for (i = 0; i < sizeof(tp->eeprom)/2; i++)
-			((u16 *)ee_data)[i] =
-				le16_to_cpu(tulip_read_eeprom(ioaddr, i, ee_addr_size));
+		for (i = 0; i < sizeof(tp->eeprom)/2; i++) {
+			u16 data = tulip_read_eeprom(ioaddr, i, ee_addr_size);
+			((u16 *)ee_data)[i] = (tp->flags & HAS_SWAPPED_SEEPROM) ? data : le16_to_cpu(data);
+		}
 
 		/* DEC now has a specification (see Notes) but early board makers
 		   just put the address in the first EEPROM locations. */
===== drivers/parisc/dino.c 1.10 vs edited =====
--- 1.10/drivers/parisc/dino.c	Sun Aug 24 06:50:06 2003
+++ edited/drivers/parisc/dino.c	Wed Sep  3 11:48:51 2003
@@ -401,23 +401,7 @@
 	{
 		int irq;
 
-		/*
-		 * Perform a binary search on set bits.
-		 * `Less than Fatal' and PS2 interrupts aren't supported.
-		 */
-		if (mask & 0xf) {
-			if (mask & 0x3) {
-				irq = (mask & 0x1) ? 0 : 1; /* PCI INT A, B */
-			} else {
-				irq = (mask & 0x4) ? 2 : 3; /* PCI INT C, D */
-			}
-		} else {
-			if (mask & 0x30) {
-				irq = (mask & 0x10) ? 4 : 5; /* PCI INT E, F */
-			} else {
-				irq = (mask & 0x40) ? 6 : 10; /* GSC, RS232 */
-			}
-		}
+		irq = __ffs(mask);
 
 		mask &= ~(1<<irq);
 
@@ -479,9 +463,18 @@
 	int i;
 	struct dino_device *dino_dev = DINO_DEV(parisc_walk_tree(bus->dev));
 	struct resource *res;
+	char name[128];
+	int size;
 
 	res = &dino_dev->hba.lmmio_space;
 	res->flags = IORESOURCE_MEM;
+	size = snprintf(name, sizeof(name), "Dino LMMIO (%s)", bus->dev->bus_id);
+	res->name = kmalloc(size+1, GFP_KERNEL);
+	if(res->name)
+		strcpy((char *)res->name, name);
+	else
+		res->name = dino_dev->hba.lmmio_space.name;
+	
 
 	if (ccio_allocate_resource(dino_dev->hba.dev, res, _8MB,
 				(unsigned long) 0xfffffffff0000000UL | _8MB,
@@ -521,7 +514,7 @@
 	** Set Latency Timer to 0xff (not a shared bus)
 	** Set CACHELINE_SIZE.
 	*/
-	dino_cfg_write(dev->bus, dev->devfn, PCI_CACHE_LINE_SIZE, 16, 0xff00 | L1_CACHE_BYTES/4); 
+	dino_cfg_write(dev->bus, dev->devfn, PCI_CACHE_LINE_SIZE, 2, 0xff00 | L1_CACHE_BYTES/4); 
 
 	/*
 	** Program INT_LINE for card-mode devices.
@@ -532,13 +525,14 @@
 	** "-1" converts INTA-D (1-4) to PCIINTA-D (0-3) range.
 	** The additional "-1" adjusts for skewing the IRQ<->slot.
 	*/
-	dino_cfg_read(dev->bus, dev->devfn, PCI_INTERRUPT_PIN, 8, &irq_pin); 
+	dino_cfg_read(dev->bus, dev->devfn, PCI_INTERRUPT_PIN, 1, &irq_pin); 
+	printk("DINO CONFIG READ GIVES irq_pin %d\n", irq_pin);
 	dev->irq = (irq_pin + PCI_SLOT(dev->devfn) - 1) % 4 ;
 
 	/* Shouldn't really need to do this but it's in case someone tries
 	** to bypass PCI services and look at the card themselves.
 	*/
-	dino_cfg_write(dev->bus, dev->devfn, PCI_INTERRUPT_LINE, 8, dev->irq); 
+	dino_cfg_write(dev->bus, dev->devfn, PCI_INTERRUPT_LINE, 1, dev->irq); 
 }
 

@@ -818,8 +812,15 @@
 {
 	struct dino_device *dino_dev;	// Dino specific control struct
 	const char *version = "unknown";
-	const char *name = "Dino";
+	const int name_len = 32;
+	char *name;
 	int is_cujo = 0;
+
+	name = kmalloc(name_len, GFP_KERNEL);
+	if(name)
+		snprintf(name, name_len, "Dino %s", dev->dev.bus_id);
+	else
+		name = "Dino";
 
 	if (is_card_dino(&dev->id)) {
 		version = "3.x (card mode)";
