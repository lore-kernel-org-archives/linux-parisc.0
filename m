Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11933
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 16:48:28 -0700
Sender: debackex@esiee.fr
Message-ID: <3A64DEA8.10F76F58@esiee.net>
Date: Wed, 17 Jan 2001 00:52:08 +0100
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: rbradetich@uswest.net
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: multipart/mixed;
 boundary="------------CB9673829DD973DAA3527F9A"
Subject: [parisc-linux] PDC Additional Addresses patch
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------CB9673829DD973DAA3527F9A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

Here is a patch to make linux store additionnal addresses in struct
hp_device, so that drivers can access it cleanly.




Xavier Debacker
ESIEE Team
http://www.esiee.fr/puffin

--------------CB9673829DD973DAA3527F9A
Content-Type: text/plain; charset=us-ascii;
 name="addl_addr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="addl_addr.patch"

diff -ru linux-orig/arch/parisc/kernel/inventory.c linux/arch/parisc/kernel/inventory.c
--- linux-orig/arch/parisc/kernel/inventory.c	Sun Dec 24 11:07:24 2000
+++ linux/arch/parisc/kernel/inventory.c	Sun Jan 14 03:55:20 2001
@@ -184,6 +184,7 @@
 	long status;
 	int num = 0;
 	long mod_index;
+	struct hp_device * d;
 
 	/* So the idea here is to simply try one SYSTEM_MAP call.  If 
 	   that one works, great, otherwise do it another way */
@@ -202,22 +203,29 @@
 							  mod_index);
 			if (status == PDC_RET_OK) {
 				num++;
-				register_module(module_result.mod_addr);
-#if 0
-
+				d = register_module(module_result.mod_addr);
+ /* #if 0 */
+				
 				/*
 				 * This code is here to show how
 				 * to get the additional address ranges
 				 * for a module.
 				 */
+				d->addl_addr[0] = module_result.mod_addr; /* copy of d->hpa */
 
 				if (module_result.add_addrs) {
 					long addr_index;
+					long max_addr_index;
 
 					printk("Module at %p has %d additional range(s):\n",
 						module_result.mod_addr,
 						module_result.add_addrs);
 
+					if (module_result.add_addrs >= MAX_HPDEV_ADDRS) {
+						printk("MAX_HPDEV_ADDRS is too low, please edit linux/include/asm/hardware.h, and set this value to %d\n", module_result.add_addrs + 1);
+						max_addr_index = MAX_HPDEV_ADDRS - 1;
+					} else  max_addr_index = module_result.add_addrs;	
+
 					for (addr_index = 1;
 						addr_index <= module_result.add_addrs;
 						addr_index++) {
@@ -231,6 +239,7 @@
 						    printk("index %d address %p\n",
 							    addr_index,
 							    addr_result.mod_addr);
+						    d->addl_addr[addr_index] = addr_result.mod_addr;
 						}
 						else {
 						    printk("Bad PDC_FIND_ADDRESS status return (%d) for index %d\n",status,addr_index);
@@ -238,7 +247,7 @@
 						}
 					}
 				}
-#endif
+/* #endif */
 			}
 		}
 	}
diff -ru linux-orig/include/asm-parisc/hardware.h linux/include/asm-parisc/hardware.h
--- linux-orig/include/asm-parisc/hardware.h	Wed Nov 15 23:32:07 2000
+++ linux/include/asm-parisc/hardware.h	Sun Jan 14 03:56:47 2001
@@ -9,6 +9,8 @@
 	char *name; 
 };
 
+#define MAX_HPDEV_ADDRS 4
+
 struct hp_device {
 	unsigned short hw_type:5;	/* HPHW_xxx */
 	unsigned short hversion;	/* HP-UX uses  hv_model:12 */
@@ -20,6 +22,8 @@
                                             reference */
 	unsigned int managed; /* this is if the device has a driver for it */
 	void * hpa;
+	/* infos returned by pdc calls (-------) */
+	unsigned long  addl_addr[MAX_HPDEV_ADDRS];
 
 #ifdef __LP64__
 	/* parms for pdc_pat_cell_module() call */
@@ -30,6 +34,7 @@
 	unsigned long  mod_info;	/* PAT specific - Misc Module info */
 	unsigned long  pmod_loc;	/* physical Module location */
 	unsigned long  mod_path;	/* Module HW path */
+
 #endif
 };

--------------CB9673829DD973DAA3527F9A--
