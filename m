Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DCF34829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 22:08:10 -0700 (MST)
Received: from beavis.ybsoft.com (ns1.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id C81862B10D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 22:08:08 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="=-0MeGBE4XA6qyeKAx+l2s"
Message-Id: <1043383738.594.8.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 23 Jan 2003 22:08:08 -0700
Subject: [parisc-linux] [PATCH] long booting kernels...
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

--=-0MeGBE4XA6qyeKAx+l2s
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I finally found some time to test the updated bus walk code on a
parisc-2.4.20-pa22 system.  It works fine for me, but the C200 does not
exhibit the problems seen by others on this list.  I would appreciate if
someone with this problem could test this patch and see if it speeds the
boot time up.

This is the same patch I applied to the 2.5 tree several months ago.

Thanks,

- Ryan


--=-0MeGBE4XA6qyeKAx+l2s
Content-Disposition: attachment; filename=drivers.diff
Content-Type: text/x-patch; name=drivers.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.48
diff -u -p -r1.48 drivers.c
--- arch/parisc/kernel/drivers.c	11 Sep 2002 05:47:43 -0000	1.48
+++ arch/parisc/kernel/drivers.c	21 Nov 2002 05:10:51 -0000
@@ -9,6 +9,7 @@
  * Copyright (c) 1999 The Puffin Group
  * Copyright (c) 2001 Matthew Wilcox for Hewlett Packard
  * Copyright (c) 2001 Helge Deller <deller@gmx.de>
+ * Copyright (c) 2001,2002 Ryan Bradetich 
  * 
  * The file handles registering devices and drivers, then matching them.
  * It's the closest we get to a dating agency.
@@ -23,7 +24,6 @@
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/pdc.h>
-#include <asm/gsc.h>
 
 /* See comments in include/asm-parisc/pci.h */
 struct pci_dma_ops *hppa_dma_ops;
@@ -416,6 +416,7 @@ alloc_pa_dev(unsigned long hpa, struct h
 	dev->id.sversion = ((iodc_data[4] & 0x0f) << 16) |
 			(iodc_data[5] << 8) | iodc_data[6];
 	dev->hpa = hpa;
+
 	name = parisc_hardware_description(&dev->id);
 	if (name) {
 		strncpy(dev->name, name, sizeof(dev->name)-1);
@@ -461,30 +462,25 @@ int register_parisc_device(struct parisc
 #define BC_PORT_MASK 0x8
 #define BC_LOWER_PORT 0x8
 
+#define IO_STATUS 	offsetof(struct bc_module, io_status)
 
 #define BUS_CONVERTER(dev) \
         ((dev->id.hw_type == HPHW_IOA) || (dev->id.hw_type == HPHW_BCPORT))
 
 #define IS_LOWER_PORT(dev) \
-        ((gsc_readl(&((struct bc_module *)dev->hpa)->io_status) \
-                & BC_PORT_MASK) == BC_LOWER_PORT)
-
-#define READ_IO_IO_LOW(dev) \
-	(dev->id.hw_type == HPHW_IOA ? \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io_low) << 16 : \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io_low))
-
-#define READ_IO_IO_HIGH(dev) \
-	(dev->id.hw_type == HPHW_IOA ? \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io_high) << 16 : \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io_high))
+        ((__raw_readl(dev->hpa + IO_STATUS) & BC_PORT_MASK) == BC_LOWER_PORT)
 
+#define MAX_NATIVE_DEVICES 64
+#define NATIVE_DEVICE_OFFSET 0x1000
 
-static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high, 
-			    struct parisc_device *parent);
-
-#define FLEX_MASK (unsigned long)0xfffffffffffc0000
+#define FLEX_MASK 	(unsigned long)0xfffffffffffc0000
+#define IO_IO_LOW	offsetof(struct bc_module, io_io_low)
+#define IO_IO_HIGH	offsetof(struct bc_module, io_io_high)
+#define READ_IO_IO_LOW(dev)  (unsigned long)(signed int)__raw_readl(dev->hpa + IO_IO_LOW)
+#define READ_IO_IO_HIGH(dev) (unsigned long)(signed int)__raw_readl(dev->hpa + IO_IO_HIGH)
 
+static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high,
+                            struct parisc_device *parent);
 
 void walk_lower_bus(struct parisc_device *dev)
 {
@@ -493,15 +489,17 @@ void walk_lower_bus(struct parisc_device
 	if(!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
 		return;
 
-	io_io_low = ((unsigned long)(signed int)READ_IO_IO_LOW(dev) + ~FLEX_MASK) & FLEX_MASK;
-	io_io_high = ((unsigned long)(signed int)READ_IO_IO_HIGH(dev) + ~FLEX_MASK) & FLEX_MASK;
+	if(dev->id.hw_type == HPHW_IOA) {
+		io_io_low = (unsigned long)(signed int)(READ_IO_IO_LOW(dev) << 16);
+		io_io_high = io_io_low + MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET;
+	} else {
+		io_io_low = (READ_IO_IO_LOW(dev) + ~FLEX_MASK) & FLEX_MASK;
+		io_io_high = (READ_IO_IO_HIGH(dev)+ ~FLEX_MASK) & FLEX_MASK;
+	}
 
 	walk_native_bus(io_io_low, io_io_high, dev);
 }
 
-#define MAX_NATIVE_DEVICES 64
-#define NATIVE_DEVICE_OFFSET 0x1000
-
 /**
  * walk_native_bus -- Probe a bus for devices
  * @io_io_low: Base address of this bus.
@@ -515,7 +513,7 @@ void walk_lower_bus(struct parisc_device
  * keyboard ports).  This problem is not yet solved.
  */
 static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_high,
-			    struct parisc_device *parent)
+                            struct parisc_device *parent)
 {
 	int i, devices_found = 0;
 	unsigned long hpa = io_io_low;
@@ -523,7 +521,7 @@ static void walk_native_bus(unsigned lon
 
 	get_node_path(parent, &path);
 	do {
-		for (i = 0; i < MAX_NATIVE_DEVICES; i++, hpa += NATIVE_DEVICE_OFFSET) {
+		for(i = 0; i < MAX_NATIVE_DEVICES; i++, hpa += NATIVE_DEVICE_OFFSET) {
 			struct parisc_device *dev;
 
 			/* Was the device already added by Firmware? */
@@ -539,7 +537,7 @@ static void walk_native_bus(unsigned lon
 			}
 			walk_lower_bus(dev);
 		}
-	} while (!devices_found && hpa < io_io_high);
+	} while(!devices_found && hpa < io_io_high);
 }
 
 #define CENTRAL_BUS_ADDR (unsigned long) 0xfffffffffff80000
@@ -552,7 +550,7 @@ static void walk_native_bus(unsigned lon
  */
 void walk_central_bus(void)
 {
-	walk_native_bus(CENTRAL_BUS_ADDR, 
+	walk_native_bus(CENTRAL_BUS_ADDR,
 			CENTRAL_BUS_ADDR + (MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET),
 			&root);
 }

--=-0MeGBE4XA6qyeKAx+l2s--
