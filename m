Return-Path: <ryan_bradetich@hp.com>
From: Ryan Bradetich <ryan_bradetich@hp.com>
To: parisc-linux-cvs@lists.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="=-6F4BNpa4embhfpzG3xTy"
Message-Id: <1083634607.26081.6.camel@beavis>
Mime-Version: 1.0
Date: Mon, 03 May 2004 19:36:47 -0600
Cc: 
Subject: [parisc-linux] Removal of the CONFIG_PDC_NARROW option.
Reply-To: ryan_bradetich@hp.com
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--=-6F4BNpa4embhfpzG3xTy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello All,

I promised jejb a long time ago to get rid of the CONFIG_PDC_NARROW
config option and replace it with a run-time check.  This will allow
64-bit kernels to run on any 64-bit capable system and does not need to
be compiled special to run with narrow firmware.  I finally finished
this task and have committed it to CVS head.

I have attached the patch for review and I am posting to both lists
since some users might use the option and wonder about it when this
option is no longer present.

I have tested this patch on C200 (narrow firmware), K460 (wide
firmware), and A500 (wide firmware).

Thanks,

- Ryan



--=-6F4BNpa4embhfpzG3xTy
Content-Disposition: attachment; filename=64bit-runtime-check.patch
Content-Type: text/x-patch; name=64bit-runtime-check.patch; charset=us-ascii
Content-Transfer-Encoding: 7bit

Index: Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/Makefile,v
retrieving revision 1.186
diff -u -p -r1.186 Makefile
--- a/Makefile	2 May 2004 16:16:00 -0000	1.186
+++ b/Makefile	4 May 2004 01:14:40 -0000
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 6
-EXTRAVERSION =-rc3-pa6
+EXTRAVERSION =-rc3-pa7
 NAME=Zonked Quokka
 
 # *DOCUMENTATION*
Index: arch/parisc/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/Kconfig,v
retrieving revision 1.17
diff -u -p -r1.17 Kconfig
--- a/arch/parisc/Kconfig	26 Apr 2004 21:00:41 -0000	1.17
+++ b/arch/parisc/Kconfig	4 May 2004 01:14:42 -0000
@@ -117,18 +117,6 @@ config PARISC64
 config 64BIT
 	def_bool PARISC64
 
-config PDC_NARROW
-	bool "32-bit firmware"
-	depends on PARISC64
-	help
-	  This option will enable owners of C160, C180, C200, C240, C360, J280,
-	  J282, J2240 and some D/K/R class to run a 64bit kernel with their
-	  32bit PDC firmware.
-	
-	  Nobody should try this option unless they know what they are doing.
-	
-	  If unsure, say N.
-
 config SMP
 	bool "Symmetric multi-processing support"
 	---help---
Index: arch/parisc/kernel/firmware.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/firmware.c,v
retrieving revision 1.6
diff -u -p -r1.6 firmware.c
--- a/arch/parisc/kernel/firmware.c	14 Apr 2004 06:18:39 -0000	1.6
+++ b/arch/parisc/kernel/firmware.c	4 May 2004 01:14:42 -0000
@@ -10,6 +10,7 @@
  * Copyright 1999 SuSE GmbH Nuernberg (Philipp Rumpf, prumpf@tux.org)
  * Copyright 1999 The Puffin Group, (Alex deVries, David Kennedy)
  * Copyright 2003 Grant Grundler <grundler parisc-linux org>
+ * Copyright 2003,2004 Ryan Bradetich <rbrad@parisc-linux.org>
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License as published by
@@ -71,6 +72,15 @@ static spinlock_t pdc_lock = SPIN_LOCK_U
 static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
 static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));
 
+#ifdef __LP64__
+#define WIDE_FIRMWARE 0x1
+#define NARROW_FIRMWARE 0x2
+
+/* Firmware needs to be initially set to narrow to determine the 
+ * actual firmware width. */
+int parisc_narrow_firmware = 1;
+#endif
+
 /* on all currently-supported platforms, IODC I/O calls are always
  * 32-bit calls, and MEM_PDC calls are always the same width as the OS.
  * This means Cxxx boxes can't run wide kernels right now. -PB
@@ -87,11 +97,11 @@ long real64_call(unsigned long function,
 #endif
 long real32_call(unsigned long function, ...);
 
-#if defined(__LP64__) && ! defined(CONFIG_PDC_NARROW)
-#define MEM_PDC (unsigned long)(PAGE0->mem_pdc_hi) << 32 | PAGE0->mem_pdc
-#   define mem_pdc_call(args...) real64_call(MEM_PDC, args)
+#ifdef __LP64__
+#   define MEM_PDC (unsigned long)(PAGE0->mem_pdc_hi) << 32 | PAGE0->mem_pdc
+#   define mem_pdc_call(args...) unlikely(parisc_narrow_firmware) ? real32_call(MEM_PDC, args) : real64_call(MEM_PDC, args)
 #else
-#define MEM_PDC (unsigned long)PAGE0->mem_pdc
+#   define MEM_PDC (unsigned long)PAGE0->mem_pdc
 #   define mem_pdc_call(args...) real32_call(MEM_PDC, args)
 #endif
 
@@ -105,12 +115,14 @@ long real32_call(unsigned long function,
  */
 static unsigned long f_extend(unsigned long address)
 {
-#ifdef CONFIG_PDC_NARROW
-	if((address & 0xff000000) == 0xf0000000)
-		return 0xf0f0f0f000000000 | (u32)address;
-
-	if((address & 0xf0000000) == 0xf0000000)
-		return 0xffffffff00000000 | (u32)address;
+#ifdef __LP64__
+	if(unlikely(parisc_narrow_firmware)) {
+		if((address & 0xff000000) == 0xf0000000)
+			return 0xf0f0f0f000000000 | (u32)address;
+
+		if((address & 0xf0000000) == 0xf0000000)
+			return 0xffffffff00000000 | (u32)address;
+	}
 #endif
 	return address;
 }
