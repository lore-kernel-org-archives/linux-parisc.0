From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: 2.6.10-pa1 compile fails
Date: Wed, 29 Dec 2004 19:45:15 +0000
Message-ID: <41D3094B.4060206__41675.5593651489$1416624517$gmane$org@tiscali.be>
References: <Pine.LNX.4.21.0412291312230.15774-100000@hal.pp.fishpool.fi>	<41D2CF5D.3020801@tiscali.be>
	<20041229154533.GA8376@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------000002040600050003070403"
Cc: =?ISO-8859-1?Q?Martin-=C9ric_Ra?= =?ISO-8859-1?Q?cine?= <q-funk@iki.fi>,
 Joel Soete <joel.soete@tiscali.be>,
 debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041229154533.GA8376@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------000002040600050003070403
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Matthew Wilcox wrote:
> On Wed, Dec 29, 2004 at 03:38:05PM +0000, Joel Soete wrote:
> 
>>mmm don't have such error with gcc-3.3.5.
> 
> 
> We had this discussion two months ago.
> 
> http://lists.debian.org/debian-hppa/2004/10/msg00021.html
> 
Taken this into account, I move parport_gsc.h into drivers/parport and remove stuff from parport_gsc.c
(btw I add a gnu license to parport_gsc.h based on the one of parport_gsc.c ;-)

