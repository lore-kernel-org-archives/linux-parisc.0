Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id EECFB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Mar 2001 01:18:40 -0700 (MST)
Received: from rbrad by beavis.ybsoft.com with local (Exim 3.20 #1 (Debian))
	id 14iXdW-0001JK-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Mar 2001 01:18:30 -0700
Date: Thu, 29 Mar 2001 01:18:30 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010329011830.A18639@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
Subject: [parisc-linux] [PATCH] PDC cleanup and encapsulation
List-ID: <linux-parisc.vger.kernel.org>

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello parisc-linux hackers,

This is a fairly extensive patch which (almost) finishes the PDC cleanups I
have been working on.  The goal of this patch was to add kernel-docs and
encapsulate the firmware calls so the caller does not have to worry about
alignment issues, etc.

The last PDC/firware cleanup I have on my list is to rename asm/pdc.h
to firmware.h.  This will be a seperate patch after this patch has been
reviewed/approved/committed.

I have tested this patch on the following machines:
	- 712/80 using STI console
	- C200 32-bit kernel using serial console
	- A500 64-bit kernel using serial console

Since the majority of the changes are in firmware.c and pdc.h
I have included include those files in their entirity to make
them easier to read.

As always, feedback, concerns, and questions are welcome.

Thanks,

- Ryan


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pdc4.patch"

? pdc4.patch
Index: arch/parisc/kernel/Makefile
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/Makefile,v
retrieving revision 1.33
diff -u -p -r1.33 Makefile
--- Makefile	2001/03/24 03:09:50	1.33
+++ Makefile	2001/03/29 07:57:50
@@ -41,7 +41,7 @@ obj-$(CONFIG_IOMMU_SBA) += sba_iommu.o
 obj-$(CONFIG_IOMMU_CCIO) += ccio-dma.o
 obj-$(CONFIG_CHASSIS_LCD_LED) += led.o 
 obj-$(CONFIG_SUPERIO) += superio.o
-obj-$(CONFIG_PARISC64) += pdcpat.o binfmt_elf32.o sys_parisc32.o \
+obj-$(CONFIG_PARISC64) += binfmt_elf32.o sys_parisc32.o \
 		ioctl32.o signal32.o
 
 include $(TOPDIR)/Rules.make
Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/cache.c,v
retrieving revision 1.13
diff -u -p -r1.13 cache.c
--- cache.c	2001/01/13 09:50:00	1.13
+++ cache.c	2001/03/29 07:57:50
@@ -28,7 +28,7 @@ int dcache_stride;
 int icache_stride;
 
 struct pdc_cache_info cache_info;
-#ifndef __LP64__
+#ifndef CONFIG_PA20
 static struct pdc_btlb_info btlb_info;
 #endif
 
@@ -73,7 +73,7 @@ int get_cache_info(char *buffer)
 		cache_info.dt_conf.tc_sh ? " - shared with ITLB":""
 	);
 		
-#ifndef __LP64__
+#ifndef CONFIG_PA20
 	/* BTLB - Block TLB */
 	if (btlb_info.max_size==0) {
 		p += sprintf(p, "BTLB\t\t: not supported\n" );
@@ -164,7 +164,7 @@ cache_init(void)
 			 cache_info.dc_conf.cc_line );
 	icache_stride = ( (1<<(cache_info.ic_conf.cc_block+3)) *
 			 cache_info.ic_conf.cc_line );
-#ifndef __LP64__
+#ifndef CONFIG_PA20
 	if(pdc_btlb_info(&btlb_info)<0) {
 		memset(&btlb_info, 0, sizeof btlb_info);
 	}
Index: arch/parisc/kernel/ccio-dma.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/ccio-dma.c,v
retrieving revision 1.28
diff -u -p -r1.28 ccio-dma.c
--- ccio-dma.c	2001/03/02 10:31:49	1.28
+++ ccio-dma.c	2001/03/29 07:57:50
@@ -1249,11 +1249,9 @@ static struct {
 		u16 hversion;
 		u8  spa;
 		u8  type;
-		u32     foo[3];	/* 16 bytes total */
-} cujo_iodc __attribute__ ((aligned (64)));
+		u32 foo[3];	/* 16 bytes total */
+} cujo_iodc;
 
-static unsigned long cujo_result[32] __attribute__ ((aligned (16))) = {0,0,0,0};
-
 /*
 ** CUJO 2.0 incorrectly decodes a memory access for specific
 ** pages (every page at specific iotlb locations dependent
@@ -1276,6 +1274,7 @@ static unsigned long cujo_result[32] __a
 static void
 ccio_cujo20_hack(struct ioc *ioc)
 {
+	unsigned long bytecnt;
 	u32 iovp = 0, io_io_low;
 	unsigned int idx;
 	unsigned long status, mask;
@@ -1286,12 +1285,12 @@ ccio_cujo20_hack(struct ioc *ioc)
 	if(!(CUJO_RAVEN_LOC == io_io_low || CUJO_FIREHAWK_LOC == io_io_low))
 		return;
 	
-	status = pdc_iodc_read(&cujo_result, (void *)CUJO_RAVEN_LOC, 0, &cujo_iodc, 16);
+	status = pdc_iodc_read(&bytecnt, (void *)CUJO_RAVEN_LOC, 0, &cujo_iodc, 16);
 	if(0 == status) {
 		if(CUJO_20_BADHVERS == cujo_iodc.hversion)
 			iovp = CUJO_20_BADPAGE1;
 	} else {
-		status = pdc_iodc_read(&cujo_result, (void *)CUJO_FIREHAWK_LOC, 0, &cujo_iodc, 16);
+		status = pdc_iodc_read(&bytecnt, (void *)CUJO_FIREHAWK_LOC, 0, &cujo_iodc, 16);
 		if(0 == status) {
 			if(CUJO_20_BADHVERS == cujo_iodc.hversion)
 				iovp = CUJO_20_BADPAGE2;
Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.14
diff -u -p -r1.14 drivers.c
--- drivers.c	2001/02/27 00:35:43	1.14
+++ drivers.c	2001/03/29 07:57:50
@@ -24,10 +24,6 @@ static struct hp_device pa_devices[MAX_D
 
 static struct pa_iodc_driver *pa_drivers = NULL;
 
-static unsigned long pdc_result[32] __attribute__ ((aligned (16))) = {0,0,0,0};
-static  u8 iodc_data[32] __attribute__ ((aligned (64)));
-
-
 static int compare_spec( struct hp_device * hp_dev,
 	struct pa_iodc_driver *driver)
 {
@@ -153,10 +149,12 @@ int add_pa_dev_addr(struct hp_device *hp
 struct hp_device *alloc_pa_dev(unsigned long hpa)
 {
 	int i, status;
+	unsigned long bytecnt;
+	u8 iodc_data[32];
 	struct hp_device * d;
 
 	d = &pa_devices[num_devices];
-	status = pdc_iodc_read(&pdc_result, (void *)hpa, 0, &iodc_data, 32);
+	status = pdc_iodc_read(&bytecnt, (void *)hpa, 0, &iodc_data, 32);
 	if (status != PDC_RET_OK) {
 		/* There is no device here, so we'll skip it */
 		return NULL;
Index: arch/parisc/kernel/firmware.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/firmware.c,v
retrieving revision 1.25
diff -u -p -r1.25 firmware.c
--- firmware.c	2001/03/22 06:46:32	1.25
+++ firmware.c	2001/03/29 07:57:51
@@ -44,6 +44,36 @@
 
 #include <stdarg.h>
 
+static spinlock_t pdc_lock = SPIN_LOCK_UNLOCKED;
+static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
+static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));
+
+/* on all currently-supported platforms, IODC I/O calls are always
+ * 32-bit calls, and MEM_PDC calls are always the same width as the OS.
+ * This means Cxxx boxes can't run wide kernels right now. -PB
+ *
+ * CONFIG_PDC_NARROW has been added to allow 64-bit kernels to run on
+ * systems with 32-bit MEM_PDC calls. This will allow wide kernels to
+ * run on Cxxx boxes now. -RB
+ *
+ * Note that some PAT boxes may have 64-bit IODC I/O...
+ */
+
+/* yes 'int', not 'long' -- IODC I/O is always 32-bit stuff */
+#ifdef __LP64__
+static long real64_call(unsigned long function, ...);
+#endif
+static long real32_call(unsigned long function, ...);
+
+#if defined(__LP64__) && ! defined(CONFIG_PDC_NARROW)
+#define MEM_PDC (unsigned long)(PAGE0->mem_pdc_hi) << 32 | PAGE0->mem_pdc
+#   define mem_pdc_call(args...) real64_call(MEM_PDC, args)
+#else
+#define MEM_PDC (unsigned long)PAGE0->mem_pdc
+#   define mem_pdc_call(args...) real32_call(MEM_PDC, args)
+#endif
+
+
 #define ASSERT_ALIGN(ptr, align)					\
 	do { if(((unsigned long)(ptr)) & (align-1)) {			\
 		printk("PDC: %s:%d  %s() called with "	\
@@ -53,6 +83,13 @@
 		return -1;						\
 	} } while(0)
 	
+/**
+ * f_extend - Convert PDC addresses to kernel addresses.
+ * @address: Address returned from PDC.
+ *
+ * This function is used to convert PDC addresses into kernel addresses
+ * when the PDC address size and kernel address size are different.
+ */
 static unsigned long f_extend(unsigned long address)
 {
 #ifdef CONFIG_PDC_NARROW
@@ -65,6 +102,14 @@ static unsigned long f_extend(unsigned l
 	return address;
 }
 
+/**
+ * convert_to_wide - Convert the return buffer addresses into kernel addresses.
+ * @address: The return buffer from PDC.
+ *
+ * This fucntion is used to convert the return buffer addresses retrieve from PDC
+ * into kernel addresses when the PDC address size and kernel address size are
+ * different.
+ */
 static void convert_to_wide(unsigned long *addr)
 {
 #ifdef CONFIG_PDC_NARROW
@@ -75,268 +120,655 @@ static void convert_to_wide(unsigned lon
 #endif
 }
 
-/* verify address can be accessed without an HPMC */
+/**
+ * pdc_add_valid - Verify address can be accessesd without causing a HPMC.
+ * @address: Address to be verified.
+ *
+ * This PDC call attempts to read from the specified address and verify
+ * the address is valid.
+ */
 int pdc_add_valid(void *address)
 {
-	ASSERT_ALIGN(address, 4);
-	return mem_pdc_call(PDC_ADD_VALID, PDC_ADD_VALID_VERIFY, address);
-}
+        int retval;
 
-int pdc_chassis_disp(unsigned long disp)
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_ADD_VALID, PDC_ADD_VALID_VERIFY, address);
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_chassis_info - Return chassis information.
+ * @result: The return buffer.
+ * @chassis_info: The memory buffer address.
+ * @len: The size of the memory buffer address.
+ *
+ * An HVERSION dependent call for returning the chassis information.
+ */
+int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len)
 {
-	return mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_DISP, disp);
-}
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_CHASSIS, PDC_RETURN_CHASSIS_INFO,
+                              __pa(pdc_result), __pa(pdc_result2), len);
+	memcpy(chassis_info, pdc_result, sizeof(*chassis_info));
+	memcpy(led_info, pdc_result2, sizeof(*led_info));
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_coproc_cfg - To identify coprocessors attached to the processor.
+ * @pdc_coproc_info: Return buffer address.
+ *
+ * This PDC call returns the presence and status of all the coprocessors
+ * attached to the processor.
+ */
+int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
+{
+        int retval;
 
-int pdc_chassis_info(void *pdc_result, void *chassis_info, unsigned long len)
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_COPROC, PDC_COPROC_CFG, __pa(pdc_result));
+        convert_to_wide(pdc_result);
+        pdc_coproc_info->ccr_functional = pdc_result[0];
+        pdc_coproc_info->ccr_present = pdc_result[1];
+        pdc_coproc_info->revision = pdc_result[17];
+        pdc_coproc_info->model = pdc_result[18];
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_iodc_read - Read data from the modules IODC.
+ * @actcnt: The actual number of bytes.
+ * @hpa: The HPA of the module for the iodc read.
+ * @index: The iodc entry point.
+ * @iodc_data: A buffer memory for the iodc options.
+ * @iodc_data_size: Size of the memory buffer.
+ *
+ * This PDC call reads from the IODC of the module specified by the hpa
+ * argument.
+ */
+int pdc_iodc_read(unsigned long *actcnt, void *hpa, unsigned int index,
+		  void *iodc_data, unsigned int iodc_data_size)
 {
 	int retval;
 
-	ASSERT_ALIGN(pdc_result, 4);
-	ASSERT_ALIGN(chassis_info, 4);
-	retval = mem_pdc_call(PDC_CHASSIS, PDC_RETURN_CHASSIS_INFO,
-			      __pa(pdc_result), __pa(chassis_info), len);
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, 
+			      index, __pa(pdc_result2), iodc_data_size);
 	convert_to_wide(pdc_result);
+	*actcnt = pdc_result[0];
+	memcpy(iodc_data, pdc_result2, iodc_data_size);
+	spin_unlock_irq(&pdc_lock);
+
 	return retval;
 }
 
-int pdc_hpa_processor(struct pdc_hpa *address)
+/**
+ * pdc_system_map_find_mods - Locate unarchitected modules.
+ * @pdc_mod_info: Return buffer address.
+ * @mod_path: pointer to dev path structure.
+ * @mod_index: fixed address module index.
+ *
+ * To locate and identify modules which reside at fixed I/O addresses, which
+ * do not self-identify via architected bus walks.
+ */
+int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
+			     struct pdc_module_path *mod_path, long mod_index)
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_MODULE, __pa(pdc_result), 
+			      __pa(pdc_result2), mod_index);
+	convert_to_wide(pdc_result);
+	memcpy(pdc_mod_info, pdc_result, sizeof(*pdc_mod_info));
+	memcpy(mod_path, pdc_result2, sizeof(*mod_path));
+	spin_unlock_irq(&pdc_lock);
 
-	/* We're using 0 for the last parameter just to make sure.
-	   It's actually HVERSION dependant.  And remember, life is
-	   hard without a backspace. */
-	ASSERT_ALIGN(address, 4);
-	retval = mem_pdc_call(PDC_HPA, PDC_HPA_PROCESSOR, __pa(address), 0);
-	convert_to_wide((unsigned long *)address);
-	address->hpa = f_extend(address->hpa);
+	pdc_mod_info->mod_addr = (void *)f_extend((unsigned long)pdc_mod_info->mod_addr);
 	return retval;
 }
 
-int pdc_coproc_cfg(void *address)
+/**
+ * pdc_system_map_find_addrs - Retrieve additional address ranges.
+ * @pdc_addr_info: Return buffer address.
+ * @mod_index: Fixed address module index.
+ * @addr_index: Address range index.
+ * 
+ * Retrieve additional information about subsequent address ranges for modules
+ * with multiple address ranges.  
+ */
+int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
+			      long mod_index, long addr_index)
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_ADDRESS, __pa(pdc_result),
+			      mod_index, addr_index);
+	convert_to_wide(pdc_result);
+	memcpy(pdc_addr_info, pdc_result, sizeof(*pdc_addr_info));
+	spin_unlock_irq(&pdc_lock);
 
-	ASSERT_ALIGN(address, 4);
-	retval = mem_pdc_call(PDC_COPROC, PDC_COPROC_CFG, __pa(address));
-	convert_to_wide(address);
+	pdc_addr_info->mod_addr = (void *)f_extend((unsigned long)pdc_addr_info->mod_addr);
 	return retval;
 }
-
 
-int pdc_iodc_read(void *address, void *hpa, unsigned int index,
-		  void *iodc_data, unsigned int iodc_data_size)
+/**
+ * pdc_model_info - Return model information about the processor.
+ * @model: The return buffer.
+ *
+ * Returns the version numbers, identifiers, and capabilities from the processor module.
+ */
+int pdc_model_info(struct pdc_model *model) 
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_INFO, __pa(pdc_result), 0);
+	convert_to_wide(pdc_result);
+	memcpy(model, pdc_result, sizeof(*model));
+	spin_unlock_irq(&pdc_lock);
 
-	ASSERT_ALIGN(address, 4);
-	ASSERT_ALIGN(hpa, 4);
-	ASSERT_ALIGN(iodc_data, 4);
-	retval = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(address), hpa, 
-			      index, __pa(iodc_data), iodc_data_size);
-	convert_to_wide(address);
 	return retval;
 }
 
-int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
-			     struct pdc_module_path *mod_path, long mod_index)
+/**
+ * pdc_model_sysmodel - Get the system model name.
+ * @name: A char array of at least 81 characters.
+ *
+ * Get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L)
+ */
+int pdc_model_sysmodel(char *name)
 {
-	int retval;
+        int retval;
 
-	ASSERT_ALIGN(pdc_mod_info, 8);
-	ASSERT_ALIGN(mod_path, 8);
-	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_MODULE, __pa(pdc_mod_info), 
-			      __pa(mod_path), mod_index);
-	convert_to_wide((unsigned long *)pdc_mod_info);
-	pdc_mod_info->mod_addr = (void *)f_extend((unsigned long)pdc_mod_info->mod_addr);
-	return retval;
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_SYSMODEL, __pa(pdc_result),
+                              OS_ID_HPUX, __pa(name));
+        convert_to_wide(pdc_result);
+
+        if (retval == PDC_RET_OK) {
+                name[pdc_result[0]] = '\0'; /* add trailing '\0' */
+        } else {
+                name[0] = 0;
+        }
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_model_versions - Identify the version number of each processor.
+ * @cpu_id: The return buffer.
+ * @id: The id of the processor to check.
+ *
+ * Returns the version number for each processor component.
+ *
+ * This comment was here before, but I do not know what it means :( -RB
+ * id: 0 = cpu revision, 1 = boot-rom-version
+ */
+int pdc_model_versions(unsigned long *versions, int id)
+{
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_VERSIONS, __pa(pdc_result), id);
+        convert_to_wide(pdc_result);
+        *versions = pdc_result[0];
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
 
-int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
-			      long mod_index, long addr_index)
+/**
+ * pdc_model_cpuid - Returns the CPU_ID.
+ * @cpu_id: The return buffer.
+ *
+ * Returns the CPU_ID value which uniquely identifies the cpu portion of
+ * the processor module.
+ */
+int pdc_model_cpuid(unsigned long *cpu_id)
 {
-	int retval;
+        int retval;
 
-	ASSERT_ALIGN(pdc_addr_info, 8);
-	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_ADDRESS, __pa(pdc_addr_info), 
-			      mod_index, addr_index);
-	convert_to_wide((unsigned long *)pdc_addr_info);
-	pdc_addr_info->mod_addr = (void *)f_extend((unsigned long)pdc_addr_info->mod_addr);
-	return retval;
+        spin_lock_irq(&pdc_lock);
+        pdc_result[0] = 0; /* preset zero (call may not be implimented!) */
+        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CPU_ID, __pa(pdc_result), 0);
+        convert_to_wide(pdc_result);
+        *cpu_id = pdc_result[0];
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
 
+/**
+ * pdc_cache_info - Return cache and TLB information.
+ * @cache_info: The return buffer.
+ *
+ * Returns information about the processor's cache and TLB.
+ */
+int pdc_cache_info(struct pdc_cache_info *cache_info)
+{
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_CACHE, PDC_CACHE_INFO, __pa(pdc_result), 0);
+        convert_to_wide(pdc_result);
+        memcpy(cache_info, pdc_result, sizeof(*cache_info));
+        spin_unlock_irq(&pdc_lock);
 
-int pdc_model_info(struct pdc_model *model) 
+        return retval;
+}
+
+#ifndef CONFIG_PA20
+/**
+ * pdc_btlb_info - Return block TLB information.
+ * @btlb: The return buffer.
+ *
+ * Returns information about the hardware Block TLB.
+ */
+int pdc_btlb_info(struct pdc_btlb_info *btlb) 
 {
-	int retval;
+        int retval;
 
-	ASSERT_ALIGN(model, 8);
-	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_INFO, __pa(model), 0);
-	convert_to_wide((unsigned long *)model);
-	return retval;
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_BLOCK_TLB, PDC_BTLB_INFO, __pa(pdc_result), 0);
+        memcpy(btlb, pdc_result, sizeof(*btlb));
+        spin_unlock_irq(&pdc_lock);
+
+        if(retval < 0) {
+                btlb->max_size = 0;
+        }
+        return retval;
 }
+#endif
 
