From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Sun, 31 Jul 2005 20:32:29 +0100
Message-ID: <20050731193229.GE5500@levanta.com>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731090005.GD5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

With the following patch I can boot my C360, although there is not
ps/2 (obviously, given the second part of the diff):

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/drivers.c,v
retrieving revision 1.25
diff -u -r1.25 drivers.c
--- arch/parisc/kernel/drivers.c        26 Jul 2005 23:55:47 -0000      1.25
+++ arch/parisc/kernel/drivers.c        31 Jul 2005 19:22:21 -0000
@@ -448,11 +448,9 @@
        struct parisc_device * pdev = to_parisc_device(dev);
        struct match_id_data * d = data;
 
-       if (check_dev(pdev)) {
-               if (pdev->hw_path == d->id) {
-                       d->dev = pdev;
-                       return 1;
-               }
+       if (pdev->hw_path == d->id) {
+               d->dev = pdev;
+               return 1;
        }
        return 0;
 }
Index: drivers/input/serio/gscps2.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/serio/gscps2.c,v
retrieving revision 1.16
diff -u -r1.16 gscps2.c
--- drivers/input/serio/gscps2.c        18 Mar 2005 13:16:54 -0000      1.16
+++ drivers/input/serio/gscps2.c        31 Jul 2005 19:22:29 -0000
@@ -334,7 +334,7 @@
        unsigned long hpa = dev->hpa;
        int ret;
 
-       if (!dev->irq)
+       //if (!dev->irq)
                return -ENODEV;
 
        /* Offset for DINO PS/2. Works with LASI even */


I think the drivers.c part is probably reasonable, although it might be
masking some underlying problem with device discovery.  If I enable the
gscps2 driver the system hangs, possibly with an interrupt storm.

I noticed the 2.6.13 kernel is using completely different IRQ allocations
from 2.6.8 (cat /proc/interrupts); is this expected?


2.6.8

           CPU00
 32:       9151      PARISC-CPU  timer
 33:          0      PARISC-CPU  IPI
 34:        512      PARISC-CPU  lasi
 35:       2053      PARISC-CPU  Dino [8/0]
 36:          0      PARISC-CPU  Cujo
 69:         31            Lasi  GSC PS2 keyboard, GSC PS2 mouse
 86:         68            Lasi  lasi700
 90:        413            Lasi  serial
 96:         30      Dino [8/0]  eth0
 99:       2023      Dino [8/0]  sym53c8xx


2.6.13

 16:       2020        GSC-ASIC  serial
 17:         54        GSC-ASIC  lasi700
 22:       2532         GSC-PCI  sym53c8xx
 23:         36         GSC-PCI  eth0
 64:      94680             CPU  timer
 65:          0             CPU  IPI
 66:       2074             CPU  lasi
 67:       2566             CPU  Dino
 68:          0             CPU  Cujo


When I enable gscps2 it is trying to use IRQ 20.

Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