--- include/asm-parisc/parport_gsc.h.Orig	2004-12-29 16:17:31.110118022 +0100
+++ include/asm-parisc/parport_gsc.h	1970-01-01 01:00:00.000000000 +0100
@@ -1,193 +0,0 @@
-#ifndef __LINUX_PARPORT_GSC_H
-#define __LINUX_PARPORT_GSC_H
-
-#include <asm/io.h>
-#include <linux/delay.h>
-
-#undef	DEBUG_PARPORT	/* undefine for production */
-#define DELAY_TIME 	0
-
-#if DELAY_TIME == 0
-#define parport_readb	gsc_readb
-#define parport_writeb	gsc_writeb
-#else
-static __inline__ unsigned char parport_readb( unsigned long port )
-{
-    udelay(DELAY_TIME);
-    return gsc_readb(port);
-}
-
-static __inline__ void parport_writeb( unsigned char value, unsigned long port )
-{
-    gsc_writeb(value,port);
-    udelay(DELAY_TIME);
-}
-#endif
-
-/* --- register definitions ------------------------------- */
-
-#define EPPDATA(p)  ((p)->base    + 0x4)
-#define EPPADDR(p)  ((p)->base    + 0x3)
-#define CONTROL(p)  ((p)->base    + 0x2)
-#define STATUS(p)   ((p)->base    + 0x1)
-#define DATA(p)     ((p)->base    + 0x0)
-
-struct parport_gsc_private {
-	/* Contents of CTR. */
-	unsigned char ctr;
-
-	/* Bitmask of writable CTR bits. */
-	unsigned char ctr_writable;
-
-	/* Number of bytes per portword. */
-	int pword;
-
-	/* Not used yet. */
-	int readIntrThreshold;
-	int writeIntrThreshold;
-
-	/* buffer suitable for DMA, if DMA enabled */
-	char *dma_buf;
-	dma_addr_t dma_handle;
-	struct pci_dev *dev;
-};
-
-extern __inline__ void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
-#endif
-	parport_writeb(d, DATA(p));
-}
-
-extern __inline__ unsigned char parport_gsc_read_data(struct parport *p)
-{
-	unsigned char val = parport_readb (DATA (p));
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG "parport_gsc_read_data(%p) = 0x%02x\n",
-		p, val);
-#endif
-	return val;
-}
-
-/* __parport_gsc_frob_control differs from parport_gsc_frob_control in that
- * it doesn't do any extra masking. */
-static __inline__ unsigned char __parport_gsc_frob_control (struct parport *p,
-							   unsigned char mask,
-							   unsigned char val)
-{
-	struct parport_gsc_private *priv = p->physport->private_data;
-	unsigned char ctr = priv->ctr;
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG
-		"__parport_gsc_frob_control(%02x,%02x): %02x -> %02x\n",
-		mask, val, ctr, ((ctr & ~mask) ^ val) & priv->ctr_writable);
-#endif
-	ctr = (ctr & ~mask) ^ val;
-	ctr &= priv->ctr_writable; /* only write writable bits. */
-	parport_writeb (ctr, CONTROL (p));
-	priv->ctr = ctr;	/* Update soft copy */
-	return ctr;
-}
-
-extern __inline__ void parport_gsc_data_reverse (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x20);
-}
-
-extern __inline__ void parport_gsc_data_forward (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x00);
-}
-
-extern __inline__ void parport_gsc_write_control (struct parport *p,
-						 unsigned char d)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to newer interface. */
-	if (d & 0x20) {
-		printk (KERN_DEBUG "%s (%s): use data_reverse for this!\n",
-			p->name, p->cad->name);
-		parport_gsc_data_reverse (p);
-	}
-
-	__parport_gsc_frob_control (p, wm, d & wm);
-}
-
-extern __inline__ unsigned char parport_gsc_read_control(struct parport *p)
-{
-	const unsigned char rm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-	const struct parport_gsc_private *priv = p->physport->private_data;
-	return priv->ctr & rm; /* Use soft copy */
-}
-
-extern __inline__ unsigned char parport_gsc_frob_control (struct parport *p,
-							 unsigned char mask,
-							 unsigned char val)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to newer interface. */
-	if (mask & 0x20) {
-		printk (KERN_DEBUG "%s (%s): use data_%s for this!\n",
-			p->name, p->cad->name,
-			(val & 0x20) ? "reverse" : "forward");
-		if (val & 0x20)
-			parport_gsc_data_reverse (p);
-		else
-			parport_gsc_data_forward (p);
-	}
-
-	/* Restrict mask and val to control lines. */
-	mask &= wm;
-	val &= wm;
-
-	return __parport_gsc_frob_control (p, mask, val);
-}
-
-extern __inline__ unsigned char parport_gsc_read_status(struct parport *p)
-{
-	return parport_readb (STATUS(p));
-}
-
-
-extern __inline__ void parport_gsc_disable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x00);
-}
-
-extern __inline__ void parport_gsc_enable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x10);
-}
-
-extern void parport_gsc_release_resources(struct parport *p);
-
-extern int parport_gsc_claim_resources(struct parport *p);
-
-extern void parport_gsc_init_state(struct pardevice *, struct parport_state *s);
-
-extern void parport_gsc_save_state(struct parport *p, struct parport_state *s);
-
-extern void parport_gsc_restore_state(struct parport *p, struct parport_state *s);
-
-extern void parport_gsc_inc_use_count(void);
-
-extern void parport_gsc_dec_use_count(void);
-
-extern struct parport *parport_gsc_probe_port (unsigned long base,
-					      unsigned long base_hi,
-					      int irq, int dma,
-					      struct pci_dev *dev);
-
-#endif
--- drivers/parport/parport_gsc.h.Orig	1970-01-01 01:00:00.000000000 +0100
+++ drivers/parport/parport_gsc.h	2004-12-29 20:25:09.872226309 +0100
@@ -0,0 +1,222 @@
+/*
+ *	Low-level parallel-support for PC-style hardware integrated in the
+ *	LASI-Controller (on GSC-Bus) for HP-PARISC Workstations
+ *
+ *	(C) 1999-2001 by Helge Deller <deller@gmx.de>
+ *
+ *
+ *	This program is free software; you can redistribute it and/or modify
+ *	it under the terms of the GNU General Public License as published by
+ *	the Free Software Foundation; either version 2 of the License, or
+ *	(at your option) any later version.
+ *
+ *	This program is distributed in the hope that it will be useful,
+ *	but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *	GNU General Public License for more details.
+ *
+ *	You should have received a copy of the GNU General Public License
+ *	along with this program; if not, write to the Free Software
+ *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * based on parport_pc.c by
+ * 	    Grant Guenther <grant@torque.net>
+ * 	    Phil Blundell <Philip.Blundell@pobox.com>
+ *          Tim Waugh <tim@cyberelk.demon.co.uk>
+ *	    Jose Renau <renau@acm.org>
+ *          David Campbell <campbell@torque.net>
+ *          Andrea Arcangeli
+ */
+
+#ifndef	__DRIVERS_PARPORT_PARPORT_GSC_H
+#define	__DRIVERS_PARPORT_PARPORT_GSC_H
+
+#include <asm/io.h>
+#include <linux/delay.h>
+
+#undef	DEBUG_PARPORT	/* undefine for production */
+#define DELAY_TIME 	0
+
+#if DELAY_TIME == 0
+#define parport_readb	gsc_readb
+#define parport_writeb	gsc_writeb
+#else
+static __inline__ unsigned char parport_readb( unsigned long port )
+{
+    udelay(DELAY_TIME);
+    return gsc_readb(port);
+}
+
+static __inline__ void parport_writeb( unsigned char value, unsigned long port )
+{
+    gsc_writeb(value,port);
+    udelay(DELAY_TIME);
+}
+#endif
+
+/* --- register definitions ------------------------------- */
+
+#define EPPDATA(p)  ((p)->base    + 0x4)
+#define EPPADDR(p)  ((p)->base    + 0x3)
+#define CONTROL(p)  ((p)->base    + 0x2)
+#define STATUS(p)   ((p)->base    + 0x1)
+#define DATA(p)     ((p)->base    + 0x0)
+
+struct parport_gsc_private {
+	/* Contents of CTR. */
+	unsigned char ctr;
+
+	/* Bitmask of writable CTR bits. */
+	unsigned char ctr_writable;
+
+	/* Number of bytes per portword. */
+	int pword;
+
+	/* Not used yet. */
+	int readIntrThreshold;
+	int writeIntrThreshold;
+
+	/* buffer suitable for DMA, if DMA enabled */
+	char *dma_buf;
+	dma_addr_t dma_handle;
+	struct pci_dev *dev;
+};
+
+static inline void parport_gsc_write_data(struct parport *p, unsigned char d)
+{
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
+#endif
+	parport_writeb(d, DATA(p));
+}
+
+static inline unsigned char parport_gsc_read_data(struct parport *p)
+{
+	unsigned char val = parport_readb (DATA (p));
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG "parport_gsc_read_data(%p) = 0x%02x\n",
+		p, val);
+#endif
+	return val;
+}
+
+/* __parport_gsc_frob_control differs from parport_gsc_frob_control in that
+ * it doesn't do any extra masking. */
+static inline unsigned char __parport_gsc_frob_control(struct parport *p,
+							unsigned char mask,
+							unsigned char val)
+{
+	struct parport_gsc_private *priv = p->physport->private_data;
+	unsigned char ctr = priv->ctr;
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG
+		"__parport_gsc_frob_control(%02x,%02x): %02x -> %02x\n",
+		mask, val, ctr, ((ctr & ~mask) ^ val) & priv->ctr_writable);
+#endif
+	ctr = (ctr & ~mask) ^ val;
+	ctr &= priv->ctr_writable; /* only write writable bits. */
+	parport_writeb (ctr, CONTROL (p));
+	priv->ctr = ctr;	/* Update soft copy */
+	return ctr;
+}
+
+static inline void parport_gsc_data_reverse(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x20, 0x20);
+}
+
+static inline void parport_gsc_data_forward(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x20, 0x00);
+}
+
+static inline void parport_gsc_write_control(struct parport *p,
+						 unsigned char d)
+{
+	const unsigned char wm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+
+	/* Take this out when drivers have adapted to newer interface. */
+	if (d & 0x20) {
+		printk (KERN_DEBUG "%s (%s): use data_reverse for this!\n",
+			p->name, p->cad->name);
+		parport_gsc_data_reverse (p);
+	}
+
+	__parport_gsc_frob_control (p, wm, d & wm);
+}
+
+static inline unsigned char parport_gsc_read_control(struct parport *p)
+{
+	const unsigned char rm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+	const struct parport_gsc_private *priv = p->physport->private_data;
+	return priv->ctr & rm; /* Use soft copy */
+}
+
+static inline unsigned char parport_gsc_frob_control(struct parport *p,
+							unsigned char mask,
+							unsigned char val)
+{
+	const unsigned char wm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+
+	/* Take this out when drivers have adapted to newer interface. */
+	if (mask & 0x20) {
+		printk (KERN_DEBUG "%s (%s): use data_%s for this!\n",
+			p->name, p->cad->name,
+			(val & 0x20) ? "reverse" : "forward");
+		if (val & 0x20)
+			parport_gsc_data_reverse (p);
+		else
+			parport_gsc_data_forward (p);
+	}
+
+	/* Restrict mask and val to control lines. */
+	mask &= wm;
+	val &= wm;
+
+	return __parport_gsc_frob_control (p, mask, val);
+}
+
+static inline unsigned char parport_gsc_read_status(struct parport *p)
+{
+	return parport_readb (STATUS(p));
+}
+
+static inline void parport_gsc_disable_irq(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x10, 0x00);
+}
+
+static inline void parport_gsc_enable_irq(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x10, 0x10);
+}
+
+extern void parport_gsc_release_resources(struct parport *p);
+
+extern int parport_gsc_claim_resources(struct parport *p);
+
+extern void parport_gsc_init_state(struct pardevice *, struct parport_state *s);
+
+extern void parport_gsc_save_state(struct parport *p, struct parport_state *s);
+
+extern void parport_gsc_restore_state(struct parport *p, struct parport_state *s);
+
+extern void parport_gsc_inc_use_count(void);
+
+extern void parport_gsc_dec_use_count(void);
+
+extern struct parport *parport_gsc_probe_port(unsigned long base,
+						unsigned long base_hi,
+						int irq, int dma,
+						struct pci_dev *dev);
+
+#endif	/* __DRIVERS_PARPORT_PARPORT_GSC_H */
--- drivers/parport/parport_gsc.c.Orig	2004-12-29 13:11:41.371485993 +0100
+++ drivers/parport/parport_gsc.c	2004-12-29 20:07:39.873552874 +0100
@@ -42,7 +42,7 @@
  #include <asm/pdc.h>
  #include <asm/parisc-device.h>
  #include <asm/hardware.h>
