Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailb.telia.com (mailb.telia.com [194.22.194.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id C920F4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 08:59:21 -0700 (MST)
Message-Id: <200102181559.QAA28579@zaphod.halden.lillfab.se>
Date: Sun, 18 Feb 2001 16:59:16 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
To: alex@linuxcare.com
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: MULTIPART/mixed; BOUNDARY="-1463811727-1804289383-982511956=:30534"
Subject: [parisc-linux] Some progress with WAX_EISA (Who knows about interrupts?)
List-ID: <linux-parisc.vger.kernel.org>

---1463811727-1804289383-982511956=:30534
Content-Type: TEXT/plain; CHARSET=US-ASCII

Hello Alex and all.

Today I managed to get the ne driver to initialize my NE2k clone in the
EISA slot on my  715/old.
I have no idea on what to do about interrupts, so the do not work. But
port I/O seems to work which it did not do before.

For this to work the WAX EISA must be the first PCI bus adapter to be
registered with the PCI code or else it does not get to mapped to the
ISA port range. This will only be problematic on boxes where there are
both a EISA bus and a PCI bus and I do not know if there are any.

/Daniel 

-- 


---1463811727-1804289383-982511956=:30534
Content-Type: TEXT/plain; CHARSET=US-ASCII
Content-Disposition: attachment ; filename="0218.diff"

Index: drivers/gsc/busdevice.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/busdevice.c,v
retrieving revision 1.13
diff -u -p -r1.13 busdevice.c
--- busdevice.c	2000/12/22 20:50:23	1.13
+++ busdevice.c	2001/02/18 15:40:21
@@ -39,7 +39,7 @@
 #endif
 
 
-static struct pa_iodc_driver busdev_drivers_for[] __initdata = {
+static struct pa_iodc_driver busdev_drivers_for[] = {
 /* I'm pretty sure this covers them all. */
   {HPHW_BA, 0x0, 0, 0x00081, 0, 0,
 	DRIVER_CHECK_HWTYPE + DRIVER_CHECK_SVERSION,
@@ -275,6 +275,9 @@ int __init busdevices_init(void)
 
 #ifdef CONFIG_GSC_WAX
 	register_wax_driver();
+#endif
+#ifdef CONFIG_WAX_EISA
+	register_wax_eisa_driver();
 #endif
 
 	return 0;
Index: drivers/gsc/wax.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/wax.c,v
retrieving revision 1.5
diff -u -p -r1.5 wax.c
--- wax.c	2000/12/22 20:50:23	1.5
+++ wax.c	2001/02/18 15:40:21
@@ -145,9 +145,6 @@ wax_init_chip(struct hp_device *d, struc
 	printk("%s: HIL Keyboard-NMI registered.\n", wax->name);
 #endif
 
-#ifdef CONFIG_WAX_EISA
-	register_wax_eisa_driver();
-#endif
 
 	return ret;
 }
Index: drivers/gsc/wax_eisa.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/wax_eisa.c,v
retrieving revision 1.1
diff -u -p -r1.1 wax_eisa.c
--- wax_eisa.c	2000/12/22 20:50:23	1.1
+++ wax_eisa.c	2001/02/18 15:40:21
@@ -21,6 +21,7 @@
 #include <asm/hardware.h>
 #include <asm/gsc.h>
 #include <asm/irq.h>
+#include <linux/pci.h>
 #include <asm/pci.h>
 #include <asm/processor.h>
 
@@ -40,52 +41,45 @@ static struct pa_iodc_driver wax_eisa_dr
 };
 
 #define WAX_EISA_OUT(type, size) \
-static void wax_out##type (u##size d, int addr) \
+static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) \
 { \
 	u32 out_addr; \
-	if (((addr >= 0x00080000) && (addr < 0x00100000)) || \
-		((addr >= 0x00500000) && (addr < 0x03C00000))) { \
-		out_addr = 0xfc000000 + ((addr & 0xfc00) >> 6) + \
+        out_addr = (u32)hba->base_addr + ((addr & 0xfc00) >> 6) + \
 			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
-		gsc_write##type(d,out_addr); \
-	} else { \
-		printk("Wax EISA: Ack, cannot write to 0x%x\n",addr); \
-	} \
+	gsc_write##type(d,out_addr); \
 } 
 
+
 WAX_EISA_OUT(b,8)
 WAX_EISA_OUT(w,16)
 WAX_EISA_OUT(l,32)
 
 #define WAX_EISA_IN(type, size) \
-static u##size wax_in##type (int addr) \
+static u##size wax_in##type (struct pci_hba_data *hba, u16 addr) \
 { \
-	u32 out_addr; \
-	if (((addr >= 0x00080000) && (addr < 0x00100000)) || \
-		((addr >= 0x00500000) && (addr < 0x03C00000))) { \
-		out_addr = 0xfc000000 + ((addr & 0xfc00) >> 6) + \
-			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
-		return gsc_read##type(out_addr); \
-	} else { \
-		printk("WAX EISA Ack, cannot read from 0x%x\n",addr); \
-		return -1; \
-	} \
+	u32 in_addr; \
+        in_addr = (u32)hba->base_addr + ((addr & 0xfc00) >> 6) + \
+	       ((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
+	return gsc_read##type(in_addr); \
 }
 
+
 WAX_EISA_IN(b,8)
 WAX_EISA_IN(w,16)
 WAX_EISA_IN(l,32)
 
 static struct pci_port_ops wax_port_ops = {
-	wax_inb, wax_inl, wax_inw,
-	wax_outb, wax_outl, wax_outw
+	wax_inb, wax_inw, wax_inl,
+	wax_outb, wax_outw, wax_outl
 };
 
 struct pci_hba_data wax_eisa_hba;
 
+/*
+ * What are these for? 
 #define outsl(x) outl((x))
 #define insl(x) inl((x))
-
+*/
 /*
 The following need to be created still.
 memset_io
@@ -117,9 +111,14 @@ wax_eisa_driver_init(struct hp_device *d
 
 	version = gsc_readw(d->hpa+0x7000);
 	printk(KERN_INFO "Wax EISA bus adapter version 0x%x at 0x%p\n",version,d->hpa);
-
-	pcibios_register_hba((struct pci_hba_data *) &wax_port_ops);
-
+        
+        /* I think that hpa is the only part that makes sence to us */
+        wax_eisa_hba.base_addr=d->hpa;
+   
+     
+	pcibios_register_hba((struct pci_hba_data *) &wax_eisa_hba);
+        pci_port = (struct pci_port_ops*) &wax_port_ops;
+   
 #if 0
 	/* Turn off lock control */
 	gsc_writeb(0x0,d->hpa + 0x10001); 
Index: include/asm-parisc/io.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/io.h,v
retrieving revision 1.15
diff -u -p -r1.15 io.h
--- io.h	2001/01/25 00:03:08	1.15
+++ io.h	2001/02/18 15:40:27
@@ -25,6 +25,7 @@
 #define writel gsc_writel
 
 
+
 #if defined(CONFIG_PCI) || defined(CONFIG_ISA)
 /*
  *	So we get clear link errors 
@@ -43,8 +44,34 @@ static inline void memcpy_toio(void *des
 		writeb(*((char *)src)++, (char *)dest++);
 }
 
-#endif
+/* ins and outs */
+#define PCI_PORT_OUTS(type, size) \
+extern inline void outs##type(unsigned short port, void * addr, unsigned long count) \
+{ while (count) { \
+    out##type(*(u##size*)addr, port); \
+    addr+=sizeof(u##size); \
+    count--; \
+  } \
+}
+
+PCI_PORT_OUTS(b,8)
+PCI_PORT_OUTS(w,16)
+PCI_PORT_OUTS(l,32)
 
+#define PCI_PORT_INS(type, size) \
+extern inline void ins##type(unsigned short port, void * addr, unsigned long count) \
+{ while (count) { \
+    *(u##size*)addr = in##type(port); \
+    addr+=sizeof(u##size); \
+    count--; \
+  } \
+} 
+
+PCI_PORT_INS(b,8)
+PCI_PORT_INS(w,16)
+PCI_PORT_INS(l,32)
+
+#endif
 /* IO Port space is :      BBiiii   where BB is HBA number. */
 #define IO_SPACE_LIMIT 0x00ffffff
 
Index: include/asm-parisc/irq.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/irq.h,v
retrieving revision 1.12
diff -u -p -r1.12 irq.h
--- irq.h	2000/11/02 08:14:13	1.12
+++ irq.h	2001/02/18 15:40:27
@@ -74,6 +74,9 @@ static __inline__ int irq_cannonicalize(
 
 extern void disable_irq(int);
 extern void enable_irq(int);
+/* It seems that the standard disable_irq() in parisc-linux 
+ * does not sync, so this should be safe */
+#define disable_irq_nosync(x) disable_irq(x)
 
 extern void do_irq_mask(unsigned long mask, struct irq_region *region,
 	struct pt_regs *regs);

---1463811727-1804289383-982511956=:30534--
