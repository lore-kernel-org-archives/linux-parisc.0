Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 5 Jul 2003 23:57:54 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
Message-ID: <20030706055754.GA18646@dsl2.external.hp.com>
References: <20030627151546.GA30607@dsl2.external.hp.com> <3ED70CF10000AE2E@ocpmta2.freegates.net> <20030705230834.GB9682@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030705230834.GB9682@dsl2.external.hp.com>
Subject: [parisc-linux] IDE modules build prob
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

On Sat, Jul 05, 2003 at 05:08:34PM -0600, Grant Grundler wrote:
> 2) CONFIG_IDE=m leads to lots of unresolved symbols in IDE modules.
>    Willy just pointed me at
> 
>    	http://www.ussg.iu.edu/hypermail/linux/kernel/0307.0/0995.html
> 
>    which should solve this problem.

Alan Cox's "it's a start" patch has problems when applied
to our 2.4.21 tree (diff appended):
...
ld -r -o ide-core.o ide-iops.o ide-taskfile.o ide.o ide-lib.o ide-io.o
ide-default.o ide-proc.o setup-pci.o  ide-dma.o 
ide-default.o(.text.idedefault_init+0x0): In function `init_module':
: multiple definition of `init_module'
ide.o(.text.init_module+0x0): first defined here
make[2]: *** [ide-core.o] Error 1
make[2]: Leaving directory `/home/src/linux/drivers/ide'
...

grundler <507>fgrep module_init *c
...
ide-default.c:module_init(idedefault_init);
...
ide.c:module_init(ide_init);
...
grundler <508>

I gather each .o file is only allowed to have one module_init().
If that a deficiency in parisc build or something else?

thanks,
grant


Index: drivers/ide/Makefile
===================================================================
RCS file: /var/cvs/linux/drivers/ide/Makefile,v
retrieving revision 1.11
diff -u -p -r1.11 Makefile
--- drivers/ide/Makefile	26 Jun 2003 15:07:16 -0000	1.11
+++ drivers/ide/Makefile	6 Jul 2003 05:53:08 -0000
@@ -8,7 +8,6 @@
 # In the future, some of these should be built conditionally.
 #
 
-O_TARGET := idedriver.o
 
 export-objs := ide-iops.o ide-taskfile.o ide-proc.o ide.o ide-probe.o ide-dma.o ide-lib.o setup-pci.o ide-io.o ide-disk.o
 
@@ -29,24 +28,23 @@ endif
 
 # Core IDE code - must come before legacy
 
-obj-$(CONFIG_BLK_DEV_IDE)		+= ide-probe.o ide-geometry.o ide-iops.o ide-taskfile.o ide.o ide-lib.o ide-io.o ide-default.o
-obj-$(CONFIG_BLK_DEV_IDEDISK)		+= ide-disk.o
-obj-$(CONFIG_BLK_DEV_IDECD)		+= ide-cd.o
-obj-$(CONFIG_BLK_DEV_IDETAPE)		+= ide-tape.o
-obj-$(CONFIG_BLK_DEV_IDEFLOPPY)		+= ide-floppy.o
+ide-core-objs := ide-iops.o ide-taskfile.o ide.o ide-lib.o ide-io.o ide-default.o ide-proc.o
+ide-detect-objs := ide-probe.o ide-geometry.o
 
 ifeq ($(CONFIG_BLK_DEV_IDEPCI),y)
-obj-$(CONFIG_BLK_DEV_IDE)		+= setup-pci.o
+ide-core-objs += setup-pci.o 
 endif
 ifeq ($(CONFIG_BLK_DEV_IDEDMA_PCI),y)
-obj-$(CONFIG_BLK_DEV_IDE)		+= ide-dma.o
+ide-core-objs += ide-dma.o 
 endif
-obj-$(CONFIG_BLK_DEV_ISAPNP)		+= ide-pnp.o
-
 
-ifeq ($(CONFIG_BLK_DEV_IDE),y)
-obj-$(CONFIG_PROC_FS)			+= ide-proc.o
-endif
+# Initialisation order:
+# Core sets up
+# Legacy drivers may register a callback
+# Drivers are pre initialised
+# Probe inits the drivers and driver callbacks
+# Raid scans the devices 
+obj-$(CONFIG_BLK_DEV_IDE) += ide-core.o
 
 ifeq ($(CONFIG_BLK_DEV_IDE),y)
   obj-y		+= legacy/idedriver-legacy.o
@@ -58,10 +56,28 @@ else
   endif
 endif
 
+obj-$(CONFIG_BLK_DEV_ISAPNP) += ide-pnp.o
+
+obj-$(CONFIG_BLK_DEV_IDEDISK) += ide-disk.o
+obj-$(CONFIG_BLK_DEV_IDECD) += ide-cd.o
+obj-$(CONFIG_BLK_DEV_IDETAPE) += ide-tape.o
+obj-$(CONFIG_BLK_DEV_IDEFLOPPY) += ide-floppy.o
+
+obj-$(CONFIG_BLK_DEV_IDE) += ide-detect.o 
 
 ifeq ($(CONFIG_BLK_DEV_IDE),y)
 # RAID must be last of all
   obj-y		+= raid/idedriver-raid.o
 endif
 
+list-multi := ide-core.o ide-detect.o
+O_TARGET := idedriver.o
+
 include $(TOPDIR)/Rules.make
+
+ide-core.o: $(ide-core-objs)
+	$(LD) -r -o $@ $(ide-core-objs)
+
+ide-detect.o: $(ide-detect-objs)
+	$(LD) -r -o $@ $(ide-detect-objs)
+