-#include <asm/parport_gsc.h>
+#include "parport_gsc.h"


  MODULE_AUTHOR("Helge Deller <deller@gmx.de>");
@@ -87,95 +87,6 @@
  	return IRQ_HANDLED;
  }

-void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-	parport_writeb (d, DATA (p));
-}
-
-unsigned char parport_gsc_read_data(struct parport *p)
-{
-	unsigned char c = parport_readb (DATA (p));
-	return c;
-}
-
-void parport_gsc_write_control(struct parport *p, unsigned char d)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to the newer interface. */
-	if (d & 0x20) {
-		pr_debug("%s (%s): use data_reverse for this!\n",
-			    p->name, p->cad->name);
-		parport_gsc_data_reverse (p);
-	}
-
-	__parport_gsc_frob_control (p, wm, d & wm);
-}
-
-unsigned char parport_gsc_read_control(struct parport *p)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-	const struct parport_gsc_private *priv = p->physport->private_data;
-	return priv->ctr & wm; /* Use soft copy */
-}
-
-unsigned char parport_gsc_frob_control (struct parport *p, unsigned char mask,
-				       unsigned char val)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to the newer interface. */
-	if (mask & 0x20) {
-		pr_debug("%s (%s): use data_%s for this!\n",
-			p->name, p->cad->name,
-			(val & 0x20) ? "reverse" : "forward");
-		if (val & 0x20)
-			parport_gsc_data_reverse (p);
-		else
-			parport_gsc_data_forward (p);
-	}
-
-	/* Restrict mask and val to control lines. */
-	mask &= wm;
-	val &= wm;
-
-	return __parport_gsc_frob_control (p, mask, val);
-}
-
-unsigned char parport_gsc_read_status(struct parport *p)
-{
-	return parport_readb (STATUS (p));
-}
-
-void parport_gsc_disable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0);
-}
-
-void parport_gsc_enable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x10);
-}
-
-void parport_gsc_data_forward (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0);
-}
-
-void parport_gsc_data_reverse (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x20);
-}
-
  void parport_gsc_init_state(struct pardevice *dev, struct parport_state *s)
  {
  	s->u.pc.ctr = 0xc | (dev->irq_func ? 0x10 : 0x0);
=========><=========

(I just test it with gcc-3.4.3-6 kernel compiles well)

hth,
	Joel

PS: Also joined patch files in case of bad wraping

--------------000002040600050003070403
Content-Type: text/plain;
 name="drivers_parport_parport_gsc.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers_parport_parport_gsc.c.diff"

--- drivers/parport/parport_gsc.c.Orig	2004-12-29 13:11:41.371485993 +0100
+++ drivers/parport/parport_gsc.c	2004-12-29 20:07:39.873552874 +0100
@@ -42,7 +42,7 @@
 #include <asm/pdc.h>
 #include <asm/parisc-device.h>
 #include <asm/hardware.h>
-#include <asm/parport_gsc.h>
+#include "parport_gsc.h"
 
 
 MODULE_AUTHOR("Helge Deller <deller@gmx.de>");
@@ -87,95 +87,6 @@
 	return IRQ_HANDLED;
 }
 
