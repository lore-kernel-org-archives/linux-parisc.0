From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Cell support and fix PCI PDC paths
Date: Mon, 25 Dec 2006 16:13:28 -0700
Message-ID: <20061225231328.GA5741__29658.9773883627$1416624633$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Grant noted that the way we construct a PDC
address for a PCI device is wrong on some machines
(ftp://ftp.parisc-linux.org/patches/diff-2.6.20-rc1-PCI_hwpath).
I noticed the PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG procedure in the PAT
PDC document, and decided we should use it instead where we can.

I also noticed that the definition of the flags byte has been changed
for PAT machines -- the bottom 6 bits now define which cell the device is
attached to.  This explains (for example) why we get a duplicate hwpath
for Vesa's rp8400.

We would have got wrong results from the pdc_stable driver when it tried
to read the timeout value, so I've just disabled that sysfs file on pdc
machines for now.

I chose to implement cellular support by tagging each parisc_device
with a 'cell' byte, rather than the more obvious creation of a set of
cell parisc_devices as I thought this would minimise code churn and
memory consumption.

I didn't like the use of PF_* for flag definitions.  To me, PF_* are
networking protocol families (eg PF_INET).  So I changed that to HWP
for hardware path.

Testing appreciated; I've only tried it on an N-class.

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 6274cd2..51a6384 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -36,6 +36,7 @@
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/pdc.h>
+#include <asm/pdcpat.h>
 #include <asm/parisc-device.h>
 
 /* See comments in include/asm-parisc/pci.h */
@@ -306,9 +307,15 @@ static void get_node_path(struct device *dev, struct hardware_path *path)
 	memset(&path->bc, -1, 6);
 
 	if (is_pci_dev(dev)) {
-		unsigned int devfn = to_pci_dev(dev)->devfn;
-		path->mod = PCI_FUNC(devfn);
-		path->bc[i--] = PCI_SLOT(devfn);
+		struct pci_dev *pdev = to_pci_dev(dev);
+		if (is_pdc_pat()) {
+			int ret = pdc_pat_get_hwpath_from_pci(
+						pdc_address(pdev), path);
+			if (ret == PDC_OK)
+				return;
+		}
+		path->mod = PCI_FUNC(pdev->devfn);
+		path->bc[i--] = PCI_SLOT(pdev->devfn);
 		dev = dev->parent;
 	}
 
@@ -318,6 +325,8 @@ static void get_node_path(struct device *dev, struct hardware_path *path)
 			path->bc[i--] = PCI_SLOT(devfn) | (PCI_FUNC(devfn)<< 5);
 		} else if (dev->bus == &parisc_bus_type) {
 			path->bc[i--] = to_parisc_device(dev)->hw_path;
+			if (is_pdc_pat())
+				path->flags = to_parisc_device(dev)->cell;
 		}
 		dev = dev->parent;
 	}
