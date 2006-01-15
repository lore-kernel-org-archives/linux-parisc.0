From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] alternative insn for parisc
Date: Sun, 15 Jan 2006 11:14:19 -0500
Message-ID: <20060115161419.GC21721@quicksilver.road.mcmartin.ca>
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

I was toying with the idea of cleaning up the ugly
ioc_needs_fdc branches all over sba_iommu.c to use something a little
bit more elegant, patching opcodes at runtime...

x86{,-64} has a nice little interface for this that I thought I'd
hijack...

Anyway, it seems to work ok, the bits and pieces appear to be
properly stored in the altinstructions section, but the actual runtime
patching fails in a bogus way.

I don't have time to debug this right now, but if someone else wants
to trace my faulty logic, that would be awesome. Please don't commit it
yet, as I still haven't decided how I want to export the `API' for
deciding whether to patch or not.

Cheers,
	Kyle

Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/setup.c,v
retrieving revision 1.14
diff -u -d -p -r1.14 setup.c
--- arch/parisc/kernel/setup.c	17 Dec 2005 17:54:41 -0000	1.14
+++ arch/parisc/kernel/setup.c	15 Jan 2006 00:56:55 -0000
@@ -38,6 +38,7 @@
 #undef PCI_DEBUG
 #include <linux/proc_fs.h>
 
+#include <asm/system.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
@@ -116,6 +117,59 @@ void __init dma_ops_init(void)
 }
 #endif
 
+static int parisc_patch_opcode(unsigned long flag, unsigned long reason)
+{
+	switch(reason) {
+	case ALT_PDC_CAPABILITY:
+		if (boot_cpu_data.pdc.capabilities & flag)
+			return 1;
+		break;
+	default:
+		printk(KERN_INFO "Unknown reason.\n");
+		break;
+	}
+
+	return 0;
+}
+
+void apply_alternatives(void *start, void *end)
+{
+	struct alt_instr *a;
+
+	for (a = start; (void*)a < end; a++) {
+		printk(KERN_INFO "Patching code @ 0x%p\n", a);
+		printk(KERN_INFO "a->instr = 0x%p\n", (a->instr));
+		printk(KERN_INFO "a->replacement = 0x%p\n", (a->replacement));
+		printk(KERN_INFO "a->flag = 0x%x\n", a->flag);
+		printk(KERN_INFO "a->reason = 0x%x\n", a->reason);
+
+		if (!parisc_patch_opcode(a->flag, a->reason))
+			continue;
+
+		printk(KERN_INFO "Applying patch to 0x%p\n", a->instr);
+
+		/* parisc has fixed width insns */
+		memcpy(a->instr, a->replacement, 4);
+		/* this probably executed before we need to flush */
+	}
+}
+
+static int no_replacement __initdata = 0;
+
+void __init alternative_instructions(void)
+{
+	extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
+
+	if (no_replacement)
+		return;
+
+	printk(KERN_INFO "alt_instructions section start = 0x%p\n"
+	       KERN_INFO "alt_instructions section end = 0x%p\n",
+		__alt_instructions, __alt_instructions_end);
+
+	apply_alternatives(__alt_instructions, __alt_instructions_end);
+}
+
 extern int init_per_cpu(int cpuid);
 extern void collect_boot_cpu_data(void);
 
@@ -318,6 +372,8 @@ static int __init parisc_init(void)
 			boot_cpu_data.cpu_name,
 			boot_cpu_data.cpu_hz / 1000000,
 			boot_cpu_data.cpu_hz % 1000000	);
+
+	alternative_instructions();
 
 	parisc_setup_cache_timing();
 
Index: drivers/parisc/sba_iommu.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/sba_iommu.c,v
retrieving revision 1.42
diff -u -d -p -r1.42 sba_iommu.c
--- drivers/parisc/sba_iommu.c	12 Nov 2005 04:08:02 -0000	1.42
+++ drivers/parisc/sba_iommu.c	15 Jan 2006 00:57:00 -0000
@@ -37,6 +37,7 @@
 #include <asm/hardware.h>	/* for register_parisc_driver() stuff */
 
 #include <linux/proc_fs.h>
+#include <asm/system.h>		/* for alternate() */
 #include <asm/runway.h>		/* for proc_runway_root */
 #include <asm/pdc.h>		/* for PDC_MODEL_* */
 #include <asm/pdcpat.h>		/* for is_pdc_pat() */
