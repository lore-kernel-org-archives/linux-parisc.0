Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id F34864829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 06:53:47 -0600 (MDT)
Date: Mon, 14 Apr 2003 12:53:41 +0000
Message-ID: <3E8AE87E00006CB4@ocpmta2.freegates.net>
In-Reply-To: <20030414115416.GQ29166@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Gerard Roudier" <groudier@free.fr>,
	"Grant Grundler" <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>Date: Mon, 14 Apr 2003 12:54:16 +0100
>From: Matthew Wilcox <willy@debian.org>
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: Gerard Roudier <groudier@free.fr>,
>	Grant Grundler <grundler@parisc-linux.org>,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] parisc-linux.org kernel
>
>
>
>joel, do not include patches as attachments, include them inline.
>
>-- 
Shame on me: I again forgot.

Here there are:

diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/sym53c8xx.c linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx.c
--- linux-2.4.21-pre7/drivers/scsi/sym53c8xx.c	2003-03-27 19:43:51.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx.c	2003-03-27 18:50:22.000000000
+0100
@@ -4915,6 +4915,11 @@
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
@@ -4986,6 +4991,29 @@
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
@@ -5128,7 +5156,6 @@
 		np->rv_ctest4	|= MPEE;	/* Master parity checking */
 	if (driver_setup.scsi_parity)
 		np->rv_scntl0	|= 0x0a;	/*  full arb., ena parity, par->ATN  */
-
 #ifdef SCSI_NCR_NVRAM_SUPPORT
 	/*
 	**	Get parity checking, host ID and verbose mode from NVRAM
@@ -5196,7 +5223,7 @@
 			if (np->sv_stest2 & 0x20)
 				np->scsi_mode = SMODE_HVD;
 			break;
-		default:/* Don't care about HVD */	
+		default: /* Don't care about HVD */	
 			break;
 		}
 	}
@@ -5239,6 +5266,7 @@
 		tcb_p tp = &np->target[i];
 
 		tp->usrsync = 255;
