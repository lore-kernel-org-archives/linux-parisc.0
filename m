From: <gregkh@suse.de>
Subject: [parisc-linux] patch
	add-parisc_bus_type-probe-and-remove-methods.patch added to
	gregkh-2.6 tree
Date: Mon, 09 Jan 2006 22:00:06 -0800
Message-ID: <1EwCYA-2IA-00@press.kroah.org>
References: <20060105142951.13.10@flint.arm.linux.org.uk>
To: rmk@arm.linux.org.uk,
 greg@kroah.com,
 gregkh@suse.de,
 matthew@wil.cx,
 parisc-linux@parisc-linux.org,
 rmk+kernel@arm.linux.org.uk
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060105142951.13.10@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


This is a note to let you know that I've just added the patch titled

     Subject: [CFT 10/29] Add parisc_bus_type probe and remove methods

to my gregkh-2.6 tree.  Its filename is

     add-parisc_bus_type-probe-and-remove-methods.patch

This tree can be found at 
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/


>>From rmk+greg=kroah.com@arm.linux.org.uk Thu Jan  5 06:37:17 2006
From: Russell King <rmk@arm.linux.org.uk>
CC: Greg K-H <greg@kroah.com>, parisc <parisc-linux@parisc-linux.org>
Subject: [CFT 10/29] Add parisc_bus_type probe and remove methods
Date: Thu, 05 Jan 2006 14:34:38 +0000
Message-ID: <20060105142951.13.10@flint.arm.linux.org.uk>

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
Acked-by: Matthew Wilcox <matthew@wil.cx>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 arch/parisc/kernel/drivers.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- gregkh-2.6.orig/arch/parisc/kernel/drivers.c
+++ gregkh-2.6/arch/parisc/kernel/drivers.c
@@ -173,8 +173,6 @@ int register_parisc_driver(struct parisc
 	WARN_ON(driver->drv.probe != NULL);
 	WARN_ON(driver->drv.remove != NULL);
 
-	driver->drv.probe = parisc_driver_probe;
-	driver->drv.remove = parisc_driver_remove;
 	driver->drv.name = driver->name;
 
 	return driver_register(&driver->drv);
@@ -570,6 +568,8 @@ struct bus_type parisc_bus_type = {
 	.name = "parisc",
 	.match = parisc_generic_match,
 	.dev_attrs = parisc_device_attrs,
+	.probe = parisc_driver_probe,
+	.remove = parisc_driver_remove,
 };
 
 /**


Patches currently in gregkh-2.6 which might be from rmk@arm.linux.org.uk are

driver/add-bttv-sub-bus_type-probe-and-remove-methods.patch
driver/add-bus_type-probe-remove-shutdown-methods..patch
driver/add-ccwgroup_bus_type-probe-and-remove-methods.patch
driver/add-dio_bus_type-probe-and-remove-methods.patch
driver/add-ecard_bus_type-probe-remove-shutdown-methods.patch
driver/add-gameport-bus_type-probe-and-remove-methods.patch
driver/add-i2c_bus_type-probe-and-remove-methods.patch
driver/add-ide_bus_type-probe-and-remove-methods.patch
driver/add-locomo-bus_type-probe-remove-methods.patch
driver/add-logic-module-bus_type-probe-remove-methods.patch
driver/add-macio_bus_type-probe-and-remove-methods.patch
driver/add-mcp-bus_type-probe-and-remove-methods.patch
driver/add-mmc_bus_type-probe-and-remove-methods.patch
driver/add-ocp_bus_type-probe-and-remove-methods.patch
driver/add-of_platform_bus_type-probe-and-remove-methods.patch
driver/add-parisc_bus_type-probe-and-remove-methods.patch
driver/add-pci_bus_type-probe-and-remove-methods.patch
driver/add-pcmcia_bus_type-probe-and-remove-methods.patch
driver/add-pnp_bus_type-probe-and-remove-methods.patch
driver/add-pseudo-lld-bus_type-probe-and-remove-methods.patch
driver/add-rio_bus_type-probe-and-remove-methods.patch
driver/add-sa1111-bus_type-probe-remove-methods.patch
driver/add-serio-bus_type-probe-and-remove-methods.patch
driver/add-sh_bus_type-probe-and-remove-methods.patch
driver/add-superhyway_bus_type-probe-and-remove-methods.patch
driver/add-tiocx-bus_type-probe-remove-methods.patch
driver/add-usb_serial_bus_type-probe-and-remove-methods.patch
driver/add-vio_bus_type-probe-and-remove-methods.patch
driver/add-zorro_bus_type-probe-and-remove-methods.patch
driver/remove-usb-gadget-generic-driver-methods.patch
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