@@ -326,6 +335,10 @@ static void get_node_path(struct device *dev, struct hardware_path *path)
 static char *print_hwpath(struct hardware_path *path, char *output)
 {
 	int i;
+
+	if (is_pdc_pat())
+		output += sprintf(output, "%u/", path->flags & HWP_CELL);
+
 	for (i = 0; i < 6; i++) {
 		if (path->bc[i] == -1)
 			continue;
@@ -406,13 +419,15 @@ static void setup_bus_id(struct parisc_device *padev)
 	sprintf(output, "%u", (unsigned char) padev->hw_path);
 }
 
-struct parisc_device * create_tree_node(char id, struct device *parent)
+static struct parisc_device *
+create_tree_node(struct device *parent, char cell, char id)
 {
 	struct parisc_device *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 
 	dev->hw_path = id;
+	dev->cell = cell;
 	dev->id.hw_type = HPHW_FAULTY;
 
 	dev->dev.parent = parent;
@@ -434,6 +449,7 @@ struct parisc_device * create_tree_node(char id, struct device *parent)
 
 struct match_id_data {
 	char id;
+	char cell;
 	struct parisc_device * dev;
 };
 
@@ -442,7 +458,7 @@ static int match_by_id(struct device * dev, void * data)
 	struct parisc_device * pdev = to_parisc_device(dev);
 	struct match_id_data * d = data;
 
-	if (pdev->hw_path == d->id) {
+	if (pdev->hw_path == d->id && pdev->cell == d->cell) {
 		d->dev = pdev;
 		return 1;
 	}
@@ -457,27 +473,29 @@ static int match_by_id(struct device * dev, void * data)
  * Checks all the children of @parent for a matching @id.  If none
  * found, it allocates a new device and returns it.
  */
-static struct parisc_device * alloc_tree_node(struct device *parent, char id)
+static struct parisc_device * alloc_tree_node(struct device *parent, char cell, char id)
 {
 	struct match_id_data d = {
 		.id = id,
+		.cell = cell,
 	};
 	if (device_for_each_child(parent, &d, match_by_id))
 		return d.dev;
 	else
-		return create_tree_node(id, parent);
+		return create_tree_node(parent, cell, id);
 }
 
 static struct parisc_device *create_parisc_device(struct hardware_path *modpath)
 {
 	int i;
+	char cell = is_pdc_pat() ? modpath->flags & HWP_CELL : 0;
 	struct device *parent = &root;
 	for (i = 0; i < 6; i++) {
 		if (modpath->bc[i] == -1)
 			continue;
-		parent = &alloc_tree_node(parent, modpath->bc[i])->dev;
+		parent = &alloc_tree_node(parent, cell, modpath->bc[i])->dev;
 	}
-	return alloc_tree_node(parent, modpath->mod);
+	return alloc_tree_node(parent, cell, modpath->mod);
 }
 
 struct parisc_device *
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 9158b70..7516790 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1387,6 +1387,20 @@ int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val)
 
 	return retval;
 }
+
+int pdc_pat_get_hwpath_from_pci(unsigned long pci_addr, struct hardware_path *path)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG,
+			__pa(pdc_result), pci_addr);
+	memcpy(path, pdc_result, 8);
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
 #endif /* __LP64__ */
 
 
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index ea1b7a6..66afab8 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -67,6 +67,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/pdc.h>
+#include <asm/pdcpat.h>
 #include <asm/page.h>
 #include <asm/uaccess.h>
 #include <asm/hardware.h>
@@ -541,7 +542,7 @@ pdcs_size_read(struct subsystem *entry, char *buf)
  * pdcs_auto_read - Stable Storage autoboot/search flag output.
  * @entry: An allocated and populated subsytem struct. We don't use it tho.
  * @buf: The output buffer to write to.
- * @knob: The PF_AUTOBOOT or PF_AUTOSEARCH flag
+ * @knob: The HWP_AUTOBOOT or HWP_AUTOSEARCH flag
  */
 static ssize_t
 pdcs_auto_read(struct subsystem *entry, char *buf, int knob)
@@ -571,7 +572,7 @@ pdcs_auto_read(struct subsystem *entry, char *buf, int knob)
 static inline ssize_t
 pdcs_autoboot_read(struct subsystem *entry, char *buf)
 {
-	return pdcs_auto_read(entry, buf, PF_AUTOBOOT);
+	return pdcs_auto_read(entry, buf, HWP_AUTOBOOT);
 }
 
 /**
@@ -582,7 +583,7 @@ pdcs_autoboot_read(struct subsystem *entry, char *buf)
 static inline ssize_t
 pdcs_autosearch_read(struct subsystem *entry, char *buf)
 {
-	return pdcs_auto_read(entry, buf, PF_AUTOSEARCH);
+	return pdcs_auto_read(entry, buf, HWP_AUTOSEARCH);
 }
 
 /**
@@ -597,19 +598,28 @@ pdcs_timer_read(struct subsystem *entry, char *buf)
 {
 	char *out = buf;
 	struct pdcspath_entry *pathentry;
+	int timer;
 
 	if (!entry || !buf)
 		return -EINVAL;
 
+	/*
+	 * PDC PAT machines use the timer field for something different.
+	 * I don't know where they keep the timer field now ...
+	 */
+	if (is_pdc_pat())
+		return -ENODEV;
+
 	/* Current flags are stored in primary boot path entry */
 	pathentry = &pdcspath_entry_primary;
 
-	/* print the timer value in seconds */
 	read_lock(&pathentry->rw_lock);
-	out += sprintf(out, "%u\n", (pathentry->devpath.flags & PF_TIMER) ?
-				(1 << (pathentry->devpath.flags & PF_TIMER)) : 0);
+	timer = pathentry->devpath.flags & HWP_TIMER;
 	read_unlock(&pathentry->rw_lock);
 
+	/* print the timer value in seconds */
+	out += sprintf(out, "%u\n", timer ? (1 << timer) : 0);
+
 	return out - buf;
 }
 
@@ -751,7 +761,7 @@ pdcs_osdep2_read(struct subsystem *entry, char *buf)
  * @entry: An allocated and populated subsytem struct. We don't use it tho.
  * @buf: The input buffer to read from.
  * @count: The number of bytes to be read.
