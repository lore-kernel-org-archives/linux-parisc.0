From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix section mismatch warnings
Date: Tue, 13 Jan 2009 20:51:29 +0100
Message-ID: <496CF0C1.8010906@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 03f26bd..f6d2412 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -151,7 +151,7 @@ static void convert_to_wide(unsigned long *addr)
 }
 
 #ifdef CONFIG_64BIT
-void __init set_firmware_width_unlocked(void)
+void __cpuinit set_firmware_width_unlocked(void)
 {
 	int ret;
 
@@ -168,7 +168,7 @@ void __init set_firmware_width_unlocked(void)
  * This function must be called before any pdc_* function that uses the
  * convert_to_wide function.
  */
-void __init set_firmware_width(void)
+void __cpuinit set_firmware_width(void)
 {
 	unsigned long flags;
 	spin_lock_irqsave(&pdc_lock, flags);
@@ -176,11 +176,11 @@ void __init set_firmware_width(void)
 	spin_unlock_irqrestore(&pdc_lock, flags);
 }
 #else
-void __init set_firmware_width_unlocked(void) {
+void __cpuinit set_firmware_width_unlocked(void) {
 	return;
 }
 
-void __init set_firmware_width(void) {
+void __cpuinit set_firmware_width(void) {
 	return;
 }
 #endif /*CONFIG_64BIT*/
@@ -302,7 +302,7 @@ int pdc_chassis_warn(unsigned long *warn)
 	return retval;
 }
 
-int __init pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
+int __cpuinit pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
 {
 	int ret;
 
@@ -323,7 +323,7 @@ int __init pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
  * This PDC call returns the presence and status of all the coprocessors
  * attached to the processor.
  */
-int __init pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
+int __cpuinit pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
 {
 	int ret;
 	unsigned long flags;
