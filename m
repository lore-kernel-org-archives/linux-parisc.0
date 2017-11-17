From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Various sparse patches for v4.16
Date: Fri, 17 Nov 2017 22:22:57 +0100
Message-ID: <20171117212257.GA19816@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 27c62baa9c4e..afe493b23d04 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -183,15 +183,15 @@ static inline unsigned char readb(const volatile void __iomem *addr)
 }
 static inline unsigned short readw(const volatile void __iomem *addr)
 {
-	return le16_to_cpu(__raw_readw(addr));
+	return le16_to_cpu((__le16 __force) __raw_readw(addr));
 }
 static inline unsigned int readl(const volatile void __iomem *addr)
 {
-	return le32_to_cpu(__raw_readl(addr));
+	return le32_to_cpu((__le32 __force) __raw_readl(addr));
 }
 static inline unsigned long long readq(const volatile void __iomem *addr)
 {
-	return le64_to_cpu(__raw_readq(addr));
+	return le64_to_cpu((__le64 __force) __raw_readq(addr));
 }
 
 static inline void writeb(unsigned char b, volatile void __iomem *addr)
@@ -200,15 +200,15 @@ static inline void writeb(unsigned char b, volatile void __iomem *addr)
 }
 static inline void writew(unsigned short w, volatile void __iomem *addr)
 {
-	__raw_writew(cpu_to_le16(w), addr);
+	__raw_writew((__u16 __force) cpu_to_le16(w), addr);
 }
 static inline void writel(unsigned int l, volatile void __iomem *addr)
 {
-	__raw_writel(cpu_to_le32(l), addr);
+	__raw_writel((__u32 __force) cpu_to_le32(l), addr);
 }
 static inline void writeq(unsigned long long q, volatile void __iomem *addr)
 {
-	__raw_writeq(cpu_to_le64(q), addr);
+	__raw_writeq((__u64 __force) cpu_to_le64(q), addr);
 }
 
 #define	readb	readb
diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index aa9f29b875de..49d8d53e50b7 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -91,7 +91,7 @@ struct gscps2port {
 	struct parisc_device *padev;
 	struct serio *port;
 	spinlock_t lock;
-	char *addr;
+	char __iomem *addr;
 	u8 act, append; /* position in buffer[] */
 	struct {
 		u8 data;
@@ -114,7 +114,7 @@ struct gscps2port {
  * wait_TBE() - wait for Transmit Buffer Empty
  */
 
-static int wait_TBE(char *addr)
+static int wait_TBE(char __iomem *addr)
 {
 	int timeout = 25000; /* device is expected to react within 250 msec */
 	while (gscps2_readb_status(addr) & GSC_STAT_TBNE) {
@@ -146,14 +146,14 @@ static void gscps2_flush(struct gscps2port *ps2port)
 static inline int gscps2_writeb_output(struct gscps2port *ps2port, u8 data)
 {
 	unsigned long flags;
-	char *addr = ps2port->addr;
+	char __iomem *addr = ps2port->addr;
 
 	if (!wait_TBE(addr)) {
 		printk(KERN_DEBUG PFX "timeout - could not write byte %#x\n", data);
 		return 0;
 	}
 
-	while (gscps2_readb_status(ps2port->addr) & GSC_STAT_RBNE)
+	while (gscps2_readb_status(addr) & GSC_STAT_RBNE)
 		/* wait */;
 
 	spin_lock_irqsave(&ps2port->lock, flags);
@@ -200,13 +200,12 @@ static void gscps2_enable(struct gscps2port *ps2port, int enable)
 
 static void gscps2_reset(struct gscps2port *ps2port)
 {
-	char *addr = ps2port->addr;
 	unsigned long flags;
 
 	/* reset the interface */
 	spin_lock_irqsave(&ps2port->lock, flags);
 	gscps2_flush(ps2port);
-	writeb(0xff, addr+GSC_RESET);
+	writeb(0xff, ps2port->addr + GSC_RESET);
 	gscps2_flush(ps2port);
 	spin_unlock_irqrestore(&ps2port->lock, flags);
 }
diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index ff1a332d76e4..0c6e8b44b4ed 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -176,7 +176,7 @@ static int led_proc_open(struct inode *inode, struct file *file)
 }
 
 
-static ssize_t led_proc_write(struct file *file, const char *buf,
+static ssize_t led_proc_write(struct file *file, const char __user *buf,
 	size_t count, loff_t *pos)
 {
 	void *data = PDE_DATA(file_inode(file));
@@ -250,7 +250,7 @@ static int __init led_create_procfs(void)
 
 	if (led_type == -1) return -1;
 
-	proc_pdc_root = proc_mkdir("pdc", 0);
+	proc_pdc_root = proc_mkdir("pdc", NULL);
 	if (!proc_pdc_root) return -1;
 
 	if (!lcd_no_led_support)
diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 5f710aaaf3da..190c0a7a1c52 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -256,7 +256,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 	}
 	priv->ctr = 0xc;
 	priv->ctr_writable = 0xff;
-	priv->dma_buf = 0;
+	priv->dma_buf = NULL;
 	priv->dma_handle = 0;
 	p->base = base;
 	p->base_hi = base_hi;
diff --git a/drivers/scsi/ncr53c8xx.h b/drivers/scsi/ncr53c8xx.h
index 02901c54b08b..5b75b5cb69c1 100644
--- a/drivers/scsi/ncr53c8xx.h
+++ b/drivers/scsi/ncr53c8xx.h
@@ -356,8 +356,8 @@
 
 #if	defined(__BIG_ENDIAN) && !defined(SCSI_NCR_BIG_ENDIAN)
 
-#define cpu_to_scr(dw)	cpu_to_le32(dw)
-#define scr_to_cpu(dw)	le32_to_cpu(dw)
+#define cpu_to_scr(dw)	((__u32 __force) cpu_to_le32(dw))
+#define scr_to_cpu(dw)	le32_to_cpu((__le32 __force)(dw))
 
 #elif	defined(__LITTLE_ENDIAN) && defined(SCSI_NCR_BIG_ENDIAN)
 
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 6ded5c198998..3c2e4cabc08f 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -527,7 +527,7 @@ rattlerSetupPlanes(struct stifb_info *fb)
 	fb->id = saved_id;
 
 	for (y = 0; y < fb->info.var.yres; ++y)
-		memset(fb->info.screen_base + y * fb->info.fix.line_length,
+		fb_memset(fb->info.screen_base + y * fb->info.fix.line_length,
 			0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
 
 	CRX24_SET_OVLY_MASK(fb);
