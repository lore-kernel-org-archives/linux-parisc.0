From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 10/23] [PARISC] PDC_CHASSIS is implemented on
	all machines
Date: Sun, 25 Jun 2006 19:34:38 -0400
Message-ID: <11512784921346-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
Cc: Thibaut Varene <varenet@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

From: Thibaut Varene <varenet@parisc-linux.org>

This patch removes a limitation of the original code, so that CHASSIS
codes can be sent to all machines. On machines with a LCD panel, this
code displays "INI" during bootup, "RUN" when the system is booted and
running, "FLT" when a panic occurs, etc.

This part of the code can be enabled/disabled through CONFIG_PDC_CHASSIS

This patch also adds minimalistic support for Chassis warnings, through
a proc entry '/proc/chassis', which will reflect the warnings status (PSU
or fans failure when they happen, NVRAM battery level and temperature
thresholds overflows).

This part of the code can be enabled/disabled through CONFIG_PDC_CHASSIS_WARN

Signed-off-by: Thibaut VARENE <varenet@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/firmware.c    |   22 +++++++++--
 arch/parisc/kernel/pdc_chassis.c |   73 ++++++++++++++++++++++++++++++++------
 drivers/parisc/Kconfig           |   33 ++++++++++++++---
 include/asm-parisc/pdc.h         |    1 +
 4 files changed, 107 insertions(+), 22 deletions(-)

10308768c98d32cf8606224ee01c92dc9ff57126
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 2dc06b8..0596f27 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -11,7 +11,7 @@
  * Copyright 1999 The Puffin Group, (Alex deVries, David Kennedy)
  * Copyright 2003 Grant Grundler <grundler parisc-linux org>
  * Copyright 2003,2004 Ryan Bradetich <rbrad@parisc-linux.org>
- * Copyright 2004 Thibaut VARENE <varenet@parisc-linux.org>
+ * Copyright 2004,2006 Thibaut VARENE <varenet@parisc-linux.org>
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License as published by
@@ -252,10 +252,8 @@ int pdc_pat_chassis_send_log(unsigned lo
 #endif
 
 /**
- * pdc_chassis_disp - Updates display
+ * pdc_chassis_disp - Updates chassis code
  * @retval: -1 on error, 0 on success
- *
- * Works on old PDC only (E class, others?)
  */
 int pdc_chassis_disp(unsigned long disp)
 {
@@ -269,6 +267,22 @@ int pdc_chassis_disp(unsigned long disp)
 }
 
 /**
+ * pdc_chassis_warn - Fetches chassis warnings
+ * @retval: -1 on error, 0 on success
+ */
+int pdc_chassis_warn(unsigned long *warn)
+{
+	int retval = 0;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_WARN, __pa(pdc_result));
+	*warn = pdc_result[0];
+	spin_unlock_irq(&pdc_lock);
+
+	return retval;
+}
+
+/**
  * pdc_coproc_cfg - To identify coprocessors attached to the processor.
  * @pdc_coproc_info: Return buffer address.
  *
diff --git a/arch/parisc/kernel/pdc_chassis.c b/arch/parisc/kernel/pdc_chassis.c
index a45e2e2..51e86c0 100644
--- a/arch/parisc/kernel/pdc_chassis.c
+++ b/arch/parisc/kernel/pdc_chassis.c
@@ -1,8 +1,8 @@
 /* 
- *    interfaces to log Chassis Codes via PDC (firmware)
+ *    interfaces to Chassis Codes via PDC (firmware)
  *
  *    Copyright (C) 2002 Laurent Canet <canetl@esiee.fr>
- *    Copyright (C) 2002-2004 Thibaut VARENE <varenet@parisc-linux.org>
+ *    Copyright (C) 2002-2006 Thibaut VARENE <varenet@parisc-linux.org>
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License, version 2, as
@@ -16,6 +16,9 @@
  *    You should have received a copy of the GNU General Public License
  *    along with this program; if not, write to the Free Software
  *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ *    TODO: poll chassis warns, trigger (configurable) machine shutdown when
+ *    		needed.
  */
 
 #undef PDC_CHASSIS_DEBUG
@@ -30,6 +33,7 @@ #include <linux/kernel.h>
 #include <linux/reboot.h>
 #include <linux/notifier.h>
 #include <linux/cache.h>
+#include <linux/proc_fs.h>
 
 #include <asm/pdc_chassis.h>
 #include <asm/processor.h>
@@ -38,7 +42,6 @@ #include <asm/pdcpat.h>
 
 
 #ifdef CONFIG_PDC_CHASSIS
-static int pdc_chassis_old __read_mostly = 0;	
 static unsigned int pdc_chassis_enabled __read_mostly = 1;
 
 