-/* get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L) */ 
-int pdc_model_sysmodel(char *name)
+#ifndef __LP64__
+/**
+ * pdc_mem_map_hpa - Find fixed module information.  
+ * @address: The return buffer
+ * @mod_path: pointer to dev path structure.
+ *
+ * This call was developed for S700 workstations to allow the kernel to find
+ * the I/O devices (Core I/O). In the future (Kittyhawk and beyond) this
+ * call will be replaced (on workstations) by the architected PDC_SYSTEM_MAP
+ * call.
+ *
+ * This call is supported by all existing S700 workstations (up to  Gecko).
+ */
+int pdc_mem_map_hpa(struct pdc_memory_map *address, struct pdc_module_path *mod_path)
 {
-	int retval;
-	struct pdc_model_sysmodel sys_model;
-	
-	ASSERT_ALIGN(name, 4);
-	sys_model.mod_len = 0;
-	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_SYSMODEL, __pa(&sys_model), 
-			      OS_ID_HPUX,__pa(name));
-	convert_to_wide((unsigned long *)&sys_model);
-
-	if (retval == PDC_RET_OK) {
-		name[sys_model.mod_len] = '\0'; /* add trailing '\0' */
-	} else {
-		name[0] = 0;
-	}	
-	return retval;
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        memcpy(pdc_result2, mod_path, sizeof(*mod_path));
+        retval = mem_pdc_call(PDC_MEM_MAP, PDC_MEM_MAP_HPA, __pa(pdc_result), __pa(pdc_result2));
+        memcpy(address, pdc_result, sizeof(*address));
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
+#endif
+
+/**
+ * pdc_lan_station_id - Get the LAN address.
+ * @lan_addr: The return buffer.
+ * @net_hpa: The network device HPA.
+ *
+ * Get the LAN station address when it is not directly available from the LAN hardware.
+ */
+int pdc_lan_station_id(char *lan_addr, void *net_hpa)
+{
+        int retval;
+	unsigned int ret[2];
 
-/* id: 0 = cpu revision, 1 = boot-rom-version */
-int pdc_model_versions(struct pdc_model_cpuid *cpu_id, int id) 
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_LAN_STATION_ID, PDC_LAN_STATION_ID_READ,
+                              __pa(pdc_result), net_hpa);
+        if(retval < 0) {
+                /* FIXME: else read MAC from NVRAM */
+                memset(lan_addr, 0, PDC_LAN_STATION_ID_SIZE);
+        } else {
+		ret[0] = (unsigned int)pdc_result[0];
+		ret[1] = (unsigned int)pdc_result[1];
+		memcpy(lan_addr, ret, PDC_LAN_STATION_ID_SIZE);
+        }
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_pci_irt_size - Get the number of entries in the interrupt routing table.
+ * @num_entries: The return value.
+ * @hpa: The HPA for the device.
+ *
+ * This PDC function returns the number of entries in the specified cell's
+ * interrupt table.
+ * Similar to PDC_PAT stuff - but added for Forte/Allegro boxes
+ */ 
+int pdc_pci_irt_size(unsigned long *num_entries, void *hpa)
 {
 	int retval;
-	
-	ASSERT_ALIGN(cpu_id, 8);
-	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_VERSIONS, __pa(cpu_id), id);
-	convert_to_wide((unsigned long *)cpu_id);
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL_SIZE, 
+			      __pa(pdc_result), hpa);
+	convert_to_wide(pdc_result);
+	*num_entries = pdc_result[0];
+	spin_unlock_irq(&pdc_lock);
+
 	return retval;
 }
 
-int pdc_model_cpuid(struct pdc_model_cpuid *cpu_id) 
+/** 
+ * pdc_pci_irt - Get the PCI interrupt routing table.
+ * @num_entries: The number of entries in the table.
+ * @hpa: The Hard Physical Address of the device.
+ * @tbl: 
+ *
+ * Get the PCI interrupt routing table for the device at the given HPA.
+ * Similar to PDC_PAT stuff - but added for Forte/Allegro boxes
+ */
+int pdc_pci_irt(unsigned long num_entries, void *hpa, void *tbl)
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	pdc_result[0] = num_entries;
+	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL, 
+			      __pa(pdc_result), hpa, __pa(tbl));
+	spin_unlock_irq(&pdc_lock);
 
-	ASSERT_ALIGN(cpu_id, 8);
-	cpu_id->cpuid = 0; /* preset zero (call maybe not implemented!) */
-	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CPU_ID, __pa(cpu_id), 0);
-	convert_to_wide((unsigned long *)cpu_id);
 	return retval;
 }
 
-int pdc_cache_info(struct pdc_cache_info *cache_info) 
+/**
+ * pdc_tod_read - Read the Time-Of-Day clock.
+ * @tod: The return buffer:
+ *
+ * Read the Time-Of-Day clock
+ */
+int pdc_tod_read(struct pdc_tod *tod)
 {
-	int retval;
-	
-	ASSERT_ALIGN(cache_info, 8);
-	retval = mem_pdc_call(PDC_CACHE, PDC_CACHE_INFO, __pa(cache_info), 0);
-	convert_to_wide((unsigned long *)cache_info);
-	return retval;
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_TOD, PDC_TOD_READ, __pa(pdc_result), 0);
+        convert_to_wide(pdc_result);
+        memcpy(tod, pdc_result, sizeof(*tod));
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+
+/**
+ * pdc_tod_set - Set the Time-Of-Day clock.
+ * @sec: The number of seconds since epoch.
+ * @usec: The number of micro seconds.
+ *
+ * Set the Time-Of-Day clock.
+ */ 
+int pdc_tod_set(unsigned long sec, unsigned long usec)
+{
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_TOD, PDC_TOD_WRITE, sec, usec);
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
 
-#ifndef __LP64__
-int pdc_btlb_info(struct pdc_btlb_info *btlb) 
+#ifdef __LP64__
+int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr, struct pdc_memory_table *tbl, 
+		      unsigned long entries)
 {
 	int retval;
 
-	ASSERT_ALIGN(btlb, 8);
-	retval = mem_pdc_call(PDC_BLOCK_TLB, PDC_BTLB_INFO, __pa(btlb), 0);
-	convert_to_wide((unsigned long *)btlb);
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_MEM, PDC_MEM_TABLE, __pa(pdc_result), __pa(pdc_result2), entries);
+	convert_to_wide(pdc_result);
+	memcpy(r_addr, pdc_result, sizeof(*r_addr));
+	memcpy(tbl, pdc_result2, entries * sizeof(*tbl));
+	spin_unlock_irq(&pdc_lock);
 
-	if(retval < 0) {
-		btlb->max_size = 0;
-	}
 	return retval;
 }
+#endif
 
-int pdc_mem_map_hpa(struct pdc_memory_map *r_addr, struct pdc_module_path *mod_path) 
+/* FIXME: Is this pdc used?  I could not find type reference to ftc_bitmap
+ * so I guessed at unsigned long.  Someone who knows what this does, can fix
+ * it later. :)
+ */
+int pdc_do_firm_test_reset(unsigned long ftc_bitmap)
 {
-	int retval;
+        int retval;
 
-	ASSERT_ALIGN(r_addr, 8);
-	ASSERT_ALIGN(mod_path, 8);
-	retval = mem_pdc_call(PDC_MEM_MAP, PDC_MEM_MAP_HPA, __pa(r_addr), __pa(mod_path));
-	convert_to_wide((unsigned long *)r_addr);
-	return retval;
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_FIRM_TEST_RESET,
+                              PDC_FIRM_TEST_MAGIC, ftc_bitmap);
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
 
-int pdc_lan_station_id(char *lan_addr, void *net_hpa) 
+/*
+ * pdc_do_reset - Reset the system.
+ *
+ * Reset the system.
+ */
+int pdc_do_reset()
 {
-	int retval;
-	unsigned char *addr;
-	struct pdc_lan_station_id id;
-	
-	ASSERT_ALIGN(lan_addr, 4);
-	ASSERT_ALIGN(net_hpa, 4);
-	retval = mem_pdc_call(PDC_LAN_STATION_ID, PDC_LAN_STATION_ID_READ, __pa(&id), net_hpa);
-	convert_to_wide((unsigned long *)&id);
-
-	if(retval < 0) {
-		addr = 0;	/* FIXME: else read MAC from NVRAM */
-	} else {
-		addr = id.addr;
-	}
+        int retval;
 
-	if(addr) {
-		memmove(lan_addr, addr, PDC_LAN_STATION_ID_SIZE);
-	} else {
-		memset(lan_addr, 0, PDC_LAN_STATION_ID_SIZE);
-	}
-	return (addr != 0);
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET);
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
 }
-#endif
 
+/**
+ * iodc_iodc_putc - Console character print using IODC.
+ * @c: the character to output.
+ *
+ * Note that only these special chars are architected for console IODC io:
+ * BEL, BS, CR, and LF. Others are passed through.
+ * Since the HP console requires CR+LF to perform a 'newline', we translate
+ * "\n" to "\r\n".
+ */
+void pdc_iodc_putc(unsigned char c)
+{
+        /* XXX Should we spinlock posx usage */
+        static int posx;        /* for simple TAB-Simulation... */
+        static int __attribute__((aligned(8)))   iodc_retbuf[32];
+        static char __attribute__((aligned(64))) iodc_dbuf[4096];
+        unsigned int n;
+
+        switch (c) {
+        case '\n':
+                iodc_dbuf[0] = '\r';
+                iodc_dbuf[1] = '\n';
+                n = 2;
+                posx = 0;
+                break;
+        case '\t':
+                pdc_iodc_putc(' ');
+                while (posx & 7)        /* expand TAB */
+                        pdc_iodc_putc(' ');
+                return;         /* return since IODC can't handle this */
+        case '\b':
+                posx-=2;                /* BS */
+        default:
+                iodc_dbuf[0] = c;
+                n = 1;
+                posx++;
+                break;
+        }
+
+        spin_lock_irq(&pdc_lock);
+        real32_call(PAGE0->mem_cons.iodc_io,
+                    (unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
+                    PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
+                    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
+        spin_unlock_irq(&pdc_lock);
+}
+
+int pdc_sti_call(unsigned long func, unsigned long flags,
+                 unsigned long inptr, unsigned long outputr,
+                 unsigned long glob_cfg)
+{
+        int retval;
+
+        spin_lock_irq(&pdc_lock);  
+        retval = real32_call(func, flags, inptr, outputr, glob_cfg);
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
 
-/* Similar to PDC_PAT stuff in pdcpat.c - but added for Forte/Allegro boxes */
-int pdc_pci_irt_size(void *r_addr, void *hpa)
+#ifdef __LP64__
+/**
+ * pdc_pat_cell_get_number - Returns the cell number.
+ * @cell_info: The return buffer.
+ *
+ * This PDC call returns the cell number of the cell from which the call
+ * is made.
+ */
+int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info)
 {
 	int retval;
 
-	ASSERT_ALIGN(r_addr, 4);
-	ASSERT_ALIGN(hpa, 4);
-	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL_SIZE, __pa(r_addr), hpa);
-	convert_to_wide(r_addr);
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_CELL, PDC_PAT_CELL_GET_NUMBER, __pa(pdc_result));
+	memcpy(cell_info, pdc_result, sizeof(*cell_info));
+	spin_unlock_irq(&pdc_lock);
+
 	return retval;
 }
 
-int pdc_pci_irt(void *r_addr, void *hpa, void *tbl)
+/**
+ * pdc_pat_cell_module - Retrieve the cell's module information.
+ * @actcnt: The number of bytes written to mem_addr.
+ * @ploc: The physical location.
+ * @mod: The module index.
+ * @view_type: The view of the address type.
+ * @mem_addr: The return buffer.
+ *
+ * This PDC call returns information about each module attached to the cell
+ * at the specified location.
+ */
+int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod,
+			unsigned long view_type, void *mem_addr)
 {
 	int retval;
 
-	ASSERT_ALIGN(r_addr, 4);
-	ASSERT_ALIGN(hpa, 4);
-	ASSERT_ALIGN(tbl, 4);
-	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL, __pa(r_addr), hpa, __pa(tbl));
-	convert_to_wide(r_addr);
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_CELL, PDC_PAT_CELL_MODULE, __pa(pdc_result), 
+			      ploc, mod, view_type, __pa(pdc_result2));
+	if(!retval) {
+		*actcnt = pdc_result[0];
+		memcpy(mem_addr, pdc_result2, *actcnt);
+	}
+	spin_unlock_irq(&pdc_lock);
+
 	return retval;
 }
 
-/* access the TOD clock */
-int pdc_tod_read(struct pdc_tod *tod)
+/**
+ * pdc_pat_cpu_get_number - Retrieve the cpu number.
+ * @cpu_info: The return buffer.
+ * @hpa: The Hard Physical Address of the CPU.
+ *
+ * Retrieve the cpu number for the cpu at the specified HPA.
+ */
+int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa)
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_CPU, PDC_PAT_CPU_GET_NUMBER,
+			      __pa(&pdc_result), hpa);
+	memcpy(cpu_info, pdc_result, sizeof(*cpu_info));
+	spin_unlock_irq(&pdc_lock);
 
-	ASSERT_ALIGN(tod, 8);
-	retval = mem_pdc_call(PDC_TOD, PDC_TOD_READ, __pa(tod), 0);
-	convert_to_wide((unsigned long *)tod);
 	return retval;
 }
 
-int pdc_tod_set(unsigned long sec, unsigned long usec)
+/**
+ * pdc_pat_get_irt_size - Retrieve the number of entries in the cell's interrupt table.
+ * @num_entries: The return value.
+ * @cell_num: The target cell.
+ *
+ * This PDC function returns the number of entries in the specified cell's
+ * interrupt table.
+ */
+int pdc_pat_get_irt_size(unsigned long *num_entries, unsigned long cell_num)
+{
+	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_GET_PCI_ROUTING_TABLE_SIZE,
+			      __pa(pdc_result), cell_num);
+	*num_entries = pdc_result[0];
+	spin_unlock_irq(&pdc_lock);
+
+	return retval;
+}
+
+/**
+ * pdc_pat_get_irt - Retrieve the cell's interrupt table.
+ * @r_addr: The return buffer.
+ * @cell_num: The target cell.
+ *
+ * This PDC functin returns the actual interrupt table for the specified cell.
+ */
+int pdc_pat_get_irt(void *r_addr, unsigned long cell_num)
 {
-	return mem_pdc_call(PDC_TOD, PDC_TOD_WRITE, sec, usec);
+	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_GET_PCI_ROUTING_TABLE,
+			      __pa(r_addr), cell_num);
+	spin_unlock_irq(&pdc_lock);
+
+	return retval;
 }
 
-#ifdef __LP64__
-int pdc_mem_mem_table(void *r_addr, void *tbl, unsigned long entries)
+/**
+ * pdc_pat_pd_get_addr_map - Retrieve information about memory address ranges.
+ * @actlen: The return buffer.
+ * @mem_addr: Pointer to the memory buffer.
+ * @count: The number of bytes to read from the buffer.
+ * @offset: The offset with respect to the beginning of the buffer.
+ *
+ */
+int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, 
+			    unsigned long count, unsigned long offset)
 {
 	int retval;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_PD, PDC_PAT_PD_GET_ADDR_MAP, __pa(pdc_result), 
+			      __pa(pdc_result2), count, offset);
+	*actual_len = pdc_result[0];
+	memcpy(mem_addr, pdc_result2, *actual_len);
+	spin_unlock_irq(&pdc_lock);
 
-	ASSERT_ALIGN(r_addr, 4);
-	ASSERT_ALIGN(tbl, 4);
-	retval = mem_pdc_call(PDC_MEM, PDC_MEM_TABLE, __pa(r_addr), __pa(tbl), entries);
-	convert_to_wide(r_addr);
 	return retval;
 }
 #endif
 
 
-static spinlock_t pdc_lock = SPIN_LOCK_UNLOCKED;
-
 /***************** 32-bit real-mode calls ***********/
 /* The struct below is used
  * to overlay real_stack (real2.S), preparing a 32-bit call frame.
@@ -364,17 +796,14 @@ struct narrow_stack {
 	/* in reality, there's nearly 8k of stack after this */
 };
 
-long real32_call(unsigned long fn, ...)
+static long real32_call(unsigned long fn, ...)
 {
 	va_list args;
-	unsigned long r, flags;
 	extern struct narrow_stack real_stack;
 	extern unsigned long real32_call_asm(unsigned int *,
 					     unsigned int *, 
 					     unsigned int);
 	
-	spin_lock_irqsave(&pdc_lock, flags);
-
 	va_start(args, fn);
 	real_stack.arg0 = va_arg(args, unsigned int);
 	real_stack.arg1 = va_arg(args, unsigned int);
@@ -391,11 +820,8 @@ long real32_call(unsigned long fn, ...)
 	real_stack.arg12 = va_arg(args, unsigned int);
 	real_stack.arg13 = va_arg(args, unsigned int);
 	va_end(args);
-	
-	r = real32_call_asm(&real_stack.sp, &real_stack.arg0, fn);
-	spin_unlock_irqrestore(&pdc_lock, flags);
 	
-	return r;
+	return real32_call_asm(&real_stack.sp, &real_stack.arg0, fn);
 }
 
 #ifdef __LP64__
@@ -421,17 +847,14 @@ struct wide_stack {
 	/* in reality, there's nearly 8k of stack after this */
 };
 
-long real64_call(unsigned long fn, ...)
+static long real64_call(unsigned long fn, ...)
 {
 	va_list args;
-	unsigned long r, flags;
 	extern struct wide_stack real_stack;
 	extern unsigned long real64_call_asm(unsigned long *,
 					     unsigned long *, 
 					     unsigned long);
     
-	spin_lock_irqsave(&pdc_lock, flags);
-
 	va_start(args, fn);
 	real_stack.arg0 = va_arg(args, unsigned long);
 	real_stack.arg1 = va_arg(args, unsigned long);
@@ -448,11 +871,8 @@ long real64_call(unsigned long fn, ...)
 	real_stack.arg12 = va_arg(args, unsigned long);
 	real_stack.arg13 = va_arg(args, unsigned long);
 	va_end(args);
-	
-	r = real64_call_asm(&real_stack.sp, &real_stack.arg0, fn);
-	spin_unlock_irqrestore(&pdc_lock, flags);
 	
-	return r;
+	return real64_call_asm(&real_stack.sp, &real_stack.arg0, fn);
 }
 
 #endif
Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/inventory.c,v
retrieving revision 1.27
diff -u -p -r1.27 inventory.c
--- inventory.c	2001/03/02 10:31:49	1.27
+++ inventory.c	2001/03/29 07:57:51
@@ -7,7 +7,6 @@
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/pdc.h>
-#include <asm/pdcpat.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 
@@ -19,20 +18,16 @@
 
 int pdc_type = PDC_TYPE_ILLEGAL;
 
