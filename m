Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id C321F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Oct 2001 17:00:00 -0600 (MDT)
Date: Fri, 19 Oct 2001 16:59:26 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011019165926.A31233@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] [PATCH] The long awaited iotree patch for System Map Firmware
List-ID: <linux-parisc.vger.kernel.org>

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello parisc-linux hackers,

Here is the patch for the I/O Tree for the System Map firmware
boxes.  I believe the I/O tree for legacy firmware is already in
the cvs repository, and I need to get access to a PAT firmware
box to finish the iotree for PAT firmware.


Please test this patch out and report any problems.  I would
like to get this patch committed to the repository so we can
finally use the multiple IOMMUs present in the ccio boxes,
etc.


I have tested this patch on C200 and K460.

Thanks,

- Ryan

P.S. Thanks to willy for all his help, reviews and general
rewrite to put this patch in its current state!

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="iotree-rbrad-willy.patch"

Index: arch/parisc/kernel/ccio-dma.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/ccio-dma.c,v
retrieving revision 1.42
diff -u -p -r1.42 ccio-dma.c
--- arch/parisc/kernel/ccio-dma.c	2001/10/04 16:30:43	1.42
+++ arch/parisc/kernel/ccio-dma.c	2001/10/19 22:39:04
@@ -208,6 +208,8 @@ static int ioc_count;
 #define MKIOVA(iovp,offset) (dma_addr_t)((long)iovp | (long)offset)
 #define ROUNDUP(x,y) ((x + ((y)-1)) & ~((y)-1))
 
+
+#define GET_IOC(dev) (ioc_list)
 /*
 ** Don't worry about the 150% average search length on a miss.
 ** If the search wraps around, and passes the res_hint, it will
@@ -638,7 +640,7 @@ static dma_addr_t 
 ccio_map_single(struct pci_dev *dev, void *addr, size_t size, int direction)
 {
 	int idx;
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 	unsigned long flags;
 	dma_addr_t iovp;
 	dma_addr_t offset;
@@ -702,7 +704,7 @@ static void 
 ccio_unmap_single(struct pci_dev *dev, dma_addr_t iova, size_t size, 
 		  int direction)
 {
-	struct ioc *ioc = ioc_list; /* XXX: Use appropriate IOC for this dev */
+	struct ioc *ioc = GET_IOC(dev);
 	unsigned long flags; 
 	dma_addr_t offset = iova & ~IOVP_MASK;
 	