-void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-	parport_writeb (d, DATA (p));
-}
-
-unsigned char parport_gsc_read_data(struct parport *p)
-{
-	unsigned char c = parport_readb (DATA (p));
-	return c;
-}
-
-void parport_gsc_write_control(struct parport *p, unsigned char d)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to the newer interface. */
-	if (d & 0x20) {
-		pr_debug("%s (%s): use data_reverse for this!\n",
-			    p->name, p->cad->name);
-		parport_gsc_data_reverse (p);
-	}
-
-	__parport_gsc_frob_control (p, wm, d & wm);
-}
-
-unsigned char parport_gsc_read_control(struct parport *p)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-	const struct parport_gsc_private *priv = p->physport->private_data;
-	return priv->ctr & wm; /* Use soft copy */
-}
-
-unsigned char parport_gsc_frob_control (struct parport *p, unsigned char mask,
-				       unsigned char val)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to the newer interface. */
-	if (mask & 0x20) {
-		pr_debug("%s (%s): use data_%s for this!\n",
-			p->name, p->cad->name,
-			(val & 0x20) ? "reverse" : "forward");
-		if (val & 0x20)
-			parport_gsc_data_reverse (p);
-		else
-			parport_gsc_data_forward (p);
-	}
-
-	/* Restrict mask and val to control lines. */
-	mask &= wm;
-	val &= wm;
-
-	return __parport_gsc_frob_control (p, mask, val);
-}
-
-unsigned char parport_gsc_read_status(struct parport *p)
-{
-	return parport_readb (STATUS (p));
-}
-
-void parport_gsc_disable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0);
-}
-
-void parport_gsc_enable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x10);
-}
-
-void parport_gsc_data_forward (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0);
-}
-
-void parport_gsc_data_reverse (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x20);
-}
-
 void parport_gsc_init_state(struct pardevice *dev, struct parport_state *s)
 {
 	s->u.pc.ctr = 0xc | (dev->irq_func ? 0x10 : 0x0);

--------------000002040600050003070403
Content-Type: text/plain;
 name="include_asm-parisc_parport_gsc.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="include_asm-parisc_parport_gsc.h.diff"

--- include/asm-parisc/parport_gsc.h.Orig	2004-12-29 16:17:31.110118022 +0100
+++ include/asm-parisc/parport_gsc.h	1970-01-01 01:00:00.000000000 +0100
@@ -1,193 +0,0 @@
-#ifndef __LINUX_PARPORT_GSC_H
-#define __LINUX_PARPORT_GSC_H
-
-#include <asm/io.h>
-#include <linux/delay.h>
-
-#undef	DEBUG_PARPORT	/* undefine for production */
-#define DELAY_TIME 	0
-
-#if DELAY_TIME == 0
-#define parport_readb	gsc_readb
-#define parport_writeb	gsc_writeb
-#else
-static __inline__ unsigned char parport_readb( unsigned long port )
-{
-    udelay(DELAY_TIME);
-    return gsc_readb(port);
-}
-
-static __inline__ void parport_writeb( unsigned char value, unsigned long port )
-{
-    gsc_writeb(value,port);
-    udelay(DELAY_TIME);
-}
-#endif
-
-/* --- register definitions ------------------------------- */
-
-#define EPPDATA(p)  ((p)->base    + 0x4)
-#define EPPADDR(p)  ((p)->base    + 0x3)
-#define CONTROL(p)  ((p)->base    + 0x2)
-#define STATUS(p)   ((p)->base    + 0x1)
-#define DATA(p)     ((p)->base    + 0x0)
-
-struct parport_gsc_private {
-	/* Contents of CTR. */
-	unsigned char ctr;
-
-	/* Bitmask of writable CTR bits. */
-	unsigned char ctr_writable;
-
-	/* Number of bytes per portword. */
-	int pword;
-
-	/* Not used yet. */
-	int readIntrThreshold;
-	int writeIntrThreshold;
-
-	/* buffer suitable for DMA, if DMA enabled */
-	char *dma_buf;
-	dma_addr_t dma_handle;
-	struct pci_dev *dev;
-};
-
-extern __inline__ void parport_gsc_write_data(struct parport *p, unsigned char d)
-{
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
-#endif
-	parport_writeb(d, DATA(p));
-}
-
-extern __inline__ unsigned char parport_gsc_read_data(struct parport *p)
-{
-	unsigned char val = parport_readb (DATA (p));
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG "parport_gsc_read_data(%p) = 0x%02x\n",
-		p, val);
-#endif
-	return val;
-}
-
-/* __parport_gsc_frob_control differs from parport_gsc_frob_control in that
- * it doesn't do any extra masking. */
-static __inline__ unsigned char __parport_gsc_frob_control (struct parport *p,
-							   unsigned char mask,
-							   unsigned char val)
-{
-	struct parport_gsc_private *priv = p->physport->private_data;
-	unsigned char ctr = priv->ctr;
-#ifdef DEBUG_PARPORT
-	printk (KERN_DEBUG
-		"__parport_gsc_frob_control(%02x,%02x): %02x -> %02x\n",
-		mask, val, ctr, ((ctr & ~mask) ^ val) & priv->ctr_writable);
-#endif
-	ctr = (ctr & ~mask) ^ val;
-	ctr &= priv->ctr_writable; /* only write writable bits. */
-	parport_writeb (ctr, CONTROL (p));
-	priv->ctr = ctr;	/* Update soft copy */
-	return ctr;
-}
-
-extern __inline__ void parport_gsc_data_reverse (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x20);
-}
-
-extern __inline__ void parport_gsc_data_forward (struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x20, 0x00);
-}
-
-extern __inline__ void parport_gsc_write_control (struct parport *p,
-						 unsigned char d)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to newer interface. */
-	if (d & 0x20) {
-		printk (KERN_DEBUG "%s (%s): use data_reverse for this!\n",
-			p->name, p->cad->name);
-		parport_gsc_data_reverse (p);
-	}
-
-	__parport_gsc_frob_control (p, wm, d & wm);
-}
-
-extern __inline__ unsigned char parport_gsc_read_control(struct parport *p)
-{
-	const unsigned char rm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-	const struct parport_gsc_private *priv = p->physport->private_data;
-	return priv->ctr & rm; /* Use soft copy */
-}
-
-extern __inline__ unsigned char parport_gsc_frob_control (struct parport *p,
-							 unsigned char mask,
-							 unsigned char val)
-{
-	const unsigned char wm = (PARPORT_CONTROL_STROBE |
-				  PARPORT_CONTROL_AUTOFD |
-				  PARPORT_CONTROL_INIT |
-				  PARPORT_CONTROL_SELECT);
-
-	/* Take this out when drivers have adapted to newer interface. */
-	if (mask & 0x20) {
-		printk (KERN_DEBUG "%s (%s): use data_%s for this!\n",
-			p->name, p->cad->name,
-			(val & 0x20) ? "reverse" : "forward");
-		if (val & 0x20)
-			parport_gsc_data_reverse (p);
-		else
-			parport_gsc_data_forward (p);
-	}
-
-	/* Restrict mask and val to control lines. */
-	mask &= wm;
-	val &= wm;
-
-	return __parport_gsc_frob_control (p, mask, val);
-}
-
-extern __inline__ unsigned char parport_gsc_read_status(struct parport *p)
-{
-	return parport_readb (STATUS(p));
-}
-
-
-extern __inline__ void parport_gsc_disable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x00);
-}
-
-extern __inline__ void parport_gsc_enable_irq(struct parport *p)
-{
-	__parport_gsc_frob_control (p, 0x10, 0x10);
-}
-
-extern void parport_gsc_release_resources(struct parport *p);
-
-extern int parport_gsc_claim_resources(struct parport *p);
-
-extern void parport_gsc_init_state(struct pardevice *, struct parport_state *s);
-
-extern void parport_gsc_save_state(struct parport *p, struct parport_state *s);
-
-extern void parport_gsc_restore_state(struct parport *p, struct parport_state *s);
-
-extern void parport_gsc_inc_use_count(void);
-
-extern void parport_gsc_dec_use_count(void);
-
-extern struct parport *parport_gsc_probe_port (unsigned long base,
-					      unsigned long base_hi,
-					      int irq, int dma,
-					      struct pci_dev *dev);
-
-#endif