-static struct pdc_model model __attribute__ ((aligned(8)));
-#ifndef __LP64__
-static u8 iodc_data[32 * sizeof(long)] __attribute__ ((aligned(64)));
-static struct pdc_memory_map r_addr __attribute__ ((aligned(8)));
-#endif
-static unsigned long pdc_result[32] __attribute__ ((aligned(8)));
-static struct pdc_system_map_mod_info module_result  __attribute__ ((aligned(8)));
-static struct pdc_system_map_addr_info addr_result __attribute__ ((aligned(8)));
-static struct pdc_module_path module_path __attribute__ ((aligned(8)));
-
 void setup_pdc(void)
 {
 	long status;
 	unsigned int bus_id;
+	struct pdc_system_map_mod_info module_result;
+	struct pdc_module_path module_path;
+	struct pdc_model model;
+#ifdef __LP64__
+	struct pdc_pat_cell_num cell_info;
+#endif
 
 	/* Determine the pdc "type" used on this machine */
 
@@ -59,11 +54,11 @@ void setup_pdc(void)
 	 */
 
 #ifdef __LP64__
-	status = pdc_pat_cell_get_number(&pdc_result);
+	status = pdc_pat_cell_get_number(&cell_info);
 	if (status == PDC_RET_OK) {
-	    pdc_type = PDC_TYPE_PAT;
-	    printk("64 bit PDC PAT Box\n");
-	    return;
+		pdc_type = PDC_TYPE_PAT;
+		printk("64 bit PDC PAT Box\n");
+		return;
 	}
 #endif
 
@@ -166,12 +161,13 @@ void do_pagezero_memconfig(void)
 static int pat_query_module(ulong pcell_loc, ulong mod_index)
 {
 	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+	unsigned long bytecnt;
 	unsigned long temp;	/* 64-bit scratch value */
 	long status;		/* PDC return value status */
 	struct hp_device *dev;
 
 	/* return cell module (PA or Processor view) */
-	status = pdc_pat_cell_module(&pdc_result, pcell_loc, mod_index,
+	status = pdc_pat_cell_module(&bytecnt, pcell_loc, mod_index,
 				     PA_VIEW, &pa_pdc_cell);
 
 	if (status != PDC_RET_OK) {
@@ -254,7 +250,7 @@ static int pat_query_module(ulong pcell_
 
 static void do_pat_memconfig(void)
 {
-	struct pdc_pat_pd_addr_map_rtn r_addr;
+	unsigned long actual_len;
 	struct pdc_pat_pd_addr_map_entry mem_table[PAT_MAX_RANGES+1];
 	struct pdc_pat_pd_addr_map_entry *mtbl_ptr;
 	physmem_range_t *pmem_ptr;
@@ -266,10 +262,10 @@ static void do_pat_memconfig(void)
 	length = (unsigned long)(PAT_MAX_RANGES + 1)
 				* sizeof(struct pdc_pat_pd_addr_map_entry);
 
-	status = pdc_pat_pd_get_addr_map(&r_addr,mem_table,length,0L);
+	status = pdc_pat_pd_get_addr_map(&actual_len, mem_table, length, 0L);
 
 	if ((status != PDC_RET_OK)
-	    || ((r_addr.actual_len % sizeof(struct pdc_pat_pd_addr_map_entry)) != 0)) {
+	    || ((actual_len % sizeof(struct pdc_pat_pd_addr_map_entry)) != 0)) {
 
 		/* The above pdc call shouldn't fail, but, just in
 		 * case, just use the PAGE0 info.
@@ -280,7 +276,7 @@ static void do_pat_memconfig(void)
 		return;
 	}
 
-	entries = r_addr.actual_len / sizeof(struct pdc_pat_pd_addr_map_entry);
+	entries = actual_len / sizeof(struct pdc_pat_pd_addr_map_entry);
 
 	if (entries > PAT_MAX_RANGES) {
 		printk("This Machine has more memory ranges than we support!\n");
@@ -319,28 +315,25 @@ static void do_pat_memconfig(void)
 
 static int do_pat_inventory(void)
 {
-	ulong mod_index = 0;
 	int status;
-	ulong cell_num;
-	ulong pcell_loc;
+	ulong mod_index = 0;
+	struct pdc_pat_cell_num cell_info;
 
 	/*
 	** Note:  Prelude (and it's successors: Lclass, A400/500) only
 	**        implement PDC_PAT_CELL sub-options 0 and 2.
 	*/
-	status = pdc_pat_cell_get_number(&pdc_result);
+	status = pdc_pat_cell_get_number(&cell_info);
 	if (status != PDC_RET_OK) {
 		return 0;
 	}
 
-	cell_num = pdc_result[0];	/* Cell number call was made from */
-	pcell_loc = pdc_result[1];	/* Physical location of this cell */
-
 #ifdef DEBUG_PAT
-	printk("CELL_GET_NUMBER: 0x%lx 0x%lx\n", cell_num, pcell_loc);
+	printk("CELL_GET_NUMBER: 0x%lx 0x%lx\n", cell_info.cell_num, 
+	       cell_info.cell_loc);
 #endif
 
-	while (PDC_RET_OK == pat_query_module(pcell_loc, mod_index)) {
+	while (PDC_RET_OK == pat_query_module(cell_info.cell_loc, mod_index)) {
 		mod_index++;
 	}
 
@@ -441,6 +434,10 @@ int do_legacy_inventory(void)
 	int status;
 	unsigned int hw_type;
 	unsigned int func;
+	unsigned long bytecnt;
+	struct pdc_module_path module_path;
+	struct pdc_memory_map r_addr;
+	u8 iodc_data[32 * sizeof(long)];
 
 	/* This is undocumented at the time of writing, but basically 
 	** we're setting up mod_path so that bc[0..4]=0xff, and step
@@ -471,7 +468,7 @@ int do_legacy_inventory(void)
 			continue;
 		}
 
-		status = pdc_iodc_read(&pdc_result, (void *) r_addr.hpa, 0,
+		status = pdc_iodc_read(&bytecnt, (void *)r_addr.hpa, 0,
 				       &iodc_data, 32);
 		if (status != PDC_RET_OK)
 			continue;
@@ -617,6 +614,9 @@ static int do_system_map_inventory(void)
 	int i, j, num;
 	long status;
 	struct hp_device *hp_device;
+	struct pdc_system_map_mod_info module_result;
+	struct pdc_system_map_addr_info addr_result;
+	struct pdc_module_path module_path;
 
 	/* So the idea here is to simply try one SYSTEM_MAP call.  If 
 	** that one works, great, otherwise do it another way 
Index: arch/parisc/kernel/iosapic.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/iosapic.c,v
retrieving revision 1.22
diff -u -p -r1.22 iosapic.c
--- iosapic.c	2001/03/02 10:31:49	1.22
+++ iosapic.c	2001/03/29 07:57:51
@@ -169,7 +169,6 @@
 
 #include <asm/byteorder.h>	/* get in-line asm for swab */
 #include <asm/pdc.h>
-#include <asm/pdcpat.h>
 #include <asm/page.h>
 #include <asm/segment.h>
 #include <asm/system.h>
@@ -327,25 +326,22 @@ static size_t irt_num_entry;
 static int __init /* return number of entries as success/fail flag */
 iosapic_load_irt(unsigned long cell_num, struct irt_entry **irt)
 {
-	struct pdc_pat_io_num pdc_io_num; /* PDC return block */
 	long status;              /* PDC return value status */
 	struct irt_entry *table = NULL;  /* start of interrupt routing tbl */
 	unsigned long num_entries = 0UL;
 
 	ASSERT(NULL != irt);
-	/* FIXME ASSERT(((&pdc_io_num) & (0x3f)) == 0);  enforce 32-byte alignment */
 
 	if (is_pdc_pat()) {
 
 		/* Use pat pdc routine to get interrupt routing table size */
 		DBG(KERN_DEBUG "calling get_irt_size\n");
-		status = pdc_pat_get_irt_size( &pdc_io_num, cell_num);
+		status = pdc_pat_get_irt_size(&num_entries, cell_num);
 		DBG(KERN_DEBUG "get_irt_size: %ld\n", status);
 
 		ASSERT(status == PDC_RET_OK);
 
 		/* save the number of entries in the table */
-		num_entries = pdc_io_num.num;
 		ASSERT(0UL != num_entries);
 
 		/*
@@ -377,7 +373,7 @@ iosapic_load_irt(unsigned long cell_num,
 		return 0;
 	}
 
-	status = pdc_pci_irt_size( (void *)&pdc_io_num,
+	status = pdc_pci_irt_size(&num_entries,
 			/* elroy HPA (really a NOP) */ 0);
 	DBG(KERN_WARNING "pdc_pci_irt_size: %ld\n", status);
 
@@ -386,7 +382,6 @@ iosapic_load_irt(unsigned long cell_num,
 		return 0;
 	}
 
-	num_entries = pdc_io_num.num;
 	ASSERT(0UL != num_entries);
 
 	table = IOSAPIC_KALLOC(struct irt_entry, num_entries);
@@ -395,7 +390,7 @@ iosapic_load_irt(unsigned long cell_num,
 		return 0;
 	}
 
-	status = pdc_pci_irt( (void *) &pdc_io_num,
+	status = pdc_pci_irt(num_entries,
 			(void *) NULL, /* Elroy HPA - not used */
 			(void *) table);
 
Index: arch/parisc/kernel/lba_pci.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/lba_pci.c,v
retrieving revision 1.24
diff -u -p -r1.24 lba_pci.c
--- lba_pci.c	2001/03/11 07:05:58	1.24
+++ lba_pci.c	2001/03/29 07:57:52
@@ -42,7 +42,6 @@
 #include <asm/byteorder.h>
 #include <asm/irq.h>		/* for struct irq_region support */
 #include <asm/pdc.h>
-#include <asm/pdcpat.h>
 #include <asm/page.h>
 #include <asm/segment.h>
 #include <asm/system.h>
@@ -277,11 +276,6 @@ static u32 lba_t32;
 #define ROPES_PER_SBA	8
 #define LBA_NUM(x)    ((((unsigned long) x) >> 13) & (ROPES_PER_SBA-1))
 
-#ifdef __LP64__
-/* PDC_PAT */
-static  unsigned long pdc_result[32] __attribute__ ((aligned (8))) = {0,0,0,0};
-#endif
-
 /*
 ** One time initialization to let the world know the LBA was found.
 ** This is the only routine which is NOT static.
@@ -1040,6 +1034,7 @@ static struct pci_port_ops lba_pat_port_
 static void
 lba_pat_resources( struct hp_device *d, struct lba_device *lba_dev)
 {
+	unsigned long bytecnt;
 	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;	/* PA_VIEW */
 #ifdef DONT_NEED_THIS_FOR_ASTRO
 	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;	/* IO_VIEW */
@@ -1050,12 +1045,12 @@ lba_pat_resources( struct hp_device *d, 
 	int i;
 
 	/* return cell module (IO view) */
-	status = pdc_pat_cell_module(& pdc_result, d->pcell_loc, d->mod_index,
+	status = pdc_pat_cell_module(&bytecnt, d->pcell_loc, d->mod_index,
 				PA_VIEW, & pa_pdc_cell);
 	pa_count = pa_pdc_cell.mod[1];
 
 #ifdef DONT_NEED_THIS_FOR_ASTRO
-	status |= pdc_pat_cell_module(& pdc_result, d->pcell_loc, d->mod_index,
+	status |= pdc_pat_cell_module(&bytecnt, d->pcell_loc, d->mod_index,
 				IO_VIEW, & io_pdc_cell);
 	io_count = io_pdc_cell.mod[1];
 #endif
Index: arch/parisc/kernel/led.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/led.c,v
retrieving revision 1.15
diff -u -p -r1.15 led.c
--- led.c	2001/02/24 02:39:18	1.15
+++ led.c	2001/03/29 07:57:52
@@ -35,6 +35,7 @@
 #include <asm/hardware.h>
 #include <asm/param.h>		/* HZ */
 #include <asm/led.h>
+#include <asm/pdc.h>
 
 /* The control of the LEDs and LCDs on PARISC-machines have to be done 
    completely in software. The necessary calculations are done during every
@@ -486,7 +487,7 @@ int lcd_print( char *str )
 
 int __init led_init(void)
 {
-	long pdc_result[32];
+	struct pdc_chassis_info chassis_info;
 
 	/* Work around the buggy PDC of KittyHawk-machines */
 	switch (CPU_HVERSION) {
@@ -503,26 +504,26 @@ int __init led_init(void)
 		break;
 	}
 
-	/* initialize pdc_result, so we can check the return values of pdc_chassis_info() */
-	pdc_result[0] = pdc_result[1] = 0;
+	/* initialize raddr, so we can check the return values of pdc_chassis_info() */
+	chassis_info.actcnt = chassis_info.maxcnt = 0;
 
-	if (pdc_chassis_info(&pdc_result, &lcd_info, sizeof(lcd_info)) == PDC_OK) {
+	if (pdc_chassis_info(&chassis_info, &lcd_info, sizeof(lcd_info)) == PDC_OK) {
 		pr_debug("%s: chassis info: model=%d (%s), "
-			 "lcd_width=%d, cmd_delay=%u, ret0=%ld, ret1=%ld\n",
+			 "lcd_width=%d, cmd_delay=%u, actcnt=%ld, maxcnt=%ld\n",
 		         __FUNCTION__,
 			 lcd_info.model, 
 			 (lcd_info.model==DISPLAY_MODEL_LCD) ? "LCD" :
 			  (lcd_info.model==DISPLAY_MODEL_LASI) ? "LED" : "unknown",  
 			 lcd_info.lcd_width, lcd_info.min_cmd_delay, 
-			 pdc_result[0], pdc_result[1]);
+			 chassis_info.actcnt, chassis_info.maxcnt);
 
 		/* check the results. Some machines have a buggy PDC */
-		if (pdc_result[0] <= 0 || pdc_result[0] != pdc_result[1])
+		if (chassis_info.actcnt <= 0 || chassis_info.actcnt != chassis_info.maxcnt)
 			goto not_found;
 
 		switch (lcd_info.model) {
 		case DISPLAY_MODEL_LCD:		/* LCD display */
-			if (pdc_result[0] < 
+			if (chassis_info.actcnt < 
 			    (unsigned long)&lcd_info._pad - (unsigned long)&lcd_info - 1)
 				 goto not_found;
 			pr_debug("%s: min_cmd_delay = %d uS\n",
@@ -533,7 +534,7 @@ int __init led_init(void)
 			goto not_found;
 
 		case DISPLAY_MODEL_LASI:	/* Lasi style 8 bit LED display */
-			if (pdc_result[0] != 8 && pdc_result[0] != 32)
+			if (chassis_info.actcnt != 8 && chassis_info.actcnt != 32)
 				goto not_found;
 			break;
 
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.24
diff -u -p -r1.24 pdc_cons.c
--- pdc_cons.c	2001/03/08 13:30:33	1.24
+++ pdc_cons.c	2001/03/29 07:57:52
@@ -11,89 +11,10 @@
 #include <asm/system.h>
 #include <asm/pdc.h>	/* for iodc_call() proto and friends */
 
-static int __attribute__((aligned(8)))   iodc_retbuf[32];
-static char __attribute__((aligned(64))) iodc_dbuf[4096];
-
-/*
- * pdc_putc:
- * Console character print using IODC.
- *
- * Note that only these special chars are architected for console IODC io:
- * BEL, BS, CR, and LF. Others are passed through.
- * Since the HP console requires CR+LF to perform a 'newline', we translate
- * "\n" to "\r\n".
- */
-
-static int posx;	/* for simple TAB-Simulation... */
-
-/* XXX Should we spinlock posx usage */
-
-void pdc_putc(unsigned char c)
-{
-	unsigned int n;
-
-	switch (c) {
-	case '\n':
-		iodc_dbuf[0] = '\r'; 
-		iodc_dbuf[1] = '\n';
-               	n = 2;
-               	posx = 0;
-		break;
-	case '\t':
-		pdc_putc(' ');
-		while (posx & 7) 	/* expand TAB */
-			pdc_putc(' ');
-		return;		/* return since IODC can't handle this */
-	case '\b':
-		posx-=2;		/* BS */
-	default:
-		iodc_dbuf[0] = c;
-		n = 1;
-		posx++;
-		break;
-	}
-	{
-		real32_call(PAGE0->mem_cons.iodc_io,
-			(unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
-			PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
-			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
-	}
-}
-
 static void pdc_console_write(struct console *co, const char *s, unsigned count)
 {
 	while(count--)
-		pdc_putc(*s++);
-}
-
-int pdc_console_wait_key(struct console *co)
-{
-	int ch = 'X';
-	int status;
-
-	/* Bail if no console input device. */
-	if (!PAGE0->mem_kbd.iodc_io)
-		return 0;
-	
-	/* wait for a keyboard (rs232)-input */
-	do {
-		unsigned long flags;
-
-		save_flags(flags);
-		cli();
-		status = real32_call(PAGE0->mem_kbd.iodc_io,
-			(unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
-			PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
-			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
-		restore_flags(flags);
-		ch = *iodc_dbuf;	/* save the character directly to ch */
-	} while (*iodc_retbuf == 0);	/* wait for a key */
-	return ch;
-}
-
-int pdc_getc(void)
-{
-	return pdc_console_wait_key(NULL);
+		pdc_iodc_putc(*s++);
 }
 
 static int pdc_console_setup(struct console *co, char *options)
@@ -106,7 +27,7 @@ static struct console pdc_cons = {
 	write:		pdc_console_write,
 	read:		NULL,
 	device:		NULL, 
-	wait_key:	pdc_console_wait_key,
+	wait_key:	NULL,
 	unblank:	NULL,
 	setup:		pdc_console_setup,
 	flags:		CON_BOOT|CON_PRINTBUFFER|CON_ENABLED,  // |CON_CONSDEV,
Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.34
diff -u -p -r1.34 process.c
--- process.c	2001/02/23 07:02:01	1.34
+++ process.c	2001/03/29 07:57:52
@@ -113,15 +113,12 @@ void machine_restart(char *cmd)
 		** memory self tests. (Not implemented yet)
 		*/
 		if (ftc_bitmap) {
-			mem_pdc_call( PDC_BROADCAST_RESET,
-				PDC_DO_FIRM_TEST_RESET, PDC_FIRM_TEST_MAGIC,
-				ftc_bitmap);
+			pdc_do_firm_test_reset(ftc_bitmap);
 		}
 #endif
 
 		/* "Normal" system reset */
-		(void) mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET,
-			0L, 0L, 0L);
+		pdc_do_reset();
 
 		/* Nope...box should reset with just CMD_RESET now */
 		gsc_writel(CMD_RESET, COMMAND_GLOBAL);
Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/setup.c,v
retrieving revision 1.80
diff -u -p -r1.80 setup.c
--- setup.c	2001/03/22 06:46:32	1.80
+++ setup.c	2001/03/29 07:57:52
@@ -60,7 +60,6 @@
 #include <asm/machdep.h>	/* for pa7300lc_init() proto */
 
 #include <asm/irq.h>		/* for struct irq_region */
-#include <asm/pdcpat.h>		/* for PA_VIEW PDC_PAT_CPU_GET_NUMBER etc */
 
 #include <linux/proc_fs.h>
 
@@ -128,12 +127,13 @@ cpu_driver_callback(struct hp_device *d,
 
 #ifdef __LP64__
 	if (is_pdc_pat()) {
-		unsigned long pdc_result[32] __attribute__ ((aligned (8))) = {0,0,0,0};
 		ulong status;
+		unsigned long bytecnt;
 	        pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+		struct pdc_pat_cpu_num cpu_info;
 
-		status = pdc_pat_cell_module(& pdc_result, d->pcell_loc,
-			d->mod_index, PA_VIEW, & pa_pdc_cell);
+		status = pdc_pat_cell_module(&bytecnt, d->pcell_loc,
+			d->mod_index, PA_VIEW, &pa_pdc_cell);
 
 		ASSERT(PDC_RET_OK == status);
 
@@ -145,21 +145,20 @@ cpu_driver_callback(struct hp_device *d,
 		txn_addr = pa_pdc_cell.mod[0];   /* id_eid for IO sapic */
 
 		/* get the cpu number */
-		status = mem_pdc_call( PDC_PAT_CPU, PDC_PAT_CPU_GET_NUMBER,
-				__pa(& pdc_result), d->hpa);
+		status = pdc_pat_cpu_get_number(&cpu_info, d->hpa);
 
 		ASSERT(PDC_RET_OK == status);
 
-		if(pdc_result[0] >= NR_CPUS) {
+		if(cpu_info.cpu_num >= NR_CPUS) {
 			printk(KERN_WARNING "IGNORING CPU at 0x%p,"
 				" cpu_slot_id > NR_CPUS"
 				" (%ld > %d)\n",
-				d->hpa, pdc_result[0], NR_CPUS);
+				d->hpa, cpu_info.cpu_num, NR_CPUS);
 			/* Ignore CPU since it will only crash */
 			boot_cpu_data.cpu_count--;
 			return(1);
 		} else {
-			cpuid = pdc_result[0];
+			cpuid = cpu_info.cpu_num;
 		}
 	} else
 #endif
@@ -243,14 +242,14 @@ void __init collect_boot_cpu_data(void)
 #undef p
 
 	if(pdc_model_versions(&boot_cpu_data.pdc.versions, 0)==0)
-		printk("vers	%08lx\n", boot_cpu_data.pdc.versions.cpuid);
+		printk("vers	%08lx\n", boot_cpu_data.pdc.versions);
 
 	if(pdc_model_cpuid(&boot_cpu_data.pdc.cpuid)==0)
-		printk("cpuid	%08lx\n", boot_cpu_data.pdc.cpuid.cpuid);
+		printk("cpuid	%08lx\n", boot_cpu_data.pdc.cpuid);
 
 	printk("CPUID	vers %ld rev %ld\n",
-		(boot_cpu_data.pdc.cpuid.cpuid >> 5) & 127,
-		boot_cpu_data.pdc.cpuid.cpuid & 31);
+		(boot_cpu_data.pdc.cpuid >> 5) & 127,
+		boot_cpu_data.pdc.cpuid & 31);
 
 	if (pdc_model_sysmodel(boot_cpu_data.pdc.sys_model_name)==0)
 		printk("model	%s\n",boot_cpu_data.pdc.sys_model_name);
@@ -282,31 +281,22 @@ void __init collect_boot_cpu_data(void)
 int
 init_per_cpu(int cpuid)
 {
-	unsigned long pdc_result[32] __attribute__ ((aligned (8)));
-	unsigned long ccr;
 	int ret;
+	struct pdc_coproc_cfg coproc_cfg;
 
-	/*
-	** ret[0] == Functional Coprocessors
-	** ret[1] == Coprocessors Present
-	** ret[15] == FP test status
-	** ret[17] == Revision
-	** ret[18] == Model
-	*/
-	ret = pdc_coproc_cfg(&pdc_result);
-	ccr = pdc_result[0];
+	ret = pdc_coproc_cfg(&coproc_cfg);
 
-	if(ret >= 0 && ccr) {
-		mtctl(ccr, 10);  /* 10 == Coprocessor Control Reg */
+	if(ret >= 0 && coproc_cfg.ccr_functional) {
+		mtctl(coproc_cfg.ccr_functional, 10);  /* 10 == Coprocessor Control Reg */
 
 		/* FWIW, FP rev/model is a more accurate way to determine
 		** CPU type. CPU rev/model has some ambiguous cases.
 		*/
-		cpu_data[cpuid].fp_rev = pdc_result[17];
-		cpu_data[cpuid].fp_model = pdc_result[18];
+		cpu_data[cpuid].fp_rev = coproc_cfg.revision;
+		cpu_data[cpuid].fp_model = coproc_cfg.model;
 
 		printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
-			cpuid, pdc_result[17], pdc_result[18]);
+			cpuid, coproc_cfg.revision, coproc_cfg.model);
 
 		/*
 		** store status register to stack (hopefully aligned)
@@ -316,11 +306,11 @@ init_per_cpu(int cpuid)
 
 	} else {
 		printk(KERN_WARNING  "WARNING: No FP CoProcessor?!"
-			" (pdc_result[0] == 0x%lx, expected 0xc0)\n"
+			" (coproc_cfg.ccr_functional == 0x%lx, expected 0xc0)\n"
 #ifdef __LP64__
 			"Halting Machine - FP required\n"
 #endif
-			,ccr);
+			, coproc_cfg.ccr_functional);
 #ifdef __LP64__
 		mdelay(100);	/* previous chars get pushed to console */
 		panic("FP CoProc not reported");
@@ -405,6 +395,8 @@ void __init setup_arch(char **cmdline_p)
 	"32"
 #endif
 	"-bit Kernel has started...\n");
+
+	pdc_console_init();
 
 #ifdef CONFIG_PDC_NARROW
 	printk("Kernel is using PDC in 32-bit mode.\n");
Index: arch/parisc/kernel/time.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/time.c,v
retrieving revision 1.10
diff -u -p -r1.10 time.c
--- time.c	2001/01/24 23:59:51	1.10
+++ time.c	2001/03/29 07:57:52
@@ -37,7 +37,6 @@ extern rwlock_t xtime_lock;
 
 static long clocktick;	/* timer cycles per tick */
 static long halftick;
-static struct pdc_tod tod_data __attribute__((aligned(8)));
 
 void timer_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
@@ -163,6 +162,7 @@ do_settimeofday (struct timeval *tv)
 void __init time_init(void)
 {
 	unsigned long next_tick;
+	static struct pdc_tod tod_data;
 
 	clocktick = (100 * PAGE0->mem_10msec) / HZ;
 	halftick = clocktick / 2;
Index: drivers/char/genrtc.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/char/genrtc.c,v
retrieving revision 1.5
diff -u -p -r1.5 genrtc.c
--- genrtc.c	2001/02/08 06:20:15	1.5
+++ genrtc.c	2001/03/29 07:57:53
@@ -102,7 +102,7 @@ static const unsigned short int __mon_yd
 
 static int get_hw_time(struct rtc_time *wtime)
 {
-	struct pdc_tod tod_data __attribute__((aligned(8)));
+	struct pdc_tod tod_data;
 	long int days, rem, y;
 	const unsigned short int *ip;
 
Index: drivers/net/lasi_82596.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/net/lasi_82596.c,v
retrieving revision 1.15
diff -u -p -r1.15 lasi_82596.c
--- lasi_82596.c	2001/01/25 00:01:15	1.15
+++ lasi_82596.c	2001/03/29 07:57:53
@@ -1160,7 +1160,7 @@ static int __init i82596_probe(struct ne
 	if (!dev->base_addr || !dev->irq)
 	    return -ENODEV;
 
-	if (!pdc_lan_station_id( (char*)&eth_addr, (void*)dev->base_addr)) {
+	if (pdc_lan_station_id( (char*)&eth_addr, (void*)dev->base_addr)) {
 	    for(i=0;i<6;i++)
 		eth_addr[i] = gsc_readb(LAN_PROM_ADDR+i);
 	    printk("82596.c: MAC of HP700 LAN blindely read from the prom!\n");
Index: drivers/scsi/zalon7xx.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/scsi/zalon7xx.c,v
retrieving revision 1.5
diff -u -p -r1.5 zalon7xx.c
--- zalon7xx.c	2001/03/04 19:27:05	1.5
+++ zalon7xx.c	2001/03/29 07:57:57
@@ -79,6 +79,14 @@ int zalon7xx_detect(Scsi_Host_Template *
 	return (hosts_used != 0);
 }
 
+#if 0
+/* FIXME:
+ * Is this function dead code? or is someone planning on using it in the
+ * future.  The clock = (int) pdc_result[16] does not look correct to
+ * me ... I think it should be iodc_data[16].  Since this cause a compile
+ * error with the new encapsulated PDC, I'm not compiling in this function.
+ * - RB
+ */
 /* poke SCSI clock out of iodc data */
 static int 
 lasi_scsi_clock(void * hpa, int defaultclock)
@@ -96,6 +104,7 @@ lasi_scsi_clock(void * hpa, int defaultc
 	printk(KERN_DEBUG __FUNCTION__ ": SCSI clock %d\n", clock);
  	return clock;
 }
+#endif
 
 static int __init
 zalon_scsi_callback(struct hp_device *d, struct pa_iodc_driver *dri)
Index: drivers/video/sti/sticore.h
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/sti/sticore.h,v
retrieving revision 1.7
diff -u -p -r1.7 sticore.h
--- sticore.h	2001/02/18 22:24:40	1.7
+++ sticore.h	2001/03/29 07:57:57
@@ -46,7 +46,7 @@
 
 #define STI_CALL(func, flags, inptr, outptr, glob_cfg) \
 	({	 						\
-		real32_call( func, (unsigned long)STI_PTR(flags), \
+		pdc_sti_call( func, (unsigned long)STI_PTR(flags), \
 				    STI_PTR(inptr), STI_PTR(outptr), \
 				    glob_cfg); \
 	})
Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pdc.h,v
retrieving revision 1.28
diff -u -p -r1.28 pdc.h
--- pdc.h	2001/03/22 16:24:19	1.28
+++ pdc.h	2001/03/29 07:57:59
@@ -178,6 +178,184 @@ compatibility */
 #define OSTAT_RUN		      6
 #define OSTAT_ON		       7
 
+#ifdef __LP64__
+/* PDC PAT CELL */
+#define PDC_PAT_CELL           	64L   /* Interface for gaining and 
+                                         * manipulatin g cell state within PD */
+#define PDC_PAT_CELL_GET_NUMBER    0L   /* Return Cell number */
+#define PDC_PAT_CELL_GET_INFO      1L   /* Returns info about Cell */
+#define PDC_PAT_CELL_MODULE        2L   /* Returns info about Module */
+#define PDC_PAT_CELL_SET_ATTENTION 9L   /* Set Cell Attention indicator */
+#define PDC_PAT_CELL_NUMBER_TO_LOC 10L   /* Cell Number -> Location */
+#define PDC_PAT_CELL_WALK_FABRIC   11L   /* Walk the Fabric */
+#define PDC_PAT_CELL_GET_RDT_SIZE  12L   /* Return Route Distance Table Sizes */
+#define PDC_PAT_CELL_GET_RDT       13L   /* Return Route Distance Tables */
+#define PDC_PAT_CELL_GET_LOCAL_PDH_SZ 14L /* Read Local PDH Buffer Size */
+#define PDC_PAT_CELL_SET_LOCAL_PDH    15L  /* Write Local PDH Buffer */
+#define PDC_PAT_CELL_GET_REMOTE_PDH_SZ 16L /* Return Remote PDH Buffer Size */
+#define PDC_PAT_CELL_GET_REMOTE_PDH 17L /* Read Remote PDH Buffer */
+#define PDC_PAT_CELL_GET_DBG_INFO   128L  /* Return DBG Buffer Info */
+#define PDC_PAT_CELL_CHANGE_ALIAS   129L  /* Change Non-Equivalent Alias Chacking */
+
+/*
+** Arg to PDC_PAT_CELL_MODULE memaddr[4]
+**
+** Addresses on the Merced Bus != all Runway Bus addresses.
+** This is intended for programming SBA/LBA chips range registers.
+*/
+#define IO_VIEW      0UL
+#define PA_VIEW      1UL
+
+/* PDC_PAT_CELL_MODULE entity type values */
+#define	PAT_ENTITY_CA	0	/* central agent */
+#define	PAT_ENTITY_PROC	1	/* processor */
+#define	PAT_ENTITY_MEM	2	/* memory controller */
+#define	PAT_ENTITY_SBA	3	/* system bus adapter */
+#define	PAT_ENTITY_LBA	4	/* local bus adapter */
+#define	PAT_ENTITY_PBC	5	/* processor bus converter */
+#define	PAT_ENTITY_XBC	6	/* crossbar fabric connect */
+#define	PAT_ENTITY_RC	7	/* fabric interconnect */
+
+/* PDC_PAT_CELL_MODULE address range type values */
+#define PAT_PBNUM           0         /* PCI Bus Number */
+#define PAT_LMMIO           1         /* < 4G MMIO Space */
+#define PAT_GMMIO           2         /* > 4G MMIO Space */
+#define PAT_NPIOP           3         /* Non Postable I/O Port Space */
+#define PAT_PIOP            4         /* Postable I/O Port Space */
+#define PAT_AHPA            5         /* Addional HPA Space */
+#define PAT_UFO             6         /* HPA Space (UFO for Mariposa) */
+#define PAT_GNIP            7         /* GNI Reserved Space */
+
+
+/* PDC PAT CHASSIS LOG */
+
+#define PDC_PAT_CHASSIS_LOG		65L /* Platform logging & forward
+					    ** progress functions */
+#define PDC_PAT_CHASSIS_WRITE_LOG    	0L /* Write Log Entry */
+#define PDC_PAT_CHASSIS_READ_LOG     	1L /* Read  Log Entry */
+
+/* PDC PAT CPU  */
+
+#define PDC_PAT_CPU                	67L /* Interface to CPU configuration
+                                        	* within the protection domain */
+#define PDC_PAT_CPU_INFO            	0L /* Return CPU config info */
+#define PDC_PAT_CPU_DELETE          	1L /* Delete CPU */
+#define PDC_PAT_CPU_ADD             	2L /* Add    CPU */
+#define PDC_PAT_CPU_GET_NUMBER      	3L /* Return CPU Number */
+#define PDC_PAT_CPU_GET_HPA         	4L /* Return CPU HPA */
+#define PDC_PAT_CPU_STOP            	5L /* Stop   CPU */
+#define PDC_PAT_CPU_RENDEZVOUS      	6L /* Rendezvous CPU */
+#define PDC_PAT_CPU_GET_CLOCK_INFO  	7L /* Return CPU Clock info */
+#define PDC_PAT_CPU_GET_RENDEZVOUS_STATE 8L /* Return Rendezvous State */
+#define PDC_PAT_CPU_PLUNGE_FABRIC 	128L /* Plunge Fabric */
+#define PDC_PAT_CPU_UPDATE_CACHE_CLEANSING 129L /* Manipulate Cache 
+                                                 * Cleansing Mode */
+/*  PDC PAT EVENT */
+
+#define PDC_PAT_EVENT              	68L /* Interface to Platform Events */
+#define PDC_PAT_EVENT_GET_CAPS     	0L /* Get Capabilities */
+#define PDC_PAT_EVENT_SET_MODE     	1L /* Set Notification Mode */
+#define PDC_PAT_EVENT_SCAN         	2L /* Scan Event */
+#define PDC_PAT_EVENT_HANDLE       	3L /* Handle Event */
+#define PDC_PAT_EVENT_GET_NB_CALL  	4L /* Get Non-Blocking call Args */
+
+/*  PDC PAT HPMC */
+
+#define PDC_PAT_HPMC               70L /* Cause processor to go into spin
+				       ** loop, and wait for wake up from
+				       ** Monarch Processor */
+#define PDC_PAT_HPMC_RENDEZ_CPU     0L /* go into spin loop */
+#define PDC_PAT_HPMC_SET_PARAMS     1L /* Allows OS to specify intr which PDC 
+                                        * will use to interupt OS during machine
+                                        * check rendezvous */
+
+/* parameters for PDC_PAT_HPMC_SET_PARAMS: */
+#define HPMC_SET_PARAMS_INTR 	    1L /* Rendezvous Interrupt */
+#define HPMC_SET_PARAMS_WAKE 	    2L /* Wake up processor */
+
+/*  PDC PAT IO */
+
+#define PDC_PAT_IO                  71L /* On-line services for I/O modules */
+#define PDC_PAT_IO_GET_SLOT_STATUS   	5L /* Get Slot Status Info*/
+#define PDC_PAT_IO_GET_LOC_FROM_HARDWARE 6L /* Get Physical Location from */
+                                            /* Hardware Path */
+#define PDC_PAT_IO_GET_HARDWARE_FROM_LOC 7L /* Get Hardware Path from 
+                                             * Physical Location */
+#define PDC_PAT_IO_GET_PCI_CONFIG_FROM_HW 11L /* Get PCI Configuration
+                                               * Address from Hardware Path */
+#define PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG 12L /* Get Hardware Path 
+                                               * from PCI Configuration Address */
+#define PDC_PAT_IO_READ_HOST_BRIDGE_INFO 13L  /* Read Host Bridge State Info */
+#define PDC_PAT_IO_CLEAR_HOST_BRIDGE_INFO 14L /* Clear Host Bridge State Info*/
+#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE_SIZE 15L /* Get PCI INT Routing Table 
+                                                   * Size */
+#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE  16L /* Get PCI INT Routing Table */
+#define PDC_PAT_IO_GET_HINT_TABLE_SIZE 	17L /* Get Hint Table Size */
+#define PDC_PAT_IO_GET_HINT_TABLE   	18L /* Get Hint Table */
+#define PDC_PAT_IO_PCI_CONFIG_READ  	19L /* PCI Config Read */
+#define PDC_PAT_IO_PCI_CONFIG_WRITE 	20L /* PCI Config Write */
+#define PDC_PAT_IO_GET_NUM_IO_SLOTS 	21L /* Get Number of I/O Bay Slots in 
+                                       		  * Cabinet */
+#define PDC_PAT_IO_GET_LOC_IO_SLOTS 	22L /* Get Physical Location of I/O */
+                                   		     /* Bay Slots in Cabinet */
+#define PDC_PAT_IO_BAY_STATUS_INFO  	28L /* Get I/O Bay Slot Status Info */
+#define PDC_PAT_IO_GET_PROC_VIEW        29L /* Get Processor view of IO address */
+#define PDC_PAT_IO_PROG_SBA_DIR_RANGE   30L /* Program directed range */
+
+/* PDC PAT MEM */
+
+#define PDC_PAT_MEM             	72L /* Manage memory page deallocation */
+#define PDC_PAT_MEM_PD_INFO     	0L /* Return PDT info for PD       */
+#define PDC_PAT_MEM_PD_CLEAR    	1L /* Clear PDT for PD             */
+#define PDC_PAT_MEM_PD_READ     	2L /* Read PDT entries for PD      */
+#define PDC_PAT_MEM_PD_RESET    	3L /* Reset clear bit for PD       */
+#define PDC_PAT_MEM_CELL_INFO   	5L /* Return PDT info For Cell     */
+#define PDC_PAT_MEM_CELL_CLEAR  	6L /* Clear PDT For Cell           */
+#define PDC_PAT_MEM_CELL_READ   	7L /* Read PDT entries For Cell    */
+#define PDC_PAT_MEM_CELL_RESET  	8L /* Reset clear bit For Cell     */
+#define PDC_PAT_MEM_SETGM	  	9L /* Set Golden Memory value      */
+#define PDC_PAT_MEM_ADD_PAGE    	10L /* ADDs a page to the cell      */
+#define PDC_PAT_MEM_ADDRESS     	11L /* Get Physical Location From   */
+                                    		 /* Memory Address               */
+#define PDC_PAT_MEM_GET_TXT_SIZE   	12L /* Get Formatted Text Size   */
+#define PDC_PAT_MEM_GET_PD_TXT     	13L /* Get PD Formatted Text     */
+#define PDC_PAT_MEM_GET_CELL_TXT   	14L /* Get Cell Formatted Text   */
+#define PDC_PAT_MEM_RD_STATE_INFO  	15L /* Read Mem Module State Info*/
+#define PDC_PAT_MEM_CLR_STATE_INFO 	16L /*Clear Mem Module State Info*/
+#define PDC_PAT_MEM_CLEAN_RANGE    	128L /*Clean Mem in specific range*/
+#define PDC_PAT_MEM_GET_TBL_SIZE   	131L /* Get Memory Table Size     */
+#define PDC_PAT_MEM_GET_TBL        	132L /* Get Memory Table          */
+
+/* PDC PAT NVOLATILE */
+
+#define PDC_PAT_NVOLATILE          	73L /* Access Non-Volatile Memory */
+#define PDC_PAT_NVOLATILE_READ      	0L /* Read Non-Volatile Memory   */
+#define PDC_PAT_NVOLATILE_WRITE     	1L /* Write Non-Volatile Memory  */
+#define PDC_PAT_NVOLATILE_GET_SIZE  	2L /* Return size of NVM         */
+#define PDC_PAT_NVOLATILE_VERIFY    	3L /* Verify contents of NVM     */
+#define PDC_PAT_NVOLATILE_INIT      	4L /* Initialize NVM             */
+
+/* PDC PAT PD */
+
+#define PDC_PAT_PD                      74L /* Protection Domain Info      */
+#define PDC_PAT_PD_GET_ADDR_MAP         0L  /* Get Address Map             */
+
+/* PDC_PAT_PD_GET_ADDR_MAP entry types */
+
+#define PAT_MEMORY_DESCRIPTOR           1
+
+/* PDC_PAT_PD_GET_ADDR_MAP memory types */
+
+#define PAT_MEMTYPE_MEMORY              0
+#define PAT_MEMTYPE_FIRMWARE            4
+
+/* PDC_PAT_PD_GET_ADDR_MAP memory usage */
+
+#define PAT_MEMUSE_GENERAL              0
+#define PAT_MEMUSE_GI                 128
+#define PAT_MEMUSE_GNI                129
+#endif /* __LP64__ */
+
 #ifndef __ASSEMBLY__
 
 #include <linux/types.h>
@@ -193,6 +371,18 @@ extern int pdc_type;
 
 #define is_pdc_pat()    (pdc_type == PDC_TYPE_PAT)
 
+struct pdc_chassis_info {       /* for PDC_CHASSIS_INFO */
+	unsigned long actcnt;   /* actual number of bytes returned */
+	unsigned long maxcnt;   /* maximum number of bytes that could be returned */
+};
+
+struct pdc_coproc_cfg {         /* for PDC_COPROC_CFG */
+        unsigned long ccr_functional;
+        unsigned long ccr_present;
+        unsigned long revision;
+        unsigned long model;
+};
+
 struct pdc_model {		/* for PDC_MODEL */
 	unsigned long hversion;
 	unsigned long sversion;
@@ -203,19 +393,7 @@ struct pdc_model {		/* for PDC_MODEL */
 	unsigned long arch_rev;
 	unsigned long pot_key;
 	unsigned long curr_key;
-	unsigned long pad[32-9];
-} __attribute__((aligned(8))) ;
-
-
-struct pdc_model_sysmodel {	/* for PDC_MODEL_SYSMODEL */
-	unsigned long mod_len;
-	unsigned long pad[32-1];
-} __attribute__((aligned(8))) ;
-
-struct pdc_model_cpuid	 {	/* for PDC_MODEL_CPU_ID */
-	unsigned long cpuid;
-	unsigned long pad[32-1];
-} __attribute__((aligned(8))) ;
+};
 
 struct pdc_cache_cf {		/* for PDC_CACHE  (I/D-caches) */
     unsigned long
@@ -281,14 +459,7 @@ struct pdc_cache_info {		/* main-PDC_CAC
 	unsigned long	dt_off_stride;
 	unsigned long	dt_off_count;
 	unsigned long	dt_loop;
-	/* padded to 32 entries... */
-	unsigned long 	pad[32-30];
-} __attribute__((aligned(8))) ;
-
-struct pdc_hpa {      /* PDC_HPA */
-	unsigned long	hpa;
-	unsigned long	pad[31];
-} __attribute__((aligned(8))) ;
+};
 
 #if 0
 /* If you start using the next struct, you'll have to adjust it to
@@ -312,7 +483,7 @@ struct pdc_iodc {     /* PDC_IODC */
 } __attribute__((aligned(8))) ;
 #endif
 
-#ifndef __LP64__
+#ifndef CONFIG_PA20
 /* no BLTBs in pa2.0 processors */
 struct pdc_btlb_info_range {
 	__u8 res00;
@@ -326,21 +497,13 @@ struct pdc_btlb_info {	/* PDC_BLOCK_TLB,
 	unsigned int max_size;	/* maximum size of BTLB in pages */
 	struct pdc_btlb_info_range fixed_range_info;
 	struct pdc_btlb_info_range variable_range_info;
-	unsigned int pad[32-4];
-} __attribute__((aligned(8))) ;
+};
 #endif
 
-struct pdc_tlb {		/* for PDC_TLB */
-	unsigned long min_size;
-	unsigned long max_size;
-	unsigned long pad[32-2];
-} __attribute__((aligned(8))) ;
-
 #ifdef __LP64__
 struct pdc_memory_table_raddr { /* PDC_MEM/PDC_MEM_TABLE (return info) */
 	unsigned long entries_returned;
 	unsigned long entries_total;
-	unsigned long pad[32-2];
 };
 
 struct pdc_memory_table {       /* PDC_MEM/PDC_MEM_TABLE (arguments) */
@@ -354,14 +517,12 @@ struct pdc_system_map_mod_info { /* PDC_
 	void * mod_addr;
 	unsigned long mod_pgs;
 	unsigned long add_addrs;
-	unsigned long pad[32-3];
-} __attribute__((aligned(8))) ;
+};
 
 struct pdc_system_map_addr_info { /* PDC_SYSTEM_MAP/FIND_ADDRESS */
 	void * mod_addr;
 	unsigned long mod_pgs;
-	unsigned long pad[32-2];
-} __attribute__((aligned(8))) ;
+};
 
 /*
  * Device path specifications used by PDC.
@@ -372,31 +533,55 @@ struct pdc_module_path {
 			/* I/O adaptor (< 0 means none, > 63 resvd) */
 	char  mod;	/* fixed field of specified module */
 	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
-	unsigned long pad[32-2];
-} __attribute__((aligned(8))) ;
+};
 
 #ifndef __LP64__
 /* Probably needs 64-bit porting -PB */
 struct pdc_memory_map {		/* PDC_MEMORY_MAP */
 	unsigned long hpa;	/* mod's register set address */
 	unsigned long more_pgs;	/* number of additional I/O pgs */
-	int pad1[30];
-} __attribute__((aligned(8))) ;
-
-struct pdc_lan_station_id {	/* PDC_LAN_STATION_ID */
-	unsigned char addr[PDC_LAN_STATION_ID_SIZE];
-	unsigned char pad0[2];
-	int pad1[30];
 };
 #endif
 
 struct pdc_tod {
 	unsigned long tod_sec; 
 	unsigned long tod_usec;
-	long pad[30];
-} __attribute__((aligned(8))) ;
+};
+
+#ifdef __LP64__
+struct pdc_pat_cell_num {
+	unsigned long cell_num;
+	unsigned long cell_loc;
+};
+
+struct pdc_pat_cpu_num {
+	unsigned long cpu_num;
+	unsigned long cpu_loc;
+};
 
+struct pdc_pat_pd_addr_map_entry {
+	unsigned char entry_type;       /* 1 = Memory Descriptor Entry Type */
+	unsigned char reserve1[5];
+	unsigned char memory_type;
+	unsigned char memory_usage;
+	unsigned long paddr;
+	unsigned int  pages;            /* Length in 4K pages */
+	unsigned int  reserve2;
+	unsigned long cell_map;
+};
+
+/* FIXME: mod[508] should really be a union of the various mod components */
+struct pdc_pat_cell_mod_maddr_block {	/* PDC_PAT_CELL_MODULE */
+	unsigned long cba;              /* function 0 configuration space address */
+	unsigned long mod_info;         /* module information */
+	unsigned long mod_location;     /* physical location of the module */
+	unsigned long mod_path;         /* module path (device path - layers) */
+	unsigned long mod[508];		/* PAT cell module components */
+};
 
+typedef struct pdc_pat_cell_mod_maddr_block pdc_pat_cell_mod_maddr_block_t;
+#endif
+
 /* architected results from PDC_PIM/transfer hpmc on a PA1.1 machine */
 
 struct pdc_hpmc_pim_11 { /* PDC_PIM */
@@ -599,67 +784,94 @@ struct zeropage {
 
 #ifndef __ASSEMBLY__
 extern void pdc_console_init(void);
-/* pdc_get/put are NOT SMP safe - use at your own risk! */
-extern int  pdc_getc(void);		/* wait for char */
-extern void pdc_putc(unsigned char);	/* print char */
-
 extern void setup_pdc(void);            /* in inventory.c */
 
 /* wrapper-functions from pdc.c */
 
 int pdc_add_valid(void *address);
-int pdc_hpa_processor(struct pdc_hpa *address);
-int pdc_coproc_cfg(void *address);
-int pdc_iodc_read(void *address, void *hpa, unsigned int index,
+int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len);
+int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info);
+int pdc_iodc_read(unsigned long *actcnt, void *hpa, unsigned int index,
 		  void *iodc_data, unsigned int iodc_data_size);
-int pdc_psw_get_mask(void *address);
-int pdc_psw_get_defaults(void *address);
-int pdc_psw_set_defaults(unsigned long val);
 int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
 			     struct pdc_module_path *mod_path, long mod_index);
 int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
 			      long mod_index, long addr_index);
 int pdc_model_info(struct pdc_model *model);
 int pdc_model_sysmodel(char  *name);
-int pdc_model_cpuid(struct pdc_model_cpuid *cpu_id);
-int pdc_model_versions(struct pdc_model_cpuid *cpu_id, int id);
+int pdc_model_cpuid(unsigned long *cpu_id);
+int pdc_model_versions(unsigned long *versions, int id);
 int pdc_cache_info(struct pdc_cache_info *cache);
+#ifndef CONFIG_PA20
+int pdc_btlb_info(struct pdc_btlb_info *btlb);
+#endif
 #ifndef __LP64__
-int pdc_btlb_info( struct pdc_btlb_info *btlb);
-int pdc_lan_station_id( char *lan_addr, void *net_hpa);
 int pdc_mem_map_hpa(struct pdc_memory_map *r_addr, struct pdc_module_path *mod_path);
 #endif
-
-extern int pdc_chassis_disp(unsigned long disp);
-extern int pdc_chassis_info(void *pdc_result, void *chassis_info, unsigned long len);
+int pdc_lan_station_id(char *lan_addr, void *net_hpa);
 
-int pdc_pci_irt_size(void *r_addr, void *hpa);
-int pdc_pci_irt(void *r_addr, void *hpa, void *tbl);
+int pdc_pci_irt_size(unsigned long *num_entries, void *hpa);
+int pdc_pci_irt(unsigned long num_entries, void *hpa, void *tbl);
 
 int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
 
 #ifdef __LP64__
-int pdc_mem_mem_table(void *r_addr, void *tbl, unsigned long entries);
+int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr, struct pdc_memory_table *tbl, 
+		      unsigned long entries);
 #endif
 
-/* on all currently-supported platforms, IODC I/O calls are always
- * 32-bit calls, and MEM_PDC calls are always the same width as the OS.
- * This means Cxxx boxes can't run wide kernels right now. -PB
- *
- * Note that some PAT boxes may have 64-bit IODC I/O...
- */
+int pdc_do_firm_test_reset(unsigned long ftc_bitmap);
+int pdc_do_reset(void);
+void pdc_iodc_putc(unsigned char c);
+
+int pdc_sti_call(unsigned long func, unsigned long flags,
+                 unsigned long inptr, unsigned long outputr,
+                 unsigned long glob_cfg);
+
+#ifdef __LP64__
+int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info);
+int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod,
+			unsigned long view_type, void *mem_addr);
+int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa);
+int pdc_pat_get_irt_size(unsigned long *num_entries, unsigned long cell_num);
+int pdc_pat_get_irt(void *r_addr, unsigned long cell_num);
+int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, 
+			    unsigned long count, unsigned long offset);
+
+/********************************************************************
+* PDC_PAT_CELL[Return Cell Module] memaddr[0] conf_base_addr
+* ----------------------------------------------------------
+* Bit  0 to 51 - conf_base_addr
+* Bit 52 to 62 - reserved
+* Bit       63 - endianess bit
+********************************************************************/
+#define PAT_GET_CBA(value) ((value) & 0xfffffffffffff000UL)
+
+/********************************************************************
+* PDC_PAT_CELL[Return Cell Module] memaddr[1] mod_info
+* ----------------------------------------------------
+* Bit  0 to  7 - entity type
+*    0 = central agent,            1 = processor,
+*    2 = memory controller,        3 = system bus adapter,
+*    4 = local bus adapter,        5 = processor bus converter,
+*    6 = crossbar fabric connect,  7 = fabric interconnect,
+*    8 to 254 reserved,            255 = unknown.
+* Bit  8 to 15 - DVI
+* Bit 16 to 23 - IOC functions
+* Bit 24 to 39 - reserved
+* Bit 40 to 63 - mod_pages
+*    number of 4K pages a module occupies starting at conf_base_addr
+********************************************************************/
+#define PAT_GET_ENTITY(value)	(((value) >> 56) & 0xffUL)
+#define PAT_GET_DVI(value)	(((value) >> 48) & 0xffUL)
+#define PAT_GET_IOC(value)	(((value) >> 40) & 0xffUL)
+#define PAT_GET_MOD_PAGES(value)(((value) & 0xffffffUL)
 
-/* yes 'int', not 'long' -- IODC I/O is always 32-bit stuff */
-extern long real64_call(unsigned long function, ...);
-extern long real32_call(unsigned long function, ...);
-
-#if defined(__LP64__) && ! defined(CONFIG_PDC_NARROW)
-#define MEM_PDC (unsigned long)(PAGE0->mem_pdc_hi) << 32 | PAGE0->mem_pdc
-#   define mem_pdc_call(args...) real64_call(MEM_PDC, args)
 #else
-#define MEM_PDC (unsigned long)PAGE0->mem_pdc
-#   define mem_pdc_call(args...) real32_call(MEM_PDC, args)
+/* No PAT support for 32-bit kernels...sorry */
+#define pdc_pat_get_irt_size(num_entries, cell_numn)	PDC_RET_NE_PROC
+#define pdc_pat_get_irt(r_addr, cell_num)	PDC_RET_NE_PROC
 #endif
 
 extern void pdc_init(void);
Index: include/asm-parisc/pdcpat.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pdcpat.h,v
retrieving revision 1.7
diff -u -p -r1.7 pdcpat.h
--- pdcpat.h	2001/03/02 10:31:51	1.7
+++ pdcpat.h	2001/03/29 07:57:59
@@ -10,183 +10,6 @@
  * Copyright 2000 (c) Grant Grundler <grundler@puffin.external.hp.com>
  */
 
-/* PDC PAT CELL */
-#define PDC_PAT_CELL           	64L   /* Interface for gaining and 
-                                         * manipulatin g cell state within PD */
-#define PDC_PAT_CELL_GET_NUMBER    0L   /* Return Cell number */
-#define PDC_PAT_CELL_GET_INFO      1L   /* Returns info about Cell */
-#define PDC_PAT_CELL_MODULE        2L   /* Returns info about Module */
-#define PDC_PAT_CELL_SET_ATTENTION 9L   /* Set Cell Attention indicator */
-#define PDC_PAT_CELL_NUMBER_TO_LOC 10L   /* Cell Number -> Location */
-#define PDC_PAT_CELL_WALK_FABRIC   11L   /* Walk the Fabric */
-#define PDC_PAT_CELL_GET_RDT_SIZE  12L   /* Return Route Distance Table Sizes */
-#define PDC_PAT_CELL_GET_RDT       13L   /* Return Route Distance Tables */
-#define PDC_PAT_CELL_GET_LOCAL_PDH_SZ 14L /* Read Local PDH Buffer Size */
-#define PDC_PAT_CELL_SET_LOCAL_PDH    15L  /* Write Local PDH Buffer */
-#define PDC_PAT_CELL_GET_REMOTE_PDH_SZ 16L /* Return Remote PDH Buffer Size */
-#define PDC_PAT_CELL_GET_REMOTE_PDH 17L /* Read Remote PDH Buffer */
-#define PDC_PAT_CELL_GET_DBG_INFO   128L  /* Return DBG Buffer Info */
-#define PDC_PAT_CELL_CHANGE_ALIAS   129L  /* Change Non-Equivalent Alias Chacking */
-
-
-/*
-** Arg to PDC_PAT_CELL_MODULE memaddr[4]
-**
-** Addresses on the Merced Bus != all Runway Bus addresses.
-** This is intended for programming SBA/LBA chips range registers.
-*/
-#define IO_VIEW      0UL
-#define PA_VIEW      1UL
-
-/* PDC_PAT_CELL_MODULE entity type values */
-#define	PAT_ENTITY_CA	0	/* central agent */
-#define	PAT_ENTITY_PROC	1	/* processor */
-#define	PAT_ENTITY_MEM	2	/* memory controller */
-#define	PAT_ENTITY_SBA	3	/* system bus adapter */
-#define	PAT_ENTITY_LBA	4	/* local bus adapter */
-#define	PAT_ENTITY_PBC	5	/* processor bus converter */
-#define	PAT_ENTITY_XBC	6	/* crossbar fabric connect */
-#define	PAT_ENTITY_RC	7	/* fabric interconnect */
-
-/* PDC_PAT_CELL_MODULE address range type values */
-#define PAT_PBNUM           0         /* PCI Bus Number */
-#define PAT_LMMIO           1         /* < 4G MMIO Space */
-#define PAT_GMMIO           2         /* > 4G MMIO Space */
-#define PAT_NPIOP           3         /* Non Postable I/O Port Space */
-#define PAT_PIOP            4         /* Postable I/O Port Space */
-#define PAT_AHPA            5         /* Addional HPA Space */
-#define PAT_UFO             6         /* HPA Space (UFO for Mariposa) */
-#define PAT_GNIP            7         /* GNI Reserved Space */
-
-
-/* PDC PAT CHASSIS LOG */
-
-#define PDC_PAT_CHASSIS_LOG		65L /* Platform logging & forward
-					    ** progress functions */
-#define PDC_PAT_CHASSIS_WRITE_LOG    	0L /* Write Log Entry */
-#define PDC_PAT_CHASSIS_READ_LOG     	1L /* Read  Log Entry */
-
-/* PDC PAT CPU  */
-
-#define PDC_PAT_CPU                	67L /* Interface to CPU configuration
-                                        	* within the protection domain */
-#define PDC_PAT_CPU_INFO            	0L /* Return CPU config info */
-#define PDC_PAT_CPU_DELETE          	1L /* Delete CPU */
-#define PDC_PAT_CPU_ADD             	2L /* Add    CPU */
-#define PDC_PAT_CPU_GET_NUMBER      	3L /* Return CPU Number */
-#define PDC_PAT_CPU_GET_HPA         	4L /* Return CPU HPA */
-#define PDC_PAT_CPU_STOP            	5L /* Stop   CPU */
-#define PDC_PAT_CPU_RENDEZVOUS      	6L /* Rendezvous CPU */
-#define PDC_PAT_CPU_GET_CLOCK_INFO  	7L /* Return CPU Clock info */
-#define PDC_PAT_CPU_GET_RENDEZVOUS_STATE 8L /* Return Rendezvous State */
-#define PDC_PAT_CPU_PLUNGE_FABRIC 	128L /* Plunge Fabric */
-#define PDC_PAT_CPU_UPDATE_CACHE_CLEANSING 129L /* Manipulate Cache 
-                                                 * Cleansing Mode */
-/*  PDC PAT EVENT */
-
-#define PDC_PAT_EVENT              	68L /* Interface to Platform Events */
-#define PDC_PAT_EVENT_GET_CAPS     	0L /* Get Capabilities */
-#define PDC_PAT_EVENT_SET_MODE     	1L /* Set Notification Mode */
-#define PDC_PAT_EVENT_SCAN         	2L /* Scan Event */
-#define PDC_PAT_EVENT_HANDLE       	3L /* Handle Event */
-#define PDC_PAT_EVENT_GET_NB_CALL  	4L /* Get Non-Blocking call Args */
-
-/*  PDC PAT HPMC */
-
-#define PDC_PAT_HPMC               70L /* Cause processor to go into spin
-				       ** loop, and wait for wake up from
-				       ** Monarch Processor */
-#define PDC_PAT_HPMC_RENDEZ_CPU     0L /* go into spin loop */
-#define PDC_PAT_HPMC_SET_PARAMS     1L /* Allows OS to specify intr which PDC 
-                                        * will use to interupt OS during machine
-                                        * check rendezvous */
-
-/* parameters for PDC_PAT_HPMC_SET_PARAMS: */
-#define HPMC_SET_PARAMS_INTR 	    1L /* Rendezvous Interrupt */
-#define HPMC_SET_PARAMS_WAKE 	    2L /* Wake up processor */
-
-/*  PDC PAT IO */
-
-#define PDC_PAT_IO                  71L /* On-line services for I/O modules */
-#define PDC_PAT_IO_GET_SLOT_STATUS   	5L /* Get Slot Status Info*/
-#define PDC_PAT_IO_GET_LOC_FROM_HARDWARE 6L /* Get Physical Location from */
-                                            /* Hardware Path */
-#define PDC_PAT_IO_GET_HARDWARE_FROM_LOC 7L /* Get Hardware Path from 
-                                             * Physical Location */
-#define PDC_PAT_IO_GET_PCI_CONFIG_FROM_HW 11L /* Get PCI Configuration
-                                               * Address from Hardware Path */
-#define PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG 12L /* Get Hardware Path 
-                                               * from PCI Configuration Address */
-#define PDC_PAT_IO_READ_HOST_BRIDGE_INFO 13L  /* Read Host Bridge State Info */
-#define PDC_PAT_IO_CLEAR_HOST_BRIDGE_INFO 14L /* Clear Host Bridge State Info*/
-#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE_SIZE 15L /* Get PCI INT Routing Table 
-                                                   * Size */
-#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE  16L /* Get PCI INT Routing Table */
-#define PDC_PAT_IO_GET_HINT_TABLE_SIZE 	17L /* Get Hint Table Size */
-#define PDC_PAT_IO_GET_HINT_TABLE   	18L /* Get Hint Table */
-#define PDC_PAT_IO_PCI_CONFIG_READ  	19L /* PCI Config Read */
-#define PDC_PAT_IO_PCI_CONFIG_WRITE 	20L /* PCI Config Write */
-#define PDC_PAT_IO_GET_NUM_IO_SLOTS 	21L /* Get Number of I/O Bay Slots in 
-                                       		  * Cabinet */
-#define PDC_PAT_IO_GET_LOC_IO_SLOTS 	22L /* Get Physical Location of I/O */
-                                   		     /* Bay Slots in Cabinet */
-#define PDC_PAT_IO_BAY_STATUS_INFO  	28L /* Get I/O Bay Slot Status Info */
-#define PDC_PAT_IO_GET_PROC_VIEW        29L /* Get Processor view of IO address */
-#define PDC_PAT_IO_PROG_SBA_DIR_RANGE   30L /* Program directed range */
-
-/* PDC PAT MEM */
-
-#define PDC_PAT_MEM             	72L /* Manage memory page deallocation */
-#define PDC_PAT_MEM_PD_INFO     	0L /* Return PDT info for PD       */
-#define PDC_PAT_MEM_PD_CLEAR    	1L /* Clear PDT for PD             */
-#define PDC_PAT_MEM_PD_READ     	2L /* Read PDT entries for PD      */
-#define PDC_PAT_MEM_PD_RESET    	3L /* Reset clear bit for PD       */
-#define PDC_PAT_MEM_CELL_INFO   	5L /* Return PDT info For Cell     */
-#define PDC_PAT_MEM_CELL_CLEAR  	6L /* Clear PDT For Cell           */
-#define PDC_PAT_MEM_CELL_READ   	7L /* Read PDT entries For Cell    */
-#define PDC_PAT_MEM_CELL_RESET  	8L /* Reset clear bit For Cell     */
-#define PDC_PAT_MEM_SETGM	  	9L /* Set Golden Memory value      */
-#define PDC_PAT_MEM_ADD_PAGE    	10L /* ADDs a page to the cell      */
-#define PDC_PAT_MEM_ADDRESS     	11L /* Get Physical Location From   */
-                                    		 /* Memory Address               */
-#define PDC_PAT_MEM_GET_TXT_SIZE   	12L /* Get Formatted Text Size   */
-#define PDC_PAT_MEM_GET_PD_TXT     	13L /* Get PD Formatted Text     */
-#define PDC_PAT_MEM_GET_CELL_TXT   	14L /* Get Cell Formatted Text   */
-#define PDC_PAT_MEM_RD_STATE_INFO  	15L /* Read Mem Module State Info*/
-#define PDC_PAT_MEM_CLR_STATE_INFO 	16L /*Clear Mem Module State Info*/
-#define PDC_PAT_MEM_CLEAN_RANGE    	128L /*Clean Mem in specific range*/
-#define PDC_PAT_MEM_GET_TBL_SIZE   	131L /* Get Memory Table Size     */
-#define PDC_PAT_MEM_GET_TBL        	132L /* Get Memory Table          */
-
-/* PDC PAT NVOLATILE */
-
-#define PDC_PAT_NVOLATILE          	73L /* Access Non-Volatile Memory */
-#define PDC_PAT_NVOLATILE_READ      	0L /* Read Non-Volatile Memory   */
-#define PDC_PAT_NVOLATILE_WRITE     	1L /* Write Non-Volatile Memory  */
-#define PDC_PAT_NVOLATILE_GET_SIZE  	2L /* Return size of NVM         */
-#define PDC_PAT_NVOLATILE_VERIFY    	3L /* Verify contents of NVM     */
-#define PDC_PAT_NVOLATILE_INIT      	4L /* Initialize NVM             */
-
-/* PDC PAT PD */
-
-#define PDC_PAT_PD                      74L /* Protection Domain Info      */
-#define PDC_PAT_PD_GET_ADDR_MAP         0L  /* Get Address Map             */
-
-/* PDC_PAT_PD_GET_ADDR_MAP entry types */
-
-#define PAT_MEMORY_DESCRIPTOR           1
-
-/* PDC_PAT_PD_GET_ADDR_MAP memory types */
-
-#define PAT_MEMTYPE_MEMORY              0
-#define PAT_MEMTYPE_FIRMWARE            4
-
-/* PDC_PAT_PD_GET_ADDR_MAP memory usage */
-
-#define PAT_MEMUSE_GENERAL              0
-#define PAT_MEMUSE_GI                 128
-#define PAT_MEMUSE_GNI                129
-
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
@@ -210,82 +33,12 @@ struct pdc_pat_cell_info_rtn_block {
 
 typedef struct pdc_pat_cell_info_rtn_block pdc_pat_cell_info_rtn_block_t;
 
-/* FIXME: mod[508] should really be a union of the various mod components */
-struct pdc_pat_cell_mod_maddr_block {	/* PDC_PAT_CELL_MODULE */
-	unsigned long cba;              /* function 0 configuration space address */
-	unsigned long mod_info;         /* module information */
-	unsigned long mod_location;     /* physical location of the module */
-	unsigned long mod_path;         /* module path (device path - layers) */
-	unsigned long mod[508];		/* PAT cell module components */
-} __attribute__((aligned(8))) ;
-
-typedef struct pdc_pat_cell_mod_maddr_block pdc_pat_cell_mod_maddr_block_t;
-
-struct pdc_pat_io_num {
-	unsigned long num;
-	unsigned long reserved[31];
-};
-
-
  struct pdc_pat_pd_addr_map_rtn {
 	unsigned long actual_len;       /* actual # bytes in address map */
 	unsigned long reserved[31];
 } __attribute__((aligned(8))) ;
 
-struct pdc_pat_pd_addr_map_entry {
-	unsigned char entry_type;       /* 1 = Memory Descriptor Entry Type */
-	unsigned char reserve1[5];
-	unsigned char memory_type;
-	unsigned char memory_usage;
-	unsigned long paddr;
-	unsigned int  pages;            /* Length in 4K pages */
-	unsigned int  reserve2;
-	unsigned long cell_map;
-} __attribute__((aligned(8))) ;
-
-extern int pdc_pat_cell_get_number(void *);
-extern int pdc_pat_cell_module(void *, unsigned long, unsigned long, unsigned long, void *);
-extern int pdc_pat_cell_num_to_loc(void *, unsigned long);
-
-#ifdef __LP64__
-extern int pdc_pat_get_irt_size(void *r_addr, unsigned long cell_num);
-extern int pdc_pat_get_irt(void *r_addr, unsigned long cell_num);
-#else
-/* No PAT support for 32-bit kernels...sorry */
-#define pdc_pat_get_irt_size(r_addr, cell_numn)	PDC_RET_NE_PROC
-#define pdc_pat_get_irt(r_addr, cell_num)	PDC_RET_NE_PROC
-#endif
-
 extern int pdc_pat_pd_get_addr_map(void *, void *, unsigned long, unsigned long);
-
-/********************************************************************
-* PDC_PAT_CELL[Return Cell Module] memaddr[0] conf_base_addr
-* ----------------------------------------------------------
-* Bit  0 to 51 - conf_base_addr
-* Bit 52 to 62 - reserved
-* Bit       63 - endianess bit
-********************************************************************/
-#define PAT_GET_CBA(value) ((value) & 0xfffffffffffff000UL)
-
-/********************************************************************
-* PDC_PAT_CELL[Return Cell Module] memaddr[1] mod_info
-* ----------------------------------------------------
-* Bit  0 to  7 - entity type
-*    0 = central agent,            1 = processor,
-*    2 = memory controller,        3 = system bus adapter,
-*    4 = local bus adapter,        5 = processor bus converter,
-*    6 = crossbar fabric connect,  7 = fabric interconnect,
-*    8 to 254 reserved,            255 = unknown.
-* Bit  8 to 15 - DVI
-* Bit 16 to 23 - IOC functions
-* Bit 24 to 39 - reserved
-* Bit 40 to 63 - mod_pages
-*    number of 4K pages a module occupies starting at conf_base_addr
-********************************************************************/
-#define PAT_GET_ENTITY(value)	(((value) >> 56) & 0xffUL)
-#define PAT_GET_DVI(value)	(((value) >> 48) & 0xffUL)
-#define PAT_GET_IOC(value)	(((value) >> 40) & 0xffUL)
-#define PAT_GET_MOD_PAGES(value)(((value) & 0xffffffUL)
 
 #endif /* __ASSEMBLY__ */
 
Index: include/asm-parisc/processor.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/processor.h,v
retrieving revision 1.41
diff -u -p -r1.41 processor.h
--- processor.h	2001/03/02 08:28:56	1.41
+++ processor.h	2001/03/29 07:57:59
@@ -51,8 +51,8 @@ struct system_cpuinfo_parisc {
 
 	struct {
 		struct pdc_model model;
-		struct pdc_model_cpuid /* ARGH */ versions;
-		struct pdc_model_cpuid cpuid;
+		unsigned long versions;
+		unsigned long cpuid;
 #if 0
 		struct pdc_model_caps caps;
 #endif

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="firmware.c"

/* arch/parisc/kernel/pdc.c  - safe pdc access routines
 *
 * Copyright 1999 SuSE GmbH Nuernberg (Philipp Rumpf, prumpf@tux.org)
 * portions Copyright 1999 The Puffin Group, (Alex deVries, David Kennedy)
 *
 * only these routines should be used out of the real kernel (i.e. everything
 * using virtual addresses) for obvious reasons */

/*	I think it would be in everyone's best interest to follow this
 *	guidelines when writing PDC wrappers:
 *
 *	 - the name of the pdc wrapper should match one of the macros
 *	   used for the first two arguments
 *	 - don't use caps for random parts of the name
 *	 - use ASSERT_ALIGN to ensure the aligment of the arguments is
 *	   correct
 *	 - use __pa() to convert virtual (kernel) pointers to physical
 *	   ones.
 *	 - the name of the struct used for pdc return values should equal
 *	   one of the macros used for the first two arguments to the
 *	   corresponding PDC call
 *	 - keep the order of arguments
 *	 - don't be smart (setting trailing NUL bytes for strings, return
 *	   something useful even if the call failed) unless you are sure
 *	   it's not going to affect functionality or performance
 *
 *	Example:
 *	int pdc_cache_info(struct pdc_cache_info *cache_info )
 *	{
 *		ASSERT_ALIGN(cache_info, 8);
 *	
 *		return mem_pdc_call(PDC_CACHE,PDC_CACHE_INFO,__pa(cache_info),0);
 *	}
 *					prumpf	991016	
 */

#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/spinlock.h>

#include <asm/page.h>
#include <asm/pdc.h>
#include <asm/system.h>

#include <stdarg.h>

static spinlock_t pdc_lock = SPIN_LOCK_UNLOCKED;
static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));

/* on all currently-supported platforms, IODC I/O calls are always
 * 32-bit calls, and MEM_PDC calls are always the same width as the OS.
 * This means Cxxx boxes can't run wide kernels right now. -PB
 *
 * CONFIG_PDC_NARROW has been added to allow 64-bit kernels to run on
 * systems with 32-bit MEM_PDC calls. This will allow wide kernels to
 * run on Cxxx boxes now. -RB
 *
 * Note that some PAT boxes may have 64-bit IODC I/O...
 */

/* yes 'int', not 'long' -- IODC I/O is always 32-bit stuff */
#ifdef __LP64__
static long real64_call(unsigned long function, ...);
#endif
static long real32_call(unsigned long function, ...);

#if defined(__LP64__) && ! defined(CONFIG_PDC_NARROW)
#define MEM_PDC (unsigned long)(PAGE0->mem_pdc_hi) << 32 | PAGE0->mem_pdc
#   define mem_pdc_call(args...) real64_call(MEM_PDC, args)
#else
#define MEM_PDC (unsigned long)PAGE0->mem_pdc
#   define mem_pdc_call(args...) real32_call(MEM_PDC, args)
#endif


#define ASSERT_ALIGN(ptr, align)					\
	do { if(((unsigned long)(ptr)) & (align-1)) {			\
		printk("PDC: %s:%d  %s() called with "	\
			"unaligned argument from %p", __FILE__, __LINE__, \
			__FUNCTION__, __builtin_return_address(0));	\
									\
		return -1;						\
	} } while(0)
	
/**
 * f_extend - Convert PDC addresses to kernel addresses.
 * @address: Address returned from PDC.
 *
 * This function is used to convert PDC addresses into kernel addresses
 * when the PDC address size and kernel address size are different.
 */
static unsigned long f_extend(unsigned long address)
{
#ifdef CONFIG_PDC_NARROW
	if((address & 0xff000000) == 0xf0000000)
		return 0xf0f0f0f000000000 | (u32)address;

	if((address & 0xf0000000) == 0xf0000000)
		return 0xffffffff00000000 | (u32)address;
#endif
	return address;
}

/**
 * convert_to_wide - Convert the return buffer addresses into kernel addresses.
 * @address: The return buffer from PDC.
 *
 * This fucntion is used to convert the return buffer addresses retrieve from PDC
 * into kernel addresses when the PDC address size and kernel address size are
 * different.
 */
static void convert_to_wide(unsigned long *addr)
{
#ifdef CONFIG_PDC_NARROW
	int i;
	unsigned *p = (unsigned int *)addr;
	for(i = 31; i >= 0; --i)
		addr[i] = p[i];
#endif
}

/**
 * pdc_add_valid - Verify address can be accessesd without causing a HPMC.
 * @address: Address to be verified.
 *
 * This PDC call attempts to read from the specified address and verify
 * the address is valid.
 */
int pdc_add_valid(void *address)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_ADD_VALID, PDC_ADD_VALID_VERIFY, address);
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_chassis_info - Return chassis information.
 * @result: The return buffer.
 * @chassis_info: The memory buffer address.
 * @len: The size of the memory buffer address.
 *
 * An HVERSION dependent call for returning the chassis information.
 */
int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_CHASSIS, PDC_RETURN_CHASSIS_INFO,
                              __pa(pdc_result), __pa(pdc_result2), len);
	memcpy(chassis_info, pdc_result, sizeof(*chassis_info));
	memcpy(led_info, pdc_result2, sizeof(*led_info));
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_coproc_cfg - To identify coprocessors attached to the processor.
 * @pdc_coproc_info: Return buffer address.
 *
 * This PDC call returns the presence and status of all the coprocessors
 * attached to the processor.
 */
int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_COPROC, PDC_COPROC_CFG, __pa(pdc_result));
        convert_to_wide(pdc_result);
        pdc_coproc_info->ccr_functional = pdc_result[0];
        pdc_coproc_info->ccr_present = pdc_result[1];
        pdc_coproc_info->revision = pdc_result[17];
        pdc_coproc_info->model = pdc_result[18];
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_iodc_read - Read data from the modules IODC.
 * @actcnt: The actual number of bytes.
 * @hpa: The HPA of the module for the iodc read.
 * @index: The iodc entry point.
 * @iodc_data: A buffer memory for the iodc options.
 * @iodc_data_size: Size of the memory buffer.
 *
 * This PDC call reads from the IODC of the module specified by the hpa
 * argument.
 */
int pdc_iodc_read(unsigned long *actcnt, void *hpa, unsigned int index,
		  void *iodc_data, unsigned int iodc_data_size)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, 
			      index, __pa(pdc_result2), iodc_data_size);
	convert_to_wide(pdc_result);
	*actcnt = pdc_result[0];
	memcpy(iodc_data, pdc_result2, iodc_data_size);
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_system_map_find_mods - Locate unarchitected modules.
 * @pdc_mod_info: Return buffer address.
 * @mod_path: pointer to dev path structure.
 * @mod_index: fixed address module index.
 *
 * To locate and identify modules which reside at fixed I/O addresses, which
 * do not self-identify via architected bus walks.
 */
int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
			     struct pdc_module_path *mod_path, long mod_index)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_MODULE, __pa(pdc_result), 
			      __pa(pdc_result2), mod_index);
	convert_to_wide(pdc_result);
	memcpy(pdc_mod_info, pdc_result, sizeof(*pdc_mod_info));
	memcpy(mod_path, pdc_result2, sizeof(*mod_path));
	spin_unlock_irq(&pdc_lock);

	pdc_mod_info->mod_addr = (void *)f_extend((unsigned long)pdc_mod_info->mod_addr);
	return retval;
}

/**
 * pdc_system_map_find_addrs - Retrieve additional address ranges.
 * @pdc_addr_info: Return buffer address.
 * @mod_index: Fixed address module index.
 * @addr_index: Address range index.
 * 
 * Retrieve additional information about subsequent address ranges for modules
 * with multiple address ranges.  
 */
int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
			      long mod_index, long addr_index)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_ADDRESS, __pa(pdc_result),
			      mod_index, addr_index);
	convert_to_wide(pdc_result);
	memcpy(pdc_addr_info, pdc_result, sizeof(*pdc_addr_info));
	spin_unlock_irq(&pdc_lock);

	pdc_addr_info->mod_addr = (void *)f_extend((unsigned long)pdc_addr_info->mod_addr);
	return retval;
}

/**
 * pdc_model_info - Return model information about the processor.
 * @model: The return buffer.
 *
 * Returns the version numbers, identifiers, and capabilities from the processor module.
 */
int pdc_model_info(struct pdc_model *model) 
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_INFO, __pa(pdc_result), 0);
	convert_to_wide(pdc_result);
	memcpy(model, pdc_result, sizeof(*model));
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_model_sysmodel - Get the system model name.
 * @name: A char array of at least 81 characters.
 *
 * Get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L)
 */
int pdc_model_sysmodel(char *name)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_SYSMODEL, __pa(pdc_result),
                              OS_ID_HPUX, __pa(name));
        convert_to_wide(pdc_result);

        if (retval == PDC_RET_OK) {
                name[pdc_result[0]] = '\0'; /* add trailing '\0' */
        } else {
                name[0] = 0;
        }
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_model_versions - Identify the version number of each processor.
 * @cpu_id: The return buffer.
 * @id: The id of the processor to check.
 *
 * Returns the version number for each processor component.
 *
 * This comment was here before, but I do not know what it means :( -RB
 * id: 0 = cpu revision, 1 = boot-rom-version
 */
int pdc_model_versions(unsigned long *versions, int id)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_VERSIONS, __pa(pdc_result), id);
        convert_to_wide(pdc_result);
        *versions = pdc_result[0];
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_model_cpuid - Returns the CPU_ID.
 * @cpu_id: The return buffer.
 *
 * Returns the CPU_ID value which uniquely identifies the cpu portion of
 * the processor module.
 */
int pdc_model_cpuid(unsigned long *cpu_id)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        pdc_result[0] = 0; /* preset zero (call may not be implimented!) */
        retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CPU_ID, __pa(pdc_result), 0);
        convert_to_wide(pdc_result);
        *cpu_id = pdc_result[0];
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_cache_info - Return cache and TLB information.
 * @cache_info: The return buffer.
 *
 * Returns information about the processor's cache and TLB.
 */
int pdc_cache_info(struct pdc_cache_info *cache_info)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_CACHE, PDC_CACHE_INFO, __pa(pdc_result), 0);
        convert_to_wide(pdc_result);
        memcpy(cache_info, pdc_result, sizeof(*cache_info));
        spin_unlock_irq(&pdc_lock);

        return retval;
}

#ifndef CONFIG_PA20
/**
 * pdc_btlb_info - Return block TLB information.
 * @btlb: The return buffer.
 *
 * Returns information about the hardware Block TLB.
 */
int pdc_btlb_info(struct pdc_btlb_info *btlb) 
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_BLOCK_TLB, PDC_BTLB_INFO, __pa(pdc_result), 0);
        memcpy(btlb, pdc_result, sizeof(*btlb));
        spin_unlock_irq(&pdc_lock);

        if(retval < 0) {
                btlb->max_size = 0;
        }
        return retval;
}
#endif

#ifndef __LP64__
/**
 * pdc_mem_map_hpa - Find fixed module information.  
 * @address: The return buffer
 * @mod_path: pointer to dev path structure.
 *
 * This call was developed for S700 workstations to allow the kernel to find
 * the I/O devices (Core I/O). In the future (Kittyhawk and beyond) this
 * call will be replaced (on workstations) by the architected PDC_SYSTEM_MAP
 * call.
 *
 * This call is supported by all existing S700 workstations (up to  Gecko).
 */
int pdc_mem_map_hpa(struct pdc_memory_map *address, struct pdc_module_path *mod_path)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        memcpy(pdc_result2, mod_path, sizeof(*mod_path));
        retval = mem_pdc_call(PDC_MEM_MAP, PDC_MEM_MAP_HPA, __pa(pdc_result), __pa(pdc_result2));
        memcpy(address, pdc_result, sizeof(*address));
        spin_unlock_irq(&pdc_lock);

        return retval;
}
#endif

