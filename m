Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id EBF18482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:48:39 -0600 (MDT)
Date: Fri, 21 Sep 2001 10:48:38 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010921104838.A2049@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] [PATCH] Additional Address cleanup
List-ID: <linux-parisc.vger.kernel.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello parisc-linux hackers,

I have a small patch which allows the additional addresses to
be allocated dynamically instead of a static array.  The patch
itself is pretty simple, but I made one simplification that
I wanted to run by the experts before committing the patch.

The simplification I made was to remove the HPA from index
0 of the addr[] in the parisc_device.  I feel this is redundant
since the device already records the HPA with the hpa field.
By not including the HPA, it also saves a kmalloc on every
parisc device to store the HPA, and an additional kfree/kmalloc
when the device actually has additional addresses to store.

Currently, the only device that is using the additional
addresses is the STI driver, and it blindly reads from
addr[1] for the location of a graphics card.  Nothing else
besides the adding/printing of the additional addresses
every uses the addr field in the parisc device.

So can I safely remove the HPA from addr[0] as I've done with
the attached patch?  Or will I break future device support
if the HPA is not present?

Thanks,

- Ryan

P.S. I have tested this patch on C200+ with serial console,
712/100 with STI console, and compiled it at 64-bit.

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="addr.patch"

? addr.diff
? arch/parisc/kernel/Makefile.iotree
? arch/parisc/kernel/drivers.c.iotree
? arch/parisc/kernel/inventory.c.iotree
? arch/parisc/kernel/iotree.c
Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.24
diff -u -p -r1.24 drivers.c
--- arch/parisc/kernel/drivers.c	2001/09/18 01:14:18	1.24
+++ arch/parisc/kernel/drivers.c	2001/09/21 16:21:46
@@ -174,30 +174,6 @@ int get_num_pa_dev(void)
 	return i;
 }
 
-/**
- * add_pa_dev_addr - Add an additional address to the list of addresses of a HP device
- * @hp_device: the PA-RISC device structure
- * @addr: the address to be added
- */
-int add_pa_dev_addr(struct parisc_device *hp_device, unsigned long addr)
-{
-	if (!hp_device || !addr)
-	    return 0;
-
-	if (hp_device->num_addrs >= MAX_ADD_ADDRS) {
-	    printk(KERN_ERR "%s: Too many additional addresses. "
-			"Increase the value of MAX_ADD_ADDRS in harware.h !\n",
-			__FUNCTION__ );
-	    return 0;
-	}
-
-	hp_device->addr[hp_device->num_addrs] = addr;
-	hp_device->num_addrs++;
-
-	return hp_device->num_addrs;
-}
-
-
 struct parisc_device *alloc_pa_dev(unsigned long hpa)
 {
 	int i, status;
@@ -243,13 +219,9 @@ struct parisc_device *alloc_pa_dev(unsig
 		strncpy(dev->name, name, sizeof(dev->name)-1);
 	}
 
-	/* add the hpa of this module as the first additional address */
-	add_pa_dev_addr(dev, hpa);
-
 	num_devices++;
 
 	write_unlock(&pa_lock);
-
 	return dev;
 }
 
Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/inventory.c,v
retrieving revision 1.35
diff -u -p -r1.35 inventory.c
--- arch/parisc/kernel/inventory.c	2001/09/18 16:12:08	1.35
+++ arch/parisc/kernel/inventory.c	2001/09/21 16:21:46
@@ -15,6 +15,8 @@
 
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/slab.h>
 #include <linux/mm.h>
 #include <asm/hardware.h>
 #include <asm/io.h>
@@ -30,7 +32,7 @@
 
 int pdc_type = PDC_TYPE_ILLEGAL;
 
