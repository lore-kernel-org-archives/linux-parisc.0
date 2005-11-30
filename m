From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] FLT CBFB on B1000 when accessing second graphics
	card
Date: Wed, 30 Nov 2005 12:24:39 -0700
Message-ID: <200511301224.39435.bjorn.helgaas@hp.com>
References: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 30 November 2005 7:21 am, Thomas Klinger wrote:
> I'm trying to setup Debian 3.1r0a (sarge) on a B1000 with two graphics
> card. The first one is the original A4977A Visualize EG rev. 03, as
> more powerful display card for the graphical desktop we installed a
> Matrox Millenium II with 2MB RAM. ...
> 
> What comes now is that if we try to start the X server using the
> second card the system switches the card and immediatly fails with the
> error code FLT CBFB (shown in the front LCD display).

I don't follow parisc development enough to know whether this
scenario is supposed to work.  Based on what I do know about
HP chipsets and the ia64 kernel, I expect this to fail for the
following reason:

In general, X is not smart enough to completely initialize video
cards, because the necessary documentation is usually not public.
So the usual strategy is to execute the option ROM on the card.
For the primary card, system firmware usually runs the ROM (or is
smart enough to initialize the card directly) before booting the
OS.

But secondary cards are usually not initialized by system firmware,
so X has to run the option ROM before it can use the card.  The
code in the option ROM assumes there is only one video card in the
system, and that it has MMIO from 0xA0000-0xBFFFF and IO ports from
0x3B0-0x3DF.

When you have two video cards in the system, HP chipsets route those
ranges to one card or the other, not both.  So my guess is that X
is either trying to use the second card uninitialized, or it is
trying to emulate the option ROM on the second card, and the MMIO
or IO port accesses done by the option ROM code are being routed to
the primary card.

Bad things will happen in either case.

I have code for ia64 that makes this work, and it should be fairly
easy to port to parisc.  It works by reprogramming the chipset to
route the VGA MMIO and IO port resource to the appropriate card.
There are a few related X server changes, too.

This is a bit of a work-in-progress, but I'll attach the current
ia64 kernel patch so you can get an idea of what I'm doing.

Bjorn




[PATCH] ia64: support HP chipset VGA routing

Called via pci_mmap_legacy_mem() and pci_{read,write}_legacy_io().

I'm working on support for multiple VGA devices.  Sysfs-pci exports
access to the legacy I/O port and MMIO resources required.  And HP
chipsets have programmable routing for those resources (actually just
the VGA-specific 0xA0000-0xBFFFF MMIO and 0x3B0-0x3DF I/O port
ranges).

But since the chipset only routes to one VGA device at a time, we need
some arbitration to coordinate user accesses and the chipset routing.
The attached file is a start, but I'm a complete VM neophyte, so I'd
appreciate any guidance.

There are no struct pages for the VGA MMIO region, so I couldn't use a
nopage() vm_op directly.  I used populate() instead, which seems a bit
hacky.  It sounds like a nopfn() or similar is coming, and I might be
able to use that.

===== arch/ia64/hp/common/Makefile 1.8 vs edited =====
Index: work4/arch/ia64/hp/common/Makefile
===================================================================
--- work4.orig/arch/ia64/hp/common/Makefile	2005-10-17 15:45:16.000000000 -0600
+++ work4/arch/ia64/hp/common/Makefile	2005-10-17 16:04:38.000000000 -0600
@@ -1,10 +1,7 @@
-#
-# ia64/platform/hp/common/Makefile
-#
-# Copyright (C) 2002 Hewlett Packard
+# (c) Copyright 2002, 2005 Hewlett-Packard Development Company, L.P.
 # Copyright (C) Alex Williamson (alex_williamson@hp.com)
-#
+# 	Bjorn Helgaas <bjorn.helgaas@hp.com>
 
-obj-y := sba_iommu.o
+obj-y := cc.o sba.o lba.o sba_iommu.o vga.o
 obj-$(CONFIG_IA64_HP_ZX1_SWIOTLB) += hwsw_iommu.o
 obj-$(CONFIG_IA64_GENERIC) += hwsw_iommu.o
Index: work4/arch/ia64/hp/common/sba_iommu.c
===================================================================
--- work4.orig/arch/ia64/hp/common/sba_iommu.c	2005-10-17 15:45:16.000000000 -0600
+++ work4/arch/ia64/hp/common/sba_iommu.c	2005-10-17 16:04:38.000000000 -0600
@@ -44,6 +44,8 @@
 
 #include <asm/acpi-ext.h>
 
+#include "cec.h"
+
 #define PFX "IOC: "
 
 /*
@@ -164,8 +166,6 @@
 #define SX1000_IOC_ID	((PCI_DEVICE_ID_HP_SX1000_IOC << 16) | PCI_VENDOR_ID_HP)
 #define SX2000_IOC_ID	((PCI_DEVICE_ID_HP_SX2000_IOC << 16) | PCI_VENDOR_ID_HP)
 
-#define ZX1_IOC_OFFSET	0x1000	/* ACPI reports SBA, we want IOC */
-
 #define IOC_FUNC_ID	0x000
 #define IOC_FCLASS	0x008	/* function class, bist, header, rev... */
 #define IOC_IBASE	0x300	/* IO TLB */
