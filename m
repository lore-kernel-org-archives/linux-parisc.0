From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in
	parisc/kernel
Date: Sun, 27 May 2007 19:30:36 +0200
Message-ID: <200705271930.36593.deller__23716.7636085816$1416624369$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

Hi Kyle,

this patch fixes two section mismatches in parisc/kernel:
WARNING: arch/parisc/kernel/built-in.o(.data.read_mostly+0xd8): Section mismatch: reference to .init.text:processor_probe (between 'cpu_driver' and 'boot_cpu_data')
WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x140): Section mismatch: reference to .init.text:parisc_hardware_description (after 'alloc_pa_dev')

Additionally, mark some tables as constants.

Please apply, Helge

    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index e365f03..04848b2 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -38,7 +38,7 @@
  *	so don't reference this table after starting the init process
  */
  
-static struct hp_hardware hp_hardware_list[] __initdata = {
+static struct hp_hardware hp_hardware_list[] __devinitdata = {
 	{HPHW_NPROC,0x01,0x4,0x0,"Indigo (840, 930)"},
 	{HPHW_NPROC,0x8,0x4,0x01,"Firefox(825,925)"},
 	{HPHW_NPROC,0xA,0x4,0x01,"Top Gun (835,834,935,635)"},
@@ -1219,7 +1219,7 @@ static struct hp_cpu_type_mask {
 	unsigned short model;
 	unsigned short mask;
 	enum cpu_type cpu;
-} hp_cpu_type_mask_list[] __initdata = {
+} hp_cpu_type_mask_list[] __devinitdata = {
 
 	{ 0x0000, 0x0ff0, pcx    },  /* 0x0000 - 0x000f */
 	{ 0x0048, 0x0ff0, pcxl   },  /* 0x0040 - 0x004f */
@@ -1300,7 +1300,7 @@ static struct hp_cpu_type_mask {
 	{ 0x0000, 0x0000, pcx    }	/* terminate table */
 };
 
-char *cpu_name_version[][2] = {
+const char * const cpu_name_version[][2] = {
 	[pcx]	= { "PA7000 (PCX)",	"1.0" },
 	[pcxs]	= { "PA7000 (PCX-S)",	"1.1a" },
 	[pcxt]	= { "PA7100 (PCX-T)",	"1.1b" },
@@ -1316,7 +1316,7 @@ char *cpu_name_version[][2] = {
 	[mako2] = { "PA8900 (Shortfin)",	"2.0" }
 };
 
-const char * __init
+const char * __devinit
 parisc_hardware_description(struct parisc_device_id *id)
 {
 	struct hp_hardware *listptr;
@@ -1355,7 +1355,7 @@ parisc_hardware_description(struct paris
 
 
 /* Interpret hversion (ret[0]) from PDC_MODEL(4)/PDC_MODEL_INFO(0) */
-enum cpu_type __init
+enum cpu_type __cpuinit
 parisc_get_cpu_type(unsigned long hversion)
 {
 	struct hp_cpu_type_mask *ptr;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 27f9553..549f548 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -76,7 +76,7 @@ extern int update_cr16_clocksource(void)
  * (return 1).  If so, initialize the chip and tell other partners in crime 
  * they have work to do.
  */
-static int __init processor_probe(struct parisc_device *dev)
+static int __cpuinit processor_probe(struct parisc_device *dev)
 {
 	unsigned long txn_addr;
 	unsigned long cpuid;
@@ -381,12 +381,12 @@ show_cpuinfo (struct seq_file *m, void *
 	return 0;
 }
 
-static struct parisc_device_id processor_tbl[] __read_mostly = {
+static const struct parisc_device_id processor_tbl[] = {
 	{ HPHW_NPROC, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, SVERSION_ANY_ID },
 	{ 0, }
 };
 
-static struct parisc_driver cpu_driver __read_mostly = {
+static struct parisc_driver cpu_driver = {
 	.name		= "CPU",
 	.id_table	= processor_tbl,
 	.probe		= processor_probe
diff --git a/include/asm-parisc/hardware.h b/include/asm-parisc/hardware.h
index daf58dd..4e96268 100644
--- a/include/asm-parisc/hardware.h
+++ b/include/asm-parisc/hardware.h
@@ -35,7 +35,7 @@ enum cpu_type {
 	mako2	= 12  /* pa8900		pa 2.0  */
 };
 
-extern char *cpu_name_version[][2]; /* mapping from enum cpu_type to strings */
+extern const char * const cpu_name_version[][2]; /* mapping from enum cpu_type to strings */
 
 struct parisc_driver;
 
diff --git a/include/asm-parisc/processor.h b/include/asm-parisc/processor.h
index 0052dc9..6b294fb 100644
--- a/include/asm-parisc/processor.h
+++ b/include/asm-parisc/processor.h
@@ -69,8 +69,8 @@ struct system_cpuinfo_parisc {
 		char   sys_model_name[81]; /* PDC-ROM returnes this model name */
 	} pdc;
 
-	char		*cpu_name;	/* e.g. "PA7300LC (PCX-L2)" */
-	char		*family_name;	/* e.g. "1.1e" */
+	const char	*cpu_name;	/* e.g. "PA7300LC (PCX-L2)" */
+	const char	*family_name;	/* e.g. "1.1e" */
 };
 
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
