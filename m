From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Sun, 11 Jul 2004 18:12:46 -0600
Message-ID: <20040712001246.GD27835@colo.lackof.org>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040711233439.GX546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 11, 2004 at 04:34:39PM -0700, Randolph Chung wrote:
> i.e. (the progif write was removed since it's redundant):

Much nicer. Here's the cleaned up patch based on your code 
that I'd like to commit.

grant


Index: Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/Makefile,v
retrieving revision 1.220
diff -u -p -r1.220 Makefile
--- Makefile	11 Jul 2004 17:31:32 -0000	1.220
+++ Makefile	12 Jul 2004 00:07:49 -0000
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 7
-EXTRAVERSION = -pa13
+EXTRAVERSION = -pa14
 NAME=Zonked Quokka
 
 # *DOCUMENTATION*
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.9
diff -u -p -r1.9 superio.c
--- drivers/parisc/superio.c	18 May 2004 13:08:56 -0000	1.9
+++ drivers/parisc/superio.c	12 Jul 2004 00:07:49 -0000
@@ -483,6 +483,13 @@ void superio_fixup_pci(struct pci_dev *p
 
 	pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);
 	printk("PCI: Enabled native mode for NS87415 (pif=0x%x)\n", prog);
+
+	/* IODC clobbers the SuckyIO CTRL registers when we "search"
+	 * from BCH command line. Code below does the same.
+	 */
+	pci_write_config_byte(pdev, SIO_IDE_CTRL1, SIO_IDE_ATAPI_BUF);
+	pci_write_config_byte(pdev, SIO_IDE_CTRL2, 0x00);
+	pci_write_config_byte(pdev, SIO_IDE_CTRL3, 0x00);
 }
 
 /* Because of a defect in Super I/O, all reads of the PCI DMA status 
Index: include/asm-parisc/superio.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/superio.h,v
retrieving revision 1.4
diff -u -p -r1.4 superio.h
--- include/asm-parisc/superio.h	11 Mar 2004 05:41:54 -0000	1.4
+++ include/asm-parisc/superio.h	12 Jul 2004 00:07:49 -0000
@@ -12,6 +12,16 @@
 #define SIO_SP2BAR 0x98		/* Serial 2 BAR */
 #define SIO_PPBAR  0x9C		/* Parallel BAR */
 
+/* IDE (NS87415) CTRL registers */
+#define SIO_IDE_CTRL1  0x40	/* IDE Control Register 1 */
+#define   SIO_IDE_ATAPI_BUF 0xf0   /* "ATAPI buffer mode (no prefetching)" */
+#define SIO_IDE_CTRL2  0x41	/* IDE Control Register 2 */
+#define   SIO_IDE_CHAN1_IRQ 0x01   /* mask Channel 1 IRQ */
+#define   SIO_IDE_CHAN2_IRQ 0x02   /* mask Channel 2 IRQ */
+#define SIO_IDE_CTRL3  0x42	/* IDE Control Register 3 */
+#define   SIO_IDE_CHAN1_PREFETCH_ENB 0x01 /* Enable "Chan 1 Pre-fetch Buffer" */
+#define   SIO_IDE_CHAN2_PREFETCH_ENB 0x02
+
 #define TRIGGER_1  0x67		/* Edge/level trigger register 1 */
 #define TRIGGER_2  0x68		/* Edge/level trigger register 2 */
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