@@ -960,7 +962,7 @@ static int
 ccio_map_sg(struct pci_dev *dev, struct scatterlist *sglist, int nents, 
 	    int direction)
 {
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 	int coalesced, filled = 0;
 	unsigned long flags;
 	unsigned long hint = hint_lookup[direction];
@@ -1023,8 +1025,7 @@ static void 
 ccio_unmap_sg(struct pci_dev *dev, struct scatterlist *sglist, int nents, 
 	      int direction)
 {
-	/* FIXME : see Multi-IOC below */
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 
 	DBG_RUN_SG("%s() START %d entries,  %p,%x\n",
 		__FUNCTION__, nents, sglist->address, sglist->length);
@@ -1062,7 +1063,7 @@ static struct pci_dma_ops ccio_ops = {
 static int 
 ccio_proc_info(char *buf, char **start, off_t offset, int len)
 {
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 
 	buf[0] = '\0';
 	while (ioc != NULL) {
@@ -1123,7 +1124,7 @@ ccio_proc_info(char *buf, char **start, 
 static int
 ccio_resource_map(char *buf, char **start, off_t offset, int len)
 {
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 
 	buf[0] = '\0';
 	while (ioc != NULL) {
@@ -1153,7 +1154,7 @@ ccio_resource_map(char *buf, char **star
 void ccio_cujo20_fixup(struct parisc_device *dev, u32 iovp)
 {
 	unsigned int idx;
-	struct ioc *ioc = ioc_list;
+	struct ioc *ioc = GET_IOC(dev);
 	u8 *res_ptr;
 
 #ifdef CONFIG_PROC_FS
@@ -1336,7 +1337,7 @@ int do_native_bus_walk(unsigned long io_
  */
 static int ccio_probe(struct parisc_device *dev)
 {
-	int i, start_index, num_devices;
+	int i;
 	unsigned long io_io_low;
 	struct ioc *ioc, **ioc_p = &ioc_list;
 
@@ -1379,9 +1380,8 @@ static int ccio_probe(struct parisc_devi
 	io_io_low |= 0xffffffff00000000UL;
 #endif
 	printk(KERN_INFO "io_io_low: 0x%lx\n", io_io_low);
-	start_index = get_num_pa_dev();
-	num_devices = do_native_bus_walk(io_io_low);
-	print_pa_devices(start_index, num_devices);
+	walk_native_bus(io_io_low, dev);
+	print_subdevices(dev);
 	return 0;
 }
 
Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.28
diff -u -p -r1.28 drivers.c
--- arch/parisc/kernel/drivers.c	2001/10/05 17:02:32	1.28
+++ arch/parisc/kernel/drivers.c	2001/10/19 22:39:04
@@ -23,19 +23,47 @@
 #include <asm/io.h>
 #include <asm/pdc.h>
 
+static struct parisc_driver *pa_drivers;
+static struct parisc_device root;
 
-/* 
- * I'm assuming there'll never be 32 devices.  We should probably make
- * this more flexible.  
+/* This lock protects the pa_drivers list _only_ since all parisc_devices
+ * are registered before smp_init() is called.  If you wish to add devices
+ * after that, this muct be serialised somehow.  I recommend a semaphore
+ * rather than a spinlock since driver ->probe functions are allowed to
+ * sleep (for example when allocating memory).
  */
+static spinlock_t pa_lock = SPIN_LOCK_UNLOCKED;
 
-#define MAX_DEVICES 32
+#define for_each_padev(dev) \
+	for (dev = root.child; dev != NULL; dev = next_dev(dev))
 
-static int num_devices;
-static struct parisc_device pa_devices[MAX_DEVICES];
-static struct parisc_driver *pa_drivers;
-static rwlock_t pa_lock = RW_LOCK_UNLOCKED;
+#define bus_for_each(dev) \
+	for (; dev != NULL; dev = dev->sibling)
+
+/**
+ * next_dev - enumerates registered devices
+ * @dev: the previous device returned from next_dev
+ *
+ * next_dev does a depth-first search of the tree, returning parents
+ * before children.  Returns NULL when there are no more devices.
+ */
+struct parisc_device *next_dev(struct parisc_device *dev)
+{
+	if (dev->child) {
+		return dev->child;
+	} else if (dev->sibling) {
+		return dev->sibling;
+	}
+
+	/* Exhausted tree at this level, time to go up. */
+	do {
+		dev = dev->parent;
+		if (dev && dev->sibling)
+			return dev->sibling;
+	} while (dev != &root);
 
+	return NULL;
+}
 
 /**
  * match_device - Report whether this driver can handle this device
@@ -45,9 +73,12 @@ static rwlock_t pa_lock = RW_LOCK_UNLOCK
 static int match_device(struct parisc_driver *driver, struct parisc_device *dev)
 {
 	const struct parisc_device_id *ids;
+
+	for (ids = driver->id_table; ids->sversion; ids++) {
+		if ((ids->sversion != SVERSION_ANY_ID) &&
+		    (ids->sversion != dev->id.sversion))
+			continue;
 
-	for (ids = driver->id_table; ids->hw_type || ids->hversion ||
-			ids->hversion_rev || ids->sversion; ids++) {
 		if ((ids->hw_type != HWTYPE_ANY_ID) &&
 		    (ids->hw_type != dev->id.hw_type))
 			continue;
@@ -60,14 +91,9 @@ static int match_device(struct parisc_dr
 		    (ids->hversion_rev != dev->id.hversion_rev))
 			continue;
 
-		if ((ids->sversion != SVERSION_ANY_ID) &&
-		    (ids->sversion != dev->id.sversion))
-			continue;
-
 		return 1;
 	}
 	return 0;
-
 }
 
 /**
@@ -76,7 +102,7 @@ static int match_device(struct parisc_dr
  */
 int register_parisc_driver(struct parisc_driver *driver)
 {
-	int i;
+	struct parisc_device *device;
 
 	if (driver->next) {
 		printk(KERN_WARNING 
@@ -84,19 +110,8 @@ int register_parisc_driver(struct parisc
 		       driver->name, driver->version);
 		return 1;
 	}
-
-	write_lock(&pa_lock);
 
-	/* Note that the list is in reverse order of registration.  This
-	 * may be significant if we ever actually support hotplug and have
-	 * multiple drivers capable of claiming the same chip.
-	 */
-	driver->next = pa_drivers;
-	pa_drivers = driver;
-	
-	for (i=0; i < num_devices; i++) {
-		struct parisc_device *device = &pa_devices[i];
-
+	for_each_padev(device) {
 		if (device->driver)
 			continue;
 		if (!match_device(driver, device))
@@ -112,8 +127,16 @@ int register_parisc_driver(struct parisc
 		}
 	}
 
-	write_unlock(&pa_lock);
+	/* Note that the list is in reverse order of registration.  This
+	 * may be significant if we ever actually support hotplug and have
+	 * multiple drivers capable of claiming the same chip.
+	 */
 
+	spin_lock(&pa_lock);
+	driver->next = pa_drivers;
+	pa_drivers = driver;
+	spin_unlock(&pa_lock);
+
 	return 0;
 }
 
@@ -125,9 +148,9 @@ int register_parisc_driver(struct parisc
  */
 int unregister_parisc_driver(struct parisc_driver *driver)
 {
-	int i;
+	struct parisc_device *dev;
 
-	write_lock(&pa_lock);
+	spin_lock(&pa_lock);
 
 	if (pa_drivers == driver) {
 		/* was head of list - update head */
@@ -149,65 +172,123 @@ int unregister_parisc_driver(struct pari
 
 	}
 
-	for (i=0; i < num_devices; i++) {
-		if (pa_devices[i].driver == driver)
-			pa_devices[i].driver = NULL;
-	}
+	spin_unlock(&pa_lock);
 
-	write_unlock(&pa_lock);
+	for_each_padev(dev) {
+		if (dev->driver == driver)
+			dev->driver = NULL;
+	}
 
 	return 0;
 }
 
+static struct parisc_device *find_device_by_addr(unsigned long hpa)
+{
+	struct parisc_device *dev;
+	for_each_padev(dev) {
+		if (dev->hpa == hpa)
+			return dev;
+	}
+	return NULL;
+}
+
+static void
+get_node_path(struct parisc_device *dev, struct pdc_module_path *path)
+{
+	int i = 5;
+	memset(&path->bc, -1, 6);
+	while (dev != &root) {
+		path->bc[i--] = dev->hw_path;
+		dev = dev->parent;
+	}
+}
+
+static void print_hwpath(struct parisc_device *dev, char *output)
+{
+	int i;
+	struct pdc_module_path path;
+
+	get_node_path(dev->parent, &path);
+	for (i = 0; i < 6; i++) {
+		if (path.bc[i] == -1)
+			continue;
+		output += sprintf(output, "%d/", path.bc[i]);
+	}
+	sprintf(output, "%d", dev->hw_path);
+}
 
 /**
- * get_num_pa_dev - Get the count of found devices
- * (currently only used by the ccio driver)
+ * alloc_tree_node - returns a device entry in the iotree
+ * @parent: the parent node in the tree
+ * @id: the element of the module path for this entry
+ *
+ * Checks all the children of @parent for a matching @id.  If none
+ * found, it allocates a new device and returns it.
  */
-int get_num_pa_dev(void)
+struct parisc_device *
+alloc_tree_node(struct parisc_device *parent, char id)
 {
-	int i;
+	struct parisc_device *dev, *prev;
+	if ((!parent->child) || (parent->child->hw_path > id)) {
+		dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+		memset(dev, 0, sizeof(*dev));
+		dev->hw_path = id;
+		dev->parent = parent;
+		dev->sibling = parent->child;
+		parent->child = dev;
+		return dev;
+	}
+	
+	prev = parent->child;
+	if(prev->hw_path == id)
+		return prev;
+
+	while (prev->sibling && prev->sibling->hw_path < id) {
+		prev = prev->sibling;
+	}
 	
-	read_lock(&pa_lock);
-	i = num_devices;
-	read_unlock(&pa_lock);
+	if ((prev->sibling) && (prev->sibling->hw_path == id))
+		return prev->sibling;
 
-	return i;
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	memset(dev, 0, sizeof(*dev));
+	dev->hw_path = id;
+	dev->parent = parent;
+	dev->sibling = prev->sibling;
+	prev->sibling = dev;
+	return dev;
 }
 
-struct parisc_device *alloc_pa_dev(unsigned long hpa)
+static struct parisc_device *find_parisc_device(struct pdc_module_path *modpath)
 {
-	int i, status;
+	int i;
+	struct parisc_device *parent = &root;
+	for (i = 0; i < 6; i++) {
+		if (modpath->bc[i] == -1)
+			continue;
+		parent = alloc_tree_node(parent, modpath->bc[i]);
+	}
+	return alloc_tree_node(parent, modpath->mod);
+}
+
+struct parisc_device *
+alloc_pa_dev(unsigned long hpa, struct pdc_module_path *mod_path)
+{
+	int status;
 	unsigned long bytecnt;
 	u8 iodc_data[32];
 	struct parisc_device *dev;
 	const char *name;
 
-	write_lock(&pa_lock);
-
-	/* Check to make sure this device has not already been added -Ryan */
-	for (i = 0; i < num_devices; i++) {
-		if (pa_devices[i].hpa == hpa) {
-			write_unlock(&pa_lock);
-			return NULL;
-		}
-	}
-
-	if (num_devices >= MAX_DEVICES) {
-		printk(KERN_ERR "%s: Too many devices.\n", __FUNCTION__ );
-		write_unlock(&pa_lock);
+	/* Check to make sure this device has not already been added - Ryan */
+	if (find_device_by_addr(hpa) != NULL)
 		return NULL;
-	}
-	
-	dev = &pa_devices[num_devices];
-	memset(dev, 0, sizeof(*dev));
-	
+
 	status = pdc_iodc_read(&bytecnt, hpa, 0, &iodc_data, 32);
-	if (status != PDC_OK) {
-		/* There is no device here, so we'll skip it */
-		write_unlock(&pa_lock);
+	if (status != PDC_OK)
 		return NULL;
-	}
+
+	dev = find_parisc_device(mod_path);
 
 	dev->id.hw_type = iodc_data[3] & 0x1f;
 	dev->id.hversion = (iodc_data[0] << 4) | ((iodc_data[1] & 0xf0) >> 4);
@@ -220,9 +301,6 @@ struct parisc_device *alloc_pa_dev(unsig
 		strncpy(dev->name, name, sizeof(dev->name)-1);
 	}
 
-	num_devices++;
-
-	write_unlock(&pa_lock);
 	return dev;
 }
 
@@ -243,7 +321,7 @@ int register_parisc_device(struct parisc
 	if (dev->driver)
 		return 1;
 	
-	write_lock(&pa_lock);
+	spin_lock(&pa_lock);
 
 	/* Locate a driver which agrees to manage this device.  */
 	for (driver = pa_drivers; driver; driver = driver->next) {
@@ -254,45 +332,85 @@ int register_parisc_device(struct parisc
 	}
 
 	dev->driver = driver;
-	write_unlock(&pa_lock);
+	spin_unlock(&pa_lock);
 	return driver != NULL;
 }
 
+#define MAX_NATIVE_DEVICES 64
+#define NATIVE_DEVICE_OFFSET 0x1000
 
 /**
- * print_pa_devices - Print out a list of devices found in this system
- * @start_index: the starting index from which the list should be printed
- * @num_indexes: the numbers of devices to print
+ * do_native_bus_walk -- Probe a bus for devices
+ * @addr: Base address of this bus.
+ * 
+ * A native bus (eg Runway or GSC) may have up to 64 devices on it,
+ * spaced at intervals of 0x1000 bytes.  PDC may not inform us of these
+ * devices, so we have to probe for them.  Unfortunately, we may find
+ * devices which are not physically connected (such as extra serial &
+ * keyboard ports).  This problem is not yet solved.
  */
-void print_pa_devices(int start_index, int num_indexes)
+void walk_native_bus(unsigned long addr, struct parisc_device *parent)
 {
-	unsigned int i;
-	struct parisc_device *d;
+	int i;
+	struct pdc_module_path path;
+	get_node_path(parent, &path);
+	for (i = 0; i < MAX_NATIVE_DEVICES; i++) {
+		struct parisc_device *dev;
+		path.mod = i;
+		dev = alloc_pa_dev(addr + i * NATIVE_DEVICE_OFFSET, &path);
+		if (!dev)
+			continue;
+		register_parisc_device(dev);
+	}
+}
 
-	read_lock(&pa_lock);
-	
-	for (i = start_index; i < start_index + num_indexes; i++) {
-		
-		if (i >= MAX_DEVICES)
-			break;
-		
-		d = &pa_devices[i];
-		
-		printk(KERN_INFO
-		"%d. %s (%d) at 0x%lx, versions 0x%x, 0x%x, 0x%x",
-		i + 1, d->name,	d->id.hw_type, d->hpa, 
-		d->id.hversion, d->id.hversion_rev, d->id.sversion);
-
-		if (d->num_addrs > 1) {
-			int k;
-			printk(",  additional addresses: ");
-			for (k = 1; k < d->num_addrs; k++)
-				printk("0x%lx ", d->addr[k]);
-		}
+#define CENTRAL_BUS_ADDR (unsigned long) 0xfffffffffff80000
+
+/**
+ * walk_central_bus - Find devices attached to the central bus
+ *
+ * PDC doesn't tell us about all devices in the system.  This routine
+ * finds devices connected to the central bus.
+ */
+void walk_central_bus(void)
+{
+	walk_native_bus(CENTRAL_BUS_ADDR, &root);
+}
+
+static void print_parisc_device(struct parisc_device *dev)
+{
+	char hw_path[64];
+	static int count;
 
-		printk("\n");
+	print_hwpath(dev, hw_path);
+	printk(KERN_INFO "%d. %s (%d) at 0x%lx [%s], versions 0x%x, 0x%x, 0x%x",
+		++count, dev->name, dev->id.hw_type, dev->hpa, hw_path,
+		dev->id.hversion, dev->id.hversion_rev, dev->id.sversion);
+
+	if (dev->num_addrs > 1) {
+		int k;
+		printk(",  additional addresses: ");
+		for (k = 1; k < dev->num_addrs; k++)
+			printk("0x%lx ", dev->addr[k]);
 	}
+	printk("\n");
+}
 
-	read_unlock(&pa_lock);
+void print_subdevices(struct parisc_device *parent)
+{
+	struct parisc_device *dev;
+	for (dev = parent->child; dev != parent->sibling; dev = next_dev(dev)) {
+		print_parisc_device(dev);
+	}
 }
 
+/**
+ * print_parisc_devices - Print out a list of devices found in this system
+ */
+void print_parisc_devices(void)
+{
+	struct parisc_device *dev;
+	for_each_padev(dev) {
+		print_parisc_device(dev);
+	}
+}
Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/inventory.c,v
retrieving revision 1.41
diff -u -p -r1.41 inventory.c
--- arch/parisc/kernel/inventory.c	2001/10/11 23:43:27	1.41
+++ arch/parisc/kernel/inventory.c	2001/10/19 22:39:04
@@ -184,7 +184,7 @@ pat_query_module(ulong pcell_loc, ulong 
 	}
 
 	temp = pa_pdc_cell.cba;
-	dev = alloc_pa_dev(PAT_GET_CBA(temp));	/* sets dev->hpa */
+	dev = alloc_pa_dev(PAT_GET_CBA(temp), NULL);	/* sets dev->hpa */
 	if (!dev) {
 		return PDC_NE_MOD;
 	}
@@ -406,7 +406,7 @@ static void __init sprockets_memconfig(v
 
 #else   /* !__LP64__ */
 
-#define pat_inventory() (0)
+#define pat_inventory() do { } while (0)
 #define pat_memconfig() do { } while (0)
 #define sprockets_memconfig() pagezero_memconfig()
 
@@ -426,7 +426,7 @@ legacy_create_device(struct pdc_memory_m
 	if (status != PDC_OK)
 		return NULL;
 
-	dev = alloc_pa_dev(r_addr->hpa);
+	dev = alloc_pa_dev(r_addr->hpa, module_path);
 	if (dev == NULL)
 		return NULL;
 
@@ -500,36 +500,6 @@ static int __init snake_inventory(void)
 
 /* Common 32/64 bit based code goes here */
 
-#define MAX_NATIVE_DEVICES 64
-#define NATIVE_DEVICE_OFFSET 0x1000
-
-/**
- * do_native_bus_walk -- Probe a bus for devices
- * @hpa: Base address of this bus.
- *
- * A native bus (eg Runway or GSC) may have up to 64 devices on it,
- * spaced at intervals of 0x1000 bytes.  PDC may not inform us of these
- * devices, so we have to probe for them.  Unfortunately, we may find
- * devices which are not physically connected (such as extra serial &
- * keyboard ports).  This problem is not yet solved.
- */
-int do_native_bus_walk(unsigned long hpa)
-{
-	int num = 0;
-	unsigned long hpa_end =
-	    hpa + (MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET);
-
-	for (; hpa < hpa_end; hpa += NATIVE_DEVICE_OFFSET) {
-		struct parisc_device *dev = alloc_pa_dev(hpa);
-		if (!dev)
-			continue;
-
-		register_parisc_device(dev);
-		++num;
-	}
-	return num;
-}
-
 /**
  * add_system_map_addresses - Add additional addresses to the parisc device.
  * @dev: The parisc device.
@@ -568,17 +538,15 @@ add_system_map_addresses(struct parisc_d
 	}
 }
 
-#define CENTRAL_BUS_ADDR (unsigned long)(signed int)0xFFF80000
-
 /**
  * do_system_map_inventory - Retrieve firmware devices via SYSTEM_MAP.
  *
  * This function attempts to retrieve and register all the devices firmware
  * knows about via the SYSTEM_MAP PDC call.
  */
-static int __init system_map_inventory(void)
+static void __init system_map_inventory(void)
 {
-	int i, num = 0;
+	int i;
 	long status = PDC_OK;
 
 	for (i = 0; status != PDC_BAD_PROC && status != PDC_NE_MOD; i++) {
@@ -591,12 +559,11 @@ static int __init system_map_inventory(v
 		if (status != PDC_OK)
 			continue;
 		
-		dev = alloc_pa_dev(module_result.mod_addr);
+		dev = alloc_pa_dev(module_result.mod_addr, &module_path);
 		if (!dev)
 			continue;
 		
 		register_parisc_device(dev);
-		++num;
 
 		/* if available, get the additional addresses for a module */
 		if (!module_result.add_addrs)
@@ -605,8 +572,8 @@ static int __init system_map_inventory(v
 		add_system_map_addresses(dev, module_result.add_addrs, i);
 	}
 
-	num += do_native_bus_walk(CENTRAL_BUS_ADDR);
-	return num;
+	walk_central_bus();
+	return;
 }
 
 void __init do_memory_inventory(void)
@@ -638,33 +605,26 @@ void __init do_memory_inventory(void)
 
 void __init do_device_inventory(void)
 {
-	int num;
-
 	printk(KERN_INFO "Searching for devices...\n");
 
 	switch (pdc_type) {
 
 	case PDC_TYPE_PAT:
-		num = pat_inventory();
+		pat_inventory();
 		break;
 
 	case PDC_TYPE_SYSTEM_MAP:
-		num = system_map_inventory();
+		system_map_inventory();
 		break;
 
 	case PDC_TYPE_LEGACY:
-		num = snake_inventory();
+		snake_inventory();
 		break;
 
 	default:
 		panic("Unknown PDC type!\n");
 	}
 
-	if (!num) {
-		panic("I can't get the hardware inventory on this machine");
-	}
-
 	printk(KERN_INFO "Found devices:\n");
-	print_pa_devices(0, num);
-	printk(KERN_INFO "That's a total of %d devices.\n", num);
+	print_parisc_devices();
 }
Index: arch/parisc/kernel/led.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/led.c,v
retrieving revision 1.23
diff -u -p -r1.23 led.c
--- arch/parisc/kernel/led.c	2001/10/10 19:01:25	1.23
+++ arch/parisc/kernel/led.c	2001/10/19 22:39:05
@@ -154,8 +154,7 @@ static int led_proc_read(char *page, cha
 static int led_proc_write(struct file *file, const char *buf, 
 	unsigned long count, void *data)
 {
-	const char *cur = NULL;
-	char lbuf[count];
+	char *cur, lbuf[count];
 	int d;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -163,7 +162,7 @@ static int led_proc_write(struct file *f
 
 	memset(lbuf, 0, count);
 
-	lcopy_from_user(lbuf, buf, count);
+	copy_from_user(lbuf, buf, count);
 	cur = lbuf;
 
 	/* skip initial spaces */
Index: include/asm-parisc/hardware.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/hardware.h,v
retrieving revision 1.24
diff -u -p -r1.24 hardware.h
--- include/asm-parisc/hardware.h	2001/10/11 23:43:30	1.24
+++ include/asm-parisc/hardware.h	2001/10/19 22:39:07
@@ -1,6 +1,8 @@
 #ifndef _PARISC_HARDWARE_H
 #define _PARISC_HARDWARE_H
 
+#include <asm/pdc.h>
+
 struct parisc_device_id {
 	unsigned char	hw_type;	/* 5 bits used */
 	unsigned char	hversion_rev;	/* 4 bits */
@@ -96,12 +98,15 @@ extern enum cpu_type parisc_get_cpu_type
 
 
 /* drivers.c: */
-extern struct parisc_device *alloc_pa_dev(unsigned long hpa);
+extern struct parisc_device *alloc_pa_dev(unsigned long hpa,
+		struct pdc_module_path *path);
 extern int register_parisc_device(struct parisc_device *dev);
-extern int get_num_pa_dev(void);
-extern void print_pa_devices(int start_index, int num_indexes);
 extern int register_parisc_driver(struct parisc_driver *driver);
 extern int unregister_parisc_driver(struct parisc_driver *driver);
+extern void walk_native_bus(unsigned long addr, struct parisc_device *parent);
+extern void walk_central_bus(void);
+extern void print_subdevices(struct parisc_device *dev);
+extern void print_parisc_devices(void);
 
 /* inventory.c: */
 extern void do_memory_inventory(void);

--0OAP2g/MAC+5xKAE--
