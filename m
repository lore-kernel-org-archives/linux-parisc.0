Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82b2487.cpe.net.cable.rogers.com [24.112.142.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 463AF482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 22:50:10 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id g0F5pFW05151
	for parisc-linux@lists.parisc-linux.org; Tue, 15 Jan 2002 00:51:15 -0500
Date: Tue, 15 Jan 2002 00:51:15 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020115005115.B4645@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with lasi_82596.c [CONFIG_IOMMU_CCIO]
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

PA,

Maybe I'm playing too quickly (recent CVS slurp, 2.4.17-pa10)

Compling kernel.

./include/asm-parisc/pci.h

    248 #ifdef CONFIG_IOMMU_CCIO
    249 struct parisc_device;
    250 struct ioc;
    251 void * ccio_get_iommu(struct parisc_device *dev);
    252 struct pci_dev * ccio_get_fake(struct parisc_device *dev);
    253 void ccio_extend_mmio_range(struct ioc *ioc);
    254 struct resource * ccio_find_parisc_resource(struct parisc_device *dev);
    255 #else /* !CONFIG_IOMMU_CCIO */
    256 #define ccio_get_iommu(dev) do { } while (0)
--> 257 #define ccio_get_fake(dev) do { } while (0)
    258 #define ccio_extend_mmio_range(ioc) do { } while (0)
    259 #define ccio_find_parisc_resource(x) &iomem_resource
    260 #endif /* !CONFIG_IOMMU_CCIO */

Which is included by lasi_82596.c there are some alternate
defines for the case where there is no IOMMU.

However in the lasi_82596 driver we see...

./drivers/net/lasi_82596.c

   1510 static int __devinit
   1511 lan_init_chip(struct parisc_device *dev)
   1512 {
   1513         struct  net_device *netdevice;
   1514         int     retval;
   1515 
   1516         if (num_drivers >= MAX_DRIVERS) {
   1517                 /* max count of possible i82596 drivers reached */
   1518                 return -ENODEV;
   1519         }
   1520 
-> 1521         fake_pci_dev = ccio_get_fake(dev);
   1522 
   1523         if (!dev->irq) {
   1524                 printk(KERN_ERR __FILE__ ": IRQ not found for i82596 at 0x%lx\n", dev->hpa);
   1525                 return -ENODEV;
   1526         }


Which on line 1521 clearly relies on ccio_get_fake(dev) to return
a value... and thus causing the kernel build to fail without any
IOMMU. Is this correct?

When the config option says:

CONFIG_IOMMU_CCIO:
The U2/UTurn is a bus converter with io mmu present in the Cxxx, D,
J, K, and R class machines.  Compiling this driver into the kernel will
not hurt anything, removing it will reduce your kernel by about 14k. 
If unsure, say Y.                                                                                     
Does a 715/50 have a U2/UTurn IOMMU or anything similar? 
(Currently perusing docs)

The kernel does compile with this option on... but it won't with
the option off. Any directions? Change the define to return some value?

c.
