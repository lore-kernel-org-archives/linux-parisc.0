Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 413E84829
	for <parisc-linux@parisc-linux.org>; Fri,  1 Nov 2002 06:18:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 187bgo-0004n2-00
	for parisc-linux@parisc-linux.org; Fri, 01 Nov 2002 13:18:18 +0000
Date: Fri, 1 Nov 2002 13:18:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021101131818.S27461@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SCSI patches
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

In the continuing mission to send our patches upstream... here's the sum
total of our SCSI patches.  As you can see there's not _much_ compared
to what we used to have ... but some of it looks a little fishy (did
MIPS really add support for PA-RISC?  ;-)

Anyway, I don't feel confident sending this upstream myself -- I don't
understand most of the changes, and wouldn't feel happy defending them.
Can I have a volunteer who does grok these scsi changes to send them
upstream?

diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/Kconfig parisc-2.5/drivers/scsi/Kconfig
--- linus-2.5/drivers/scsi/Kconfig	Thu Oct 31 10:27:51 2002
+++ parisc-2.5/drivers/scsi/Kconfig	Thu Oct 31 16:30:09 2002
@@ -993,6 +993,16 @@ config SCSI_SYM53C8XX_2
 	  Please read <file:drivers/scsi/sym53c8xx_2/Documentation.txt> for more
 	  information.
 
+config SCSI_ZALON
+	tristate "Zalon SCSI support"
+	depends on GSC && SCSI && SCSI_SYM53C8XX_2!=y
+	help
+	  The Zalon is a GSC/HSC bus interface chip that sits between the
+	  PA-RISC processor and the NCR 53c720 SCSI controller on C100,
+	  C110, J200, J210 and some D, K & R-class machines.  It's also
+	  used on the add-in Bluefish, Barracuda & Shrike SCSI cards.
+	  Say Y here if you have one of these machines or cards.
+
 config SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
 	int "DMA addressing mode"
 	depends on SCSI_SYM53C8XX_2
@@ -1097,7 +1107,7 @@ config SCSI_SYM53C8XX
 
 config SCSI_NCR53C8XX_DEFAULT_TAGS
 	int "default tagged command queue depth"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX)
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON)
 	default "8"
 	---help---
 	  "Tagged command queuing" is a feature of SCSI-2 which improves
@@ -1123,7 +1133,7 @@ config SCSI_NCR53C8XX_DEFAULT_TAGS
 
 config SCSI_NCR53C8XX_MAX_TAGS
 	int "maximum number of queued commands"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX)
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON)
 	default "32"
 	---help---
 	  This option allows you to specify the maximum number of commands
@@ -1140,7 +1150,7 @@ config SCSI_NCR53C8XX_MAX_TAGS
 
 config SCSI_NCR53C8XX_SYNC
 	int "synchronous transfers frequency in MHz"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX)
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON)
 	default "20"
 	---help---
 	  The SCSI Parallel Interface-2 Standard defines 5 classes of transfer
@@ -1174,7 +1184,7 @@ config SCSI_NCR53C8XX_SYNC
 
 config SCSI_NCR53C8XX_PROFILE
 	bool "enable profiling"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX)
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON)
 	help
 	  This option allows you to enable profiling information gathering.
 	  These statistics are not very accurate due to the low frequency
@@ -1185,7 +1195,7 @@ config SCSI_NCR53C8XX_PROFILE
 
 config SCSI_NCR53C8XX_IOMAPPED
 	bool "use normal IO"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX)
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX) && !SCSI_ZALON
 	help
 	  If you say Y here, the driver will use normal IO, as opposed to
 	  memory mapped IO. Memory mapped IO has less latency than normal IO
@@ -1210,7 +1220,7 @@ config SCSI_NCR53C8XX_PQS_PDS
 
 config SCSI_NCR53C8XX_NO_DISCONNECT
 	bool "not allow targets to disconnect"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX) && SCSI_NCR53C8XX_DEFAULT_TAGS=0
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON) && SCSI_NCR53C8XX_DEFAULT_TAGS=0
 	help
 	  This option is only provided for safety if you suspect some SCSI
 	  device of yours to not support properly the target-disconnect
@@ -1220,7 +1230,7 @@ config SCSI_NCR53C8XX_NO_DISCONNECT
 
 config SCSI_NCR53C8XX_SYMBIOS_COMPAT
 	bool "assume boards are SYMBIOS compatible (EXPERIMENTAL)"
-	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX) && EXPERIMENTAL
+	depends on PCI && SCSI_SYM53C8XX_2!=y && (SCSI_NCR53C8XX || SCSI_SYM53C8XX || SCSI_ZALON) && EXPERIMENTAL
 	---help---
 	  This option allows you to enable some features depending on GPIO
 	  wiring. These General Purpose Input/Output pins can be used for
diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/lasi700.c parisc-2.5/drivers/scsi/lasi700.c
--- linus-2.5/drivers/scsi/lasi700.c	Thu Jul 18 09:53:26 2002
+++ parisc-2.5/drivers/scsi/lasi700.c	Thu Oct 31 18:06:42 2002
@@ -51,7 +51,6 @@
 #include <asm/irq.h>
 #include <asm/hardware.h>
 #include <asm/delay.h>
-#include <asm/gsc.h>
 
 #include <linux/module.h>
 
diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/sym53c8xx.c parisc-2.5/drivers/scsi/sym53c8xx.c
--- linus-2.5/drivers/scsi/sym53c8xx.c	Thu Oct 31 17:35:47 2002
+++ parisc-2.5/drivers/scsi/sym53c8xx.c	Thu Oct 31 17:39:40 2002
@@ -4901,6 +4901,11 @@ static int __init ncr_prepare_setting(nc
 	u_long	period;
 	int i;
 
+#ifdef CONFIG_PARISC
+	char scsi_mode = -1;
+	struct hardware_path hwpath;
+#endif
+
 	/*
 	**	Wide ?
 	*/
@@ -4972,6 +4977,31 @@ static int __init ncr_prepare_setting(nc
 	 */
 
 	period = (4 * div_10M[0] + np->clock_khz - 1) / np->clock_khz;
+
+#if defined(CONFIG_PARISC)
+	/* Host firmware (PDC) keeps a table for crippling SCSI capabilities.
+	 * Many newer machines export one channel of 53c896 chip
+	 * as SE, 50-pin HD.  Also used for Multi-initiator SCSI clusters
+	 * to set the SCSI Initiator ID.
+	 */
+	get_pci_node_path(np->pdev, &hwpath);
+	if (pdc_get_initiator(&hwpath, &np->myaddr, &period, &np->maxwide, &scsi_mode))
+	{
+		if (np->maxwide) 
+			np->features |= FE_WIDE;
+		if (scsi_mode >= 0) {
+			/* C3000 PDC reports period/mode */
+			driver_setup.diff_support = 0;
+			switch(scsi_mode) {
+			case 0:	np->scsi_mode = SMODE_SE; break;
+			case 1:	np->scsi_mode = SMODE_HVD; break;
+			case 2:	np->scsi_mode = SMODE_LVD; break;
+			default:	break;
+			}
+		}
+	}
+#endif
+
 	if	(period <= 250)		np->minsync = 10;
 	else if	(period <= 303)		np->minsync = 11;
 	else if	(period <= 500)		np->minsync = 12;
@@ -12958,6 +12988,7 @@ if (sym53c8xx)
 		}
 		if (i != count)	/* Ignore this device if we already have it */
 			continue;
+		pci_set_master(pcidev);
 		devp = &devtbl[count];
 		devp->host_id = driver_setup.host_id;
 		devp->attach_done = 0;
@@ -13201,9 +13232,9 @@ sym53c8xx_pci_init(Scsi_Host_Template *t
 		return -1;
 	}
 
-#ifdef __powerpc__
+#if defined(__powerpc__) || defined(__hppa__)
 	/*
-	**	Fix-up for power/pc.
+	**	Fix-up for power/pc and hppa.
 	**	Should not be performed by the driver.
 	*/
 	if ((command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY))
diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/sym53c8xx_2/sym_glue.c parisc-2.5/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linus-2.5/drivers/scsi/sym53c8xx_2/sym_glue.c	Mon Oct 21 05:18:30 2002
+++ parisc-2.5/drivers/scsi/sym53c8xx_2/sym_glue.c	Mon Oct 21 05:34:18 2002
@@ -1876,7 +1876,7 @@ static int sym_setup_bus_dma_mask(hcb_p 
 					sym_name(np));
 		}
 		else {
-			if (!pci_set_dma_mask(np->s.device, 0xffffffffUL))
+			if (pci_set_dma_mask(np->s.device, 0xffffffffUL))
 				goto out_err32;
 		}
 	}
diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/sym53c8xx_2/sym_malloc.c parisc-2.5/drivers/scsi/sym53c8xx_2/sym_malloc.c
--- linus-2.5/drivers/scsi/sym53c8xx_2/sym_malloc.c	Thu Jul 18 09:53:28 2002
+++ parisc-2.5/drivers/scsi/sym53c8xx_2/sym_malloc.c	Thu Jul 25 00:39:33 2002
@@ -143,12 +143,15 @@ static void ___sym_mfree(m_pool_p mp, vo
 	a = (m_addr_t) ptr;
 
 	while (1) {
-#ifdef SYM_MEM_FREE_UNUSED
 		if (s == SYM_MEM_CLUSTER_SIZE) {
+#ifdef SYM_MEM_FREE_UNUSED
 			M_FREE_MEM_CLUSTER(a);
+#else
+			((m_link_p) a)->next = h[i].next;
+			h[i].next = (m_link_p) a;
+#endif
 			break;
 		}
-#endif
 		b = a ^ s;
 		q = &h[i];
 		while (q->next && q->next != (m_link_p) b) {
diff -urpNX build-tools/dontdiff linus-2.5/drivers/scsi/sym53c8xx_defs.h parisc-2.5/drivers/scsi/sym53c8xx_defs.h
--- linus-2.5/drivers/scsi/sym53c8xx_defs.h	Thu Jul 18 09:53:27 2002
+++ parisc-2.5/drivers/scsi/sym53c8xx_defs.h	Fri Oct 18 08:25:44 2002
@@ -51,6 +51,13 @@
 **  NVRAM detection and reading.
 **    Copyright (C) 1997 Richard Waltham <dormouse@farsrobt.demon.co.uk>
 **
+**  Added support for MIPS big endian systems.
+**    Carsten Langgaard, carstenl@mips.com
+**    Copyright (C) 2000 MIPS Technologies, Inc.  All rights reserved.
+**
+**  Added support for HP PARISC big endian systems.
+**    Copyright (C) 2000 MIPS Technologies, Inc.  All rights reserved.
+**
 *******************************************************************************
 */
 
@@ -78,8 +85,10 @@
 /*
  *	No more an option, enabled by default.
  */
-#ifndef CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
-#define CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
+#ifndef ENABLE_SCSI_ZALON
+# ifndef CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
+#  define CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
+# endif
 #endif
 
 /*
@@ -181,6 +190,8 @@
 #endif
 #elif defined(__sparc__)
 #undef SCSI_NCR_IOMAPPED
+#elif defined(__hppa__) && defined(ENABLE_SCSI_ZALON)
+#undef SCSI_NCR_IOMAPPED
 #endif
 
 /*
@@ -379,16 +390,24 @@
 #define	readb_raw	readb
 #define	writeb_raw	writeb
 
-#if defined(__hppa__)
-#define	readw_l2b(a)	le16_to_cpu(readw(a))
-#define	readl_l2b(a)	le32_to_cpu(readl(a))
-#define	writew_b2l(v,a)	writew(cpu_to_le16(v),a)
-#define	writel_b2l(v,a)	writel(cpu_to_le32(v),a)
-#else	/* Other bid-endian */
+#if defined(SCSI_NCR_BIG_ENDIAN)
+#define	readw_l2b	__raw_readw
+#define	readl_l2b	__raw_readl
+#define	writew_b2l	__raw_writew
+#define	writel_b2l	__raw_writel
+#define	readw_raw	__raw_readw
+#define	readl_raw(a)	__raw_readl((unsigned long)(a))
+#define	writew_raw	__raw_writew
+#define	writel_raw(v,a)	__raw_writel(v,(unsigned long)(a))
+#else	/* Other big-endian */
 #define	readw_l2b	readw
 #define	readl_l2b	readl
 #define	writew_b2l	writew
 #define	writel_b2l	writel
+#define	readw_raw	readw
+#define	readl_raw	readl
+#define	writew_raw	writew
+#define	writel_raw	writel
 #endif
 
 #else	/* little endian */
@@ -417,9 +436,11 @@
 #endif
 #endif
 
+#if !defined(__hppa__) && !defined(__mips__)
 #ifdef	SCSI_NCR_BIG_ENDIAN
 #error	"The NCR in BIG ENDIAN addressing mode is not (yet) supported"
 #endif
+#endif
 
 
 /*
@@ -572,10 +593,20 @@
 
 #else
 
+#ifdef ENABLE_SCSI_ZALON
+/* Only 8 or 32 bit transfers allowed */
+#define INW_OFF(o)		(readb((char *)np->reg + ncr_offw(o)) << 8 | readb((char *)np->reg + ncr_offw(o) + 1))
+#else
 #define INW_OFF(o)		readw_raw((char *)np->reg + ncr_offw(o))
+#endif
 #define INL_OFF(o)		readl_raw((char *)np->reg + (o))
 
+#ifdef ENABLE_SCSI_ZALON
+/* Only 8 or 32 bit transfers allowed */
+#define OUTW_OFF(o, val)	do { writeb((char)((val) >> 8), (char *)np->reg + ncr_offw(o)); writeb((char)(val), (char *)np->reg + ncr_offw(o) + 1); } while (0)
+#else
 #define OUTW_OFF(o, val)	writew_raw((val), (char *)np->reg + ncr_offw(o))
+#endif
 #define OUTL_OFF(o, val)	writel_raw((val), (char *)np->reg + (o))
 
 #endif
@@ -623,6 +654,10 @@
 **	NCR53C8XX Device Ids
 */
 
+#ifndef PSEUDO_ZALON_720_ID
+#define PSEUDO_ZALON_720_ID 0x5a00
+#endif
+
 #ifndef PCI_DEVICE_ID_NCR_53C810
 #define PCI_DEVICE_ID_NCR_53C810 1
 #endif
@@ -726,6 +761,9 @@ typedef struct {
 #define FE_DAC	 	(1<<24)   /* Support DAC cycles (64 bit addressing) */
 #define FE_ISTAT1 	(1<<25)   /* Have ISTAT1, MBOX0, MBOX1 registers */
 #define FE_DAC_IN_USE	(1<<26)	  /* Platform does DAC cycles */
+#define FE_EHP		(1<<27)   /* 720: Even host parity */
+#define FE_MUX		(1<<28)   /* 720: Multiplexed bus */
+#define FE_EA		(1<<29)   /* 720: Enable Ack */
 
 #define FE_CACHE_SET	(FE_ERL|FE_CLSE|FE_WRIE|FE_ERMP)
 #define FE_SCSI_SET	(FE_WIDE|FE_ULTRA|FE_ULTRA2|FE_DBLR|FE_QUAD|F_CLK80)
@@ -747,6 +785,9 @@ typedef struct {
 
 #define SCSI_NCR_CHIP_TABLE						\
 {									\
+ {PSEUDO_ZALON_720_ID, 0x0f, "720",  3,  8, 4,				\
+ FE_WIDE|FE_DIFF|FE_EHP|FE_MUX|FE_EA}					\
+ ,									\
  {PCI_DEVICE_ID_NCR_53C810, 0x0f, "810",  4,  8, 4,			\
  FE_ERL}								\
  ,									\
@@ -819,6 +860,7 @@ typedef struct {
  */
 #define SCSI_NCR_CHIP_IDS		\
 {					\
+	PSEUDO_ZALON_720_ID,		\
 	PCI_DEVICE_ID_NCR_53C810,	\
 	PCI_DEVICE_ID_NCR_53C815,	\
 	PCI_DEVICE_ID_NCR_53C820,	\
@@ -1170,6 +1212,7 @@ struct ncr_reg {
 /*17*/  u_char    nc_mbox1;	/* 896 and later cores only */
 
 /*18*/	u_char	  nc_ctest0;
+	#define   EHP     0x04	/* 720 even host parity             */
 /*19*/  u_char    nc_ctest1;
 
 /*1a*/  u_char    nc_ctest2;
@@ -1187,6 +1230,7 @@ struct ncr_reg {
 
 /*20*/	u_char	  nc_dfifo;
 /*21*/  u_char    nc_ctest4;
+	#define   MUX     0x80  /* 720 host bus multiplex mode      */
 	#define   BDIS    0x80  /* mod: burst disable               */
 	#define   MPEE    0x08  /* mod: master parity error enable  */
 
@@ -1219,6 +1263,7 @@ struct ncr_reg {
 	#define   CLSE    0x80  /* mod: cache line size enable      */
 	#define   PFF     0x40  /* cmd: pre-fetch flush             */
 	#define   PFEN    0x20  /* mod: pre-fetch enable            */
+	#define   EA      0x20  /* mod: 720 enable-ack              */
 	#define   SSM     0x10  /* mod: single step mode            */
 	#define   IRQM    0x08  /* mod: irq mode (1 = totem pole !) */
 	#define   STD     0x04  /* cmd: start dma mode              */
@@ -1261,6 +1306,7 @@ struct ncr_reg {
 
 /*4e*/  u_char    nc_stest2;
 	#define   ROF     0x40	/* reset scsi offset (after gross error!) */
+	#define   DIF     0x20  /* 720 SCSI differential mode             */
 	#define   EXT     0x02  /* extended filtering                     */
 
 /*4f*/  u_char    nc_stest3;
@@ -1439,12 +1485,22 @@ struct scr_tblmove {
 #define	SCR_SEL_TBL	0x42000000
 #define	SCR_SEL_TBL_ATN	0x43000000
 
+
+#ifdef SCSI_NCR_BIG_ENDIAN
+struct scr_tblsel {
+        u_char  sel_scntl3;
+        u_char  sel_id;
+        u_char  sel_sxfer;
+        u_char  sel_scntl4;	
+};
+#else
 struct scr_tblsel {
         u_char  sel_scntl4;	
         u_char  sel_sxfer;
         u_char  sel_id;
         u_char  sel_scntl3;
 };
+#endif
 
 #define SCR_JMP_REL     0x04000000
 #define SCR_ID(id)	(((u_int32)(id)) << 16)

-- 
Revolutions do not require corporate support.