/**
 * pdc_lan_station_id - Get the LAN address.
 * @lan_addr: The return buffer.
 * @net_hpa: The network device HPA.
 *
 * Get the LAN station address when it is not directly available from the LAN hardware.
 */
int pdc_lan_station_id(char *lan_addr, void *net_hpa)
{
        int retval;
	unsigned int ret[2];

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_LAN_STATION_ID, PDC_LAN_STATION_ID_READ,
                              __pa(pdc_result), net_hpa);
        if(retval < 0) {
                /* FIXME: else read MAC from NVRAM */
                memset(lan_addr, 0, PDC_LAN_STATION_ID_SIZE);
        } else {
		ret[0] = (unsigned int)pdc_result[0];
		ret[1] = (unsigned int)pdc_result[1];
		memcpy(lan_addr, ret, PDC_LAN_STATION_ID_SIZE);
        }
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_pci_irt_size - Get the number of entries in the interrupt routing table.
 * @num_entries: The return value.
 * @hpa: The HPA for the device.
 *
 * This PDC function returns the number of entries in the specified cell's
 * interrupt table.
 * Similar to PDC_PAT stuff - but added for Forte/Allegro boxes
 */ 
int pdc_pci_irt_size(unsigned long *num_entries, void *hpa)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL_SIZE, 
			      __pa(pdc_result), hpa);
	convert_to_wide(pdc_result);
	*num_entries = pdc_result[0];
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/** 
 * pdc_pci_irt - Get the PCI interrupt routing table.
 * @num_entries: The number of entries in the table.
 * @hpa: The Hard Physical Address of the device.
 * @tbl: 
 *
 * Get the PCI interrupt routing table for the device at the given HPA.
 * Similar to PDC_PAT stuff - but added for Forte/Allegro boxes
 */