@@ -64,7 +67,7 @@ __setup("pdcchassis=", pdc_chassis_setup
  * Currently, only E class and A180 are known to work with this.
  * Inspired by Christoph Plattner
  */
-
+#if 0
 static void __init pdc_chassis_checkold(void)
 {
 	switch(CPU_HVERSION) {
@@ -73,7 +76,6 @@ static void __init pdc_chassis_checkold(
 		case 0x482:		/* E45 */
 		case 0x483:		/* E55 */
 		case 0x516:		/* A180 */
-			pdc_chassis_old = 1;
 			break;
 
 		default:
@@ -81,7 +83,7 @@ static void __init pdc_chassis_checkold(
 	}
 	DPRINTK(KERN_DEBUG "%s: pdc_chassis_checkold(); pdc_chassis_old = %d\n", __FILE__, pdc_chassis_old);
 }
-
+#endif
 
 /**
  * pdc_chassis_panic_event() - Called by the panic handler.
@@ -136,14 +138,13 @@ #ifdef CONFIG_PDC_CHASSIS
 		DPRINTK(KERN_DEBUG "%s: parisc_pdc_chassis_init()\n", __FILE__);
 
 		/* Let see if we have something to handle... */
-		/* Check for PDC_PAT or old LED Panel */
-		pdc_chassis_checkold();
+		/* Check for PDC_PAT */
 		if (is_pdc_pat()) {
 			printk(KERN_INFO "Enabling PDC_PAT chassis codes support.\n");
 			handle = 1;
 		}
-		else if (unlikely(pdc_chassis_old)) {
-			printk(KERN_INFO "Enabling old style chassis LED panel support.\n");
+		else {
+			printk(KERN_INFO "Enabling regular chassis codes support.\n");
 			handle = 1;
 		}
 
@@ -215,9 +216,12 @@ #ifdef CONFIG_64BIT
 			}
 		} else retval = -1;
 #else
-		if (unlikely(pdc_chassis_old)) {
+		if (1) {
 			switch (message) {
 				case PDC_CHASSIS_DIRECT_BSTART:
+					retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_INIT));
+					break;
+
 				case PDC_CHASSIS_DIRECT_BCOMPLETE:
 					retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_RUN));
 					break;
@@ -244,3 +248,50 @@ #endif /* CONFIG_64BIT */
 #endif /* CONFIG_PDC_CHASSIS */
 	return retval;
 }
+
+#ifdef CONFIG_PDC_CHASSIS_WARN
+#ifdef CONFIG_PROC_FS
+static int pdc_chassis_warn_pread(char *page, char **start, off_t off,
+		int count, int *eof, void *data)
+{
+	char *out = page;
+	int len, ret;
+	unsigned long warn;
+	u32 warnreg;
+
+	ret = pdc_chassis_warn(&warn);
+	if (ret != PDC_OK)
+		return -EIO;
+
+	warnreg = (warn & 0xFFFFFFFF);
+
+	if ((warnreg >> 24) & 0xFF)
+		out += sprintf(out, "Chassis component failure! (eg fan or PSU): 0x%.2x\n", ((warnreg >> 24) & 0xFF));
+
+	out += sprintf(out, "Battery: %s\n", (warnreg & 0x04) ? "Low!" : "OK");
+	out += sprintf(out, "Temp low: %s\n", (warnreg & 0x02) ? "Exceeded!" : "OK");
+	out += sprintf(out, "Temp mid: %s\n", (warnreg & 0x01) ? "Exceeded!" : "OK");
+
+	len = out - page - off;
+	if (len < count) {
+		*eof = 1;
+		if (len <= 0) return 0;
+	} else {
+		len = count;
+	}
+	*start = page + off;
+	return len;
+}
+
+static int __init pdc_chassis_create_procfs(void)
+{
+	printk(KERN_INFO "Enabling PDC chassis warnings support.\n");
+	create_proc_read_entry("chassis", 0400, NULL, pdc_chassis_warn_pread,
+				NULL);
+	return 0;
+}
+
+__initcall(pdc_chassis_create_procfs);
+
+#endif /* CONFIG_PROC_FS */
+#endif /* CONFIG_PDC_CHASSIS_WARN */
diff --git a/drivers/parisc/Kconfig b/drivers/parisc/Kconfig
index 3f5de86..1d3b84b 100644
--- a/drivers/parisc/Kconfig
+++ b/drivers/parisc/Kconfig
@@ -140,18 +140,37 @@ config CHASSIS_LCD_LED
 	  If unsure, say Y.
 
 config PDC_CHASSIS
-	bool "PDC chassis State Panel support"
+	bool "PDC chassis state codes support"
 	default y
 	help
-	  Say Y here if you want to enable support for the LED State front
-	  panel as found on E class, and support for the GSP Virtual Front
-	  Panel (LED State and message logging)  as found on high end
-	  servers such as A, L and N-class.
-	  
-	  This has nothing to do with Chassis LCD and LED support.
+	  Say Y here if you want to enable support for Chassis codes.
+	  That includes support for LED State front panel as found on E
+	  class, and support for the GSP Virtual Front Panel (LED State and
+	  message logging)  as found on high end servers such as A, L and
+	  N-class.
+	  This driver will also display progress messages on LCD display,
+	  such as "INI", "RUN" and "FLT", and might thus clobber messages
+	  shown by the LED/LCD driver.
+	  This driver updates the state panel (LED and/or LCD) upon system
+	  state change (eg: boot, shutdown or panic).
 	  
 	  If unsure, say Y.
 
+
+config PDC_CHASSIS_WARN
+	bool "PDC chassis warnings support"
+	depends on PROC_FS
+	default y
+	help
+	  Say Y here if you want to enable support for Chassis warnings.
+	  This will add a proc entry '/proc/chassis' giving some information
+	  about the overall health state of the system.
+	  This includes NVRAM battery level, overtemp or failures such as
+	  fans or power units.
+
+	  If unsure, say Y.
+
+
 config PDC_STABLE
 	tristate "PDC Stable Storage support"
 	depends on SYSFS
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index 08364f9..7d8a71a 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -719,6 +719,7 @@ void setup_pdc(void);		/* in inventory.c
 int pdc_add_valid(unsigned long address);
 int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len);
 int pdc_chassis_disp(unsigned long disp);
+int pdc_chassis_warn(unsigned long *warn);
 int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info);
 int pdc_iodc_read(unsigned long *actcnt, unsigned long hpa, unsigned int index,
 		  void *iodc_data, unsigned int iodc_data_size);
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
