Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1D10482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Nov 2002 22:18:28 -0700 (MST)
Subject: [Fwd: Re: [parisc-linux] long bus walk times on boot up]  (with
	patch this time)
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>,
	Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="=-gsK4+BL/NrmmTTAzb2GP"
Date: 20 Nov 2002 22:18:15 -0700
Message-Id: <1037855895.5976.14.camel@beavis>
Mime-Version: 1.0
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

--=-gsK4+BL/NrmmTTAzb2GP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

-----Forwarded Message-----

> From: Ryan Bradetich <rbradetich@uswest.net>
> To: Matthew Wilcox <willy@debian.org>, Derek Engelhaupt <derekengelhaupt@rocketmail.com>
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] long bus walk times on boot up
> Date: 20 Nov 2002 22:16:31 -0700
> 
> Derek or anyone else experience this problem,
> 
> Feel free to test out this patch.  This impliments Willy's idea and
> seems to work find on linux-2.5.  I can not test this against cvs head
> on linux-2.4 since my C200 HPMCs in cpu_idle().
> 
> I do not have time to track down the linux-2.4 boot issue right now, but
> I will commit this patch once I get C200 to boot cvs head and if
> feedback from the patch is good.
> 
> Thanks,
> 
> - Ryan
> 
> On Wed, 2002-11-20 at 08:40, Matthew Wilcox wrote:
> > On Wed, Nov 20, 2002 at 07:30:41AM -0800, Derek Engelhaupt wrote:
> > > 
> > > Well, my C180 is gone to a new home and my C360 is well on it's
> > > way, but I had a question about the new netinstall ISO's out there.
> > > I had been running the 2.4.19-pa19-20020922-netinst.iso on the C180 and
> > > it didn't have the bus walk issues that cause the long boot up times.
> > > I really would like to avoid having my C360 take 20+ minutes to boot up.
> > > Are there any real huge issues with running this older kernal on my C360
> > > or are there any immediate plans to fix the issues of having to walk
> > > the entire bus?  I'm still a little weary of compiling my own kernal
> > > (only done this through SAM on HP-UX), but if I was forced to I could
> > > probably figure it out using the HOWTO's.  Is there a kernal parameter
> > > I could tweak that could resolve the long bus walk times?  Or am I just
> > > totally off base?  :)
> > 
> > 2.4.19-pa19 should run fine on a C360.  the long bus walk problem
> > isn't yet fixed in the 2.4 CVS (but should be fixed in the 2.5 tree).
> > this isn't a ploy to persuade more people to use 2.5; it's just ryan
> > didn't get around to it yet ;-)
> > 
> > -- 
> > Revolutions do not require corporate support.
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> 


--=-gsK4+BL/NrmmTTAzb2GP
Content-Disposition: attachment; filename=drivers.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=drivers.diff; charset=ISO-8859-1

Index: arch/parisc/kernel/drivers.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.48
diff -u -p -r1.48 drivers.c
--- arch/parisc/kernel/drivers.c	11 Sep 2002 05:47:43 -0000	1.48
+++ arch/parisc/kernel/drivers.c	21 Nov 2002 05:10:51 -0000
@@ -9,6 +9,7 @@
  * Copyright (c) 1999 The Puffin Group
  * Copyright (c) 2001 Matthew Wilcox for Hewlett Packard
  * Copyright (c) 2001 Helge Deller <deller@gmx.de>
+ * Copyright (c) 2001,2002 Ryan Bradetich=20
  *=20
  * The file handles registering devices and drivers, then matching them.
  * It's the closest we get to a dating agency.
@@ -23,7 +24,6 @@
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/pdc.h>
-#include <asm/gsc.h>
=20
 /* See comments in include/asm-parisc/pci.h */
 struct pci_dma_ops *hppa_dma_ops;