int pdc_pci_irt(unsigned long num_entries, void *hpa, void *tbl)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	pdc_result[0] = num_entries;
	retval = mem_pdc_call(PDC_PCI_INDEX, PDC_PCI_GET_INT_TBL, 
			      __pa(pdc_result), hpa, __pa(tbl));
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_tod_read - Read the Time-Of-Day clock.
 * @tod: The return buffer:
 *
 * Read the Time-Of-Day clock
 */
int pdc_tod_read(struct pdc_tod *tod)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_TOD, PDC_TOD_READ, __pa(pdc_result), 0);
        convert_to_wide(pdc_result);
        memcpy(tod, pdc_result, sizeof(*tod));
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * pdc_tod_set - Set the Time-Of-Day clock.
 * @sec: The number of seconds since epoch.
 * @usec: The number of micro seconds.
 *
 * Set the Time-Of-Day clock.
 */ 
int pdc_tod_set(unsigned long sec, unsigned long usec)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_TOD, PDC_TOD_WRITE, sec, usec);
        spin_unlock_irq(&pdc_lock);

        return retval;
}

#ifdef __LP64__
int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr, struct pdc_memory_table *tbl, 
		      unsigned long entries)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_MEM, PDC_MEM_TABLE, __pa(pdc_result), __pa(pdc_result2), entries);
	convert_to_wide(pdc_result);
	memcpy(r_addr, pdc_result, sizeof(*r_addr));
	memcpy(tbl, pdc_result2, entries * sizeof(*tbl));
	spin_unlock_irq(&pdc_lock);

	return retval;
}
#endif

