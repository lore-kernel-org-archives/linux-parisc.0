Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020307075805.70FA8484C@dsl2.external.hp.com>
Date: Thu,  7 Mar 2002 00:58:05 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] PATCH SBA SMP + other mis
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

Hi all,

I need to review this myself one more time after I had some sleep.
This is a set of misc changes I have outstanding.
(also stored on ftp.parisc-linux.org:patches/sba_misc.diff)

o SBA SMP bug fix from Alex Williamson
o ioctl32.c FB wrapper enabled for FB support
o add a warning to indicate we are ignoring a "directed" MMIO
  range that a given elroy is programmed to forward.
  Because of possible overlaps with distributed ranges, it's
  non-trivial to request_resource. Still thinking about how
  to do this right. May need to move resource mgt into
  lba_fixup_bus() where we know whether PCI devices are below
  an elroy.

grant

Index: arch/parisc/kernel/ioctl32.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/ioctl32.c,v
retrieving revision 1.9
diff -u -p -r1.9 ioctl32.c
--- arch/parisc/kernel/ioctl32.c	2002/03/03 05:35:11	1.9
+++ arch/parisc/kernel/ioctl32.c	2002/03/07 07:48:08
@@ -83,6 +83,8 @@
 #include <linux/sonet.h>
 #include <linux/atm_suni.h>
 
+#include <asm/module.h>	/* get #define module_map() */
+
 /* Use this to get at 32-bit user passed pointers. 
    See sys_sparc32.c for description about these. */
 #define A(__x) ((unsigned long)(__x))
@@ -453,6 +455,7 @@ static inline int hdio_getgeo(unsigned i
 	return err ? -EFAULT : 0;
 }
 
