From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.9-bk6-pa1: some questions
Date: Fri, 22 Oct 2004 14:40:35 +0200
Message-ID: <4161760000005926@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
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

Hello Matthew,

I greatly appreciate this idea.

I can so check my work and so have some questions:

1) I didn't understand this change:
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/drivers/scsi/sym53c8xx_2/sy=
m_glue.c
linux-2.6.9-bk6-pa1/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.6.9-bk6-pa1.orig/drivers/scsi/sym53c8xx_2/sym_glue.c	2004-10-=
22
08:11:04.000000000 +0200
+++ linux-2.6.9-bk6-pa1/drivers/scsi/sym53c8xx_2/sym_glue.c	2004-10-22 10=
:29:04.000000000
+0200
@@ -2308,7 +2308,7 @@
 	struct sym_hcb *np =3D ((struct host_data *)shost->hostdata)->ncb;
 	struct sym_tcb *tp =3D &np->target[starget->id];
 

-	if (qas)
+	if (starget)
 		tp->tinfo.goal.options |=3D PPR_OPT_QAS | PPR_OPT_DT;
 	else
 		tp->tinfo.goal.options &=3D ~PPR_OPT_QAS;

2) is this  I-K patch still needed (for superio initialisation)
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/drivers/parisc/superio.c li=
nux-2.6.9-bk6-pa1/drivers/parisc/superio.c
--- linux-2.6.9-bk6-pa1.orig/drivers/parisc/superio.c	2004-09-29 10:14:52=
.000000000
+0200
+++ linux-2.6.9-bk6-pa1/drivers/parisc/superio.c	2004-10-22 10:13:33.0000=
00000
+0200
@@ -481,7 +481,7 @@
 	pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);
 	printk("PCI: Enabled native mode for NS87415 (pif=3D0x%x)\n", prog);
 }
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, super=
io_fixup_pci);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, superi=
o_fixup_pci);
 
 
 static int __devinit superio_probe(struct pci_dev *dev, const struct pci=
_device_id
*id)
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/drivers/pci/probe.c linux-2=
.6.9-bk6-pa1/drivers/pci/probe.c
--- linux-2.6.9-bk6-pa1.orig/drivers/pci/probe.c	2004-10-22 08:10:36.0000=
00000
+0200
+++ linux-2.6.9-bk6-pa1/drivers/pci/probe.c	2004-10-22 10:13:33.000000000=

+0200
@@ -478,6 +478,9 @@
 	/* "Unknown power state" */
 	dev->current_state =3D 4;
 
+	/* Early fixups, before probing the BARs */
+	pci_fixup_device(pci_fixup_early, dev);
+
 	switch (dev->hdr_type) {		    /* header type */
 	case PCI_HEADER_TYPE_NORMAL:		    /* standard header */
 		if (class =3D=3D PCI_CLASS_BRIDGE_PCI)
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/drivers/pci/quirks.c linux-=
2.6.9-bk6-pa1/drivers/pci/quirks.c
--- linux-2.6.9-bk6-pa1.orig/drivers/pci/quirks.c	2004-10-22 08:10:36.000=
000000
+0200
+++ linux-2.6.9-bk6-pa1/drivers/pci/quirks.c	2004-10-22 10:13:33.00000000=
0
+0200
@@ -1279,6 +1279,8 @@
 	}
 }
 
+extern struct pci_fixup __start_pci_fixups_early[];
+extern struct pci_fixup __end_pci_fixups_early[];
 extern struct pci_fixup __start_pci_fixups_header[];
 extern struct pci_fixup __end_pci_fixups_header[];
 extern struct pci_fixup __start_pci_fixups_final[];
