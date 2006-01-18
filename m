From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [RF{C,T} PATCH] chassis_power_off
Date: Wed, 18 Jan 2006 00:24:56 -0500
Message-ID: <20060118052456.GJ4049@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

I *think* this should fix halt -p with 2.6.16-rc1. Comments please...
The motivation for this is a recent change to sys_reboot(),

http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blobdiff;h=d8e49e659027f70de633b69d2efd13132a428bb5;hp=eecf84526afeca15c7e82894c5c3e898239fa062;hb=5e38291d80086f6972f471c7caffa03184de0bf0;f=kernel/sys.c

If nobody raises an objection to this, I'll commit it.

Cheers,
	Kyle

Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/process.c,v
retrieving revision 1.26
diff -u -d -p -r1.26 process.c
--- arch/parisc/kernel/process.c	17 Jan 2006 14:50:31 -0000	1.26
+++ arch/parisc/kernel/process.c	18 Jan 2006 05:13:34 -0000
@@ -54,12 +54,6 @@
 #include <asm/uaccess.h>
 #include <asm/unwind.h>
 
-/*
- * Power off function, if any
- */ 
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
 void default_idle(void)
 {
 	barrier();
@@ -142,6 +136,7 @@ void machine_halt(void)
 	*/
 }
 
+void (*chassis_power_off)(void);
 
 /*
  * This routine is called from sys_reboot to actually turn off the
@@ -150,8 +145,8 @@ void machine_halt(void)
 void machine_power_off(void)
 {
 	/* If there is a registered power off handler, call it. */
-	if(pm_power_off)
-		pm_power_off();
+	if (chassis_power_off)
+		chassis_power_off();
 
 	/* Put the soft power button back under hardware control.
 	 * If the user had already pressed the power button, the
@@ -167,6 +162,8 @@ void machine_power_off(void)
 	       KERN_EMERG "Please power this system off now.");
 }
 
+void (*pm_power_off)(void) = machine_power_off;
+EXPORT_SYMBOL(pm_power_off);
 
 /*
  * Create a kernel thread
Index: drivers/parisc/lasi.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lasi.c,v
retrieving revision 1.21
diff -u -d -p -r1.21 lasi.c
--- drivers/parisc/lasi.c	17 Jan 2006 19:40:39 -0000	1.21
+++ drivers/parisc/lasi.c	18 Jan 2006 05:13:36 -0000
@@ -166,6 +166,7 @@ static void lasi_power_off(void)
 int __init
 lasi_init_chip(struct parisc_device *dev)
 {
+	extern void (*chassis_power_off)(void);
 	struct gsc_asic *lasi;
 	struct gsc_irq gsc_irq;
 	int ret;
@@ -222,7 +223,7 @@ lasi_init_chip(struct parisc_device *dev
 	 * ensure that only the first LASI (the one controlling the power off)
 	 * should set the HPA here */
 	lasi_power_off_hpa = lasi->hpa;
-	pm_power_off = lasi_power_off;
+	chassis_power_off = lasi_power_off;
 	
 	return ret;
 }
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