+
 #if 0
 /* looks like SPARC only - eg sbus video */
 struct  fbcmap32 {
@@ -556,6 +559,7 @@ static inline int fbiogscursor(unsigned 
 	set_fs (old_fs);
 	return ret;
 }
+#endif /* 0 */
 
 struct fb_fix_screeninfo32 {
 	char			id[16];
@@ -655,21 +659,36 @@ static int fb_ioctl_trans(unsigned int f
 	if (err)
 		goto out;
 	switch (cmd) {
+		struct fb_fix_screeninfo32 fix32;
 	case FBIOGET_FSCREENINFO:
-		err = __copy_to_user((char *)((struct fb_fix_screeninfo32 *)arg)->id, (char *)fix.id, sizeof(fix.id));
-		err |= __put_user((__u32)(unsigned long)fix.smem_start, &((struct fb_fix_screeninfo32 *)arg)->smem_start);
-		err |= __put_user(fix.smem_len, &((struct fb_fix_screeninfo32 *)arg)->smem_len);
-		err |= __put_user(fix.type, &((struct fb_fix_screeninfo32 *)arg)->type);
-		err |= __put_user(fix.type_aux, &((struct fb_fix_screeninfo32 *)arg)->type_aux);
-		err |= __put_user(fix.visual, &((struct fb_fix_screeninfo32 *)arg)->visual);
-		err |= __put_user(fix.xpanstep, &((struct fb_fix_screeninfo32 *)arg)->xpanstep);
-		err |= __put_user(fix.ypanstep, &((struct fb_fix_screeninfo32 *)arg)->ypanstep);
-		err |= __put_user(fix.ywrapstep, &((struct fb_fix_screeninfo32 *)arg)->ywrapstep);
-		err |= __put_user(fix.line_length, &((struct fb_fix_screeninfo32 *)arg)->line_length);
-		err |= __put_user((__u32)(unsigned long)fix.mmio_start, &((struct fb_fix_screeninfo32 *)arg)->mmio_start);
-		err |= __put_user(fix.mmio_len, &((struct fb_fix_screeninfo32 *)arg)->mmio_len);
-		err |= __put_user(fix.accel, &((struct fb_fix_screeninfo32 *)arg)->accel);
-		err |= __copy_to_user((char *)((struct fb_fix_screeninfo32 *)arg)->reserved, (char *)fix.reserved, sizeof(fix.reserved));
+		memset(&fix32, 0, sizeof(fix32));
+		memcpy(fix32.id, fix.id, sizeof(fix32.id));
+		fix32.smem_start = (__u32)(unsigned long)fix.smem_start;
+		fix32.smem_len	= fix.smem_len;
+		fix32.type	= fix.type;
+		fix32.type_aux	= fix.type_aux;
+		fix32.visual	= fix.visual;
+		fix32.xpanstep	= fix.xpanstep;
+		fix32.ypanstep	= fix.ypanstep;
+		fix32.ywrapstep = fix.ywrapstep;
+		fix32.line_length = fix.line_length;
+		fix32.mmio_start = (__u32)(unsigned long)fix.mmio_start;
+		fix32.mmio_len	= fix.mmio_len;
+		fix32.accel	= fix.accel;
+		memcpy(fix32.reserved, fix.reserved, sizeof(fix32.reserved));
+		err = __copy_to_user((void *) arg, (const void *) &fix32, sizeof(fix32));
+
+printk("fix  : %lx %x  %x %x %x  %x %x %x %x  %lx %x %x\n",
+	fix.smem_start, fix.smem_len,
+	fix.type, fix.type_aux, fix.visual,
+	fix.xpanstep, fix.ypanstep, fix.ywrapstep, fix.line_length,
+	fix.mmio_start, fix.mmio_len, fix.accel);
+printk("fix32: %x %x  %x %x %x  %x %x %x %x  %x %x %x\n",
+	fix32.smem_start, fix32.smem_len,
+	fix32.type, fix32.type_aux, fix32.visual,
+	fix32.xpanstep, fix32.ypanstep, fix32.ywrapstep, fix32.line_length,
+	fix32.mmio_start, fix32.mmio_len, fix32.accel);
+
 		break;
 	case FBIOGETCMAP:
 		err = __copy_to_user((char *)A(red), cmap.red, cmap.len * sizeof(__u16));
@@ -690,7 +709,6 @@ out:	if (cmap.red) kfree(cmap.red);
 	if (cmap.transp) kfree(cmap.transp);
 	return err;
 }
-#endif
 
 static int hdio_ioctl_trans(unsigned int fd, unsigned int cmd, unsigned long arg)
 {
@@ -2822,6 +2840,7 @@ COMPATIBLE_IOCTL(FBIOGCURMAX)
 #endif
 COMPATIBLE_IOCTL(FBIOGET_VSCREENINFO)
 COMPATIBLE_IOCTL(FBIOPUT_VSCREENINFO)
+
 COMPATIBLE_IOCTL(FBIOPAN_DISPLAY)
 COMPATIBLE_IOCTL(FBIOGET_FCURSORINFO)
 COMPATIBLE_IOCTL(FBIOGET_VCURSORINFO)
@@ -3365,10 +3384,9 @@ HANDLE_IOCTL(BLKFRAGET, w_long)
 HANDLE_IOCTL(BLKSECTGET, w_long)
 HANDLE_IOCTL(BLKPG, blkpg_ioctl_trans)
 
-#if 0
+HANDLE_IOCTL(FBIOGET_FSCREENINFO, fb_ioctl_trans)
 HANDLE_IOCTL(FBIOGETCMAP, fb_ioctl_trans)
 HANDLE_IOCTL(FBIOPUTCMAP, fb_ioctl_trans)
-#endif
 
 HANDLE_IOCTL(HDIO_GET_KEEPSETTINGS, hdio_ioctl_trans)
 HANDLE_IOCTL(HDIO_GET_UNMASKINTR, hdio_ioctl_trans)
Index: arch/parisc/kernel/sba_iommu.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/sba_iommu.c,v
retrieving revision 1.64
diff -u -p -r1.64 sba_iommu.c
--- arch/parisc/kernel/sba_iommu.c	2001/11/30 23:50:01	1.64
+++ arch/parisc/kernel/sba_iommu.c	2002/03/07 07:48:09
@@ -898,10 +898,6 @@ sba_unmap_single(struct pci_dev *dev, dm
 	ioc = GET_IOC(dev);
 	ASSERT(ioc);
 
-#if DELAYED_RESOURCE_CNT > 0
-	d = &(ioc->saved[ioc->saved_cnt]);
-#endif
-
 	offset = iova & ~IOVP_MASK;
 
 	DBG_RUN("%s() iovp 0x%lx/%x\n",
@@ -912,12 +908,14 @@ sba_unmap_single(struct pci_dev *dev, dm
 	size = ROUNDUP(size, IOVP_SIZE);
 
 	spin_lock_irqsave(&ioc->res_lock, flags);
+
 #ifdef CONFIG_PROC_FS
 	ioc->usingle_calls++;
 	ioc->usingle_pages += size >> IOVP_SHIFT;
 #endif
 
 #if DELAYED_RESOURCE_CNT > 0
+	d = &(ioc->saved[ioc->saved_cnt]);
 	d->iova = iova;
 	d->size = size;
 	if (++(ioc->saved_cnt) >= DELAYED_RESOURCE_CNT) {
Index: arch/parisc/kernel/lba_pci.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/lba_pci.c,v
retrieving revision 1.48
diff -u -p -r1.48 lba_pci.c
--- arch/parisc/kernel/lba_pci.c	2002/01/25 22:58:50	1.48
+++ arch/parisc/kernel/lba_pci.c	2002/03/07 07:48:10
@@ -34,6 +34,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/init.h>		/* for __init and __devinit */
+/* #define PCI_DEBUG	enable ASSERT */
 #include <linux/pci.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
@@ -939,7 +940,7 @@ LBA_PORT_IN(32, 0)
 #define LBA_PORT_OUT(size, mask) \
 static void lba_astro_out##size (struct pci_hba_data *d, u16 addr, u##size val) \
 { \
-	ASSERT(bus != NULL); \
+	ASSERT(d != NULL); \
 	DBG_PORT("%s(0x%p, 0x%x, 0x%x)\n", __FUNCTION__, d, addr, val); \
 	WRITE_REG##size(val, LBA_ASTRO_PORT_BASE + addr); \
 	if (LBA_DEV(d)->hw_rev < 3) \
@@ -1181,7 +1182,8 @@ lba_legacy_resources(struct parisc_devic
 	** "Directed" ranges are used when the "distributed range" isn't
 	** sufficient for all devices below a given LBA.  Typically devices
 	** like graphics cards or X25 may need a directed range when the
-	** bus has multiple slots (ie multiple devices).
+	** bus has multiple slots (ie multiple devices) or the device
+	** needs more than the typical 4 or 8MB a distributed range offers.
 	**
 	** The main reason for ignoring it now frigging complications.
 	** Directed ranges may overlap (and have precedence) over
@@ -1191,6 +1193,26 @@ lba_legacy_resources(struct parisc_devic
 	** since they may be assigned a directed range which overlaps
 	** an existing (but unused portion of) distributed range.
 	*/
+	r = &(lba_dev->hba.elmmio_space);
+	r->name  = "extra LBA PCI LMMIO";
+	r->flags = IORESOURCE_MEM;
+	r->start = READ_REG32(pa_dev->hpa + LBA_ELMMIO_BASE);
+	r->end   = 0;
+
+	/* check Range Enable bit */
+	if (r->start & 1) {
+		/* First baby step to getting Direct Ranges listed in /proc.
+		** AFAIK, only Sprockets PDC will setup a directed Range.
+		*/
+
+		r->start &= ~1;
+		r->end    = r->start;
+		r->end   += ~READ_REG32(pa_dev->hpa + LBA_ELMMIO_MASK);
+		printk(KERN_DEBUG "WARNING: Ignoring enabled ELMMIO BASE 0x%0x  SIZE 0x%x\n",
+			r->start,
+			r->end + 1);
+
+	}
 
 	r = &(lba_dev->hba.io_space);
 	r->name  = "LBA PCI I/O Ports";
@@ -1240,7 +1262,7 @@ lba_hw_init(struct lba_device *d)
 #endif	/* DEBUG_LBA_PAT */
 
 #ifdef __LP64__
-#warning Need to add support for PDC_PAT_IO "Get slot status" - OLAR support
+#warning FIXME add support for PDC_PAT_IO "Get slot status" - OLAR support
 #endif
 
 #ifdef PDC_PAT_BUG
Index: include/asm-parisc/pci.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/pci.h,v
retrieving revision 1.47
diff -u -p -r1.47 pci.h
--- include/asm-parisc/pci.h	2002/02/28 07:15:36	1.47
+++ include/asm-parisc/pci.h	2002/03/07 07:48:10
@@ -53,6 +53,7 @@ struct pci_hba_data {
 	struct resource bus_num;	/* PCI bus numbers */
 	struct resource io_space;	/* PIOP */
 	struct resource lmmio_space;	/* bus addresses < 4Gb */
+	struct resource elmmio_space;	/* additional bus addresses < 4Gb */
 	unsigned long   lmmio_space_offset;  /* CPU view - PCI view */
 	void *          iommu;          /* IOMMU this device is under */
 	/* REVISIT - spinlock to protect resources? */