-void setup_pdc(void)
+void __init setup_pdc(void)
 {
 	long status;
 	unsigned int bus_id;
@@ -108,9 +110,9 @@ void setup_pdc(void)
 
 #define PDC_PAGE_ADJ_SHIFT (PAGE_SHIFT - 12) /* pdc pages are always 4k */
 
-static void set_pmem_entry(physmem_range_t *pmem_ptr,
-			   unsigned long start,
-			   unsigned long pages4k)
+static void __init
+set_pmem_entry(physmem_range_t *pmem_ptr, unsigned long start,
+	       unsigned long pages4k)
 {
 	/* Rather than aligning and potentially throwing away
 	 * memory, we'll assume that any ranges are already
@@ -129,7 +131,7 @@ static void set_pmem_entry(physmem_range
 	pmem_ptr->pages = (pages4k >> PDC_PAGE_ADJ_SHIFT);
 }
 
-void do_pagezero_memconfig(void)
+void __init do_pagezero_memconfig(void)
 {
 	unsigned long npages;
 
@@ -168,7 +170,8 @@ void do_pagezero_memconfig(void)
 **
 */
 
-static int pat_query_module(ulong pcell_loc, ulong mod_index)
+static int __init 
+pat_query_module(ulong pcell_loc, ulong mod_index)
 {
 	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
 	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;
@@ -272,7 +275,7 @@ static int pat_query_module(ulong pcell_
 
 #define PAT_MAX_RANGES (4 * MAX_PHYSMEM_RANGES)
 
-static void do_pat_memconfig(void)
+static void __init do_pat_memconfig(void)
 {
 	unsigned long actual_len;
 	struct pdc_pat_pd_addr_map_entry mem_table[PAT_MAX_RANGES+1];
@@ -338,7 +341,7 @@ static void do_pat_memconfig(void)
 	}
 }
 
-static int do_pat_inventory(void)
+static int __init do_pat_inventory(void)
 {
 	int status;
 	ulong mod_index = 0;
@@ -367,7 +370,7 @@ static int do_pat_inventory(void)
 
 /* We only look for extended memory ranges on a 64 bit capable box */
 
-static void do_system_map_memconfig(void)
+static void __init do_system_map_memconfig(void)
 {
 	struct pdc_memory_table_raddr r_addr;
 	struct pdc_memory_table mem_table[MAX_PHYSMEM_RANGES];
@@ -416,8 +419,9 @@ static void do_system_map_memconfig(void
 
 /* All of the older legacy box (32 bit only) code goes here */
 
-static struct parisc_device *legacy_create_device(struct pdc_memory_map *r_addr,
-		struct pdc_module_path *module_path)
+static struct parisc_device * __init 
+legacy_create_device(struct pdc_memory_map *r_addr,
+		     struct pdc_module_path *module_path)
 {
 	struct parisc_device *dev;
 	int status = pdc_mem_map_hpa(r_addr, module_path);
@@ -441,7 +445,7 @@ static struct parisc_device *legacy_crea
  * sub-devices which are discovered by setting bc[5] to 0 and bc[4] to the
  * module, then trying all possible functions.
  */
-int do_legacy_inventory(void)
+int __init do_legacy_inventory(void)
 {
 	int mod, num = 0;
 	for (mod = 0; mod < 16; mod++) {
@@ -509,13 +513,56 @@ int do_native_bus_walk(unsigned long hpa
 	return num;
 }
 
-static int do_system_map_inventory(void)
+/**
+ * add_system_map_addresses - Add additional addresses to the parisc device.
+ * @dev: The parisce device.
+ * @num_addrs: Then number of addresses to add;
+ * @module_instance: The system_map module instance.
+ *
+ * This function adds any additional addresses reported by the system_map
+ * firmware to the parisc device.
+ */
+static __init void
+add_system_map_addresses(struct parisc_device *dev, int num_addrs, 
+			 int module_instance)
+{
+	int i;
+	long status;
+	struct pdc_system_map_addr_info addr_result;
+
+	dev->addr = kmalloc(sizeof(unsigned long), num_addrs);
+	if(!dev->addr) {
+		printk(KERN_ERR "%s %s(): memory allocation failure\n",
+		       __FILE__, __FUNCTION__);
+		return;
+	}
+
+	for(i = 0; i < num_addrs; ++i) {
+		status = pdc_system_map_find_addrs(&addr_result, 
+						   module_instance, i);
+		if(PDC_RET_OK == status) {
+			dev->addr[dev->num_addrs] = (unsigned long)addr_result.mod_addr;
+			dev->num_addrs++;
+		} else {
+			printk(KERN_WARNING 
+			       "Bad PDC_FIND_ADDRESS status return (%ld) for index %d\n",
+			       status, i);
+		}
+	}
+}
+
+/**
+ * do_system_map_inventory - Retrieve firmware devices via SYSTEM_MAP.
+ *
+ * This function attempts to retrieve and register all the devices firmware
+ * knows about via the SYSTEM_MAP PDC call.
+ */
+static int __init do_system_map_inventory(void)
 {
-	int i, j, num;
+	int i, num;
 	long status;
 	struct parisc_device *dev;
 	struct pdc_system_map_mod_info module_result;
-	struct pdc_system_map_addr_info addr_result;
 	struct pdc_module_path module_path;
 
 	/* So the idea here is to simply try one SYSTEM_MAP call.  If 
@@ -528,41 +575,31 @@ static int do_system_map_inventory(void)
 	num = 0;
 	for (i = 0; status != PDC_RET_NE_PROC && status != PDC_RET_NE_MOD; ++i) {
 
-		status = pdc_system_map_find_mods(&module_result, &module_path, i);
+		status = pdc_system_map_find_mods(&module_result, 
+						  &module_path, i);
 		if (status != PDC_RET_OK)
 			continue;
 		
-		dev = alloc_pa_dev((unsigned long) module_result.mod_addr);
-		if (!dev)
+		dev = alloc_pa_dev((unsigned long)module_result.mod_addr);
+		if(!dev)
 			continue;
 		
 		register_parisc_device(dev);
 		++num;
 
 		/* if available, get the additional addresses for a module */
-		if (!module_result.add_addrs)
+		if(!module_result.add_addrs)
 			continue;
 
-		for (j = 1; j <= module_result.add_addrs; ++j) {
-			status = pdc_system_map_find_addrs(&addr_result, i, j);
-			if (status == PDC_RET_OK) {
-				add_pa_dev_addr(dev, (unsigned long)
-						addr_result.mod_addr);
-			} else {
-				printk(KERN_WARNING 
-					"Bad PDC_FIND_ADDRESS status return (%ld) for index %d\n",
-					status, j);
-				status = PDC_RET_OK;	/* reset status for outer loop */
-			}
-		}
-	} /* end of main loop */
+		add_system_map_addresses(dev, module_result.add_addrs, i);
+	}
 
 	/* Walk the system bus */
 	num += do_native_bus_walk(FPA);
 	return num;
 }
 
-void do_memory_inventory(void)
+void __init do_memory_inventory(void)
 {
 	switch (pdc_type) {
 
@@ -589,7 +626,7 @@ void do_memory_inventory(void)
 	}
 }
 
-void do_device_inventory(void)
+void __init do_device_inventory(void)
 {
 	int num;
 
Index: drivers/video/sti/sticore.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/sti/sticore.c,v
retrieving revision 1.22
diff -u -p -r1.22 sticore.c
--- drivers/video/sti/sticore.c	2001/08/22 13:23:47	1.22
+++ drivers/video/sti/sticore.c	2001/09/21 16:21:51
@@ -833,7 +833,11 @@ out_err:
  */
 static int __init sticore_pa_init(struct parisc_device *dev)
 {
-	unsigned long rom = dev->addr[1];
+	unsigned long rom;
+
+	if(dev->num_addrs) {
+		rom = dev->addr[0];
+	}
 	if (!rom) {
 		rom = PAGE0->proc_sti;
 	}
Index: include/asm-parisc/hardware.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/hardware.h,v
retrieving revision 1.21
diff -u -p -r1.21 hardware.h
--- include/asm-parisc/hardware.h	2001/09/18 01:14:19	1.21
+++ include/asm-parisc/hardware.h	2001/09/21 16:21:52
@@ -21,9 +21,6 @@ struct hp_hardware {
 	const char	name[80];	/* The hardware description */
 };
 
-
-#define MAX_ADD_ADDRS	5	/* 5 additional address ranges should be sufficient */
-
 struct parisc_device {
 	unsigned long	hpa;		/* Hard Physical Address */
 	struct parisc_device_id id;
@@ -33,8 +30,8 @@ struct parisc_device {
 	struct parisc_driver *driver;	/* Driver for this device */
 	char name[80];			/* The hardware description */
 
-	unsigned int	num_addrs;	/* some devices have additional address ranges, */
-	unsigned long	addr[MAX_ADD_ADDRS]; /* which will be stored here */
+	unsigned int	num_addrs;	/* some devices have additional address ranges. */
+	unsigned long	*addr;          /* which will be stored here */
  
 #ifdef __LP64__
 	/* parms for pdc_pat_cell_module() call */
@@ -100,7 +97,6 @@ extern enum cpu_type parisc_get_cpu_type
 /* drivers.c: */
 extern struct parisc_device *alloc_pa_dev(unsigned long hpa);
 extern int register_parisc_device(struct parisc_device *dev);
-extern int add_pa_dev_addr(struct parisc_device *dev, unsigned long addr);
 extern int get_num_pa_dev(void);
 extern void print_pa_devices(int start_index, int num_indexes);
 extern int register_parisc_driver(struct parisc_driver *driver);

--Nq2Wo0NMKNjxTN9z--