@@ -416,6 +416,7 @@ alloc_pa_dev(unsigned long hpa, struct h
 	dev->id.sversion =3D ((iodc_data[4] & 0x0f) << 16) |
 			(iodc_data[5] << 8) | iodc_data[6];
 	dev->hpa =3D hpa;
+
 	name =3D parisc_hardware_description(&dev->id);
 	if (name) {
 		strncpy(dev->name, name, sizeof(dev->name)-1);
@@ -461,30 +462,25 @@ int register_parisc_device(struct parisc
 #define BC_PORT_MASK 0x8
 #define BC_LOWER_PORT 0x8
=20
+#define IO_STATUS 	offsetof(struct bc_module, io_status)
=20
 #define BUS_CONVERTER(dev) \
         ((dev->id.hw_type =3D=3D HPHW_IOA) || (dev->id.hw_type =3D=3D HPHW=
_BCPORT))
=20
 #define IS_LOWER_PORT(dev) \
-        ((gsc_readl(&((struct bc_module *)dev->hpa)->io_status) \
-                & BC_PORT_MASK) =3D=3D BC_LOWER_PORT)
-
-#define READ_IO_IO_LOW(dev) \
-	(dev->id.hw_type =3D=3D HPHW_IOA ? \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io=
_low) << 16 : \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io=
_low))
-
-#define READ_IO_IO_HIGH(dev) \
-	(dev->id.hw_type =3D=3D HPHW_IOA ? \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io=
_high) << 16 : \
-	        __raw_readl((unsigned long)&((struct bc_module *)dev->hpa)->io_io=
_high))
+        ((__raw_readl(dev->hpa + IO_STATUS) & BC_PORT_MASK) =3D=3D BC_LOWE=
R_PORT)
=20
+#define MAX_NATIVE_DEVICES 64
+#define NATIVE_DEVICE_OFFSET 0x1000
=20
-static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_h=
igh,=20
-			    struct parisc_device *parent);
-
-#define FLEX_MASK (unsigned long)0xfffffffffffc0000
+#define FLEX_MASK 	(unsigned long)0xfffffffffffc0000
+#define IO_IO_LOW	offsetof(struct bc_module, io_io_low)
+#define IO_IO_HIGH	offsetof(struct bc_module, io_io_high)
+#define READ_IO_IO_LOW(dev)  (unsigned long)(signed int)__raw_readl(dev->h=
pa + IO_IO_LOW)
+#define READ_IO_IO_HIGH(dev) (unsigned long)(signed int)__raw_readl(dev->h=
pa + IO_IO_HIGH)
=20
+static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_h=
igh,
+                            struct parisc_device *parent);
=20
 void walk_lower_bus(struct parisc_device *dev)
 {
@@ -493,15 +489,17 @@ void walk_lower_bus(struct parisc_device
 	if(!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
 		return;
=20
-	io_io_low =3D ((unsigned long)(signed int)READ_IO_IO_LOW(dev) + ~FLEX_MAS=
K) & FLEX_MASK;
-	io_io_high =3D ((unsigned long)(signed int)READ_IO_IO_HIGH(dev) + ~FLEX_M=
ASK) & FLEX_MASK;
+	if(dev->id.hw_type =3D=3D HPHW_IOA) {
+		io_io_low =3D (unsigned long)(signed int)(READ_IO_IO_LOW(dev) << 16);
+		io_io_high =3D io_io_low + MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET;
+	} else {
+		io_io_low =3D (READ_IO_IO_LOW(dev) + ~FLEX_MASK) & FLEX_MASK;
+		io_io_high =3D (READ_IO_IO_HIGH(dev)+ ~FLEX_MASK) & FLEX_MASK;
+	}
=20
 	walk_native_bus(io_io_low, io_io_high, dev);
 }
=20
-#define MAX_NATIVE_DEVICES 64
-#define NATIVE_DEVICE_OFFSET 0x1000
-
 /**
  * walk_native_bus -- Probe a bus for devices
  * @io_io_low: Base address of this bus.
@@ -515,7 +513,7 @@ void walk_lower_bus(struct parisc_device
  * keyboard ports).  This problem is not yet solved.
  */
 static void walk_native_bus(unsigned long io_io_low, unsigned long io_io_h=
igh,
-			    struct parisc_device *parent)
+                            struct parisc_device *parent)
 {
 	int i, devices_found =3D 0;
 	unsigned long hpa =3D io_io_low;
@@ -523,7 +521,7 @@ static void walk_native_bus(unsigned lon
=20
 	get_node_path(parent, &path);
 	do {
-		for (i =3D 0; i < MAX_NATIVE_DEVICES; i++, hpa +=3D NATIVE_DEVICE_OFFSET=
) {
+		for(i =3D 0; i < MAX_NATIVE_DEVICES; i++, hpa +=3D NATIVE_DEVICE_OFFSET)=
 {
 			struct parisc_device *dev;
=20
 			/* Was the device already added by Firmware? */
@@ -539,7 +537,7 @@ static void walk_native_bus(unsigned lon
 			}
 			walk_lower_bus(dev);
 		}
-	} while (!devices_found && hpa < io_io_high);
+	} while(!devices_found && hpa < io_io_high);
 }
=20
 #define CENTRAL_BUS_ADDR (unsigned long) 0xfffffffffff80000
@@ -552,7 +550,7 @@ static void walk_native_bus(unsigned lon
  */
 void walk_central_bus(void)
 {
-	walk_native_bus(CENTRAL_BUS_ADDR,=20
+	walk_native_bus(CENTRAL_BUS_ADDR,
 			CENTRAL_BUS_ADDR + (MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET),
 			&root);
 }

--=-gsK4+BL/NrmmTTAzb2GP--