+
 #ifdef SCSI_NCR_NVRAM_SUPPORT
 		if (nvram) {
 			switch(nvram->type) {
@@ -5256,10 +5284,11 @@
 			if (driver_setup.use_nvram & 0x8)
 				tp->usrflag &= ~UF_NOSCAN;
 		}
-		else {
+		else
 #else
-		if (1) {
+		if (1) 
 #endif
+		{
 			tp->usrsync = driver_setup.default_sync;
 			tp->usrwide = driver_setup.max_wide;
 			tp->usrtags = MAX_TAGS;
@@ -7074,7 +7103,11 @@
 		((INW(nc_sbdl) & 0xff00) << 10) |	/* d15-8    */
 		INB(nc_sbcl);	/* req ack bsy sel atn msg cd io    */
 
+#ifdef CONFIG_PARISC
+	if (!np->maxwide)
+#else
 	if (!(np->features & FE_WIDE))
+#endif
 		term &= 0x3ffff;
 
 	if (term != (2<<7)) {
@@ -12974,6 +13007,7 @@
 		}
 		if (i != count)	/* Ignore this device if we already have it */
 			continue;
+		pci_set_master(pcidev);
 		devp = &devtbl[count];
 		devp->host_id = driver_setup.host_id;
 		devp->attach_done = 0;
@@ -13217,7 +13251,7 @@
 		return -1;
 	}
 
-#ifdef __powerpc__
+#if defined(__powerpc__) || defined(__hppa__)
 	/*
 	**	Fix-up for power/pc.
 	**	Should not be performed by the driver.
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/sym53c8xx_2/sym_glue.c
linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.4.21-pre7/drivers/scsi/sym53c8xx_2/sym_glue.c	2002-11-29 00:53:14.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_2/sym_glue.c	2002-12-20
15:56:22.000000000 +0100
@@ -142,10 +142,24 @@
 #define	SYM_LOCK_HCB(np, flags)   spin_lock_irqsave(&np->s.smp_lock, flags)
 #define	SYM_UNLOCK_HCB(np, flags) spin_unlock_irqrestore(&np->s.smp_lock,
flags)
 
+/* Warning!
+ * sym2 driver used to hold iorl in sym53c8xx_intr and sym_timer
+ * with these macros. However, we have observed that this causes
+ * a deadlock with the iorl held by scsi_register_host. A survey
+ * of a couple of other scsi drivers that uses the "new" eh
+ * code seems to suggest that this is not required. I've disabled
+ * these for now, without having completely understood if this
+ * is correct.
+ */
+#ifndef CONFIG_PARISC /* hack */
 #define	SYM_LOCK_SCSI(np, flags) \
 		spin_lock_irqsave(&io_request_lock, flags)
 #define	SYM_UNLOCK_SCSI(np, flags) \
 		spin_unlock_irqrestore(&io_request_lock, flags)
+#else
+#define	SYM_LOCK_SCSI(np, flags)
+#define	SYM_UNLOCK_SCSI(np, flags)
+#endif
 
 /* Ugly, but will make things easier if this locking will ever disappear
*/
 #define	SYM_LOCK_SCSI_NOSAVE(np)	spin_lock_irq(&io_request_lock)
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/sym53c8xx_2/sym_hipd.c
linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_2/sym_hipd.c
--- linux-2.4.21-pre7/drivers/scsi/sym53c8xx_2/sym_hipd.c	2003-03-27 19:43:51.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_2/sym_hipd.c	2003-03-27
18:50:22.000000000 +0100
@@ -289,7 +289,11 @@
 		((INW(nc_sbdl) & 0xff00) << 10) |	/* d15-8    */
 		INB(nc_sbcl);	/* req ack bsy sel atn msg cd io    */
 
+#ifdef CONFIG_PARISC
+	if (!np->maxwide)
+#else
 	if (!(np->features & FE_WIDE))
+#endif
 		term &= 0x3ffff;
 
 	if (term != (2<<7)) {
@@ -744,6 +748,12 @@
 	u32	period;
 	int i;
 
+#ifdef CONFIG_PARISC
+	unsigned long pdc_period;
+	char scsi_mode = -1;
+	struct hardware_path hwpath;
+#endif
+
 	/*
 	 *  Wide ?
 	 */
@@ -800,6 +810,31 @@
 	 * Btw, 'period' is in tenths of nanoseconds.
 	 */
 	period = (4 * div_10M[0] + np->clock_khz - 1) / np->clock_khz;
+
+#if defined(CONFIG_PARISC)
+	/* Host firmware (PDC) keeps a table for crippling SCSI capabilities.
+	 * Many newer machines export one channel of 53c896 chip
+	 * as SE, 50-pin HD.  Also used for Multi-initiator SCSI clusters
+	 * to set the SCSI Initiator ID.
+	 */
+	get_pci_node_path(np->s.device, &hwpath);
+	if (pdc_get_initiator(&hwpath, &np->myaddr, &pdc_period, &np->maxwide,
&scsi_mode))
+	{
+		if (scsi_mode >= 0) {
+			/* C3000 PDC reports period/mode */
+			SYM_SETUP_SCSI_DIFF = 0;
+			switch(scsi_mode) {
+			case 0:	np->scsi_mode = SMODE_SE; break;
+			case 1:	np->scsi_mode = SMODE_HVD; break;
+			case 2:	np->scsi_mode = SMODE_LVD; break;
+			default:	break;
+			}
+		}
+
+		period = (u32) pdc_period;
+	}
+#endif
+
 	if	(period <= 250)		np->minsync = 10;
 	else if	(period <= 303)		np->minsync = 11;
 	else if	(period <= 500)		np->minsync = 12;
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/sym53c8xx_defs.h linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_defs.h
--- linux-2.4.21-pre7/drivers/scsi/sym53c8xx_defs.h	2002-08-03 02:39:44.000000000
+0200
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/sym53c8xx_defs.h	2003-03-19 14:33:25.000000000
+0100
@@ -82,9 +82,11 @@
 /*
  *	No more an option, enabled by default.
  */
+#ifndef ENABLE_SCSI_ZALON
 #ifndef CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
 #define CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
 #endif
+#endif
 
 /*
 **	These options are not tunable from 'make config'
@@ -185,6 +187,24 @@
 #endif
 #elif defined(__sparc__)
 #undef SCSI_NCR_IOMAPPED
+#elif defined(__hppa__)
+#if defined(ENABLE_SCSI_ZALON)
+#undef SCSI_NCR_IOMAPPED
+#endif
+#endif
+
+/*
+ * Should we enable DAC cycles on Sparc64 platform?
+ * Until further investigation we do not enable it
+ * at the moment.
+ * We may want to enable it for __ia64__ (untested)
+ */
+#if defined(__ia64__)
+#    if !defined(SCSI_NCR_USE_64BIT_DAC)
+#        define SCSI_NCR_USE_64BIT_DAC
+#    endif
+#else
+#    undef SCSI_NCR_USE_64BIT_DAC
 #endif
 
 /*
@@ -383,25 +403,24 @@
 #define	readb_raw	readb
 #define	writeb_raw	writeb
 
-#if defined(__hppa__)
-#define	readw_l2b(a)	le16_to_cpu(readw(a))
-#define	readl_l2b(a)	le32_to_cpu(readl(a))
-#define	writew_b2l(v,a)	writew(cpu_to_le16(v),a)
-#define	writel_b2l(v,a)	writel(cpu_to_le32(v),a)
-#elif defined(__mips__)
-#define readw_l2b	readw
-#define readl_l2b	readl
-#define writew_b2l	writew
-#define writel_b2l	writel
-#define inw_l2b 	inw
-#define inl_l2b 	inl
-#define outw_b2l	outw
-#define outl_b2l	outl
+#if defined(SCSI_NCR_BIG_ENDIAN)
+#define	readw_l2b	__raw_readw
+#define	readl_l2b	__raw_readl
+#define	writew_b2l	__raw_writew
+#define	writel_b2l	__raw_writel
+#define	readw_raw	__raw_readw
+#define	readl_raw(a)	__raw_readl((unsigned long)(a))
+#define	writew_raw	__raw_writew
+#define	writel_raw(v,a)	__raw_writel(v,(unsigned long)(a))
 #else	/* Other big-endian */
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
@@ -430,9 +449,11 @@
 #endif
 #endif
 
+#if !defined(__hppa__) && !defined(__mips__)
 #ifdef	SCSI_NCR_BIG_ENDIAN
 #error	"The NCR in BIG ENDIAN addressing mode is not (yet) supported"
 #endif
+#endif
 
 
 /*
@@ -585,10 +606,20 @@
 
 #else
 
+#ifdef ENABLE_SCSI_ZALON
+/* Only 8 or 32 bit transfers allowed */
+#define INW_OFF(o)		(readb((char *)np->reg + ncr_offw(o)) << 8 | readb((char
*)np->reg + ncr_offw(o) + 1))
+#else
 #define INW_OFF(o)		readw_raw((char *)np->reg + ncr_offw(o))
+#endif
 #define INL_OFF(o)		readl_raw((char *)np->reg + (o))
 
+#ifdef ENABLE_SCSI_ZALON
+/* Only 8 or 32 bit transfers allowed */
+#define OUTW_OFF(o, val)	do { writeb((char)((val) >> 8), (char *)np->reg
+ ncr_offw(o)); writeb((char)(val), (char *)np->reg + ncr_offw(o) + 1); }
while (0)
+#else
 #define OUTW_OFF(o, val)	writew_raw((val), (char *)np->reg + ncr_offw(o))
+#endif
 #define OUTL_OFF(o, val)	writel_raw((val), (char *)np->reg + (o))
 
 #endif
@@ -636,6 +667,10 @@
 **	NCR53C8XX Device Ids
 */
 
+#ifndef PSEUDO_ZALON_720_ID
+#define PSEUDO_ZALON_720_ID 0x5a00
+#endif
+
 #ifndef PCI_DEVICE_ID_NCR_53C810
 #define PCI_DEVICE_ID_NCR_53C810 1
 #endif
@@ -739,6 +774,9 @@
 #define FE_DAC	 	(1<<24)   /* Support DAC cycles (64 bit addressing) */
 #define FE_ISTAT1 	(1<<25)   /* Have ISTAT1, MBOX0, MBOX1 registers */
 #define FE_DAC_IN_USE	(1<<26)	  /* Platform does DAC cycles */
+#define FE_EHP		(1<<27)   /* 720: Even host parity */
+#define FE_MUX		(1<<28)   /* 720: Multiplexed bus */
+#define FE_EA		(1<<29)   /* 720: Enable Ack */
 
 #define FE_CACHE_SET	(FE_ERL|FE_CLSE|FE_WRIE|FE_ERMP)
 #define FE_SCSI_SET	(FE_WIDE|FE_ULTRA|FE_ULTRA2|FE_DBLR|FE_QUAD|F_CLK80)