/* FIXME: Is this pdc used?  I could not find type reference to ftc_bitmap
 * so I guessed at unsigned long.  Someone who knows what this does, can fix
 * it later. :)
 */
int pdc_do_firm_test_reset(unsigned long ftc_bitmap)
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_FIRM_TEST_RESET,
                              PDC_FIRM_TEST_MAGIC, ftc_bitmap);
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/*
 * pdc_do_reset - Reset the system.
 *
 * Reset the system.
 */
int pdc_do_reset()
{
        int retval;

        spin_lock_irq(&pdc_lock);
        retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET);
        spin_unlock_irq(&pdc_lock);

        return retval;
}

/**
 * iodc_iodc_putc - Console character print using IODC.
 * @c: the character to output.
 *
 * Note that only these special chars are architected for console IODC io:
 * BEL, BS, CR, and LF. Others are passed through.
 * Since the HP console requires CR+LF to perform a 'newline', we translate
 * "\n" to "\r\n".
 */
void pdc_iodc_putc(unsigned char c)
{
        /* XXX Should we spinlock posx usage */
        static int posx;        /* for simple TAB-Simulation... */
        static int __attribute__((aligned(8)))   iodc_retbuf[32];
        static char __attribute__((aligned(64))) iodc_dbuf[4096];
        unsigned int n;

        switch (c) {
        case '\n':
                iodc_dbuf[0] = '\r';
                iodc_dbuf[1] = '\n';
                n = 2;
                posx = 0;
                break;
        case '\t':
                pdc_iodc_putc(' ');
                while (posx & 7)        /* expand TAB */
                        pdc_iodc_putc(' ');
                return;         /* return since IODC can't handle this */
        case '\b':
                posx-=2;                /* BS */
        default:
                iodc_dbuf[0] = c;
                n = 1;
                posx++;
                break;
        }

        spin_lock_irq(&pdc_lock);
        real32_call(PAGE0->mem_cons.iodc_io,
                    (unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
                    PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
                    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
        spin_unlock_irq(&pdc_lock);
}

int pdc_sti_call(unsigned long func, unsigned long flags,
                 unsigned long inptr, unsigned long outputr,
                 unsigned long glob_cfg)
{
        int retval;

        spin_lock_irq(&pdc_lock);  
        retval = real32_call(func, flags, inptr, outputr, glob_cfg);
        spin_unlock_irq(&pdc_lock);

        return retval;
}

#ifdef __LP64__
/**
 * pdc_pat_cell_get_number - Returns the cell number.
 * @cell_info: The return buffer.
 *
 * This PDC call returns the cell number of the cell from which the call
 * is made.
 */
int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_CELL, PDC_PAT_CELL_GET_NUMBER, __pa(pdc_result));
	memcpy(cell_info, pdc_result, sizeof(*cell_info));
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_pat_cell_module - Retrieve the cell's module information.
 * @actcnt: The number of bytes written to mem_addr.
 * @ploc: The physical location.
 * @mod: The module index.
 * @view_type: The view of the address type.
 * @mem_addr: The return buffer.
 *
 * This PDC call returns information about each module attached to the cell
 * at the specified location.
 */
int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod,
			unsigned long view_type, void *mem_addr)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_CELL, PDC_PAT_CELL_MODULE, __pa(pdc_result), 
			      ploc, mod, view_type, __pa(pdc_result2));
	if(!retval) {
		*actcnt = pdc_result[0];
		memcpy(mem_addr, pdc_result2, *actcnt);
	}
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_pat_cpu_get_number - Retrieve the cpu number.
 * @cpu_info: The return buffer.
 * @hpa: The Hard Physical Address of the CPU.
 *
 * Retrieve the cpu number for the cpu at the specified HPA.
 */
int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_CPU, PDC_PAT_CPU_GET_NUMBER,
			      __pa(&pdc_result), hpa);
	memcpy(cpu_info, pdc_result, sizeof(*cpu_info));
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_pat_get_irt_size - Retrieve the number of entries in the cell's interrupt table.
 * @num_entries: The return value.
 * @cell_num: The target cell.
 *
 * This PDC function returns the number of entries in the specified cell's
 * interrupt table.
 */
int pdc_pat_get_irt_size(unsigned long *num_entries, unsigned long cell_num)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_GET_PCI_ROUTING_TABLE_SIZE,
			      __pa(pdc_result), cell_num);
	*num_entries = pdc_result[0];
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_pat_get_irt - Retrieve the cell's interrupt table.
 * @r_addr: The return buffer.
 * @cell_num: The target cell.
 *
 * This PDC functin returns the actual interrupt table for the specified cell.
 */
int pdc_pat_get_irt(void *r_addr, unsigned long cell_num)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_GET_PCI_ROUTING_TABLE,
			      __pa(r_addr), cell_num);
	spin_unlock_irq(&pdc_lock);

	return retval;
}

/**
 * pdc_pat_pd_get_addr_map - Retrieve information about memory address ranges.
 * @actlen: The return buffer.
 * @mem_addr: Pointer to the memory buffer.
 * @count: The number of bytes to read from the buffer.
 * @offset: The offset with respect to the beginning of the buffer.
 *
 */
int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, 
			    unsigned long count, unsigned long offset)
{
	int retval;

	spin_lock_irq(&pdc_lock);
	retval = mem_pdc_call(PDC_PAT_PD, PDC_PAT_PD_GET_ADDR_MAP, __pa(pdc_result), 
			      __pa(pdc_result2), count, offset);
	*actual_len = pdc_result[0];
	memcpy(mem_addr, pdc_result2, *actual_len);
	spin_unlock_irq(&pdc_lock);

	return retval;
}
#endif


/***************** 32-bit real-mode calls ***********/
/* The struct below is used
 * to overlay real_stack (real2.S), preparing a 32-bit call frame.
 * real32_call_asm() then uses this stack in narrow real mode
 */

struct narrow_stack {
	/* use int, not long which is 64 bits */
	unsigned int arg13;
	unsigned int arg12;
	unsigned int arg11;
	unsigned int arg10;
	unsigned int arg9;
	unsigned int arg8;
	unsigned int arg7;
	unsigned int arg6;
	unsigned int arg5;
	unsigned int arg4;
	unsigned int arg3;
	unsigned int arg2;
	unsigned int arg1;
	unsigned int arg0;
	unsigned int frame_marker[8];
	unsigned int sp;
	/* in reality, there's nearly 8k of stack after this */
};