--------------000002040600050003070403
Content-Type: text/plain;
 name="drivers_parport_parport_gsc.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers_parport_parport_gsc.h.diff"

--- drivers/parport/parport_gsc.h.Orig	1970-01-01 01:00:00.000000000 +0100
+++ drivers/parport/parport_gsc.h	2004-12-29 20:25:09.872226309 +0100
@@ -0,0 +1,222 @@
+/*
+ *	Low-level parallel-support for PC-style hardware integrated in the 
+ *	LASI-Controller (on GSC-Bus) for HP-PARISC Workstations
+ *
+ *	(C) 1999-2001 by Helge Deller <deller@gmx.de>
+ *
+ *
+ *	This program is free software; you can redistribute it and/or modify
+ *	it under the terms of the GNU General Public License as published by
+ *	the Free Software Foundation; either version 2 of the License, or
+ *	(at your option) any later version.
+ *
+ *	This program is distributed in the hope that it will be useful,
+ *	but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *	GNU General Public License for more details.
+ *
+ *	You should have received a copy of the GNU General Public License
+ *	along with this program; if not, write to the Free Software
+ *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ * 
+ * based on parport_pc.c by 
+ * 	    Grant Guenther <grant@torque.net>
+ * 	    Phil Blundell <Philip.Blundell@pobox.com>
+ *          Tim Waugh <tim@cyberelk.demon.co.uk>
+ *	    Jose Renau <renau@acm.org>
+ *          David Campbell <campbell@torque.net>
+ *          Andrea Arcangeli
+ */
+
+#ifndef	__DRIVERS_PARPORT_PARPORT_GSC_H
+#define	__DRIVERS_PARPORT_PARPORT_GSC_H
+
+#include <asm/io.h>
+#include <linux/delay.h>
+
+#undef	DEBUG_PARPORT	/* undefine for production */
+#define DELAY_TIME 	0
+
+#if DELAY_TIME == 0
+#define parport_readb	gsc_readb
+#define parport_writeb	gsc_writeb
+#else
+static __inline__ unsigned char parport_readb( unsigned long port )
+{
+    udelay(DELAY_TIME);
+    return gsc_readb(port);
+}
+
+static __inline__ void parport_writeb( unsigned char value, unsigned long port )
+{
+    gsc_writeb(value,port);
+    udelay(DELAY_TIME);
+}
+#endif
+
+/* --- register definitions ------------------------------- */
+
+#define EPPDATA(p)  ((p)->base    + 0x4)
+#define EPPADDR(p)  ((p)->base    + 0x3)
+#define CONTROL(p)  ((p)->base    + 0x2)
+#define STATUS(p)   ((p)->base    + 0x1)
+#define DATA(p)     ((p)->base    + 0x0)
+
+struct parport_gsc_private {
+	/* Contents of CTR. */
+	unsigned char ctr;
+
+	/* Bitmask of writable CTR bits. */
+	unsigned char ctr_writable;
+
+	/* Number of bytes per portword. */
+	int pword;
+
+	/* Not used yet. */
+	int readIntrThreshold;
+	int writeIntrThreshold;
+
+	/* buffer suitable for DMA, if DMA enabled */
+	char *dma_buf;
+	dma_addr_t dma_handle;
+	struct pci_dev *dev;
+};
+
+static inline void parport_gsc_write_data(struct parport *p, unsigned char d)
+{
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG "parport_gsc_write_data(%p,0x%02x)\n", p, d);
+#endif
+	parport_writeb(d, DATA(p));
+}
+
+static inline unsigned char parport_gsc_read_data(struct parport *p)
+{
+	unsigned char val = parport_readb (DATA (p));
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG "parport_gsc_read_data(%p) = 0x%02x\n",
+		p, val);
+#endif
+	return val;
+}
+
+/* __parport_gsc_frob_control differs from parport_gsc_frob_control in that
+ * it doesn't do any extra masking. */
+static inline unsigned char __parport_gsc_frob_control(struct parport *p,
+							unsigned char mask,
+							unsigned char val)
+{
+	struct parport_gsc_private *priv = p->physport->private_data;
+	unsigned char ctr = priv->ctr;
+#ifdef DEBUG_PARPORT
+	printk (KERN_DEBUG
+		"__parport_gsc_frob_control(%02x,%02x): %02x -> %02x\n",
+		mask, val, ctr, ((ctr & ~mask) ^ val) & priv->ctr_writable);
+#endif
+	ctr = (ctr & ~mask) ^ val;
+	ctr &= priv->ctr_writable; /* only write writable bits. */
+	parport_writeb (ctr, CONTROL (p));
+	priv->ctr = ctr;	/* Update soft copy */
+	return ctr;
+}
+
+static inline void parport_gsc_data_reverse(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x20, 0x20);
+}
+
+static inline void parport_gsc_data_forward(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x20, 0x00);
+}
+
+static inline void parport_gsc_write_control(struct parport *p,
+						 unsigned char d)
+{
+	const unsigned char wm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+
+	/* Take this out when drivers have adapted to newer interface. */
+	if (d & 0x20) {
+		printk (KERN_DEBUG "%s (%s): use data_reverse for this!\n",
+			p->name, p->cad->name);
+		parport_gsc_data_reverse (p);
+	}
+
+	__parport_gsc_frob_control (p, wm, d & wm);
+}
+
+static inline unsigned char parport_gsc_read_control(struct parport *p)
+{
+	const unsigned char rm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+	const struct parport_gsc_private *priv = p->physport->private_data;
+	return priv->ctr & rm; /* Use soft copy */
+}
+
+static inline unsigned char parport_gsc_frob_control(struct parport *p,
+							unsigned char mask,
+							unsigned char val)
+{
+	const unsigned char wm = (PARPORT_CONTROL_STROBE |
+				  PARPORT_CONTROL_AUTOFD |
+				  PARPORT_CONTROL_INIT |
+				  PARPORT_CONTROL_SELECT);
+
+	/* Take this out when drivers have adapted to newer interface. */
+	if (mask & 0x20) {
+		printk (KERN_DEBUG "%s (%s): use data_%s for this!\n",
+			p->name, p->cad->name,
+			(val & 0x20) ? "reverse" : "forward");
+		if (val & 0x20)
+			parport_gsc_data_reverse (p);
+		else
+			parport_gsc_data_forward (p);
+	}
+
+	/* Restrict mask and val to control lines. */
+	mask &= wm;
+	val &= wm;
+
+	return __parport_gsc_frob_control (p, mask, val);
+}
+
+static inline unsigned char parport_gsc_read_status(struct parport *p)
+{
+	return parport_readb (STATUS(p));
+}
+
+static inline void parport_gsc_disable_irq(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x10, 0x00);
+}
+
+static inline void parport_gsc_enable_irq(struct parport *p)
+{
+	__parport_gsc_frob_control (p, 0x10, 0x10);
+}
+
+extern void parport_gsc_release_resources(struct parport *p);
+
+extern int parport_gsc_claim_resources(struct parport *p);
+
+extern void parport_gsc_init_state(struct pardevice *, struct parport_state *s);
+
+extern void parport_gsc_save_state(struct parport *p, struct parport_state *s);
+
+extern void parport_gsc_restore_state(struct parport *p, struct parport_state *s);
+
+extern void parport_gsc_inc_use_count(void);
+
+extern void parport_gsc_dec_use_count(void);
+
+extern struct parport *parport_gsc_probe_port(unsigned long base,
+						unsigned long base_hi,
+						int irq, int dma,
+						struct pci_dev *dev);
+
+#endif	/* __DRIVERS_PARPORT_PARPORT_GSC_H */

--------------000002040600050003070403
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------000002040600050003070403--