@@ -125,11 +137,34 @@ static unsigned long f_extend(unsigned l
  */
 static void convert_to_wide(unsigned long *addr)
 {
-#ifdef CONFIG_PDC_NARROW
+#ifdef __LP64__
 	int i;
-	unsigned *p = (unsigned int *)addr;
-	for(i = 31; i >= 0; --i)
-		addr[i] = p[i];
+	unsigned int *p = (unsigned int *)addr;
+
+	if(unlikely(parisc_narrow_firmware)) {
+		for(i = 31; i >= 0; --i)
+			addr[i] = p[i];
+	}
+#endif
+}
+
+/**
+ * set_firmware_width - Determine if the firmware is wide or narrow.
+ * 
+ * This function must be called before any pdc_* function that uses the convert_to_wide
+ * function.
+ */
+void __init set_firmware_width(void)
+{
+#ifdef __LP64__
+	int retval;
+
+        spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES, __pa(pdc_result), 0);
+	convert_to_wide(pdc_result);
+	if(pdc_result[0] != NARROW_FIRMWARE)
+		parisc_narrow_firmware = 0;
+        spin_unlock_irq(&pdc_lock);
 #endif
 }
 
Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.7
diff -u -p -r1.7 head64.S
--- a/arch/parisc/kernel/head64.S	1 May 2004 20:03:11 -0000	1.7
+++ b/arch/parisc/kernel/head64.S	4 May 2004 01:14:42 -0000
@@ -165,7 +165,6 @@ common_stext:
 	tophys_r1	%r10
 	std		%r11,  TASK_PT_GR11(%r10)
 
-#ifndef CONFIG_PDC_NARROW
 	/* Switch to wide mode; Superdome doesn't support narrow PDC
 	** calls.
 	*/
@@ -175,7 +174,6 @@ common_stext:
 	bv		(%rp)
 	ssm		PSW_SM_W,%r0
 2:
-#endif /* CONFIG_PDC_NARROW */
 
 	/* Set Wide mode as the "Default" (eg for traps)
 	** First trap occurs *right* after (or part of) rfi for slave CPUs.
Index: arch/parisc/kernel/processor.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/processor.c,v
retrieving revision 1.3
diff -u -p -r1.3 processor.c
--- a/arch/parisc/kernel/processor.c	18 Oct 2003 01:01:12 -0000	1.3
+++ b/arch/parisc/kernel/processor.c	4 May 2004 01:14:42 -0000
@@ -276,6 +276,7 @@ int __init init_per_cpu(int cpunum)
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
 
+	set_firmware_width();
 	ret = pdc_coproc_cfg(&coproc_cfg);
 
 	if(ret >= 0 && coproc_cfg.ccr_functional) {
Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/setup.c,v
retrieving revision 1.4
diff -u -p -r1.4 setup.c
--- a/arch/parisc/kernel/setup.c	14 Apr 2004 06:18:39 -0000	1.4
+++ b/arch/parisc/kernel/setup.c	4 May 2004 01:14:42 -0000
@@ -121,8 +121,11 @@ void __init setup_arch(char **cmdline_p)
 
 	pdc_console_init();
 
-#ifdef CONFIG_PDC_NARROW
-	printk(KERN_INFO "Kernel is using PDC in 32-bit mode.\n");
+#ifdef __LP64__
+	extern int parisc_narrow_firmware;
+	if(parisc_narrow_firmware) {
+		printk(KERN_INFO "Kernel is using PDC in 32-bit mode.\n");
+	}
 #endif
 	setup_pdc();
 	setup_cmdline(cmdline_p);
Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pdc.h,v
retrieving revision 1.4
diff -u -p -r1.4 pdc.h
--- a/include/asm-parisc/pdc.h	21 Dec 2003 13:13:10 -0000	1.4
+++ b/include/asm-parisc/pdc.h	4 May 2004 01:14:49 -0000
@@ -949,6 +949,7 @@ int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
 
 #ifdef __LP64__
+void set_firmware_width(void);
 int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr,
 		struct pdc_memory_table *tbl, unsigned long entries);
 #endif

--=-6F4BNpa4embhfpzG3xTy--