@@ -1733,7 +1733,7 @@
 };
 
 static struct ioc * __init
-ioc_init(u64 hpa, void *handle)
+ioc_init(void *handle, u64 hpa, u64 length)
 {
 	struct ioc *ioc;
 	struct ioc_iommu *info;
@@ -1970,56 +1970,38 @@
 #define sba_map_ioc_to_node(ioc, handle)
 #endif
 
+int __init
+ioc_add(acpi_handle handle, u64 hpa, u64 length, unsigned int page_shift)
+{
+	struct ioc *ioc;
+
+	if (!iovp_shift)
+		iovp_shift = page_shift;
+
+	ioc = ioc_init(handle, hpa, length);
+	if (!ioc)
+		return -ENODEV;
+
+	sba_map_ioc_to_node(ioc, handle);
+	return 0;
+}
+
 static int __init
 acpi_sba_ioc_add(struct acpi_device *device)
 {
-	struct ioc *ioc;
 	acpi_status status;
 	u64 hpa, length;
-	struct acpi_buffer buffer;
-	struct acpi_device_info *dev_info;
 
 	status = hp_acpi_csr_space(device->handle, &hpa, &length);
 	if (ACPI_FAILURE(status))
-		return 1;
+		return -ENODEV;
 
-	buffer.length = ACPI_ALLOCATE_LOCAL_BUFFER;
-	status = acpi_get_object_info(device->handle, &buffer);
-	if (ACPI_FAILURE(status))
-		return 1;
-	dev_info = buffer.pointer;
-
-	/*
-	 * For HWP0001, only SBA appears in ACPI namespace.  It encloses the PCI
-	 * root bridges, and its CSR space includes the IOC function.
-	 */
-	if (strncmp("HWP0001", dev_info->hardware_id.value, 7) == 0) {
-		hpa += ZX1_IOC_OFFSET;
-		/* zx1 based systems default to kernel page size iommu pages */
-		if (!iovp_shift)
-			iovp_shift = min(PAGE_SHIFT, 16);
-	}
-	ACPI_MEM_FREE(dev_info);
-
-	/*
-	 * default anything not caught above or specified on cmdline to 4k
-	 * iommu page size
-	 */
-	if (!iovp_shift)
-		iovp_shift = 12;
-
-	ioc = ioc_init(hpa, device->handle);
-	if (!ioc)
-		return 1;
-
-	/* setup NUMA node association */
-	sba_map_ioc_to_node(ioc, device->handle);
-	return 0;
+	return ioc_add(device->handle, hpa, length, 12);
 }
 
 static struct acpi_driver acpi_sba_ioc_driver = {
 	.name		= "IOC IOMMU Driver",
-	.ids		= "HWP0001,HWP0004",
+	.ids		= "HWP0004",
 	.ops		= {
 		.add	= acpi_sba_ioc_add,
 	},
Index: work4/arch/ia64/hp/common/vga.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ work4/arch/ia64/hp/common/vga.c	2005-10-19 13:23:01.000000000 -0600
@@ -0,0 +1,354 @@
+/*
+ * VGA routing
+ *
+ * (c) Copyright 2005 Hewlett-Packard Development Company, L.P.
+ *	Bjorn Helgaas <bjorn.helgaas@hp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Some chipsets, including HP zx1, zx2, sx1000, and sx2000, route
+ * legacy VGA (MMIO accesses to 0xA0000-0xBFFFF and I/O port accesses
+ * to 0x3B0-0x3DF and their 10-bit aliases) to a single PCI root
+ * bridge.  This routing is programmable, so we can support several
+ * VGA devices in the same system.
+ *
+ * These legacy resources are exposed to the user via read/write of
+ * "legacy_io" (for I/O ports) and mmap of "legacy_mem" (for MMIO)
+ * in the /sys directory corresponding to the PCI root bridge.
+ *
+ * But, of course, only one of the VGA devices is accessible at a time,
+ * so this file does the locking and VM chicanery to keep multiple
+ * users separated.
+ */
+
+#include <linux/types.h>
+#include <linux/list.h>
+#include <linux/pci.h>
+#include <asm/tlbflush.h>
+#include "cec.h"
+
+
+#define VGA_MMIO_BASE		0xA0000UL
+#define VGA_MMIO_END		0xC0000UL
+#define VGA_IO_ALIAS_MASK	0x3FF
+#define VGA_IO_BASE		0x3B0
+#define VGA_IO_END		0x3E0
+
+/* FIXME can we avoid dynamic allocations by statically allocating
+ * a per-page struct here and using some rmap-style list to thread
+ * things together?
+ */
+struct vga_mapping {
+	struct list_head	list;
+	struct vm_area_struct	*vma;
+	struct pci_bus		*bus;
+};
+
+static DEFINE_SPINLOCK(vga_lock);
+static LIST_HEAD(vga_mappers);
+
+static struct pci_bus *vga_owner;
+
+static void
+change_vga_route(struct pci_bus *bus)
+{
+	struct hp_lba_data *lba = PCI_CONTROLLER(bus)->platform_data;
+
+	hp_lba_vga_enable(lba);
+	hp_sba_vga_enable(lba->sba, lba->rope);
+	hp_pin_vga_enable(lba->cell);
+
+	vga_owner = bus;
+}
+
+static pte_t *
+my_pte_alloc_map(struct mm_struct *mm, unsigned long address)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	/* FIXME doesn't this leak on the failure paths? */
+
+	pgd = pgd_offset(mm, address);
+	if (!pgd)
+		return NULL;
+
+	pud = pud_alloc(mm, pgd, address);
+	if (!pud)
+		return NULL;
+
+	pmd = pmd_alloc(mm, pud, address);
+	if (!pmd)
+		return NULL;
+
+	return pte_alloc_map(mm, pmd, address);
+}
+
+static void
+pte_protect(struct vm_area_struct *vma, unsigned long addr,
+	unsigned long pgoff, pgprot_t prot)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pte_t *pte, entry;
+
+	pte = my_pte_alloc_map(mm, addr);
+	if (!pte) {
+		printk("%s: no PTE!\n", __FUNCTION__);
+		BUG();	/* FIXME */
+		return;
+	}
+
+	entry = pfn_pte(pgoff, prot);
+	ptep_establish(vma, addr, pte, entry);
+	pte_unmap(pte);
+}
+
+static inline pte_t *
+va_to_pte(struct mm_struct *mm, unsigned long address)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	/* FIXME copied from page_check_address */
+	pgd = pgd_offset(mm, address);
+	if (likely(pgd_present(*pgd))) {
+		pud = pud_offset(pgd, address);
+		if (likely(pud_present(*pud))) {
+			pmd = pmd_offset(pud, address);
+			if (likely(pmd_present(*pmd)))
+				return pte_offset_map(pmd, address);
+		}
+	}
+	return 0;
+}
+
+static void
+vga_invalidate(struct vga_mapping *mapping)
+{
+	struct vm_area_struct *vma = mapping->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long pages, pgoff, end, address;
+	pte_t *pte, entry;
+
+	pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = max(vma->vm_pgoff, VGA_MMIO_BASE >> PAGE_SHIFT);
+	end = min(vma->vm_pgoff + pages, VGA_MMIO_END >> PAGE_SHIFT);
+	address = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
+
+	/*
+	 * We never *add* mappings to a non-current mm, merely
+	 * invalidate any that exist.  This avoids races with
+	 * exit_mmap().
+	 */
+	spin_lock(&mm->page_table_lock);
+	while (pgoff < end) {
+		pte = va_to_pte(mm, address);
+		if (pte) {
+			entry = pgoff_to_pte(pgoff);
+			ptep_establish(vma, address, pte, entry);
+			pte_unmap(pte);
+		}
+		address += PAGE_SIZE;
+		pgoff++;
+	}
+	spin_unlock(&mm->page_table_lock);
+}
+
+static void
+vga_map(struct vga_mapping *mapping, pgprot_t prot)
+{
+	struct vm_area_struct *vma = mapping->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long pages, pgoff, end, addr;
+
+	pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = max(vma->vm_pgoff, VGA_MMIO_BASE >> PAGE_SHIFT);
+	end = min(vma->vm_pgoff + pages, VGA_MMIO_END >> PAGE_SHIFT);
+	addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
+
+	spin_lock(&mm->page_table_lock);
+	while (pgoff < end) {
+		pte_protect(vma, addr, pgoff, prot);
+		addr += PAGE_SIZE;
+		pgoff++;
+	}
+	spin_unlock(&mm->page_table_lock);
+}
+
+static void
+vga_open(struct vm_area_struct *vma)
+{
+	struct pci_bus *bus = vma->vm_private_data;
+	struct vga_mapping *mapping;
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping) {
+		BUG();		/* FIXME */
+		return;
+	}
+
+	mapping->vma = vma;
+	mapping->bus = bus;
+
+	spin_lock(&vga_lock);
+	vga_invalidate(mapping);
+	list_add(&mapping->list, &vga_mappers);
+	spin_unlock(&vga_lock);
+}
+
+static void
+vga_close(struct vm_area_struct *vma)
+{
+	struct vga_mapping *mapper;
+
+	spin_lock(&vga_lock);
+	list_for_each_entry(mapper, &vga_mappers, list) {
+		if (mapper->vma == vma) {
+			list_del(&mapper->list);
+			break;
+		}
+	}
+	spin_unlock(&vga_lock);
+	kfree(mapper);
+}
+
+static struct vga_mapping *
+change_vga_owner(struct pci_bus *bus, struct vm_area_struct *vma)
+{
+	struct vga_mapping *mapper, *new_owner = NULL;
+
+	list_for_each_entry(mapper, &vga_mappers, list) {
+		vga_invalidate(mapper);
+		if (mapper->vma == vma)
+			new_owner = mapper;
+	}
+	change_vga_route(bus);
+
+	return new_owner;
+}
+
+static struct page *
+vga_nopage(struct vm_area_struct *vma, unsigned long address, int *type)
+{
+	return NOPAGE_SIGBUS;
+}
+
+static int
+vga_populate(struct vm_area_struct *vma, unsigned long address,
+	unsigned long len, pgprot_t prot, unsigned long pgoff, int nonblock)
+{
+	struct pci_bus *bus = vma->vm_private_data;
+	struct vga_mapping *mapping;
+
+	spin_lock(&vga_lock);
+	mapping = change_vga_owner(bus, vma);
+	vga_map(mapping, prot);
+	spin_unlock(&vga_lock);
+	return 0;
+}
+
+static struct vm_operations_struct vga_vm_ops = {
+	.open		= vga_open,
+	.close		= vga_close,
+	.nopage		= vga_nopage,
+	.populate	= vga_populate,
+};
+
+int
+hp_pci_mmap_legacy_page_range(struct pci_bus *bus, struct vm_area_struct *vma)
+{
+	unsigned long size = vma->vm_end - vma->vm_start;
+
+	if ((vma->vm_pgoff << PAGE_SHIFT) + size > 1024*1024)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_flags |= (VM_SHM | VM_RESERVED | VM_IO | VM_SHARED);
+	vma->vm_ops = &vga_vm_ops;
+	vma->vm_private_data = bus;
+
+	vga_open(vma);
+	return 0;
+}
+
+static inline int
+is_vga_port(u16 alias)
+{
+	u16 port = alias & VGA_IO_ALIAS_MASK;
+
+	if (port >= VGA_IO_BASE && port < VGA_IO_END)
+		return 1;
+	return 0;
+}
+
+int
+hp_pci_legacy_read(struct pci_bus *bus, u16 port, u32 *val, u8 size)
+{
+	int is_vga = is_vga_port(port);
+	int ret = size;
+
+	if (is_vga) {
+		spin_lock(&vga_lock);
+		if (vga_owner != bus)
+			change_vga_owner(bus, NULL);
+	}
+
+	switch (size) {
+	case 1:
+		*val = inb(port);
+		break;
+	case 2:
+		*val = inw(port);
+		break;
+	case 4:
+		*val = inl(port);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (is_vga)
+		spin_unlock(&vga_lock);
+
+	return ret;
+}
+
+int
+hp_pci_legacy_write(struct pci_bus *bus, u16 port, u32 val, u8 size)
+{
+	int is_vga = is_vga_port(port);
+	int ret = size;
+
+	if (is_vga) {
+		spin_lock(&vga_lock);
+		if (vga_owner != bus)
+			change_vga_owner(bus, NULL);
+	}
+
+	switch (size) {
+	case 1:
+		outb(val, port);
+		break;
+	case 2:
+		outw(val, port);
+		break;
+	case 4:
+		outl(val, port);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (is_vga)
+		spin_unlock(&vga_lock);
+
+	return ret;
+}
Index: work4/arch/ia64/hp/common/sba.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ work4/arch/ia64/hp/common/sba.c	2005-10-17 16:24:44.000000000 -0600
@@ -0,0 +1,312 @@
+/*
+ * HP System Bus Adapter (SBA) driver
+ *
+ * (c) Copyright 2005 Hewlett-Packard Development Company, L.P.
+ *	Bjorn Helgaas <bjorn.helgaas@hp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <asm/acpi-ext.h>
+#include <acpi/actypes.h>
+#include <acpi/acpi_drivers.h>
+#include "cec.h"
+
+
+#define HP_SBA_ZX_HID		"HWP0001"
+#define HP_SBA_SX_HID		"HWP0005"
+#define HP_SBA_DRIVER_NAME	"HP System Bus Adapter Driver"
+#define HP_SBA_DEVICE_NAME	"HP System Bus Adapter"
+
+#define ZX_IOC_OFFSET		0x1000	/* HWP0001 reports only SBA */
+#define ZX_IOC_FUNCTION_SIZE	0x1000
+
+#define SBA_ROPE_CONFIG_BASE	0x03a8
+#define SBA_ROPE_CONFIG_ENABLE	  0x0000000000000001UL
+#define SBA_VGA_ROUTE		0x03b0
+#define SBA_VGA_ROUTE_ENABLE	  0x8000000000000000UL
+#define SBA_VGA_ROUTE_MASK	  0x000000000000000fUL
+
+/* for sx1000 ps202 workaround only */
+#define SBA_DIR_BASE		0x0230
+#define SBA_DIR_BASE_ENABLE	  0x0000000000000001UL
+#define SBA_DIR_MASK		0x0238
+#define SBA_DIR_ROUTE		0x0240
+#define SBA_IOS_DIR_BASE	0x03c0
+#define SBA_IOS_DIR_BASE_ENABLE	  0x0000000000000001UL
+#define SBA_IOS_DIR_MASK	0x03c8
+#define SBA_IOS_DIR_ROUTE	0x03d0
+
+struct hp_sba_data {
+	struct hp_sba_data	*next;
+	acpi_handle		handle;
+	volatile void __iomem	*addr;
+	unsigned int		cell;
+	u64			rope_base;
+	char			name[32];
+};
+
+static struct hp_sba_data *sba_list;
+static struct hp_sba_data *vga_sba;
+static unsigned int vga_rope = -1;
+
+static void
+hp_sba_vga_disable(struct hp_sba_data *sba)
+{
+	u64 route;
+
+	if (ps202_workaround) {
+		writeq(0, sba->addr + SBA_DIR_BASE);
+		writeq(0, sba->addr + SBA_IOS_DIR_BASE);
+		readq(sba->addr + SBA_IOS_DIR_BASE);
+		return;
+	}
+
+	route = readq(sba->addr + SBA_VGA_ROUTE);
+	route &= ~SBA_VGA_ROUTE_ENABLE;
+	writeq(route, sba->addr + SBA_VGA_ROUTE);
+	readq(sba->addr + SBA_VGA_ROUTE);
+}
+
+void
+hp_sba_vga_enable(struct hp_sba_data *sba, unsigned int rope)
+{
+	u64 route;
+
+	if (sba == vga_sba && rope == vga_rope)
+		return;
+
+	if (sba != vga_sba)
+		hp_sba_vga_disable(vga_sba);
+
+	if (ps202_workaround) {
+		writeq(rope, sba->addr + SBA_DIR_ROUTE);
+		writeq(0xffffffffffffffffULL, sba->addr + SBA_DIR_MASK);
+		writeq(SBA_DIR_BASE_ENABLE, sba->addr + SBA_DIR_BASE);
+		readq(sba->addr + SBA_DIR_BASE);
+
+		writeq(rope, sba->addr + SBA_IOS_DIR_ROUTE);
+		writeq(0xfffffffffffff800ULL, sba->addr + SBA_IOS_DIR_MASK);
+		writeq(SBA_IOS_DIR_BASE_ENABLE, sba->addr + SBA_IOS_DIR_BASE);
+		readq(sba->addr + SBA_IOS_DIR_BASE);
+
+		vga_sba = sba;
+		vga_rope = rope;
+		return;
+	}
+
+	route = readq(sba->addr + SBA_VGA_ROUTE);
+	route &= ~SBA_VGA_ROUTE_MASK;
+	route |= (SBA_VGA_ROUTE_ENABLE | rope);
+	writeq(route, sba->addr + SBA_VGA_ROUTE);
+	readq(sba->addr + SBA_VGA_ROUTE);
+
+	vga_sba = sba;
+	vga_rope = rope;
+}
+
+struct hp_sba_data *
+hp_sba_find(acpi_handle handle)
+{
+	acpi_handle parent;
+	acpi_status status;
+	struct hp_sba_data *sba;
+
+	do {
+		for (sba = sba_list; sba; sba = sba->next) {
+			if (handle == sba->handle)
+				return sba;
+		}
+
+		status = acpi_get_parent(handle, &parent);
+		handle = parent;
+	} while (ACPI_SUCCESS(status));
+	return 0;
+}
+
+unsigned int
+hp_sba_cell(struct hp_sba_data *sba)
+{
+	return sba->cell;
+}
+
+unsigned int
+hp_sba_lba_to_rope(struct hp_sba_data *sba, u64 addr)
+{
+	return (addr - sba->rope_base) >> 13;
+}
+
+static int
+match_ids2(struct acpi_device_info *info, char *ids)
+{
+	struct acpi_compatible_id_list *cid_list = &info->compatibility_id;
+	int i;
+
+	if (strstr(ids, info->hardware_id.value))
+		return 0;
+
+	for (i = 0; i < cid_list->count; i++)
+		if (strstr(ids, cid_list->id[i].value))
+			return 0;
+
+	return -ENOENT;
+}
+
+static int
+acpi_handle_match_ids(acpi_handle handle, char *ids)
+{
+	acpi_status status;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_LOCAL_BUFFER, NULL};
+	int match;
+
+	status = acpi_get_object_info(handle, &buffer);
+	if (ACPI_FAILURE(status))
+		return -ENOENT;
+
+	match = match_ids2(buffer.pointer, ids);
+	ACPI_MEM_FREE(buffer.pointer);
+	return match;
+}
+
+static acpi_status
+find_ancestor(acpi_handle handle, char *ids, acpi_handle *ancestor)
+{
+	acpi_status status;
+	acpi_handle parent;
+
+	do {
+		if (acpi_handle_match_ids(handle, ids)) {
+			*ancestor = handle;
+			return AE_OK;
+		}
+
+		status = acpi_get_parent(handle, &parent);
+		if (ACPI_FAILURE(status))
+			return AE_ERROR;
+
+		handle = parent;
+	} while (ACPI_SUCCESS(status));
+	return AE_ERROR;
+}
+
+static int __init
+get_cell(acpi_handle handle)
+{
+	acpi_status status;
+	acpi_handle cell_handle;
+	unsigned long cell;
+
+	status = find_ancestor(handle, "ACPI004,HWP0008", &cell_handle);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	/*
+	 * Spec allows integer or string, but SPPA Firmware EAS requires
+	 * the _UID for cells to be the Cell ID.
+	 */
+	status = acpi_evaluate_integer(cell_handle, METHOD_NAME__UID,
+		NULL, &cell);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	return cell;
+}
+
+static int __init
+acpi_generic_sba_add(struct acpi_device *device, u64 *sba_hpa)
+{
+	acpi_status status;
+	u64 hpa, length;
+	struct hp_sba_data *sba;
+	int cell;
+
+	status = hp_acpi_csr_space(device->handle, &hpa, &length);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	cell = get_cell(device->handle);
+	if (cell < 0)
+		return -ENODEV;
+
+	sba = kzalloc(sizeof(*sba), GFP_KERNEL);
+	if (!sba)
+		return -ENOMEM;
+
+	strcpy(acpi_device_name(device), HP_SBA_DEVICE_NAME);
+
+	sba->next = sba_list;
+	sba_list = sba;
+
+	sba->handle = device->handle;
+	sba->addr = ioremap(hpa, length);
+	sba->cell = cell;
+	sba->rope_base = readq(sba->addr + SBA_ROPE_CONFIG_BASE) &
+		~SBA_ROPE_CONFIG_ENABLE;
+
+	snprintf(sba->name, sizeof(sba->name), "%s [%s]",
+		acpi_device_name(device), acpi_device_bid(device));
+	request_mem_region(hpa, length, sba->name);
+
+	printk(KERN_INFO "%s at MMIO 0x%lx\n", sba->name, hpa);
+
+	if (sba_hpa)
+		*sba_hpa = hpa;
+
+	return 0;
+}
+
+static int __init
+acpi_zx_sba_add(struct acpi_device *device)
+{
+	int err;
+	u64 sba_hpa;
+
+	err = acpi_generic_sba_add(device, &sba_hpa);
+	if (err)
+		return err;
+
+	/*
+	 * HWP0001 SBA devices contain an IOC that is not reported
+	 * separately.
+	 */
+	ioc_add(device->handle, sba_hpa + ZX_IOC_OFFSET, ZX_IOC_FUNCTION_SIZE,
+		min(PAGE_SHIFT, 16));
+
+	return 0;
+}
+
+static int __init
+acpi_sx_sba_add(struct acpi_device *device)
+{
+	return acpi_generic_sba_add(device, NULL);
+}
+
+static struct acpi_driver acpi_zx_sba_driver = {
+	.name		= HP_SBA_DRIVER_NAME,
+	.ids		= HP_SBA_ZX_HID,
+	.ops		= {
+		.add	= acpi_zx_sba_add,
+	},
+};
+
+static struct acpi_driver acpi_sx_sba_driver = {
+	.name		= HP_SBA_DRIVER_NAME,
+	.ids		= HP_SBA_SX_HID,
+	.ops		= {
+		.add	= acpi_sx_sba_add,
+	},
+};
+
+static int __init
+sba_init(void)
+{
+	acpi_bus_register_driver(&acpi_zx_sba_driver);
+	acpi_bus_register_driver(&acpi_sx_sba_driver);
+	return 0;
+}
+subsys_initcall(sba_init);
Index: work4/arch/ia64/hp/common/lba.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ work4/arch/ia64/hp/common/lba.c	2005-10-17 16:20:26.000000000 -0600
@@ -0,0 +1,182 @@
+/*
+ * HP Local Bus Adapter (LBA) driver
+ *
+ * (c) Copyright 2005 Hewlett-Packard Development Company, L.P.
+ *	Bjorn Helgaas <bjorn.helgaas@hp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <asm/acpi-ext.h>
+#include <acpi/actypes.h>
+#include <acpi/acpi_drivers.h>
+#include "cec.h"
+
+
+#define LBA_CONTROL		0x0108
+#define LBA_CONTROL_FORWARD_VGA	  0x00000008
+#define LBA_CONTROL_HARD_FAIL	  0x00000040
+
+#define FAIL_MODE_ROPE_HARD_FAIL		0x01
+
+#define FAIL_MODE_PCI_HARD_FAIL			0x01
+#define FAIL_MODE_PCI_SMART_MODE		0x02
+#define FAIL_MODE_PCI_CONFIG_TARGET_ABORT	0x04
+#define FAIL_MODE_PCI_IO_MASTER_ABORT		0x08
+#define FAIL_MODE_PCI_IO_TARGET_ABORT		0x10
+
+#define VGA_ROPE_MODE		0
+#define VGA_PCI_MODE		(FAIL_MODE_PCI_IO_TARGET_ABORT | \
+				 FAIL_MODE_PCI_IO_MASTER_ABORT | \
+				 FAIL_MODE_PCI_CONFIG_TARGET_ABORT | \
+				 FAIL_MODE_PCI_SMART_MODE)
+
+static struct hp_lba_data *vga_lba;
+
+static void
+hp_lba_set_fail_mode(struct hp_lba_data *lba, u64 rope_mode, u64 pci_mode)
+{
+	acpi_status status;
+	struct acpi_object_list arg_list;
+	union acpi_object fail_mode[2];
+
+	arg_list.count = 2;
+	arg_list.pointer = fail_mode;
+	fail_mode[0].type = ACPI_TYPE_INTEGER;
+	fail_mode[0].integer.value = rope_mode;
+	fail_mode[1].type = ACPI_TYPE_INTEGER;
+	fail_mode[1].integer.value = pci_mode;
+
+	status = acpi_evaluate_object(lba->handle, "WRFM", &arg_list, NULL);
+	if (ACPI_FAILURE(status))
+		printk(KERN_ERR "Couldn't write LBA fail mode\n");
+}
+
+static void
+hp_lba_vga_disable(struct hp_lba_data *lba)
+{
+	u64 ctrl;
+
+	/*
+	 * Reading an LBA register forces in-flight accesses to complete
+	 * before we route VGA to somewhere else.
+	 */
+	ctrl = readq(lba->addr + LBA_CONTROL);
+	ctrl &= ~LBA_CONTROL_FORWARD_VGA;
+	writeq(ctrl, lba->addr + LBA_CONTROL);
+	readq(lba->addr + LBA_CONTROL);
+
+	/*
+	 * We can't restore the original fail mode, because X may still
+	 * be using the device.
+	 */
+}
+
+void
+hp_lba_vga_enable(struct hp_lba_data *lba)
+{
+	u64 ctrl;
+
+	if (lba == vga_lba)
+		return;
+
+	if (vga_lba)
+		hp_lba_vga_disable(vga_lba);
+
+	ctrl = readq(lba->addr + LBA_CONTROL);
+	ctrl |= LBA_CONTROL_FORWARD_VGA;
+	writeq(ctrl, lba->addr + LBA_CONTROL);
+	readq(lba->addr + LBA_CONTROL);
+
+	hp_lba_set_fail_mode(lba, VGA_ROPE_MODE, VGA_PCI_MODE);
+
+	vga_lba = lba;
+}
+
+static char lba_id_list[] = "HWP0002,HWP0003,HWP0007";
+
+static int
+hp_lba_add(acpi_handle handle)
+{
+	acpi_status status;
+	struct acpi_device *device;
+	u64 hpa, length;
+	struct acpi_pci_id id;
+	struct pci_bus *bus;
+	struct hp_sba_data *sba;
+	struct hp_lba_data *lba;
+
+	status = acpi_bus_get_device(handle, &device);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	/*
+	 * This is called for all PCI root bridges.  But we only care
+	 * about the ones that have configurable VGA routing, i.e.,
+	 * HWP000[237].
+	 */
+	if (acpi_match_ids(device, lba_id_list))
+		return -ENODEV;
+
+	status = hp_acpi_csr_space(handle, &hpa, &length);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	status = acpi_get_pci_id(handle, &id);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	bus = pci_find_bus(id.segment, id.bus);
+	if (!bus)
+		return -EINVAL;
+
+	sba = hp_sba_find(handle);
+	if (!sba)
+		return -EINVAL;
+
+	lba = kzalloc(sizeof(*lba), GFP_KERNEL);
+	if (!lba)
+		return -ENOMEM;
+
+	lba->handle = handle;
+	lba->addr = ioremap(hpa, length);
+	lba->sba = sba;
+	lba->cell = hp_sba_cell(sba);
+	lba->rope = hp_sba_lba_to_rope(sba, hpa);
+
+	PCI_CONTROLLER(bus)->platform_data = lba;
+
+	sprintf(lba->name, "HP Local Bus Adapter (PCI Bus %04x:%02x)",
+		id.segment, id.bus);
+	request_mem_region(hpa, length, lba->name);
+
+	printk(KERN_INFO "%s at MMIO 0x%lx\n", lba->name, hpa);
+	return 0;
+}
+
+static void
+hp_lba_remove(acpi_handle handle)
+{
+}
+
+static struct acpi_pci_driver hp_lba_driver = {
+	.add =		hp_lba_add,
+	.remove =	hp_lba_remove,
+};
+
+static int __init
+hp_lba_init(void)
+{
+	/*
+	 * The LBAs are claimed by the ACPI generic PCI root bridge
+	 * driver.  Register with it as a sub-driver.
+	 */
+	acpi_pci_register_driver(&hp_lba_driver);
+	return 0;
+}
+subsys_initcall(hp_lba_init);
Index: work4/arch/ia64/hp/common/cec.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ work4/arch/ia64/hp/common/cec.h	2005-10-17 16:26:50.000000000 -0600
@@ -0,0 +1,39 @@
+/*
+ * HP chipset support
+ *
+ * (c) Copyright 2005 Hewlett-Packard Development Company, L.P.
+ *	Bjorn Helgaas <bjorn.helgaas@hp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <asm/acpi-ext.h>
+#include <acpi/actypes.h>
+#include <acpi/acpi_drivers.h>
+
+struct hp_lba_data {
+	acpi_handle		handle;
+	volatile void __iomem	*addr;
+	struct hp_sba_data	*sba;
+	unsigned int		cell;
+	unsigned int		rope;
+	char			name[40];
+};
+
+struct hp_sba_data;
+
+void hp_lba_vga_enable(struct hp_lba_data *lba);
+void hp_sba_vga_enable(struct hp_sba_data *sba, unsigned int rope);
+void hp_pin_vga_enable(unsigned int cell);
+
+struct hp_sba_data *hp_sba_find(acpi_handle handle);
+unsigned int hp_sba_cell(struct hp_sba_data *sba);
+unsigned int hp_sba_lba_to_rope(struct hp_sba_data *sba, u64 addr);
+
+extern int ps202_workaround;
+
+int ioc_add(acpi_handle handle, u64 hpa, u64 length, unsigned int page_shift);
Index: work4/arch/ia64/hp/common/cc.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ work4/arch/ia64/hp/common/cc.c	2005-10-17 16:26:06.000000000 -0600
@@ -0,0 +1,133 @@
+/*
+ * HP Cell Controller driver
+ *
+ * (c) Copyright 2005 Hewlett-Packard Development Company, L.P.
+ *	Bjorn Helgaas <bjorn.helgaas@hp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <asm/acpi-ext.h>
+#include <acpi/actypes.h>
+#include <acpi/acpi_drivers.h>
+#include "cec.h"
+
+
+#define HP_CC_HID		"HWP0006"
+#define HP_CC_DRIVER_NAME	"HP Cell Controller Driver"
+#define HP_CC_DEVICE_NAME	"HP Cell Controller"
+
+#define CC_FUNCTION_SIZE	0x1000
+#define CC_FUNCTION_PIN0	0x8000
+#define CC_FUNCTION_PIN1	0xb000
+
+#define PIN_FUNC_ID		0x0000
+#define PIN_FUNC_ID_SX1000	  0x1262103c
+#define PIN_VGA_ROUTE		0x01c0
+#define PIN_VGA_ROUTE_ENABLE	  0x8000000000000000UL
+#define PIN_VGA_ROUTE_MASK	  0x00000000000000ffUL
+#define PIN_CELL_ID		0x0f00
+#define PIN_CELL_ID_MASK	  0x000000000000000fUL
+
+int ps202_workaround;	/* ABE PS202: sx1000 VGA routing is broken */
+
+struct hp_pin_data {
+	struct hp_pin_data	*next;
+	volatile void __iomem	*addr;
+};
+
+static struct hp_pin_data *pin_list;
+static unsigned int vga_cell = -1;
+
+void
+hp_pin_vga_enable(unsigned int cell)
+{
+	struct hp_pin_data *pin;
+	u64 route;
+
+	if (cell == vga_cell)
+		return;
+
+	/* Point every PIN's VGA_ROUTE at CELL. */
+	for (pin = pin_list; pin; pin = pin->next) {
+		route = readq(pin->addr + PIN_VGA_ROUTE);
+		route &= ~(PIN_VGA_ROUTE_ENABLE | PIN_VGA_ROUTE_MASK);
+		route |= (PIN_VGA_ROUTE_ENABLE | (cell << 4));
+		writeq(route, pin->addr + PIN_VGA_ROUTE);
+		readq(pin->addr + PIN_VGA_ROUTE);
+	}
+	vga_cell = cell;
+}
+
+static int __init
+pin_add(u64 hpa, u64 length)
+{
+	struct hp_pin_data *pin;
+	u64 id;
+
+	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
+	if (!pin)
+		return -ENOMEM;
+
+	pin->addr = ioremap(hpa, length);
+	pin->next = pin_list;
+	pin_list = pin;
+
+	id = readq(pin->addr + PIN_FUNC_ID);
+	if (id == PIN_FUNC_ID_SX1000)
+		ps202_workaround = 1;
+
+	return 0;
+}
+
+static int __init
+acpi_cc_add(struct acpi_device *device)
+{
+	acpi_status status;
+	u64 hpa, length;
+	unsigned int size;
+	char *name;
+
+	status = hp_acpi_csr_space(device->handle, &hpa, &length);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	strcpy(acpi_device_name(device), HP_CC_DEVICE_NAME);
+
+	size = strlen(acpi_device_name(device)) +
+		strlen(acpi_device_bid(device)) + 4;
+	name = kzalloc(size, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	snprintf(name, size, "%s [%s]",
+		acpi_device_name(device), acpi_device_bid(device));
+	request_mem_region(hpa, length, name);
+
+	pin_add(hpa + CC_FUNCTION_PIN0, CC_FUNCTION_SIZE);
+	pin_add(hpa + CC_FUNCTION_PIN1, CC_FUNCTION_SIZE);
+
+	printk(KERN_INFO "%s at MMIO 0x%lx\n", name, hpa);
+	return 0;
+}
+
+static struct acpi_driver acpi_cc_driver = {
+	.name		= HP_CC_DRIVER_NAME,
+	.ids		= HP_CC_HID,
+	.ops		= {
+		.add	= acpi_cc_add,
+	},
+};
+
+static int __init
+cc_init(void)
+{
+	acpi_bus_register_driver(&acpi_cc_driver);
+	return 0;
+}
+subsys_initcall(cc_init);
Index: work4/include/asm-ia64/machvec_hpzx1.h
===================================================================
--- work4.orig/include/asm-ia64/machvec_hpzx1.h	2005-10-17 15:45:16.000000000 -0600
+++ work4/include/asm-ia64/machvec_hpzx1.h	2005-10-17 16:04:38.000000000 -0600
@@ -11,6 +11,9 @@
 extern ia64_mv_dma_unmap_sg		sba_unmap_sg;
 extern ia64_mv_dma_supported		sba_dma_supported;
 extern ia64_mv_dma_mapping_error	sba_dma_mapping_error;
+extern ia64_mv_pci_mmap_legacy_page_range_t	hp_pci_mmap_legacy_page_range;
+extern ia64_mv_pci_legacy_read_t	hp_pci_legacy_read;
+extern ia64_mv_pci_legacy_write_t	hp_pci_legacy_write;
 
 /*
  * This stuff has dual use!
@@ -34,5 +37,8 @@
 #define platform_dma_sync_sg_for_device		machvec_dma_sync_sg
 #define platform_dma_supported			sba_dma_supported
 #define platform_dma_mapping_error		sba_dma_mapping_error
+#define platform_pci_mmap_legacy_page_range	hp_pci_mmap_legacy_page_range
+#define platform_pci_legacy_read		hp_pci_legacy_read
+#define platform_pci_legacy_write		hp_pci_legacy_write
 
 #endif /* _ASM_IA64_MACHVEC_HPZX1_h */

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