- * @knob: The PF_AUTOBOOT or PF_AUTOSEARCH flag
+ * @knob: The HWP_AUTOBOOT or HWP_AUTOSEARCH flag
  * 
  * We will call this function to change the current autoboot flag.
  * We expect a precise syntax:
@@ -811,7 +821,7 @@ pdcs_auto_write(struct subsystem *entry, const char *buf, size_t count, int knob
 	write_unlock(&pathentry->rw_lock);
 	
 	printk(KERN_INFO PDCS_PREFIX ": changed \"%s\" to \"%s\"\n",
-		(knob & PF_AUTOBOOT) ? "autoboot" : "autosearch",
+		(knob & HWP_AUTOBOOT) ? "autoboot" : "autosearch",
 		(flags & knob) ? "On" : "Off");
 	
 	return count;
@@ -834,7 +844,7 @@ parse_error:
 static inline ssize_t
 pdcs_autoboot_write(struct subsystem *entry, const char *buf, size_t count)
 {
-	return pdcs_auto_write(entry, buf, count, PF_AUTOBOOT);
+	return pdcs_auto_write(entry, buf, count, HWP_AUTOBOOT);
 }
 
 /**
@@ -850,7 +860,7 @@ pdcs_autoboot_write(struct subsystem *entry, const char *buf, size_t count)
 static inline ssize_t
 pdcs_autosearch_write(struct subsystem *entry, const char *buf, size_t count)
 {
-	return pdcs_auto_write(entry, buf, count, PF_AUTOSEARCH);
+	return pdcs_auto_write(entry, buf, count, HWP_AUTOSEARCH);
 }
 
 /**
diff --git a/include/asm-parisc/parisc-device.h b/include/asm-parisc/parisc-device.h
index e12624d..feb1861 100644
--- a/include/asm-parisc/parisc-device.h
+++ b/include/asm-parisc/parisc-device.h
@@ -12,6 +12,7 @@ struct parisc_device {
 	int		aux_irq;	/* Some devices have a second IRQ */
 
 	char		hw_path;        /* The module number on this bus */
+	char		cell;		/* Only on PAT machines */
 	unsigned int	num_addrs;	/* some devices have additional address ranges. */
 	unsigned long	*addr;          /* which will be stored here */
  
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index 423c2b8..7f8f4ef 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -561,9 +561,10 @@ struct pdc_hpmc_pim_20 { /* PDC_PIM */
 #endif /* __ASSEMBLY__ */
 
 /* flags of the device_path (see below) */
-#define	PF_AUTOBOOT	0x80
-#define	PF_AUTOSEARCH	0x40
-#define	PF_TIMER	0x0F
+#define HWP_AUTOBOOT	0x80
+#define HWP_AUTOSEARCH	0x40
+#define HWP_CELL	0x3F	/* On PAT systems */
+#define HWP_TIMER	0x0F	/* Non-PAT systems */
 
 #ifndef __ASSEMBLY__
 
diff --git a/include/asm-parisc/pdcpat.h b/include/asm-parisc/pdcpat.h
index 47539f1..35882d8 100644
--- a/include/asm-parisc/pdcpat.h
+++ b/include/asm-parisc/pdcpat.h
@@ -192,15 +192,20 @@
 
 #ifdef CONFIG_64BIT
 #define is_pdc_pat()	(PDC_TYPE_PAT == pdc_type)
-extern int pdc_pat_get_irt_size(unsigned long *num_entries, unsigned long cell_num);
+extern int pdc_pat_get_irt_size(unsigned long *num_entries,
+						unsigned long cell_num);
 extern int pdc_pat_get_irt(void *r_addr, unsigned long cell_num);
+extern int pdc_pat_get_hwpath_from_pci(unsigned long address,
+						struct hardware_path *path);
 #else	/* ! CONFIG_64BIT */
 /* No PAT support for 32-bit kernels...sorry */
 #define is_pdc_pat()	(0)
 #define pdc_pat_get_irt_size(num_entries, cell_numn)	PDC_BAD_PROC
 #define pdc_pat_get_irt(r_addr, cell_num)		PDC_BAD_PROC
+#define pdc_pat_get_hwpath_from_pci(address, path)	PDC_BAD_PROC
 #endif	/* ! CONFIG_64BIT */
 
+#define pdc_address(dev) (dev->bus->number << 16) | (dev->devfn << 8)
 
 struct pdc_pat_cell_num {
 	unsigned long cell_num;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
