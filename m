From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: [parisc-linux] [PATCH] tiny iosapic abstraction
Date: Mon, 28 Jun 2004 12:57:06 -0600
Message-ID: <200406281257.06793.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
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

Introduce a tiny bit of abstraction to parisc iosapic.c.

This makes more obvious the two reads to flush previous writes to the
hardware in iosapic_wr_irt_entry().  ia64 does neither one (perhaps
because we don't share vectors yet).  But even if the flush is really
needed on parisc, wouldn't only the second be needed, i.e.:

+	iosapic_write(isp->isi_hpa, IOSAPIC_IRDT_ENTRY(vi->irqline), dp0);
+	iosapic_write(isp->isi_hpa, IOSAPIC_IRDT_ENTRY_HI(vi->irqline), dp1);
	/* Read the window register to flush the writes down to HW  */
 	dp1 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);

--- linux-2.6.7-pa1-iosapic/drivers/parisc/iosapic.c.orig	Fri Jun 25 15:19:46 2004
+++ linux-2.6.7-pa1-iosapic/drivers/parisc/iosapic.c	Fri Jun 25 16:12:45 2004
@@ -233,6 +233,18 @@
 #define IOSAPIC_IRDT_ENTRY(idx)		(0x10+(idx)*2)
 #define IOSAPIC_IRDT_ENTRY_HI(idx)	(0x11+(idx)*2)
 
+static inline unsigned int iosapic_read(unsigned long iosapic, unsigned int reg)
+{
+	writel(reg, iosapic + IOSAPIC_REG_SELECT);
+	return readl(iosapic + IOSAPIC_REG_WINDOW);
+}
+
+static inline void iosapic_write(unsigned long iosapic, unsigned int reg, u32 val)
+{
+	writel(reg, iosapic + IOSAPIC_REG_SELECT);
+	writel(val, iosapic + IOSAPIC_REG_WINDOW);
+}
+
 /*
 **     GFP_KERNEL includes __GFP_WAIT flag and that may not
 **     be acceptable. Since this is boot time, we shouldn't have
@@ -718,13 +730,8 @@
 	struct iosapic_info *isp = vi->iosapic;
 	u8 idx = vi->irqline;
 
-	/* point the window register to the lower word */
-	writel(IOSAPIC_IRDT_ENTRY(idx), isp->isi_hpa+IOSAPIC_REG_SELECT);
-	*dp0 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);
-
-	/* point the window register to the higher word */
-	writel(IOSAPIC_IRDT_ENTRY_HI(idx), isp->isi_hpa+IOSAPIC_REG_SELECT);
-	*dp1 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);
+	*dp0 = iosapic_read(isp->isi_hpa, IOSAPIC_IRDT_ENTRY(idx));
+	*dp1 = iosapic_read(isp->isi_hpa, IOSAPIC_IRDT_ENTRY_HI(idx));
 }
 
 
@@ -740,16 +747,12 @@
 		isp->isi_hpa,
 		dp0, dp1);
 
-	/* point the window register to the lower word */
-	writel(IOSAPIC_IRDT_ENTRY(vi->irqline), isp->isi_hpa+IOSAPIC_REG_SELECT);
-	writel( dp0, isp->isi_hpa+IOSAPIC_REG_WINDOW);
+	iosapic_write(isp->isi_hpa, IOSAPIC_IRDT_ENTRY(vi->irqline), dp0);
 
 	/* Read the window register to flush the writes down to HW  */
 	dp0 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);
 
-	/* point the window register to the higher word */
-	writel(IOSAPIC_IRDT_ENTRY_HI(vi->irqline), isp->isi_hpa+IOSAPIC_REG_SELECT);
-	writel( dp1, isp->isi_hpa+IOSAPIC_REG_WINDOW);
+	iosapic_write(isp->isi_hpa, IOSAPIC_IRDT_ENTRY_HI(vi->irqline), dp1);
 
 	/* Read the window register to flush the writes down to HW  */
 	dp1 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);
@@ -881,11 +884,7 @@
 	struct iosapic_info *isp = vi->iosapic;
 
 	for (d0=0x10; d0<0x1e; d0++) {
-		/* point the window register to the lower word */
-		writel(d0, isp->isi_hpa+IOSAPIC_REG_SELECT);
-
-		/* read the word */
-		d1 = readl(isp->isi_hpa+IOSAPIC_REG_WINDOW);
+		d1 = iosapic_read(isp->isi_hpa, d0);
 		printk(" %x", d1);
 	}
 }
@@ -933,11 +932,7 @@
 	ASSERT(isi);
 	ASSERT(isi->isi_hpa);
 
-	/* point window to the version register */
-	writel(IOSAPIC_REG_VERSION, isi->isi_hpa+IOSAPIC_REG_SELECT);