static long real32_call(unsigned long fn, ...)
{
	va_list args;
	extern struct narrow_stack real_stack;
	extern unsigned long real32_call_asm(unsigned int *,
					     unsigned int *, 
					     unsigned int);
	
	va_start(args, fn);
	real_stack.arg0 = va_arg(args, unsigned int);
	real_stack.arg1 = va_arg(args, unsigned int);
	real_stack.arg2 = va_arg(args, unsigned int);
	real_stack.arg3 = va_arg(args, unsigned int);
	real_stack.arg4 = va_arg(args, unsigned int);
	real_stack.arg5 = va_arg(args, unsigned int);
	real_stack.arg6 = va_arg(args, unsigned int);
	real_stack.arg7 = va_arg(args, unsigned int);
	real_stack.arg8 = va_arg(args, unsigned int);
	real_stack.arg9 = va_arg(args, unsigned int);
	real_stack.arg10 = va_arg(args, unsigned int);
	real_stack.arg11 = va_arg(args, unsigned int);
	real_stack.arg12 = va_arg(args, unsigned int);
	real_stack.arg13 = va_arg(args, unsigned int);
	va_end(args);
	
	return real32_call_asm(&real_stack.sp, &real_stack.arg0, fn);
}

#ifdef __LP64__
/***************** 64-bit real-mode calls ***********/

struct wide_stack {
	unsigned long arg0;
	unsigned long arg1;
	unsigned long arg2;
	unsigned long arg3;
	unsigned long arg4;
	unsigned long arg5;
	unsigned long arg6;
	unsigned long arg7;
	unsigned long arg8;
	unsigned long arg9;
	unsigned long arg10;
	unsigned long arg11;
	unsigned long arg12;
	unsigned long arg13;
	unsigned long frame_marker[2];	/* rp, previous sp */
	unsigned long sp;
	/* in reality, there's nearly 8k of stack after this */
};

static long real64_call(unsigned long fn, ...)
{
	va_list args;
	extern struct wide_stack real_stack;
	extern unsigned long real64_call_asm(unsigned long *,
					     unsigned long *, 
					     unsigned long);
    
	va_start(args, fn);
	real_stack.arg0 = va_arg(args, unsigned long);
	real_stack.arg1 = va_arg(args, unsigned long);
	real_stack.arg2 = va_arg(args, unsigned long);
	real_stack.arg3 = va_arg(args, unsigned long);
	real_stack.arg4 = va_arg(args, unsigned long);
	real_stack.arg5 = va_arg(args, unsigned long);
	real_stack.arg6 = va_arg(args, unsigned long);
	real_stack.arg7 = va_arg(args, unsigned long);
	real_stack.arg8 = va_arg(args, unsigned long);
	real_stack.arg9 = va_arg(args, unsigned long);
	real_stack.arg10 = va_arg(args, unsigned long);
	real_stack.arg11 = va_arg(args, unsigned long);
	real_stack.arg12 = va_arg(args, unsigned long);
	real_stack.arg13 = va_arg(args, unsigned long);
	va_end(args);
	
	return real64_call_asm(&real_stack.sp, &real_stack.arg0, fn);
}

#endif


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pdc.h"

#ifndef _PARISC_PDC_H
#define _PARISC_PDC_H

/*
    PDC entry points...
*/

#define PDC_POW_FAIL	1		/* perform a power-fail		*/
#define PDC_POW_FAIL_PREPARE	0	/* prepare for powerfail	*/

#define PDC_CHASSIS	2		/* PDC-chassis functions	*/
#define PDC_CHASSIS_DISP	0	/* update chassis display	*/
#define PDC_CHASSIS_WARN	1	/* return chassis warnings	*/
#define PDC_CHASSIS_DISPWARN	2	/* update&return chassis status */
#define PDC_RETURN_CHASSIS_INFO 128	/* HVERSION dependend: return chassis LED/LCD info  */

#define PDC_PIM         3               /* Get PIM data                 */
#define PDC_PIM_HPMC            0       /* Transfer HPMC data           */
#define PDC_PIM_RETURN_SIZE     1       /* Get Max buffer needed for PIM*/
#define PDC_PIM_LPMC            2       /* Transfer HPMC data           */
#define PDC_PIM_SOFT_BOOT       3       /* Transfer Soft Boot data      */
#define PDC_PIM_TOC             4       /* Transfer TOC data            */

#define PDC_MODEL	4		/* PDC model information call	*/
#define PDC_MODEL_INFO		0	/* returns information 		*/
#define PDC_MODEL_BOOTID	1	/* set the BOOT_ID		*/
#define PDC_MODEL_VERSIONS	2	/* returns cpu-internal versions*/
#define PDC_MODEL_SYSMODEL	3	/* return system model info	*/
#define PDC_MODEL_ENSPEC	4	/* ??? */
#define PDC_MODEL_DISPEC	5	/* ??? */
#define PDC_MODEL_CPU_ID	6	/* returns cpu-id (only newer machines!) */
#define PDC_MODEL_CAPABILITIES	7	/* returns OS32/OS64-flags	*/
#define PDC_MODEL_GET_BOOT__OP	8	/* returns boot test options	*/
#define PDC_MODEL_SET_BOOT__OP	9	/* set boot test options	*/

#define PDC_CACHE	5		/* return/set cache (& TLB) info*/
#define PDC_CACHE_INFO		0	/* returns information 		*/
#define PDC_CACHE_SET_COH	1	/* set coherence state		*/
#define PDC_CACHE_RET_SPID	2	/* returns space-ID bits	*/

#define PDC_HPA	 6       	/* return HPA of processor */
#define PDC_HPA_PROCESSOR       0
#define PDC_HPA_MODULES	 1

#define PDC_COPROC	7       /* Co-Processor (usually FP unit(s)) */
#define PDC_COPROC_CFG	0       /* Co-Processor Cfg (FP unit(s) enabled?) */

#define PDC_IODC	8       /* talk to IODC */
#define PDC_IODC_READ	   0       /* read IODC entry point */
/*      PDC_IODC_RI_*		      INDEX parameter of PDC_IODC_READ   */
#define PDC_IODC_RI_DATA_BYTES	0	/* IODC Data Bytes		    */
/*				1, 2	   obsolete - HVERSION dependent      */
#define PDC_IODC_RI_INIT	3	/* Initialize module		  */
#define PDC_IODC_RI_IO		4	/* Module input/output		*/
#define PDC_IODC_RI_SPA		5	/* Module input/output		*/
#define PDC_IODC_RI_CONFIG	6	/* Module input/output		*/
/*				7	  obsolete - HVERSION dependent      */
#define PDC_IODC_RI_TEST	8	/* Module input/output		*/
#define PDC_IODC_RI_TLB		9	/* Module input/output		*/
#define PDC_IODC_NINIT	  2       /* non-destructive init */
#define PDC_IODC_DINIT	  3       /* destructive init */
#define PDC_IODC_MEMERR	 4       /* check for memory errors */
#define PDC_IODC_INDEX_DATA     0       /* get first 16 bytes from mod IODC */
#define PDC_IODC_BUS_ERROR      -4      /* bus error return value */
#define PDC_IODC_INVALID_INDEX  -5      /* invalid index return value */
#define PDC_IODC_COUNT	  -6      /* count is too small */

#define	PDC_TOD		9		/* time-of-day clock (TOD) */
#define	PDC_TOD_READ		0	/* read TOD  */
#define	PDC_TOD_WRITE		1	/* write TOD */
#define	PDC_TOD_ITIMER		2	/* calibrate Interval Timer (CR16) */

#define PDC_ADD_VALID	12    		/* Memory validation PDC call */
#define PDC_ADD_VALID_VERIFY  0    	/* Make PDC_ADD_VALID verify region */

#define PDC_INSTR	15		/* get instr to invoke PDCE_CHECK() */

#define PDC_BLOCK_TLB	18		/* manage hardware block-TLB	*/
#define PDC_BTLB_INFO		0	/* returns parameter 		*/
#define PDC_BTLB_INSERT		1	/* insert BTLB entry		*/
#define PDC_BTLB_PURGE		2	/* purge BTLB entries 		*/
#define PDC_BTLB_PURGE_ALL	3	/* purge all BTLB entries 	*/

#define PDC_TLB		19		/* manage hardware TLB miss handling */
#define PDC_TLB_INFO		0	/* returns parameter 		*/
#define PDC_TLB_SETUP		1	/* set up miss handling 	*/

#define PDC_MEM         20              /* Manage memory */
#define PDC_MEM_TABLE           128     /* Non contig mem map (sprockets) */

#define PDC_PSW		21		/* Get/Set default System Mask  */
#define PDC_PSW_MASK            0	/* Return mask                  */
#define PDC_PSW_GET_DEFAULTS    1	/* Return defaults              */
#define PDC_PSW_SET_DEFAULTS    2	/* Set default                  */
#define PDC_PSW_ENDIAN_BIT	1	/* set for big endian           */
#define PDC_PSW_WIDE_BIT	2	/* set for wide mode            */ 

#define PDC_SYSTEM_MAP	22		/* find system modules */
#define PDC_FIND_MODULE 	0
#define PDC_FIND_ADDRESS        1


/* HVERSION dependent */

#define PDC_IO			135	/* log error info, reset IO system  */

#define PDC_BROADCAST_RESET	136	/* reset all processors	     */
#define PDC_DO_RESET            0UL	/* option: perform a broadcast reset */
#define PDC_DO_FIRM_TEST_RESET  1UL	/* Do broadcast reset with bitmap */
#define PDC_BR_RECONFIGURATION  2UL	/* reset w/reconfiguration */
#define PDC_FIRM_TEST_MAGIC 	0xab9ec36fUL    /* for this reboot only */

#define PDC_LAN_STATION_ID      138     /* Hversion dependent mechanism for */
#define PDC_LAN_STATION_ID_READ 0       /* getting the lan station address  */

#define	PDC_LAN_STATION_ID_SIZE	6

/* Legacy PDC definitions for same stuff */
#define PDC_PCI_INDEX		   147UL
#define PDC_PCI_GET_INT_TBL_SIZE	13UL
#define PDC_PCI_GET_INT_TBL	     14UL

/* generic error codes returned by all PDC-functions */

#define PDC_WARN	    3  /* Call completed with a warning */
#define PDC_REQ_ERR_1       2  /* See above */
#define PDC_REQ_ERR_0       1  /* Call would generate a requestor error */
#define PDC_OK	      0  /* Call completed successfully */
#define PDC_BAD_PROC	   -1  /* Called non-existant procedure */
#define PDC_BAD_OPTION     -2  /* Called with non-existant option */
#define PDC_ERROR	  -3  /* Call could not complete without an error */
#define PDC_INVALID_ARG   -10  /* Called with an invalid argument */
#define PDC_BUS_POW_WARN  -12  /* Call could not complete in allowed power budget */


/* The following are from the HPUX .h files, and are just for
compatibility */

#define PDC_RET_OK       0L	/* Call completed successfully */
#define PDC_RET_NE_PROC -1L	/* Non-existent procedure */
#define PDC_RET_NE_OPT  -2L	/* non-existant option - arg1 */
#define PDC_RET_NE_MOD  -5L	/* Module not found */
#define PDC_RET_NE_CELL_MOD -7L	/* Cell module not found */
#define PDC_RET_INV_ARG	-10L	/* Invalid argument */
#define PDC_RET_NOT_NARROW -17L /* Narrow mode not supported */


/* Error codes for PDC_ADD_VALID */

#define PDC_ADD_VALID_WARN	    3  /* Call completed with a warning */
#define PDC_ADD_VALID_REQ_ERR_1       2  /* See above */
#define PDC_ADD_VALID_REQ_ERR_0       1  /* Call would generate a requestor error */
#define PDC_ADD_VALID_OK	      0  /* Call completed successfully */
#define PDC_ADD_VALID_BAD_OPTION     -2  /* Called with non-existant option */
#define PDC_ADD_VALID_ERROR	  -3  /* Call could not complete without an error */
#define PDC_ADD_VALID_INVALID_ARG   -10  /* Called with an invalid argument */
#define PDC_ADD_VALID_BUS_POW_WARN  -12  /* Call could not complete in allowed power budget */

/* The PDC_MEM_MAP calls */

#define PDC_MEM_MAP	    128
#define PDC_MEM_MAP_HPA		0

/* constants for OS (NVM...) */
#define OS_ID_NONE	0
#define OS_ID_HPUX	1
#define OS_ID_MPEXL	2
#define OS_ID_OSF	3
#define OS_ID_LINUX	OS_ID_HPUX

/* constants for PDC_CHASSIS */
#define OSTAT_OFF		      0
#define OSTAT_FLT		      1 
#define OSTAT_TEST		     2
#define OSTAT_INIT		     3
#define OSTAT_SHUT		     4
#define OSTAT_WARN		     5
#define OSTAT_RUN		      6
#define OSTAT_ON		       7

#ifdef __LP64__
/* PDC PAT CELL */
#define PDC_PAT_CELL           	64L   /* Interface for gaining and 
                                         * manipulatin g cell state within PD */
#define PDC_PAT_CELL_GET_NUMBER    0L   /* Return Cell number */
#define PDC_PAT_CELL_GET_INFO      1L   /* Returns info about Cell */
#define PDC_PAT_CELL_MODULE        2L   /* Returns info about Module */
#define PDC_PAT_CELL_SET_ATTENTION 9L   /* Set Cell Attention indicator */
#define PDC_PAT_CELL_NUMBER_TO_LOC 10L   /* Cell Number -> Location */
#define PDC_PAT_CELL_WALK_FABRIC   11L   /* Walk the Fabric */
#define PDC_PAT_CELL_GET_RDT_SIZE  12L   /* Return Route Distance Table Sizes */
#define PDC_PAT_CELL_GET_RDT       13L   /* Return Route Distance Tables */
#define PDC_PAT_CELL_GET_LOCAL_PDH_SZ 14L /* Read Local PDH Buffer Size */
#define PDC_PAT_CELL_SET_LOCAL_PDH    15L  /* Write Local PDH Buffer */
#define PDC_PAT_CELL_GET_REMOTE_PDH_SZ 16L /* Return Remote PDH Buffer Size */
#define PDC_PAT_CELL_GET_REMOTE_PDH 17L /* Read Remote PDH Buffer */
#define PDC_PAT_CELL_GET_DBG_INFO   128L  /* Return DBG Buffer Info */
#define PDC_PAT_CELL_CHANGE_ALIAS   129L  /* Change Non-Equivalent Alias Chacking */

/*
** Arg to PDC_PAT_CELL_MODULE memaddr[4]
**
** Addresses on the Merced Bus != all Runway Bus addresses.
** This is intended for programming SBA/LBA chips range registers.
*/
#define IO_VIEW      0UL
#define PA_VIEW      1UL

/* PDC_PAT_CELL_MODULE entity type values */
#define	PAT_ENTITY_CA	0	/* central agent */
#define	PAT_ENTITY_PROC	1	/* processor */
#define	PAT_ENTITY_MEM	2	/* memory controller */
#define	PAT_ENTITY_SBA	3	/* system bus adapter */
#define	PAT_ENTITY_LBA	4	/* local bus adapter */
#define	PAT_ENTITY_PBC	5	/* processor bus converter */
#define	PAT_ENTITY_XBC	6	/* crossbar fabric connect */
#define	PAT_ENTITY_RC	7	/* fabric interconnect */

/* PDC_PAT_CELL_MODULE address range type values */
#define PAT_PBNUM           0         /* PCI Bus Number */
#define PAT_LMMIO           1         /* < 4G MMIO Space */
#define PAT_GMMIO           2         /* > 4G MMIO Space */
#define PAT_NPIOP           3         /* Non Postable I/O Port Space */
#define PAT_PIOP            4         /* Postable I/O Port Space */
#define PAT_AHPA            5         /* Addional HPA Space */
#define PAT_UFO             6         /* HPA Space (UFO for Mariposa) */
#define PAT_GNIP            7         /* GNI Reserved Space */


/* PDC PAT CHASSIS LOG */

#define PDC_PAT_CHASSIS_LOG		65L /* Platform logging & forward
					    ** progress functions */
#define PDC_PAT_CHASSIS_WRITE_LOG    	0L /* Write Log Entry */
#define PDC_PAT_CHASSIS_READ_LOG     	1L /* Read  Log Entry */

/* PDC PAT CPU  */

#define PDC_PAT_CPU                	67L /* Interface to CPU configuration
                                        	* within the protection domain */
#define PDC_PAT_CPU_INFO            	0L /* Return CPU config info */
#define PDC_PAT_CPU_DELETE          	1L /* Delete CPU */
#define PDC_PAT_CPU_ADD             	2L /* Add    CPU */
#define PDC_PAT_CPU_GET_NUMBER      	3L /* Return CPU Number */
#define PDC_PAT_CPU_GET_HPA         	4L /* Return CPU HPA */
#define PDC_PAT_CPU_STOP            	5L /* Stop   CPU */
#define PDC_PAT_CPU_RENDEZVOUS      	6L /* Rendezvous CPU */
#define PDC_PAT_CPU_GET_CLOCK_INFO  	7L /* Return CPU Clock info */
#define PDC_PAT_CPU_GET_RENDEZVOUS_STATE 8L /* Return Rendezvous State */
#define PDC_PAT_CPU_PLUNGE_FABRIC 	128L /* Plunge Fabric */
#define PDC_PAT_CPU_UPDATE_CACHE_CLEANSING 129L /* Manipulate Cache 
                                                 * Cleansing Mode */
/*  PDC PAT EVENT */

#define PDC_PAT_EVENT              	68L /* Interface to Platform Events */
#define PDC_PAT_EVENT_GET_CAPS     	0L /* Get Capabilities */
#define PDC_PAT_EVENT_SET_MODE     	1L /* Set Notification Mode */
#define PDC_PAT_EVENT_SCAN         	2L /* Scan Event */
#define PDC_PAT_EVENT_HANDLE       	3L /* Handle Event */
#define PDC_PAT_EVENT_GET_NB_CALL  	4L /* Get Non-Blocking call Args */

/*  PDC PAT HPMC */

#define PDC_PAT_HPMC               70L /* Cause processor to go into spin
				       ** loop, and wait for wake up from
				       ** Monarch Processor */
#define PDC_PAT_HPMC_RENDEZ_CPU     0L /* go into spin loop */
#define PDC_PAT_HPMC_SET_PARAMS     1L /* Allows OS to specify intr which PDC 
                                        * will use to interupt OS during machine
                                        * check rendezvous */

/* parameters for PDC_PAT_HPMC_SET_PARAMS: */
#define HPMC_SET_PARAMS_INTR 	    1L /* Rendezvous Interrupt */
#define HPMC_SET_PARAMS_WAKE 	    2L /* Wake up processor */

/*  PDC PAT IO */

#define PDC_PAT_IO                  71L /* On-line services for I/O modules */
#define PDC_PAT_IO_GET_SLOT_STATUS   	5L /* Get Slot Status Info*/
#define PDC_PAT_IO_GET_LOC_FROM_HARDWARE 6L /* Get Physical Location from */
                                            /* Hardware Path */
#define PDC_PAT_IO_GET_HARDWARE_FROM_LOC 7L /* Get Hardware Path from 
                                             * Physical Location */
#define PDC_PAT_IO_GET_PCI_CONFIG_FROM_HW 11L /* Get PCI Configuration
                                               * Address from Hardware Path */
#define PDC_PAT_IO_GET_HW_FROM_PCI_CONFIG 12L /* Get Hardware Path 
                                               * from PCI Configuration Address */
#define PDC_PAT_IO_READ_HOST_BRIDGE_INFO 13L  /* Read Host Bridge State Info */
#define PDC_PAT_IO_CLEAR_HOST_BRIDGE_INFO 14L /* Clear Host Bridge State Info*/
#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE_SIZE 15L /* Get PCI INT Routing Table 
                                                   * Size */
#define PDC_PAT_IO_GET_PCI_ROUTING_TABLE  16L /* Get PCI INT Routing Table */
#define PDC_PAT_IO_GET_HINT_TABLE_SIZE 	17L /* Get Hint Table Size */
#define PDC_PAT_IO_GET_HINT_TABLE   	18L /* Get Hint Table */
#define PDC_PAT_IO_PCI_CONFIG_READ  	19L /* PCI Config Read */
#define PDC_PAT_IO_PCI_CONFIG_WRITE 	20L /* PCI Config Write */
#define PDC_PAT_IO_GET_NUM_IO_SLOTS 	21L /* Get Number of I/O Bay Slots in 
                                       		  * Cabinet */
#define PDC_PAT_IO_GET_LOC_IO_SLOTS 	22L /* Get Physical Location of I/O */
                                   		     /* Bay Slots in Cabinet */
#define PDC_PAT_IO_BAY_STATUS_INFO  	28L /* Get I/O Bay Slot Status Info */
#define PDC_PAT_IO_GET_PROC_VIEW        29L /* Get Processor view of IO address */
#define PDC_PAT_IO_PROG_SBA_DIR_RANGE   30L /* Program directed range */

/* PDC PAT MEM */

#define PDC_PAT_MEM             	72L /* Manage memory page deallocation */
#define PDC_PAT_MEM_PD_INFO     	0L /* Return PDT info for PD       */
#define PDC_PAT_MEM_PD_CLEAR    	1L /* Clear PDT for PD             */
#define PDC_PAT_MEM_PD_READ     	2L /* Read PDT entries for PD      */
#define PDC_PAT_MEM_PD_RESET    	3L /* Reset clear bit for PD       */
#define PDC_PAT_MEM_CELL_INFO   	5L /* Return PDT info For Cell     */
#define PDC_PAT_MEM_CELL_CLEAR  	6L /* Clear PDT For Cell           */
#define PDC_PAT_MEM_CELL_READ   	7L /* Read PDT entries For Cell    */
#define PDC_PAT_MEM_CELL_RESET  	8L /* Reset clear bit For Cell     */
#define PDC_PAT_MEM_SETGM	  	9L /* Set Golden Memory value      */
#define PDC_PAT_MEM_ADD_PAGE    	10L /* ADDs a page to the cell      */
#define PDC_PAT_MEM_ADDRESS     	11L /* Get Physical Location From   */
                                    		 /* Memory Address               */
