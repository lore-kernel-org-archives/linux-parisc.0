Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id D608B482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 12:05:14 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 388342B100
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 12:05:10 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 17 Nov 2002 12:05:09 -0700
Message-Id: <1037559910.26816.9.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs.
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

Hello parisc-linux hackers,

I have written a small patch to handle a case on the E35 where
the device is mis-reported.  Specifically, the upper port of the
HP-PB bus converter is reported as:

	U2-IOA BC GSC+ Port

This is obviously wrong since U2 connects runway to GSC and this
bus converer is attempting to connect GSC to HP-PB. The correct
bus converter is:

	Gecko BOA BC GSC+ Port

The following patch fixes this problem by adding a HP hardare
quirks table, and fixing up the device early on in the discovery
process so everything else just works.


My question about the patch is is the interface generic enough.
The one thing I do not like is depending upon the HPA of the
device to determine the quirk, but I could not think of a 
different/better way to handle this.

Thoughts?

- Ryan




Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/drivers.c,v
retrieving revision 1.5
diff -u -p -r1.5 drivers.c
--- arch/parisc/kernel/drivers.c	16 Nov 2002 17:54:08 -0000	1.5
+++ arch/parisc/kernel/drivers.c	17 Nov 2002 18:54:37 -0000
@@ -416,6 +416,8 @@ alloc_pa_dev(unsigned long hpa, struct h
 	dev->id.sversion = ((iodc_data[4] & 0x0f) << 16) |
 			(iodc_data[5] << 8) | iodc_data[6];
 	dev->hpa = hpa;
+
+	parisc_hardware_quirks(dev);
 	name = parisc_hardware_description(&dev->id);
 	if (name) {
 		strncpy(dev->name, name, sizeof(dev->name)-1);
Index: arch/parisc/kernel/hardware.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/hardware.c,v
retrieving revision 1.4
diff -u -p -r1.4 hardware.c
--- arch/parisc/kernel/hardware.c	3 Nov 2002 01:52:48 -0000	1.4
+++ arch/parisc/kernel/hardware.c	17 Nov 2002 18:54:38 -0000
@@ -1289,6 +1289,21 @@ char *cpu_name_version[][2] = {
 	[pcxw2]	{ "PA8700 (PCX-W2)",	"2.0" }
 };
 
+static struct hp_hardware_quirk {
+	unsigned long hpa;
+	struct parisc_device_id quirk;
+	struct parisc_device_id real;
+} hp_hardware_quirk_list[] __initdata = {
+	/* E35 - Gecko BOA GSC Bus Converter is reported */
+	/* 	 as a U2 GSC Bus converter. */
+	{ 0xfffb8000,	{HPHW_BCPORT, 0, 0x501, 0x0000c },
+			{HPHW_BCPORT, 0, 0x500, 0x0000c }},
+
+	/* NULL terminated list */
+	{ 0x0,		{ HPHW_FAULTY, 0, 0x00, 0x0 },
+			{ HPHW_FAULTY, 0, 0x00, 0x0 }},
+};
+
 const char * __init
 parisc_hardware_description(struct parisc_device_id *id)
 {
@@ -1343,3 +1358,21 @@ parisc_get_cpu_type(unsigned long hversi
 	return pcx;	/* not reached: */
 }
 
+
+void __init parisc_hardware_quirks(struct parisc_device *dev)
+{
+	struct hp_hardware_quirk *list;
+
+	for(list = hp_hardware_quirk_list; list->hpa; list++) {
+		if((dev->hpa == list->hpa) && 
+			(dev->id.hw_type == list->quirk.hw_type) &&
+			(dev->id.hversion == list->quirk.hversion) &&
+			(dev->id.sversion == list->quirk.sversion)) 
+		{
+			dev->id.hw_type = list->real.hw_type;
+			dev->id.hversion = list->real.hversion;
+			dev->id.sversion = list->real.sversion;
+			return;
+		}
+	}
+}
Index: include/asm-parisc/hardware.h
===================================================================
RCS file: /var/cvs/linux-2.5/include/asm-parisc/hardware.h,v
retrieving revision 1.3
diff -u -p -r1.3 hardware.h
--- include/asm-parisc/hardware.h	20 Jul 2002 15:52:25 -0000	1.3
+++ include/asm-parisc/hardware.h	17 Nov 2002 18:54:38 -0000
@@ -131,6 +131,7 @@ struct bc_module {
 /* hardware.c: */
 extern const char *parisc_hardware_description(struct parisc_device_id *id);
 extern enum cpu_type parisc_get_cpu_type(unsigned long hversion);
+extern void parisc_hardware_quirks(struct parisc_device *dev);
 
 struct pci_dev;
 