@@ -760,6 +798,9 @@
 
 #define SCSI_NCR_CHIP_TABLE						\
 {									\
+ {PSEUDO_ZALON_720_ID, 0x0f, "720",  3,  8, 4,				\
+ FE_WIDE|FE_DIFF|FE_EHP|FE_MUX|FE_EA}					\
+ ,									\
  {PCI_DEVICE_ID_NCR_53C810, 0x0f, "810",  4,  8, 4,			\
  FE_ERL}								\
  ,									\
@@ -832,6 +873,7 @@
  */
 #define SCSI_NCR_CHIP_IDS		\
 {					\
+	PSEUDO_ZALON_720_ID,		\
 	PCI_DEVICE_ID_NCR_53C810,	\
 	PCI_DEVICE_ID_NCR_53C815,	\
 	PCI_DEVICE_ID_NCR_53C820,	\
@@ -1183,6 +1225,7 @@
 /*17*/  u_char    nc_mbox1;	/* 896 and later cores only */
 
 /*18*/	u_char	  nc_ctest0;
+	#define   EHP     0x04	/* 720 even host parity             */
 /*19*/  u_char    nc_ctest1;
 
 /*1a*/  u_char    nc_ctest2;
@@ -1200,6 +1243,7 @@
 
 /*20*/	u_char	  nc_dfifo;
 /*21*/  u_char    nc_ctest4;
+	#define   MUX     0x80  /* 720 host bus multiplex mode      */
 	#define   BDIS    0x80  /* mod: burst disable               */
 	#define   MPEE    0x08  /* mod: master parity error enable  */
 
@@ -1232,6 +1276,7 @@
 	#define   CLSE    0x80  /* mod: cache line size enable      */
 	#define   PFF     0x40  /* cmd: pre-fetch flush             */
 	#define   PFEN    0x20  /* mod: pre-fetch enable            */
+	#define   EA      0x20	/* mod: 720 enable-ack              */
 	#define   SSM     0x10  /* mod: single step mode            */
 	#define   IRQM    0x08  /* mod: irq mode (1 = totem pole !) */
 	#define   STD     0x04  /* cmd: start dma mode              */
@@ -1274,6 +1319,7 @@
 
 /*4e*/  u_char    nc_stest2;
 	#define   ROF     0x40	/* reset scsi offset (after gross error!) */
+	#define   DIF     0x20  /* 720 SCSI differential mode             */
 	#define   EXT     0x02  /* extended filtering                     */
 
 /*4f*/  u_char    nc_stest3;
@@ -1452,12 +1498,21 @@
 #define	SCR_SEL_TBL	0x42000000
 #define	SCR_SEL_TBL_ATN	0x43000000
 
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
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/ncr53c8xx.c linux-2.4.21-pre7-pa3x/drivers/scsi/ncr53c8xx.c
--- linux-2.4.21-pre7/drivers/scsi/ncr53c8xx.c	2002-11-29 00:53:14.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/ncr53c8xx.c	2002-12-20 15:56:21.000000000
+0100
@@ -82,6 +82,7 @@
 **	    Etc...
 **
 **	Supported NCR/SYMBIOS chips:
+**		53C720		(Wide,   Fast SCSI-2, HP Zalon)
 **		53C810		(8 bits, Fast SCSI-2, no rom BIOS) 
 **		53C815		(8 bits, Fast SCSI-2, on board rom BIOS)
 **		53C820		(Wide,   Fast SCSI-2, no rom BIOS)
@@ -180,6 +181,23 @@
 typedef u32 u_int32;
 typedef u64 u_int64;
 typedef	u_long		vm_offset_t;
+
+#ifdef __hppa__
+/* Yuck.  Current plan is to use ncr58c8xx.c for non-pci big endian
+** chips, and sym53c8xx.c for pci little endian chips.  Define this
+** here so it gets seen by sym53c8xx_defs.h, pulled in via ncr53c8xx.h.
+*/
+#define SCSI_NCR_BIG_ENDIAN
+/* INTFLY interrupts don't always seem to get serviced atm.....
+*/
+#define SIMULATED_INTFLY
+#endif
+
+#if defined(CONFIG_SCSI_ZALON) || defined(CONFIG_SCSI_ZALON_MODULE)
+#define ENABLE_SCSI_ZALON
+#include "zalon7xx.h"
+#endif
+
 #include "ncr53c8xx.h"
 
 /*
@@ -383,6 +401,8 @@
 	struct Scsi_Host *host, struct scsi_device *devlist);
 static void ncr53c8xx_intr(int irq, void *dev_id, struct pt_regs * regs);
 static void ncr53c8xx_timeout(unsigned long np);
+static int ncr53c8xx_proc_info(char *buffer, char **start, off_t offset,
+			int length, int hostno, int func);
 
 #define initverbose (driver_setup.verbose)
 #define bootverbose (np->verbose)
@@ -454,7 +474,8 @@
 #define	SIR_RESEL_BAD_I_T_L	(15)
 #define	SIR_RESEL_BAD_I_T_L_Q	(16)
 #define	SIR_DONE_OVERFLOW	(17)
-#define	SIR_MAX			(17)
+#define	SIR_INTFLY		(18)
+#define	SIR_MAX			(18)
 
 /*==========================================================
 **
@@ -626,6 +647,15 @@
 	**	negotiation of wide and synch transfer and device quirks.
 	**----------------------------------------------------------------
 	*/
+#ifdef SCSI_NCR_BIG_ENDIAN
+/*0*/	u_short	period;
+/*2*/	u_char	sval;
+/*3*/	u_char	minsync;
+/*0*/	u_char	wval;
+/*1*/	u_char	widedone;
+/*2*/	u_char	quirks;
+/*3*/	u_char	maxoffs;
+#else
 /*0*/	u_char	minsync;
 /*1*/	u_char	sval;
 /*2*/	u_short	period;
@@ -633,6 +663,7 @@
 /*1*/	u_char	quirks;
 /*2*/	u_char	widedone;
 /*3*/	u_char	wval;
+#endif
 
 #ifdef SCSI_NCR_INTEGRITY_CHECKING
 	u_char 	ic_min_sync;
@@ -843,10 +874,17 @@
 /*
 **	Last four bytes (host)
 */
+#ifdef	SCSI_NCR_BIG_ENDIAN
+#define  actualquirks  phys.header.status[3]
+#define  host_status   phys.header.status[2]
+#define  scsi_status   phys.header.status[1]
+#define  parity_status phys.header.status[0]
+#else
 #define  actualquirks  phys.header.status[0]
 #define  host_status   phys.header.status[1]
 #define  scsi_status   phys.header.status[2]
 #define  parity_status phys.header.status[3]
+#endif
 
 /*
 **	First four bytes (script)
@@ -1030,8 +1068,8 @@
 	**	be used for probing adapter implementation differences.
 	**----------------------------------------------------------------
 	*/
-	u_char	sv_scntl0, sv_scntl3, sv_dmode, sv_dcntl, sv_ctest3, sv_ctest4,
-		sv_ctest5, sv_gpcntl, sv_stest2, sv_stest4;
+	u_char	sv_scntl0, sv_scntl3, sv_dmode, sv_dcntl, sv_ctest0, sv_ctest3,
+		sv_ctest4, sv_ctest5, sv_gpcntl, sv_stest2, sv_stest4;
 
 	/*----------------------------------------------------------------
 	**	Actual initial value of IO register bits used by the 
@@ -1039,8 +1077,8 @@
 	**	features that are to be enabled.
 	**----------------------------------------------------------------
 	*/
-	u_char	rv_scntl0, rv_scntl3, rv_dmode, rv_dcntl, rv_ctest3, rv_ctest4,

-		rv_ctest5, rv_stest2;
+	u_char	rv_scntl0, rv_scntl3, rv_dmode, rv_dcntl, rv_ctest0, rv_ctest3,
+	rv_ctest4, rv_ctest5, rv_stest2;
 
 	/*----------------------------------------------------------------
 	**	Targets management.
@@ -1162,7 +1200,7 @@
 	*/
 	struct ccb	*ccb;		/* Global CCB			*/
 	struct usrcmd	user;		/* Command from user		*/
-	u_char		release_stage;	/* Synchronisation stage on release  */
+	volatile u_char	release_stage;	/* Synchronisation stage on release  */
 
 #ifdef SCSI_NCR_INTEGRITY_CHECKING
 	/*----------------------------------------------------------------
@@ -1201,6 +1239,23 @@
 */
 
 /*
+**	For HP Zalon/53c720 systems, the Zalon interface
+**	between CPU and 53c720 does prefetches, which causes
+**	problems with self modifying scripts.  The problem
+**	is overcome by calling a dummy subroutine after each
+**	modification, to force a refetch of the script on
+**	return from the subroutine.
+*/
+
+#ifdef ENABLE_SCSI_ZALON
+#define PREFETCH_FLUSH_CNT	2
+#define	PREFETCH_FLUSH		SCR_CALL, PADDRH (wait_dma),
+#else
+#define PREFETCH_FLUSH_CNT	0
+#define PREFETCH_FLUSH
+#endif
+
+/*
 **	Script fragments which are loaded into the on-chip RAM 
 **	of 825A, 875 and 895 chips.
 */
@@ -1208,7 +1263,7 @@
 	ncrcmd	start		[  5];
 	ncrcmd  startpos	[  1];
 	ncrcmd	select		[  6];
-	ncrcmd	select2		[  9];
+	ncrcmd	select2		[  9 + PREFETCH_FLUSH_CNT];
 	ncrcmd	loadpos		[  4];
 	ncrcmd	send_ident	[  9];
 	ncrcmd	prepare		[  6];
@@ -1224,7 +1279,7 @@
 	ncrcmd	setmsg		[  7];
 	ncrcmd	cleanup		[  6];
 	ncrcmd  complete	[  9];
-	ncrcmd	cleanup_ok	[  8];
+	ncrcmd	cleanup_ok	[  8 + PREFETCH_FLUSH_CNT];
 	ncrcmd	cleanup0	[  1];
 #ifndef SCSI_NCR_CCB_DONE_SUPPORT
 	ncrcmd	signal		[ 12];
@@ -1242,11 +1297,11 @@
 	ncrcmd  idle		[  2];
 	ncrcmd	reselect	[  8];
 	ncrcmd	reselected	[  8];
-	ncrcmd	resel_dsa	[  6];
+	ncrcmd	resel_dsa	[  6 + PREFETCH_FLUSH_CNT];
 	ncrcmd	loadpos1	[  4];
 	ncrcmd  resel_lun	[  6];
 	ncrcmd	resel_tag	[  6];
-	ncrcmd	jump_to_nexus	[  4];
+	ncrcmd	jump_to_nexus	[  4 + PREFETCH_FLUSH_CNT];
 	ncrcmd	nexus_indirect	[  4];
 	ncrcmd	resel_notag	[  4];
 	ncrcmd  data_in		[MAX_SCATTERL * 4];
@@ -1267,7 +1322,7 @@
 #endif
 	ncrcmd	select_no_atn	[  8];
 	ncrcmd	cancel		[  4];
-	ncrcmd	skip		[  9];
+	ncrcmd	skip		[  9 + PREFETCH_FLUSH_CNT];
 	ncrcmd	skip2		[ 19];
 	ncrcmd	par_err_data_in	[  6];
 	ncrcmd	par_err_other	[  4];
@@ -1300,9 +1355,10 @@
 	ncrcmd	bad_i_t_l_q	[  4];
 	ncrcmd	bad_target	[  8];
 	ncrcmd	bad_status	[  8];
-	ncrcmd	start_ram	[  4];
+	ncrcmd	start_ram	[  4 + PREFETCH_FLUSH_CNT];
 	ncrcmd	start_ram0	[  4];
 	ncrcmd	sto_restart	[  5];
+	ncrcmd	wait_dma	[  2];
 	ncrcmd	snooptest	[  9];
 	ncrcmd	snoopend	[  2];
 };
@@ -1328,6 +1384,7 @@
 static	void	ncr_getclock	(ncb_p np, int mult);
 static	void	ncr_selectclock	(ncb_p np, u_char scntl3);
 static	ccb_p	ncr_get_ccb	(ncb_p np, u_char tn, u_char ln);
+static  void	ncr_chip_reset	(ncb_p np, int delay);
 static	void	ncr_init	(ncb_p np, int reset, char * msg, u_long code);
 static	int	ncr_int_sbmc	(ncb_p np);
 static	int	ncr_int_par	(ncb_p np);
@@ -1527,6 +1584,10 @@
 		RADDR (dsa),
 		PADDR (loadpos),
 	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
+	/*
 	**	then we do the actual copy.
 	*/
 	SCR_COPY (sizeof (struct head)),
@@ -1827,6 +1888,10 @@
 	SCR_COPY_F (4),
 		RADDR (dsa),
 		PADDR (cleanup0),
+	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
 	SCR_COPY (sizeof (struct head)),
 		NADDR (header),
 }/*-------------------------< CLEANUP0 >--------------------*/,{
@@ -1856,8 +1921,13 @@
 	/*
 	**	... signal completion to the host
 	*/
+#ifdef SIMULATED_INTFLY
+	SCR_INT,
+		SIR_INTFLY,
+#else
 	SCR_INT_FLY,
 		0,
+#endif
 	/*
 	**	Auf zu neuen Schandtaten!
 	*/
@@ -1876,8 +1946,13 @@
 	SCR_INT,
 		SIR_DONE_OVERFLOW,
 }/*------------------------< DONE_END >---------------------*/,{
+#ifdef SIMULATED_INTFLY
+	SCR_INT,
+		SIR_INTFLY,
+#else
 	SCR_INT_FLY,
 		0,
+#endif
 	SCR_COPY (4),
 		RADDR (temp),
 		PADDR (done_pos),
@@ -2055,6 +2130,10 @@
 		RADDR (dsa),
 		PADDR (loadpos1),
 	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
+	/*
 	**	then we do the actual copy.
 	*/
 	SCR_COPY (sizeof (struct head)),
@@ -2116,6 +2195,10 @@
 	SCR_COPY_F (4),
 		RADDR (temp),
 		PADDR (nexus_indirect),
+	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
 	SCR_COPY (4),
 }/*-------------------------< NEXUS_INDIRECT >-------------------*/,{
 		0,
@@ -2272,6 +2355,10 @@
 		RADDR (dsa),
 		PADDRH (skip2),
 	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
+	/*
 	**	then we do the actual copy.
 	*/
 	SCR_COPY (sizeof (struct head)),
@@ -2782,6 +2869,10 @@
 	SCR_COPY_F (4),
 		RADDR (scratcha),
 		PADDRH (start_ram0),
+	/*
+	**	Flush script prefetch if required
+	*/
+	PREFETCH_FLUSH
 	SCR_COPY (sizeof (struct script)),
 }/*-------------------------< START_RAM0 >--------------------*/,{
 		0,
@@ -2799,6 +2890,17 @@
 		PADDR (startpos),
 	SCR_JUMP,
 		PADDR (start),
+}/*-------------------------< WAIT_DMA >-------------------*/,{
+	/*
+	**	For HP Zalon/53c720 systems, the Zalon interface
+	**	between CPU and 53c720 does prefetches, which causes
+	**	problems with self modifying scripts.  The problem
+	**	is overcome by calling a dummy subroutine after each
+	**	modification, to force a refetch of the script on
+	**	return from the subroutine.
+	*/
+	SCR_RETURN,
+		0,
 }/*-------------------------< SNOOPTEST >-------------------*/,{
 	/*
 	**	Read the variable.
@@ -3132,9 +3234,12 @@
 #define burst_length(bc) (!(bc))? 0 : 1 << (bc)
 
 /*
- *	Burst code from io register bits.
+ *	Burst code from io register bits.  Burst enable is ctest0 for c720,
+ *	ctest4 for others.
  */
-#define burst_code(dmode, ctest4, ctest5) \
+#define burst_code(dmode, ctest0, ctest4, ctest5) \
+	(np->device_id == PSEUDO_ZALON_720_ID) ? \
+	(ctest0) & 0x80? 0 : (((dmode) & 0xc0) >> 6) + 1 : \
 	(ctest4) & 0x80? 0 : (((dmode) & 0xc0) >> 6) + ((ctest5) & 0x04) + 1
 
 /*
@@ -3142,12 +3247,15 @@
  */
 static inline void ncr_init_burst(ncb_p np, u_char bc)
 {
-	np->rv_ctest4	&= ~0x80;
+	u_char *be = (np->device_id == PSEUDO_ZALON_720_ID) ?
+		&np->rv_ctest0 : &np->rv_ctest4;
+
+	*be		&= ~0x80;
 	np->rv_dmode	&= ~(0x3 << 6);
 	np->rv_ctest5	&= ~0x4;
 
 	if (!bc) {
-		np->rv_ctest4	|= 0x80;
+		*be		|= 0x80;
 	}
 	else {
 		--bc;
@@ -3224,6 +3332,7 @@
 	np->sv_scntl3	= INB(nc_scntl3) & 0x07;
 	np->sv_dmode	= INB(nc_dmode)  & 0xce;
 	np->sv_dcntl	= INB(nc_dcntl)  & 0xa8;
+	np->sv_ctest0	= INB(nc_ctest0) & 0x84;
 	np->sv_ctest3	= INB(nc_ctest3) & 0x01;
 	np->sv_ctest4	= INB(nc_ctest4) & 0x80;
 	np->sv_ctest5	= INB(nc_ctest5) & 0x24;
@@ -3310,10 +3419,11 @@
 	np->rv_scntl0	= np->sv_scntl0;
 	np->rv_dmode	= np->sv_dmode;
 	np->rv_dcntl	= np->sv_dcntl;
+	np->rv_ctest0	= np->sv_ctest0;
 	np->rv_ctest3	= np->sv_ctest3;
 	np->rv_ctest4	= np->sv_ctest4;
 	np->rv_ctest5	= np->sv_ctest5;
-	burst_max	= burst_code(np->sv_dmode, np->sv_ctest4, np->sv_ctest5);
+	burst_max	= burst_code(np->sv_dmode, np->sv_ctest0, np->sv_ctest4, np->sv_ctest5);
 #else
 
 	/*
@@ -3321,7 +3431,7 @@
 	*/
 	burst_max	= driver_setup.burst_max;
 	if (burst_max == 255)
-		burst_max = burst_code(np->sv_dmode, np->sv_ctest4, np->sv_ctest5);
+		burst_max = burst_code(np->sv_dmode, np->sv_ctest0, np->sv_ctest4, np->sv_ctest5);
 	if (burst_max > 7)
 		burst_max = 7;
 	if (burst_max > np->maxburst)
@@ -3344,6 +3454,12 @@
 		np->rv_ctest3	|= WRIE;	/* Write and Invalidate */
 	if (np->features & FE_DFS)
 		np->rv_ctest5	|= DFS;		/* Dma Fifo Size */
+	if (np->features & FE_MUX)
+		np->rv_ctest4	|= MUX;		/* Host bus multiplex mode */
+	if (np->features & FE_EA)
+		np->rv_dcntl	|= EA;		/* Enable ACK */
+	if (np->features & FE_EHP)
+		np->rv_ctest0	|= EHP;		/* Even host parity */
 
 	/*
 	**	Select some other
@@ -3523,6 +3639,7 @@
 	return 0;
 }
 
+
 /*
 **	Host attach and initialisations.
 **
@@ -3543,6 +3660,7 @@
 	ncr_nvram *nvram = device->nvram;
 	int i;
 
+#ifndef ENABLE_SCSI_ZALON
 	printk(KERN_INFO "ncr53c%s-%d: rev 0x%x on pci bus %d device %d function
%d "
 #ifdef __sparc__
 		"irq %s\n",
@@ -3557,6 +3675,7 @@
 #else
 		device->slot.irq);
 #endif
+#endif
 
 	/*
 	**	Allocate host_data structure
@@ -3645,7 +3764,6 @@
 	**	Now the INB INW INL OUTB OUTW OUTL macros
 	**	can be used safely.
 	*/
-
 	np->reg = (struct ncr_reg*) np->vaddr;
 
 #endif /* !defined SCSI_NCR_IOMAPPED */
@@ -3654,7 +3772,9 @@
 	**	Try to map the controller chip into iospace.
 	*/
 
+#ifndef ENABLE_SCSI_ZALON
 	request_region(device->slot.io_port, 128, "ncr53c8xx");
+#endif
 	np->base_io = device->slot.io_port;
 
 #ifdef SCSI_NCR_NVRAM_SUPPORT
@@ -3768,9 +3888,7 @@
 	**	Reset chip.
 	*/
 
-	OUTB (nc_istat,  SRST);
-	UDELAY (100);
-	OUTB (nc_istat,  0   );
+	ncr_chip_reset(np, 100);
 
 	/*
 	**	Now check the cache handling of the pci chipset.
@@ -3887,7 +4005,9 @@
 #ifdef DEBUG_NCR53C8XX
 		printk(KERN_DEBUG "%s: releasing IO region %x[%d]\n", ncr_name(np), np->base_io,
128);
 #endif
+#ifndef ENABLE_SCSI_ZALON
 		release_region(np->base_io, 128);
+#endif
 	}
 	if (np->irq) {
 #ifdef DEBUG_NCR53C8XX
@@ -3912,7 +4032,7 @@
 	scsi_unregister(instance);
 
         return -1;
- }
+}
 
 
 /*==========================================================
@@ -4699,9 +4819,7 @@
 			"command processing suspended for %d seconds\n",
 			ncr_name(np), settle_delay);
 
-	OUTB (nc_istat, SRST);
-	UDELAY (100);
-	OUTB (nc_istat, 0);
+	ncr_chip_reset(np, 100);
 	UDELAY (2000);	/* The 895 needs time for the bus mode to settle */
 	if (enab_int)
 		OUTW (nc_sien, RST);
@@ -4710,7 +4828,8 @@
 	**	properly set IRQ mode, prior to resetting the bus.
 	*/
 	OUTB (nc_stest3, TE);
-	OUTB (nc_dcntl, (np->rv_dcntl & IRQM));
+	if (np->device_id != PSEUDO_ZALON_720_ID)
+		OUTB (nc_dcntl, (np->rv_dcntl & IRQM));
 	OUTB (nc_scntl1, CRST);
 	UDELAY (200);
 
@@ -4917,6 +5036,10 @@
 	lcb_p lp;
 	int target, lun;
 	int i;
+	char inst_name[16];
+
+	/* Local copy so we don't access np after freeing it! */
+	strncpy(inst_name, ncr_name(np), 16);
 
 	printk("%s: releasing host resources\n", ncr_name(np));
 
@@ -4963,12 +5086,11 @@
 	*/
 
 	printk("%s: resetting chip\n", ncr_name(np));
-	OUTB (nc_istat,  SRST);
-	UDELAY (100);
-	OUTB (nc_istat,  0   );
+	ncr_chip_reset(np, 100);
 
 	OUTB(nc_dmode,	np->sv_dmode);
 	OUTB(nc_dcntl,	np->sv_dcntl);
+	OUTB(nc_ctest0,	np->sv_ctest0);
 	OUTB(nc_ctest3,	np->sv_ctest3);
 	OUTB(nc_ctest4,	np->sv_ctest4);
 	OUTB(nc_ctest5,	np->sv_ctest5);
@@ -4991,7 +5113,9 @@
 #ifdef DEBUG_NCR53C8XX
 	printk("%s: releasing IO region %x[%d]\n", ncr_name(np), np->base_io, 128);
 #endif
+#ifndef ENABLE_SCSI_ZALON
 	release_region(np->base_io, 128);
+#endif
 
 	/*
 	**	Free allocated ccb(s)
@@ -5036,7 +5160,7 @@
 		m_free_dma(np->ccb, sizeof(struct ccb), "CCB");
 	m_free_dma(np, sizeof(struct ncb), "NCB");
 
-	printk("%s: host resources successfully released\n", ncr_name(np));
+	printk("%s: host resources successfully released\n", inst_name);
 
 	return 1;
 }
@@ -5061,7 +5185,6 @@
 	/*
 	**	Sanity check
 	*/
-
 	if (!cp || cp->magic != CCB_MAGIC || !cp->cmd)
 		return;
 
@@ -5428,6 +5551,28 @@
 	}
 }
 
+/*
+** Reset ncr chip.
+*/
+
+/* Some initialisation must be done immediately following reset, for 53c720,
+ * at least.  EA (dcntl bit 5) isn't set here as it is set once only in
+ * the _detect function.
+ */
+
+static void ncr_chip_reset(ncb_p np, int delay)
+{
+	OUTB (nc_istat,  SRST);
+	UDELAY (delay);
+	OUTB (nc_istat,  0   );
+
+	if (np->features & FE_EHP)
+		OUTB (nc_ctest0, EHP);
+	if (np->features & FE_MUX)
+		OUTB (nc_ctest4, MUX);
+}
+
+
 /*==========================================================
 **
 **
@@ -5473,7 +5618,7 @@
 	*/
 	np->squeueput = 0;
 	np->script0->startpos[0] = cpu_to_scr(NCB_SCRIPTH_PHYS (np, tryloop));
-
+#ifdef SCSI_NCR_CCB_DONE_SUPPORT
 	/*
 	**	Clear Done Queue
 	*/
@@ -5490,7 +5635,7 @@
 	np->ccb_done_ic = MAX_DONE-1;
 	np->scripth0->done_queue[5*(MAX_DONE-1) + 4] =
 			cpu_to_scr(NCB_SCRIPT_PHYS (np, done_plug));
-
+#endif
 	/*
 	**	Wakeup all pending jobs.
 	*/
@@ -5500,8 +5645,10 @@
 	**	Init chip.
 	*/
 
-	OUTB (nc_istat,  0x00   );	/*  Remove Reset, abort */
-	UDELAY (2000);	/* The 895 needs time for the bus mode to settle */
+	/* Remove reset; big delay because the 895 needs time for the
+	 * bus mode to settle
+	 */
+	ncr_chip_reset(np, 2000);
 
 	OUTB (nc_scntl0, np->rv_scntl0 | 0xc0);
 					/*  full arb., ena parity, par->ATN  */
@@ -5516,6 +5663,7 @@
 	OUTB (nc_ctest5, np->rv_ctest5);	/* Large fifo + large burst */
 
 	OUTB (nc_dcntl , NOCOM|np->rv_dcntl);	/* Protect SFBR */
+	OUTB (nc_ctest0, np->rv_ctest0);	/* 720: CDIS and EHP */
 	OUTB (nc_ctest3, np->rv_ctest3);	/* Write and invalidate */
 	OUTB (nc_ctest4, np->rv_ctest4);	/* Master parity checking */
 
@@ -7100,6 +7248,18 @@
 	if (DEBUG_FLAGS & DEBUG_TINY) printk ("I#%d", num);
 
 	switch (num) {
+	case SIR_INTFLY:
+		/*
+		**	This is used for HP Zalon/53c720 where INTFLY
+		**	operation is currently broken.
+		*/
+		ncr_wakeup_done(np);
+#ifdef SCSI_NCR_CCB_DONE_SUPPORT
+		OUTL(nc_dsp, NCB_SCRIPT_PHYS (np, done_end) + 8);
+#else
+		OUTL(nc_dsp, NCB_SCRIPT_PHYS (np, start));
+#endif
+		return;
 	case SIR_RESEL_NO_MSG_IN:
 	case SIR_RESEL_NO_IDENTIFY:
 		/*
@@ -7846,7 +8006,11 @@
 	*/
 	tp->getscr[0] =	cpu_to_scr(copy_1);
 	tp->getscr[1] = cpu_to_scr(vtobus (&tp->sval));
+#ifdef SCSI_NCR_BIG_ENDIAN
+	tp->getscr[2] = cpu_to_scr(ncr_reg_bus_addr(nc_sxfer) ^ 3);
+#else
 	tp->getscr[2] = cpu_to_scr(ncr_reg_bus_addr(nc_sxfer));
+#endif
   
 	/*
 	**	Load the timing register.
@@ -7854,7 +8018,11 @@
 	*/
 	tp->getscr[3] =	cpu_to_scr(copy_1);
 	tp->getscr[4] = cpu_to_scr(vtobus (&tp->wval));
+#ifdef SCSI_NCR_BIG_ENDIAN
+	tp->getscr[5] = cpu_to_scr(ncr_reg_bus_addr(nc_scntl3) ^ 3);
+#else
 	tp->getscr[5] = cpu_to_scr(ncr_reg_bus_addr(nc_scntl3));
+#endif
 
 	/*
 	**	Get the IDENTIFY message and the lun.
@@ -7883,10 +8051,17 @@
 	/*
 	**	These assert's should be moved at driver initialisations.
 	*/
+#ifdef SCSI_NCR_BIG_ENDIAN
+	assert (( (offsetof(struct ncr_reg, nc_sxfer) ^
+		offsetof(struct tcb    , sval    )) &3) == 3);
+	assert (( (offsetof(struct ncr_reg, nc_scntl3) ^
+		offsetof(struct tcb    , wval    )) &3) == 3);
+#else
 	assert (( (offsetof(struct ncr_reg, nc_sxfer) ^
 		offsetof(struct tcb    , sval    )) &3) == 0);
 	assert (( (offsetof(struct ncr_reg, nc_scntl3) ^
 		offsetof(struct tcb    , wval    )) &3) == 0);
+#endif
 }
 
 
@@ -8230,9 +8405,7 @@
 	/*
 	**	Reset ncr chip
 	*/
-	OUTB (nc_istat,  SRST);
-	UDELAY (100);
-	OUTB (nc_istat,  0   );
+	ncr_chip_reset(np, 100);
 	/*
 	**	check for timeout
 	*/
@@ -8459,7 +8632,7 @@
 	if (np->multiplier != mult || (scntl3 & 7) < 3 || !(scntl3 & 1)) {
 		unsigned f2;
 
-		OUTB(nc_istat, SRST); UDELAY (5); OUTB(nc_istat, 0);
+		ncr_chip_reset(np, 5);
 
 		(void) ncrgetfreq (np, 11);	/* throw away first result */
 		f1 = ncrgetfreq (np, 11);
@@ -9210,6 +9383,7 @@
 */
 
 static u_short	ncr_chip_ids[]   __initdata = {
+	PSEUDO_ZALON_720_ID,
 	PCI_DEVICE_ID_NCR_53C810,
 	PCI_DEVICE_ID_NCR_53C815,
 	PCI_DEVICE_ID_NCR_53C820,
@@ -9224,6 +9398,89 @@
 	PCI_DEVICE_ID_NCR_53C1510D
 };
 
+#ifdef ENABLE_SCSI_ZALON
+/*
+**	Attach a 53c720 interfaced via Zalon chip on HP boxes.  
+*/
+
+int
+zalon_attach(Scsi_Host_Template *tpnt, unsigned long io_port, 
+	     struct parisc_device *dev, int irq, int unit)
+{
+	u_short device_id;
+	u_char revision;
+	int i;
+	ncr_chip *chip;
+	ncr_device device;
+
+	tpnt->proc_name = NAME53C8XX;
+	tpnt->proc_info = ncr53c8xx_proc_info;
+
+#if	defined(SCSI_NCR_BOOT_COMMAND_LINE_SUPPORT) && defined(MODULE)
+	if (ncr53c8xx)
+		ncr53c8xx_setup(ncr53c8xx);
+#endif
+
+#ifdef SCSI_NCR_DEBUG_INFO_SUPPORT
+	ncr_debug = driver_setup.debug;
+#endif
+	if (initverbose >= 2)
+		ncr_print_driver_setup();
+
+	memset(&device, 0, sizeof(ncr_device));
+	chip = 0;
+	device_id = PSEUDO_ZALON_720_ID;
+	revision = 0;
+	for (i = 0; i < sizeof(ncr_chip_table)/sizeof(ncr_chip_table[0]); i++)
{
+		if (device_id != ncr_chip_table[i].device_id)
+			continue;
+		chip = &device.chip;
+		memcpy(chip, &ncr_chip_table[i], sizeof(*chip));
+		chip->revision_id = revision;
+		break;
+	}
+
+	if (!chip) {
+		printk(NAME53C8XX ": not initializing, device not supported\n");
+		return -1;
+	}
+
+	/*
+	**    Fix some features according to driver setup.
+	*/
+
+	driver_setup.diff_support = 2;
+
+	/*
+	**    The following three are needed before any other access.
+	*/
+
+	writeb(0x20, io_port + 0x38); /* DCNTL_REG,  EA  */
+	writeb(0x04, io_port + 0x1b); /* CTEST0_REG, EHP */
+	writeb(0x80, io_port + 0x22); /* CTEST4_REG, MUX */
+
+ 	/*
+	**    Initialise ncr_device structure with items required by ncr_attach.
+	*/
+	device.host_id		= driver_setup.host_id;
+	device.pdev		= ccio_get_fake(dev);
+	device.slot.bus		= 0;
+	device.slot.device_fn	= 0;
+	device.slot.base	= (u_long)io_port;
+	device.slot.base_c	= (u_long)io_port;
+	device.slot.base_2	= 0;
+	device.slot.base_2_c	= 0;
+	device.slot.io_port	= io_port;
+	device.slot.irq		= irq;
+	device.attach_done	= 0;
+
+	printk(KERN_INFO NAME53C8XX ": 53c%s detected\n", device.chip.name);
+
+	return ncr_attach(tpnt, unit, &device);
+}
+#endif
+
+
 /*==========================================================
 **
 **	Chip detection entry point.
@@ -9273,6 +9530,10 @@
 static
 #endif
 #if LINUX_VERSION_CODE >= LinuxVersionCode(2,4,0) || defined(MODULE)
+#ifdef ENABLE_SCSI_ZALON
+Scsi_Host_Template driver_template = SCSI_ZALON;
+#else
 Scsi_Host_Template driver_template = NCR53C8XX;
+#endif
 #include "scsi_module.c"
 #endif
diff -NaurX dontdiff linux-2.4.21-pre7/drivers/scsi/Config.in linux-2.4.21-pre7-pa3x/drivers/scsi/Config.in
--- linux-2.4.21-pre7/drivers/scsi/Config.in	2003-03-27 19:43:50.000000000
+0100
+++ linux-2.4.21-pre7-pa3x/drivers/scsi/Config.in	2003-04-11 11:18:42.000000000
+0200
@@ -145,27 +145,46 @@
       bool '  use normal IO' CONFIG_SCSI_SYM53C8XX_IOMAPPED
    fi
 fi
+define_bool CONFIG_ASK_ZALON n
+define_bool CONFIG_ASK_NCR53C8XX n
+define_bool CONFIG_ASK_SYM53C8XX n
+if [ "$CONFIG_PARISC" = "y" ]; then
+   dep_tristate 'Zalon SCSI support' CONFIG_SCSI_ZALON $CONFIG_GSC $CONFIG_SCSI
+   if [ "$CONFIG_SCSI_ZALON" != "n" ]; then
+      define_bool CONFIG_ASK_ZALON y
+   fi
+else
+  if [ "$CONFIG_PCI" = "y" -a "$CONFIG_SCSI_SYM53C8XX_2" != "y" ]; then
+     dep_tristate 'NCR53C8XX SCSI support' CONFIG_SCSI_NCR53C8XX $CONFIG_SCSI
+     if [ "$CONFIG_SCSI_NCR53C8XX" != "n" ]; then
+        define_bool CONFIG_ASK_NCR53C8XX y
+     fi
+  fi
+fi
 if [ "$CONFIG_PCI" = "y" -a "$CONFIG_SCSI_SYM53C8XX_2" != "y" ]; then
-   dep_tristate 'NCR53C8XX SCSI support' CONFIG_SCSI_NCR53C8XX $CONFIG_SCSI
    dep_tristate 'SYM53C8XX SCSI support' CONFIG_SCSI_SYM53C8XX $CONFIG_SCSI
-   if [ "$CONFIG_PARISC" = "y" ]; then
-      dep_tristate 'Zalon SCSI support' CONFIG_SCSI_ZALON $CONFIG_GSC $CONFIG_SCSI
+   if [ "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
+      define_bool CONFIG_ASK_SYM53C8XX y
    fi
-   if [ "$CONFIG_SCSI_NCR53C8XX" != "n" -o "$CONFIG_SCSI_ZALON" = "y" -o
"$CONFIG_SCSI_ZALON" = "m" -o "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
-      int  '  default tagged command queue depth' CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS
8
-      int  '  maximum number of queued commands' CONFIG_SCSI_NCR53C8XX_MAX_TAGS
32
-      int  '  synchronous transfers frequency in MHz' CONFIG_SCSI_NCR53C8XX_SYNC
20
-      bool '  enable profiling' CONFIG_SCSI_NCR53C8XX_PROFILE
+fi
+if [ "$CONFIG_ASK_ZALON" = "y" -o "$CONFIG_ASK_NCR53C8XX" = "y" -o "$CONFIG_ASK_SYM53C8XX"
= "y" ]; then
+   int  '  default tagged command queue depth' CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS
8
+   int  '  maximum number of queued commands' CONFIG_SCSI_NCR53C8XX_MAX_TAGS
32
+   int  '  synchronous transfers frequency in MHz' CONFIG_SCSI_NCR53C8XX_SYNC
20
+   bool '  enable profiling' CONFIG_SCSI_NCR53C8XX_PROFILE
+   if [ "$CONFIG_ASK_ZALON" = "y" ]; then
+      define_bool CONFIG_SCSI_NCR53C8XX_IOMAPPED n
+   else
       bool '  use normal IO' CONFIG_SCSI_NCR53C8XX_IOMAPPED
-      if [ "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
-	 bool '  include support for the NCR PQS/PDS SCSI card' CONFIG_SCSI_NCR53C8XX_PQS_PDS
-      fi
-      if [ "$CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS" = "0" ]; then
-	 bool '  not allow targets to disconnect' CONFIG_SCSI_NCR53C8XX_NO_DISCONNECT
-      fi
-      if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
-	 bool '  assume boards are SYMBIOS compatible (EXPERIMENTAL)' CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT
-      fi
+   fi
+   if [ "$CONFIG_ASK_SYM53C8XX" = "y" ]; then
+      bool '  include support for the NCR PQS/PDS SCSI card' CONFIG_SCSI_NCR53C8XX_PQS_PDS
+   fi
+   if [ "$CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS" = "0" ]; then
+      bool '  not allow targets to disconnect' CONFIG_SCSI_NCR53C8XX_NO_DISCONNECT
+   fi
+   if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
+      bool '  assume boards are SYMBIOS compatible (EXPERIMENTAL)' CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT
    fi
 fi
 if [ "$CONFIG_MCA" = "y" ]; then


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