#define PDC_PAT_MEM_GET_TXT_SIZE   	12L /* Get Formatted Text Size   */
#define PDC_PAT_MEM_GET_PD_TXT     	13L /* Get PD Formatted Text     */
#define PDC_PAT_MEM_GET_CELL_TXT   	14L /* Get Cell Formatted Text   */
#define PDC_PAT_MEM_RD_STATE_INFO  	15L /* Read Mem Module State Info*/
#define PDC_PAT_MEM_CLR_STATE_INFO 	16L /*Clear Mem Module State Info*/
#define PDC_PAT_MEM_CLEAN_RANGE    	128L /*Clean Mem in specific range*/
#define PDC_PAT_MEM_GET_TBL_SIZE   	131L /* Get Memory Table Size     */
#define PDC_PAT_MEM_GET_TBL        	132L /* Get Memory Table          */

/* PDC PAT NVOLATILE */

#define PDC_PAT_NVOLATILE          	73L /* Access Non-Volatile Memory */
#define PDC_PAT_NVOLATILE_READ      	0L /* Read Non-Volatile Memory   */
#define PDC_PAT_NVOLATILE_WRITE     	1L /* Write Non-Volatile Memory  */
#define PDC_PAT_NVOLATILE_GET_SIZE  	2L /* Return size of NVM         */
#define PDC_PAT_NVOLATILE_VERIFY    	3L /* Verify contents of NVM     */
#define PDC_PAT_NVOLATILE_INIT      	4L /* Initialize NVM             */

/* PDC PAT PD */

#define PDC_PAT_PD                      74L /* Protection Domain Info      */
#define PDC_PAT_PD_GET_ADDR_MAP         0L  /* Get Address Map             */

/* PDC_PAT_PD_GET_ADDR_MAP entry types */

#define PAT_MEMORY_DESCRIPTOR           1

/* PDC_PAT_PD_GET_ADDR_MAP memory types */

#define PAT_MEMTYPE_MEMORY              0
#define PAT_MEMTYPE_FIRMWARE            4

/* PDC_PAT_PD_GET_ADDR_MAP memory usage */

#define PAT_MEMUSE_GENERAL              0
#define PAT_MEMUSE_GI                 128
#define PAT_MEMUSE_GNI                129
#endif /* __LP64__ */

#ifndef __ASSEMBLY__

#include <linux/types.h>

extern int pdc_type;

/* Values for pdc_type */

#define PDC_TYPE_ILLEGAL   -1
#define PDC_TYPE_PAT        0   /* Newer PAT PDC box (64 bit only */
#define PDC_TYPE_SYSTEM_MAP 1   /* Legacy box that supports PDC_SYSTEM_MAP */
#define PDC_TYPE_LEGACY     2   /* Older Legacy box */

#define is_pdc_pat()    (pdc_type == PDC_TYPE_PAT)

struct pdc_chassis_info {       /* for PDC_CHASSIS_INFO */
	unsigned long actcnt;   /* actual number of bytes returned */
	unsigned long maxcnt;   /* maximum number of bytes that could be returned */
};

struct pdc_coproc_cfg {         /* for PDC_COPROC_CFG */
        unsigned long ccr_functional;
        unsigned long ccr_present;
        unsigned long revision;
        unsigned long model;
};

struct pdc_model {		/* for PDC_MODEL */
	unsigned long hversion;
	unsigned long sversion;
	unsigned long hw_id;
	unsigned long boot_id;
	unsigned long sw_id;
	unsigned long sw_cap;
	unsigned long arch_rev;
	unsigned long pot_key;
	unsigned long curr_key;
};

struct pdc_cache_cf {		/* for PDC_CACHE  (I/D-caches) */
    unsigned long
#ifdef __LP64__
		cc_padW:32,
#endif
		cc_alias:4,	/* alias boundaries for virtual adresses   */
		cc_block: 4,	/* to determine most efficient stride */
		cc_line	: 3,	/* maximum amount written back as a result of store (multiple of 16 bytes) */
		cc_pad0 : 2,	/* reserved */
		cc_wt	: 1,	/* 0 = WT-Dcache, 1 = WB-Dcache */
		cc_sh	: 2,	/* 0 = separate I/D-cache, else shared I/D-cache */
		cc_cst  : 3,	/* 0 = incoherent D-cache, 1=coherent D-cache */
		cc_pad1 : 5,	/* reserved */
		cc_assoc: 8;	/* associativity of I/D-cache */
};

struct pdc_tlb_cf {		/* for PDC_CACHE (I/D-TLB's) */
    unsigned long tc_pad0:12,	/* reserved */
#ifdef __LP64__
		tc_padW:32,
#endif
		tc_sh	: 2,	/* 0 = separate I/D-TLB, else shared I/D-TLB */
		tc_hv   : 1,	/* HV */
		tc_page : 1,	/* 0 = 2K page-size-machine, 1 = 4k page size */
		tc_cst  : 3,	/* 0 = incoherent operations, else coherent operations */
		tc_aid  : 5,	/* ITLB: width of access ids of processor (encoded!) */
		tc_pad1 : 8;	/* ITLB: width of space-registers (encoded) */
};

struct pdc_cache_info {		/* main-PDC_CACHE-structure (caches & TLB's) */
	/* I-cache */
	unsigned long	ic_size;	/* size in bytes */
	struct pdc_cache_cf ic_conf;	/* configuration */
	unsigned long	ic_base;	/* base-addr */
	unsigned long	ic_stride;
	unsigned long	ic_count;
	unsigned long	ic_loop;
	/* D-cache */
	unsigned long	dc_size;	/* size in bytes */
	struct pdc_cache_cf dc_conf;	/* configuration */
	unsigned long	dc_base;	/* base-addr */
	unsigned long	dc_stride;
	unsigned long	dc_count;
	unsigned long	dc_loop;
	/* Instruction-TLB */
	unsigned long	it_size;	/* number of entries in I-TLB */
	struct pdc_tlb_cf it_conf;	/* I-TLB-configuration */
	unsigned long	it_sp_base;
	unsigned long	it_sp_stride;
	unsigned long	it_sp_count;
	unsigned long	it_off_base;
	unsigned long	it_off_stride;
	unsigned long	it_off_count;
	unsigned long	it_loop;
	/* data-TLB */
	unsigned long	dt_size;	/* number of entries in D-TLB */
	struct pdc_tlb_cf dt_conf;	/* D-TLB-configuration */
	unsigned long	dt_sp_base;
	unsigned long	dt_sp_stride;
	unsigned long	dt_sp_count;
	unsigned long	dt_off_base;
	unsigned long	dt_off_stride;
	unsigned long	dt_off_count;
	unsigned long	dt_loop;
};

#if 0
/* If you start using the next struct, you'll have to adjust it to
 * work with 64-bit firmware I think -PB
 */
struct pdc_iodc {     /* PDC_IODC */
	unsigned char   hversion_model;
	unsigned char 	hversion;
	unsigned char 	spa;
	unsigned char 	type;
	unsigned int	sversion_rev:4;
	unsigned int	sversion_model:19;
	unsigned int	sversion_opt:8;
	unsigned char	rev;
	unsigned char	dep;
	unsigned char	features;
	unsigned char	pad1;
	unsigned int	checksum:16;
	unsigned int	length:16;
	unsigned int    pad[15];
} __attribute__((aligned(8))) ;
#endif

#ifndef CONFIG_PA20
/* no BLTBs in pa2.0 processors */
struct pdc_btlb_info_range {
	__u8 res00;
	__u8 num_i;
	__u8 num_d;
	__u8 num_comb;
};

struct pdc_btlb_info {	/* PDC_BLOCK_TLB, return of PDC_BTLB_INFO */
	unsigned int min_size;	/* minimum size of BTLB in pages */
	unsigned int max_size;	/* maximum size of BTLB in pages */
	struct pdc_btlb_info_range fixed_range_info;
	struct pdc_btlb_info_range variable_range_info;
};
#endif

#ifdef __LP64__
struct pdc_memory_table_raddr { /* PDC_MEM/PDC_MEM_TABLE (return info) */
	unsigned long entries_returned;
	unsigned long entries_total;
};

struct pdc_memory_table {       /* PDC_MEM/PDC_MEM_TABLE (arguments) */
	unsigned long paddr;
	unsigned int  pages;
	unsigned int  reserved;
};
#endif

struct pdc_system_map_mod_info { /* PDC_SYSTEM_MAP/FIND_MODULE */
	void * mod_addr;
	unsigned long mod_pgs;
	unsigned long add_addrs;
};

struct pdc_system_map_addr_info { /* PDC_SYSTEM_MAP/FIND_ADDRESS */
	void * mod_addr;
	unsigned long mod_pgs;
};

/*
 * Device path specifications used by PDC.
 */
struct pdc_module_path {
	char  flags;	/* see bit definitions below */
	char  bc[6];	/* Bus Converter routing info to a specific */
			/* I/O adaptor (< 0 means none, > 63 resvd) */
	char  mod;	/* fixed field of specified module */
	unsigned int layers[6]; /* device-specific info (ctlr #, unit # ...) */
};

#ifndef __LP64__
/* Probably needs 64-bit porting -PB */
struct pdc_memory_map {		/* PDC_MEMORY_MAP */
	unsigned long hpa;	/* mod's register set address */
	unsigned long more_pgs;	/* number of additional I/O pgs */
};
#endif

struct pdc_tod {
	unsigned long tod_sec; 
	unsigned long tod_usec;
};

#ifdef __LP64__
struct pdc_pat_cell_num {
	unsigned long cell_num;
	unsigned long cell_loc;
};

struct pdc_pat_cpu_num {
	unsigned long cpu_num;
	unsigned long cpu_loc;
};

struct pdc_pat_pd_addr_map_entry {
	unsigned char entry_type;       /* 1 = Memory Descriptor Entry Type */
	unsigned char reserve1[5];
	unsigned char memory_type;
	unsigned char memory_usage;
	unsigned long paddr;
	unsigned int  pages;            /* Length in 4K pages */
	unsigned int  reserve2;
	unsigned long cell_map;
};

/* FIXME: mod[508] should really be a union of the various mod components */
struct pdc_pat_cell_mod_maddr_block {	/* PDC_PAT_CELL_MODULE */
	unsigned long cba;              /* function 0 configuration space address */
	unsigned long mod_info;         /* module information */
	unsigned long mod_location;     /* physical location of the module */
	unsigned long mod_path;         /* module path (device path - layers) */
	unsigned long mod[508];		/* PAT cell module components */
};

typedef struct pdc_pat_cell_mod_maddr_block pdc_pat_cell_mod_maddr_block_t;
#endif

/* architected results from PDC_PIM/transfer hpmc on a PA1.1 machine */

struct pdc_hpmc_pim_11 { /* PDC_PIM */
	__u32 gr[32];
	__u32 cr[32];
	__u32 sr[8];
	__u32 iasq_back;
	__u32 iaoq_back;
	__u32 check_type;
	__u32 cpu_state;
	__u32 rsvd1;
	__u32 cache_check;
	__u32 tlb_check;
	__u32 bus_check;
	__u32 assists_check;
	__u32 rsvd2;
	__u32 assist_state;
	__u32 responder_addr;
	__u32 requestor_addr;
	__u32 path_info;
	__u64 fr[32];
};

/*
 * architected results from PDC_PIM/transfer hpmc on a PA2.0 machine
 *
 * Note that PDC_PIM doesn't care whether or not wide mode was enabled
 * so the results are different on  PA1.1 vs. PA2.0 when in narrow mode.
 *
 * Note also that there are unarchitected results available, which
 * are hversion dependent. Do a "ser pim 0 hpmc" after rebooting, since
 * the firmware is probably the best way of printing hversion dependent
 * data.
 */

struct pdc_hpmc_pim_20 { /* PDC_PIM */
	__u64 gr[32];
	__u64 cr[32];
	__u64 sr[8];
	__u64 iasq_back;
	__u64 iaoq_back;
	__u32 check_type;
	__u32 cpu_state;
	__u32 cache_check;
	__u32 tlb_check;
	__u32 bus_check;
	__u32 assists_check;
	__u32 assist_state;
	__u32 path_info;
	__u64 responder_addr;
	__u64 requestor_addr;
	__u64 fr[32];
};

#endif /* __ASSEMBLY__ */

/* flags of the device_path (see below) */
#define	PF_AUTOBOOT	0x80
#define	PF_AUTOSEARCH	0x40
#define	PF_TIMER	0x0F

#ifndef __ASSEMBLY__

struct device_path {		/* page 1-69 */
	unsigned char flags;	/* flags see above! */
	unsigned char bc[6];	/* bus converter routing info */
	unsigned char mod;
	unsigned int  layers[6];/* device-specific layer-info */
} __attribute__((aligned(8))) ;

struct pz_device {
	struct	device_path dp;	/* see above */
	/* struct	iomod *hpa; */
	unsigned int hpa;	/* HPA base address */
	/* char	*spa; */
	unsigned int spa;	/* SPA base address */
	/* int	(*iodc_io)(struct iomod*, ...); */
	unsigned int iodc_io;	/* device entry point */
	short	pad;		/* reserved */
	unsigned short cl_class;/* see below */
} __attribute__((aligned(8))) ;

#endif /* __ASSEMBLY__ */

/* cl_class
 * page 3-33 of IO-Firmware ARS
 * IODC ENTRY_INIT(Search first) RET[1]
 */
#define	CL_NULL		0	/* invalid */
#define	CL_RANDOM	1	/* random access (as disk) */
#define	CL_SEQU		2	/* sequential access (as tape) */
#define	CL_DUPLEX	7	/* full-duplex point-to-point (RS-232, Net) */
#define	CL_KEYBD	8	/* half-duplex console (HIL Keyboard) */
#define	CL_DISPL	9	/* half-duplex console (display) */
#define	CL_FC		10	/* FiberChannel access media */

#if 0
/* FIXME: DEVCLASS_* duplicates CL_* (above).  Delete DEVCLASS_*? */
#define DEVCLASS_RANDOM		1
#define DEVCLASS_SEQU		2
#define DEVCLASS_DUPLEX		7
#define DEVCLASS_KEYBD		8
#define DEVCLASS_DISP		9
#endif

/* IODC ENTRY_INIT() */
#define ENTRY_INIT_SRCH_FRST	2
#define ENTRY_INIT_SRCH_NEXT	3
#define ENTRY_INIT_MOD_DEV	4
#define ENTRY_INIT_DEV		5
#define ENTRY_INIT_MOD		6
#define ENTRY_INIT_MSG		9

/* IODC ENTRY_IO() */
#define ENTRY_IO_BOOTIN		0
#define ENTRY_IO_CIN		2
#define ENTRY_IO_COUT		3
#define ENTRY_IO_CLOSE		4
#define ENTRY_IO_GETMSG		9

/* IODC ENTRY_SPA() */

/* IODC ENTRY_CONFIG() */

/* IODC ENTRY_TEST() */

/* IODC ENTRY_TLB() */


/* DEFINITION OF THE ZERO-PAGE (PAG0) */
/* based on work by Jason Eckhardt (jason@equator.com) */

#ifndef __ASSEMBLY__

#define PAGE0   ((struct zeropage *)__PAGE_OFFSET)

struct zeropage {
	/* [0x000] initialize vectors (VEC) */
	unsigned int	vec_special;		/* must be zero */
	/* int	(*vec_pow_fail)(void);*/
	unsigned int	vec_pow_fail; /* power failure handler */
	/* int	(*vec_toc)(void); */
	unsigned int	vec_toc;
	unsigned int	vec_toclen;
	/* int	(*vec_rendz)(void); */
	unsigned int vec_rendz;
	int	vec_pow_fail_flen;
	int	vec_pad[10];		
	
	/* [0x040] reserved processor dependent */
	int	pad0[112];

	/* [0x200] reserved */
	int	pad1[84];

	/* [0x350] memory configuration (MC) */
	int	memc_cont;		/* contiguous mem size (bytes) */
	int	memc_phsize;		/* physical memory size */
	int	memc_adsize;		/* additional mem size, bytes of SPA space used by PDC */
	unsigned int mem_pdc_hi;	/* used for 64-bit */

	/* [0x360] various parameters for the boot-CPU */
	/* unsigned int *mem_booterr[8]; */
	unsigned int mem_booterr[8];	/* ptr to boot errors */
	unsigned int mem_free;		/* first location, where OS can be loaded */
	/* struct iomod *mem_hpa; */
	unsigned int mem_hpa;		/* HPA of the boot-CPU */
	/* int (*mem_pdc)(int, ...); */
	unsigned int mem_pdc;		/* PDC entry point */
	unsigned int mem_10msec;	/* number of clock ticks in 10msec */

	/* [0x390] initial memory module (IMM) */
	/* struct iomod *imm_hpa; */
	unsigned int imm_hpa;		/* HPA of the IMM */
	int	imm_soft_boot;		/* 0 = was hard boot, 1 = was soft boot */
	unsigned int	imm_spa_size;		/* SPA size of the IMM in bytes */
	unsigned int	imm_max_mem;		/* bytes of mem in IMM */

	/* [0x3A0] boot console, display device and keyboard */
	struct pz_device mem_cons;	/* description of console device */
	struct pz_device mem_boot;	/* description of boot device */
	struct pz_device mem_kbd;	/* description of keyboard device */

	/* [0x430] reserved */
	int	pad430[116];

	/* [0x600] processor dependent */
	__u32	pad600[1];
	__u32	proc_sti;		/* pointer to STI ROM */
	__u32	pad608[126];
};

#endif /* __ASSEMBLY__ */

/* Page Zero constant offsets used by the HPMC handler */

#define BOOT_CONSOLE_HPA_OFFSET  0x3c0
#define BOOT_CONSOLE_SPA_OFFSET  0x3c4
#define BOOT_CONSOLE_PATH_OFFSET 0x3a8

#ifndef __ASSEMBLY__
extern void pdc_console_init(void);
extern void setup_pdc(void);            /* in inventory.c */

/* wrapper-functions from pdc.c */

int pdc_add_valid(void *address);
int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len);
int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info);
int pdc_iodc_read(unsigned long *actcnt, void *hpa, unsigned int index,
		  void *iodc_data, unsigned int iodc_data_size);
int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
			     struct pdc_module_path *mod_path, long mod_index);
int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
			      long mod_index, long addr_index);
int pdc_model_info(struct pdc_model *model);
int pdc_model_sysmodel(char  *name);
int pdc_model_cpuid(unsigned long *cpu_id);
int pdc_model_versions(unsigned long *versions, int id);
int pdc_cache_info(struct pdc_cache_info *cache);
#ifndef CONFIG_PA20
int pdc_btlb_info(struct pdc_btlb_info *btlb);
#endif
#ifndef __LP64__
int pdc_mem_map_hpa(struct pdc_memory_map *r_addr, struct pdc_module_path *mod_path);
#endif
int pdc_lan_station_id(char *lan_addr, void *net_hpa);

int pdc_pci_irt_size(unsigned long *num_entries, void *hpa);
int pdc_pci_irt(unsigned long num_entries, void *hpa, void *tbl);

int pdc_tod_read(struct pdc_tod *tod);
int pdc_tod_set(unsigned long sec, unsigned long usec);

#ifdef __LP64__
int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr, struct pdc_memory_table *tbl, 
		      unsigned long entries);
#endif

int pdc_do_firm_test_reset(unsigned long ftc_bitmap);
int pdc_do_reset(void);
void pdc_iodc_putc(unsigned char c);

int pdc_sti_call(unsigned long func, unsigned long flags,
                 unsigned long inptr, unsigned long outputr,
                 unsigned long glob_cfg);

#ifdef __LP64__
int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info);
int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod,
			unsigned long view_type, void *mem_addr);
int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa);
int pdc_pat_get_irt_size(unsigned long *num_entries, unsigned long cell_num);
int pdc_pat_get_irt(void *r_addr, unsigned long cell_num);
int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, 
			    unsigned long count, unsigned long offset);

/********************************************************************
* PDC_PAT_CELL[Return Cell Module] memaddr[0] conf_base_addr
* ----------------------------------------------------------
* Bit  0 to 51 - conf_base_addr
* Bit 52 to 62 - reserved
* Bit       63 - endianess bit
********************************************************************/
#define PAT_GET_CBA(value) ((value) & 0xfffffffffffff000UL)

/********************************************************************
* PDC_PAT_CELL[Return Cell Module] memaddr[1] mod_info
* ----------------------------------------------------
* Bit  0 to  7 - entity type
*    0 = central agent,            1 = processor,
*    2 = memory controller,        3 = system bus adapter,
*    4 = local bus adapter,        5 = processor bus converter,
*    6 = crossbar fabric connect,  7 = fabric interconnect,
*    8 to 254 reserved,            255 = unknown.
* Bit  8 to 15 - DVI
* Bit 16 to 23 - IOC functions
* Bit 24 to 39 - reserved
* Bit 40 to 63 - mod_pages
*    number of 4K pages a module occupies starting at conf_base_addr
********************************************************************/
#define PAT_GET_ENTITY(value)	(((value) >> 56) & 0xffUL)
#define PAT_GET_DVI(value)	(((value) >> 48) & 0xffUL)
#define PAT_GET_IOC(value)	(((value) >> 40) & 0xffUL)
#define PAT_GET_MOD_PAGES(value)(((value) & 0xffffffUL)

#else
/* No PAT support for 32-bit kernels...sorry */
#define pdc_pat_get_irt_size(num_entries, cell_numn)	PDC_RET_NE_PROC
#define pdc_pat_get_irt(r_addr, cell_num)	PDC_RET_NE_PROC
#endif

extern void pdc_init(void);

#endif /* __ASSEMBLY__ */

#endif /* _PARISC_PDC_H */


--ZGiS0Q5IWpPtfppv--