@@ -1292,6 +1294,11 @@
 	struct pci_fixup *start, *end;
 
 	switch(pass) {
+	case pci_fixup_early:
+		start =3D __start_pci_fixups_early;
+		end =3D __end_pci_fixups_early;
+		break;
+
 	case pci_fixup_header:
 		start =3D __start_pci_fixups_header;
 		end =3D __end_pci_fixups_header;
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/include/asm-generic/vmlinux=
.lds.h
linux-2.6.9-bk6-pa1/include/asm-generic/vmlinux.lds.h
--- linux-2.6.9-bk6-pa1.orig/include/asm-generic/vmlinux.lds.h	2004-10-22=

08:12:00.000000000 +0200
+++ linux-2.6.9-bk6-pa1/include/asm-generic/vmlinux.lds.h	2004-10-22 10:1=
3:33.000000000
+0200
@@ -18,6 +18,9 @@
 									\
 	/* PCI quirks */						\
 	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
+		VMLINUX_SYMBOL(__start_pci_fixups_early) =3D .;		\
+		*(.pci_fixup_early)					\
+		VMLINUX_SYMBOL(__end_pci_fixups_early) =3D .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_header) =3D .;		\
 		*(.pci_fixup_header)					\
 		VMLINUX_SYMBOL(__end_pci_fixups_header) =3D .;		\
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/include/linux/pci.h linux-2=
.6.9-bk6-pa1/include/linux/pci.h
--- linux-2.6.9-bk6-pa1.orig/include/linux/pci.h	2004-10-22 08:12:15.0000=
00000
+0200
+++ linux-2.6.9-bk6-pa1/include/linux/pci.h	2004-10-22 10:13:33.000000000=

+0200
@@ -993,21 +993,30 @@
 };
 
 enum pci_fixup_pass {
-	pci_fixup_header,	/* Called immediately after reading configuration hea=
der
*/
+	pci_fixup_early,	/* Called immediately after reading
+				   device/vendor IDs and class code */
+	pci_fixup_header,	/* Called after reading the entire
+				   configuration header (including BARs) */
 	pci_fixup_final,	/* Final phase of device fixups */
 	pci_fixup_enable,	/* pci_enable_device() time */
 };
 
 /* Anonymous variables would be nice... */
-#define DECLARE_PCI_FIXUP_HEADER(vendor, device, hook)					\
-	static struct pci_fixup __pci_fixup_##vendor##device##hook __attribute_=
used__
\
-	__attribute__((__section__(".pci_fixup_header"))) =3D {				\
-		vendor, device, hook };
-
-#define DECLARE_PCI_FIXUP_FINAL(vendor, device, hook)				\
-	static struct pci_fixup __pci_fixup_##vendor##device##hook __attribute_=
used__
\
-	__attribute__((__section__(".pci_fixup_final"))) =3D {				\
-		vendor, device, hook };
+#define DECLARE_PCI_FIXUP_SECTION(section, name, vendor, device, hook)
\
+	static struct pci_fixup __pci_fixup_##name __attribute_used__	\
+	__attribute__((__section__( #section ))) =3D { vendor, device, hook };
+
+#define DECLARE_PCI_FIXUP_EARLY(vendor, device, hook)			\
+	 DECLARE_PCI_FIXUP_SECTION(.pci_fixup_early,			\
+			vendor##device##hook, vendor, device, hook)
+
+#define DECLARE_PCI_FIXUP_HEADER(vendor, device, hook)			\
+	 DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,			\
+			vendor##device##hook, vendor, device, hook)
+
+#define DECLARE_PCI_FIXUP_FINAL(vendor, device, hook)			\
+	 DECLARE_PCI_FIXUP_SECTION(.pci_fixup_final,			\
+			vendor##device##hook, vendor, device, hook)
 
 #define DECLARE_PCI_FIXUP_ENABLE(vendor, device, hook)				\
 	static struct pci_fixup __pci_fixup_##vendor##device##hook __attribute_=
used__
\

3) is there any danger to apply this matter:
diff -NaurX dontdiff linux-2.6.9-bk6-pa1.orig/drivers/scsi/ncr53c8xx.c li=
nux-2.6.9-bk6-pa1/drivers/scsi/ncr53c8xx.c
--- linux-2.6.9-bk6-pa1.orig/drivers/scsi/ncr53c8xx.c	2004-10-22 08:10:50=
.000000000
+0200
+++ linux-2.6.9-bk6-pa1/drivers/scsi/ncr53c8xx.c	2004-10-22 10:13:33.0000=
00000
+0200
@@ -2841,7 +2841,6 @@
 		if (opcode =3D=3D 0) {
 			printk (KERN_ERR "%s: ERROR0 IN SCRIPT at %d.\n",
 				ncr_name(np), (int) (src-start-1));
-			mdelay(1000);
 		};
 
 		if (DEBUG_FLAGS & DEBUG_SCRIPT)
@@ -2871,7 +2870,6 @@
 			if ((tmp1 ^ tmp2) & 3) {
 				printk (KERN_ERR"%s: ERROR1 IN SCRIPT at %d.\n",
 					ncr_name(np), (int) (src-start-1));
-				mdelay(1000);
 			}
 			/*
 			**	If PREFETCH feature not enabled, remove 

Thanks in advance for your attention,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
