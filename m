From: Matthew Wilcox <matthew@wil.cx>
Subject: [PATCH] Sort generic PCI fixups after specific ones
Date: Wed, 22 Sep 2004 22:43:04 +0100
Message-ID: <20040922214304.GS16153__26296.1775683381$1416624479$gmane$org@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 linux-pci@atrey.karlin.mff.cuni.cz,
 parisc-linux@parisc-linux.org
To: Linus Torvalds <torvalds@osdl.org>,
 Andrew Morton <akpm@zip.com.au>
Return-Path: <linux-kernel-owner+deller=40gmx.de-S267893AbUIVVpG@vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


The recent change that allowed PCI fixups to be declared everywhere
broke IDE on PA-RISC by making the generic IDE fixup be applied before
the PA-RISC specific one.  This patch fixes that by sorting generic fixups
after the specific ones.  It also obeys the 80-column limit and reduces
the amount of grotty macro code.

I'd like to thank Joel Soete for his work tracking down the source of
this problem.

Index: linux-2.6/drivers/pci/quirks.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/pci/quirks.c,v
retrieving revision 1.16
diff -u -p -r1.16 quirks.c
--- linux-2.6/drivers/pci/quirks.c	13 Sep 2004 15:23:21 -0000	1.16
+++ linux-2.6/drivers/pci/quirks.c	22 Sep 2004 21:38:17 -0000
@@ -543,7 +543,7 @@ static void __devinit quirk_cardbus_lega
 		return;
 	pci_write_config_dword(dev, PCI_CB_LEGACY_MODE_BASE, 0);
 }
-DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID,		PCI_ANY_ID,			quirk_cardbus_legacy );
+DECLARE_PCI_FIXUP_FINAL_ALL(quirk_cardbus_legacy);
 
 /*
  * Following the PCI ordering rules is optional on the AMD762. I'm not
@@ -661,7 +661,7 @@ static void __devinit quirk_ide_bases(st
        printk(KERN_INFO "PCI: Ignoring BAR%d-%d of IDE controller %s\n",
               first_bar, last_bar, pci_name(dev));
 }
-DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID,             PCI_ANY_ID,                     quirk_ide_bases );
+DECLARE_PCI_FIXUP_HEADER_ALL(quirk_ide_bases);
 
 /*
  *	Ensure C0 rev restreaming is off. This is normally done by
Index: linux-2.6/include/asm-generic/vmlinux.lds.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-generic/vmlinux.lds.h,v
retrieving revision 1.4
diff -u -p -r1.4 vmlinux.lds.h
--- linux-2.6/include/asm-generic/vmlinux.lds.h	13 Sep 2004 15:24:02 -0000	1.4
+++ linux-2.6/include/asm-generic/vmlinux.lds.h	22 Sep 2004 21:38:23 -0000
@@ -20,9 +20,11 @@
 	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
 		VMLINUX_SYMBOL(__start_pci_fixups_header) = .;		\
 		*(.pci_fixup_header)					\
+		*(.pci_fixup_header_all)				\
 		VMLINUX_SYMBOL(__end_pci_fixups_header) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_final) = .;		\
 		*(.pci_fixup_final)					\
+		*(.pci_fixup_final_all)					\
 		VMLINUX_SYMBOL(__end_pci_fixups_final) = .;		\
 	}								\
 									\
Index: linux-2.6/include/linux/pci.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/pci.h,v
retrieving revision 1.18
diff -u -p -r1.18 pci.h
--- linux-2.6/include/linux/pci.h	13 Sep 2004 15:24:12 -0000	1.18
+++ linux-2.6/include/linux/pci.h	22 Sep 2004 21:38:25 -0000
@@ -1011,15 +1011,22 @@ enum pci_fixup_pass {
 };
 
 /* Anonymous variables would be nice... */
-#define DECLARE_PCI_FIXUP_HEADER(vendor, device, hook)					\
-	static struct pci_fixup __pci_fixup_##vendor##device##hook __attribute_used__	\
-	__attribute__((__section__(".pci_fixup_header"))) = {				\
-		vendor, device, hook };
-
-#define DECLARE_PCI_FIXUP_FINAL(vendor, device, hook)				\
-	static struct pci_fixup __pci_fixup_##vendor##device##hook __attribute_used__	\
-	__attribute__((__section__(".pci_fixup_final"))) = {				\
+#define DECLARE_PCI_FIXUP_SECTION(section, name, vendor, device, hook)	\
+	static struct pci_fixup __pci_fixup_##name			\
+	__attribute_used__ __attribute__((__section__( #section ))) = {	\
 		vendor, device, hook };
+#define DECLARE_PCI_FIXUP_HEADER(vendor, device, hook)			\
+	DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header,			\
+			vendor##device##hook, vendor, device, hook)
+#define DECLARE_PCI_FIXUP_HEADER_ALL(hook)				\
+	DECLARE_PCI_FIXUP_SECTION(.pci_fixup_header_all,		\
+			ALL_DEVICES##hook, PCI_ANY_ID, PCI_ANY_ID, hook)
+#define DECLARE_PCI_FIXUP_FINAL(vendor, device, hook)			\
+	DECLARE_PCI_FIXUP_SECTION(.pci_fixup_final,			\
+			vendor##device##hook, vendor, device, hook)
+#define DECLARE_PCI_FIXUP_FINAL_ALL(hook)				\
+	DECLARE_PCI_FIXUP_SECTION(.pci_fixup_final_all,			\
+			ALL_DEVICES##hook, PCI_ANY_ID, PCI_ANY_ID, hook)
 
 void pci_fixup_device(enum pci_fixup_pass pass, struct pci_dev *dev);
 

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
