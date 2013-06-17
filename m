From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] parisc: delete __cpuinit usage from all users
Date: Mon, 17 Jun 2013 16:34:24 -0400
Message-ID: <1371501264-12546-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: <linux-parisc@vger.kernel.org>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The __cpuinit type of throwaway sections might have made sense
some time ago when RAM was more constrained, but now the savings
do not offset the cost and complications.  For example, the fix in
commit 5e427ec2d0 ("x86: Fix bit corruption at CPU resume time")
is a good example of the nasty type of bugs that can be created
with improper use of the various __init prefixes.

After a discussion on LKML[1] it was decided that cpuinit should go
the way of devinit and be phased out.  Once all the users are gone,
we can then finally remove the macros themselves from linux/init.h.

This removes all the parisc uses of the __cpuinit macros.

[1] https://lkml.org/lkml/2013/5/20/589

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[This was generated against today's linux-next tree ; I'm assuming all
 pending parisc changes are in there currently.]

 arch/parisc/kernel/firmware.c  | 14 ++++++++------
 arch/parisc/kernel/hardware.c  |  2 +-
 arch/parisc/kernel/processor.c |  6 +++---
 arch/parisc/kernel/smp.c       |  8 ++++----
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index f65fa48..2239590 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -150,7 +150,7 @@ static void convert_to_wide(unsigned long *addr)
 }
 
 #ifdef CONFIG_64BIT
-void __cpuinit set_firmware_width_unlocked(void)
+void set_firmware_width_unlocked(void)
 {
 	int ret;
 
@@ -167,7 +167,7 @@ void __cpuinit set_firmware_width_unlocked(void)
  * This function must be called before any pdc_* function that uses the
  * convert_to_wide function.
  */
-void __cpuinit set_firmware_width(void)
+void set_firmware_width(void)
 {
 	unsigned long flags;
 	spin_lock_irqsave(&pdc_lock, flags);
@@ -175,11 +175,13 @@ void __cpuinit set_firmware_width(void)
 	spin_unlock_irqrestore(&pdc_lock, flags);
 }
 #else
-void __cpuinit set_firmware_width_unlocked(void) {
+void set_firmware_width_unlocked(void)
+{
 	return;
 }
 
-void __cpuinit set_firmware_width(void) {
+void set_firmware_width(void)
+{
 	return;
 }
 #endif /*CONFIG_64BIT*/
@@ -301,7 +303,7 @@ int pdc_chassis_warn(unsigned long *warn)
 	return retval;
 }
 
-int __cpuinit pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
+int pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
 {
 	int ret;
 
@@ -322,7 +324,7 @@ int __cpuinit pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
  * This PDC call returns the presence and status of all the coprocessors
  * attached to the processor.
  */
-int __cpuinit pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
+int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
 {
 	int ret;
 	unsigned long flags;
diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 9e2d2e4..6f4bbb8 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -1366,7 +1366,7 @@ const char *parisc_hardware_description(struct parisc_device_id *id)
 
 
 /* Interpret hversion (ret[0]) from PDC_MODEL(4)/PDC_MODEL_INFO(0) */
-enum cpu_type __cpuinit
+enum cpu_type
 parisc_get_cpu_type(unsigned long hversion)
 {
 	struct hp_cpu_type_mask *ptr;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index c8fb61e..a128a94 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -73,7 +73,7 @@ extern int update_cr16_clocksource(void);	/* from time.c */
  *
  * FIXME: doesn't do much yet...
  */
-static void __cpuinit
+static void
 init_percpu_prof(unsigned long cpunum)
 {
 	struct cpuinfo_parisc *p;
@@ -92,7 +92,7 @@ init_percpu_prof(unsigned long cpunum)
  * (return 1).  If so, initialize the chip and tell other partners in crime 
  * they have work to do.
  */
-static int __cpuinit processor_probe(struct parisc_device *dev)
+static int processor_probe(struct parisc_device *dev)
 {
 	unsigned long txn_addr;
 	unsigned long cpuid;
@@ -299,7 +299,7 @@ void __init collect_boot_cpu_data(void)
  *
  * o Enable CPU profiling hooks.
  */
-int __cpuinit init_per_cpu(int cpunum)
+int init_per_cpu(int cpunum)
 {
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index e3614fb..8a252f2 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -62,9 +62,9 @@ static int smp_debug_lvl = 0;
 volatile struct task_struct *smp_init_current_idle_task;
 
 /* track which CPU is booting */
-static volatile int cpu_now_booting __cpuinitdata;
+static volatile int cpu_now_booting;
 
-static int parisc_max_cpus __cpuinitdata = 1;
+static int parisc_max_cpus = 1;
 
 static DEFINE_PER_CPU(spinlock_t, ipi_lock);
 
@@ -328,7 +328,7 @@ void __init smp_callin(void)
 /*
  * Bring one cpu online.
  */
-int __cpuinit smp_boot_one_cpu(int cpuid, struct task_struct *idle)
+int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
 {
 	const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
 	long timeout;
@@ -424,7 +424,7 @@ void smp_cpus_done(unsigned int cpu_max)
 }
 
 
-int __cpuinit __cpu_up(unsigned int cpu, struct task_struct *tidle)
+int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
 	if (cpu != 0 && cpu < parisc_max_cpus)
 		smp_boot_one_cpu(cpu, tidle);
-- 
1.8.1.2