@@ -283,8 +284,6 @@ struct sba_device {
 
 static struct sba_device *sba_list;
 
-static unsigned long ioc_needs_fdc = 0;
-
 /* global count of IOMMUs in the system */
 static unsigned int global_ioc_cnt = 0;
 
@@ -743,8 +742,8 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t
 	 * (bit #61, big endian), we have to flush and sync every time
 	 * IO-PDIR is changed in Ike/Astro.
 	 */
-	if (ioc_needs_fdc)
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
+	pdc_capability_altinput("nop", "fdc %%r0(%2)", PDC_MODEL_IOPDIR_FDC, 
+				"r"(pdir_ptr) : "memory");
 }
 
 
@@ -784,25 +783,13 @@ sba_mark_invalid(struct ioc *ioc, dma_ad
 
 	if (byte_cnt > IOVP_SIZE)
 	{
-#if 0
-		unsigned long entries_per_cacheline = ioc_needs_fdc ?
-				L1_CACHE_ALIGN(((unsigned long) pdir_ptr))
-					- (unsigned long) pdir_ptr;
-				: 262144;
-#endif
-
 		/* set "size" field for PCOM */
 		iovp |= get_order(byte_cnt) + PAGE_SHIFT;
 
 		do {
 			/* clear I/O Pdir entry "valid" bit first */
 			((u8 *) pdir_ptr)[7] = 0;
-			if (ioc_needs_fdc) {
-				asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
-#if 0
-				entries_per_cacheline = L1_CACHE_SHIFT - 3;
-#endif
-			}
+			pdc_capability_altinput("nop", "fdc %%r0(%2)", PDC_MODEL_IOPDIR_FDC, "r"(pdir_ptr) : "memory");
 			pdir_ptr++;
 			byte_cnt -= IOVP_SIZE;
 		} while (byte_cnt > IOVP_SIZE);
@@ -817,8 +804,8 @@ sba_mark_invalid(struct ioc *ioc, dma_ad
 	** could dump core on HPMC.
 	*/
 	((u8 *) pdir_ptr)[7] = 0;
-	if (ioc_needs_fdc)
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
+        pdc_capability_altinput("nop", "fdc %%r0(%2)", 
+				PDC_MODEL_IOPDIR_FDC, "r"(pdir_ptr) : "memory");
 
 	WRITE_REG( SBA_IOVA(ioc, iovp, 0, 0), ioc->ioc_hpa+IOC_PCOM);
 }
@@ -925,8 +912,7 @@ sba_map_single(struct device *dev, void 
 	}
 
 	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+        pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 
 #ifdef ASSERT_PDIR_SANITY
 	sba_check_pdir(ioc,"Check after sba_map_single()");
@@ -996,8 +982,7 @@ sba_unmap_single(struct device *dev, dma
 	sba_free_range(ioc, iova, size);
 
 	/* If fdc's were issued, force fdc's to be visible now */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+	pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 
 	READ_REG(ioc->ioc_hpa+IOC_PCOM);	/* flush purges */
 #endif /* DELAYED_RESOURCE_CNT == 0 */
@@ -1145,8 +1130,8 @@ sba_map_sg(struct device *dev, struct sc
 	filled = iommu_fill_pdir(ioc, sglist, nents, 0, sba_io_pdir_entry);
 
 	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+        pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
+
 
 #ifdef ASSERT_PDIR_SANITY
 	if (sba_check_pdir(ioc,"Check after sba_map_sg()"))
@@ -1875,7 +1860,6 @@ sba_common_init(struct sba_device *sba_d
 	}
 
 	spin_lock_init(&sba_dev->sba_lock);
-	ioc_needs_fdc = boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC;
 
 #ifdef DEBUG_SBA_INIT
 	/*
Index: include/asm-parisc/system.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
retrieving revision 1.13
diff -u -d -p -r1.13 system.h
--- include/asm-parisc/system.h	14 Sep 2005 12:57:40 -0000	1.13
+++ include/asm-parisc/system.h	15 Jan 2006 00:57:04 -0000
@@ -2,6 +2,7 @@
 #define __PARISC_SYSTEM_H
 
 #include <linux/config.h>
+#include <linux/types.h>
 #include <asm/psw.h>
 
 /* The program status word as bitfields.  */
@@ -137,6 +138,55 @@ static inline void set_eiem(unsigned lon
 #define set_mb(var, value)		do { var = value; mb(); } while (0)
 #define set_wmb(var, value)		do { var = value; wmb(); } while (0)
 
+/* Runtime overwritten alternate instructions */
+struct alt_instr {
+	u32 *instr;		/* original */
+	u32 *replacement;
+	unsigned long flag;
+	unsigned long reason;	/* pad to 4*sizeof(unsigned long) */
+};
+
+#ifdef __LP64__
+#define ALT_INSTR_ALIGN	"32"
+#else
+#define ALT_INSTR_ALIGN "16"
+#endif /* __LP64__ */
+
+/* values for alt_instr.reason */
+#define ALT_PDC_CAPABILITY	1
+
+#define alternative(oldinstr, newinstr, flag, reason)		\
+	asm volatile ("661:\n\t" oldinstr "\n662:\n"		\
+		      ".section .altinstructions,\"a\"\n"	\
+		      "  .align " ALT_INSTR_ALIGN "\n"		\
+		      "  .long 661b\n"				\
+		      "  .long 663f\n"				\
+		      "  .long %c0\n"				\
+		      "  .long %c1\n"				\
+		      ".previous\n"				\
+		      ".section .altinstr_replacement,\"ax\"\n"	\
+		      "663:\n\t" newinstr "\n664:\n"		\
+		      ".previous" :: "i"(flag), "i"(reason)	\
+		        : "memory")
+
+#define alternative_input(oldinstr, newinstr, flag, reason, input...)	\
+        asm volatile ("661:\n\t" oldinstr "\n662:\n"			\
+                      ".section .altinstructions,\"a\"\n"		\
+                      "  .align " ALT_INSTR_ALIGN "\n"			\
+                      "  .long 661b\n"					\
+                      "  .long 663f\n"					\
+                      "  .long %c0\n"					\
+		      "  .long %c1\n"					\
+                      ".previous\n"					\
+                      ".section .altinstr_replacement,\"ax\"\n"		\
+                      "663:\n\t" newinstr "\n664:\n"			\
+                      ".previous" :: "i" (flag), "i" (reason), 		\
+		        ## input)
+
+#define pdc_capability_alt(old, new, flag) 			\
+		alternative(old, new, flag, ALT_PDC_CAPABILITY)
+#define pdc_capability_altinput(old, new, flag, input...) 	\
+		alternative_input(old, new, flag, ALT_PDC_CAPABILITY, input)
 
 #ifndef CONFIG_PA20
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
