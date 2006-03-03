From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Fri, 3 Mar 2006 15:14:28 -0500
Message-ID: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
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

Finally got around to making this work. I don't want to commit it yet,
as I still haven't decided I like using the x86-esque interface for
deciding to patch. And the names of some of the things are kind of lame.

Anyway, it appears to work in my testing on sba... I converted ccio when
I respun the diff too.

Someone looking it over would be nice. Ten poins if someone can find
another use for this that justifies making it as generic as it is.

Also, if you want to test it, you'll need to remove the & ~_PAGE_WRITE from
PAGE_KERNEL_RO in asm/pgtable.h until we write protect the kernel at a
later stage.

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 4a36ec3..df67259 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -38,6 +38,7 @@
 #undef PCI_DEBUG
 #include <linux/proc_fs.h>
 
+#include <asm/system.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
@@ -45,6 +46,7 @@
 #include <asm/pdc_chassis.h>
 #include <asm/io.h>
 #include <asm/setup.h>
+#include <asm/cache.h>
 
 char	command_line[COMMAND_LINE_SIZE] __read_mostly;
 
@@ -116,6 +118,66 @@ void __init dma_ops_init(void)
 }
 #endif
 
+static int parisc_patch_opcode(unsigned long flag, unsigned long reason)
+{
+	switch(reason) {
+	case ALT_PDC_CAPABILITY:
+		if (boot_cpu_data.pdc.capabilities & flag) {
+			return 1;
+		}
+		break;
+	default:
+		printk(KERN_INFO "Unknown reason for opcode patch.\n");
+		break;
+	}
+
+	return 0;
+}
+
+static void
+self_modifying_code_flush(unsigned long addr)
+{
+	/* flush_icache_range() does the dcache flush, sync, icache flush, 
+	 * sync. There should easily be more than 7 insns between the flush
+	 * and executing any patched instruction.
+	 */
+	flush_icache_range(addr, addr + 4);
+}
+
+void apply_alternatives(void *start, void *end)
+{
+	struct alt_instr *a;
+
+	for (a = start; (void*)a < end; a++) {
+		if (!parisc_patch_opcode(a->flag, a->reason))
+			continue;
+
+		/* pa-_risc_ no variable length crap here */
+		memcpy(a->instr, a->replacement, 4);
+		self_modifying_code_flush((unsigned long)a->instr);
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
+	apply_alternatives(__alt_instructions, __alt_instructions_end);
+}
+
+static int __init noreplacement_setup(char *s)
+{
+	no_replacement = 1;
+	return 0;
+} 
+
+__setup("noreplacement", noreplacement_setup);
+
 extern int init_per_cpu(int cpuid);
 extern void collect_boot_cpu_data(void);
 
@@ -319,6 +381,8 @@ static int __init parisc_init(void)
 			boot_cpu_data.cpu_hz / 1000000,
 			boot_cpu_data.cpu_hz % 1000000	);
 
+	alternative_instructions();
+
 	parisc_setup_cache_timing();
 
 	/* These are in a non-obvious order, will fix when we have an iotree */
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 6d6436a..cd42528 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -153,15 +153,13 @@ SECTIONS
   .con_initcall.init : { *(.con_initcall.init) }
   __con_initcall_end = .;
   SECURITY_INIT
-  /* alternate instruction replacement.  This is a mechanism x86 uses
-   * to detect the CPU type and replace generic instruction sequences
-   * with CPU specific ones.  We don't currently do this in PA, but
-   * it seems like a good idea... */
-  . = ALIGN(4);
+  /* alternate instruction replacement, see setup.c and system.h */
+  . = ALIGN(8);
   __alt_instructions = .;
   .altinstructions : { *(.altinstructions) } 
   __alt_instructions_end = .; 
- .altinstr_replacement : { *(.altinstr_replacement) } 
+ .altinstr_replacement : { *(.altinstr_replacement) }
+  . = ALIGN(4);
   /* .exit.text is discard at runtime, not link time, to deal with references
      from .altinstructions and .eh_frame */
   .exit.text : { *(.exit.text) }
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 93f8a8f..00e1a1c 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -604,19 +604,16 @@ ccio_io_pdir_entry(u64 *pdir_ptr, space_
 	((u32 *)pdir_ptr)[0] = (u32) pa;
 
 
-	/* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
-	**        PCX-U/U+ do. (eg C200/C240)
-	**        PCX-T'? Don't know. (eg C110 or similar K-class)
-	**
-	** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".
+	/* See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".
 	** Hopefully we can patch (NOP) these out at boot time somehow.
 	**
 	** "Since PCX-U employs an offset hash that is incompatible with
 	** the real mode coherence index generation of U2, the PDIR entry
 	** must be flushed to memory to retain coherence."
 	*/
-	asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
-	asm volatile("sync");
+	pdc_capability_altinput("nop", "fdc %%r0(%2)", PDC_MODEL_IOPDIR_FDC,
+				"r"(pdir_ptr) : "memory");
+	pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 }
 
 /**
@@ -678,21 +675,14 @@ ccio_mark_invalid(struct ioc *ioc, dma_a
 
 		BUG_ON(idx >= (ioc->pdir_size / sizeof(u64)));
 		pdir_ptr[7] = 0;	/* clear only VALID bit */ 
-		/*
-		** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
-		**   PCX-U/U+ do. (eg C200/C240)
-		** See PDC_MODEL/option 0/SW_CAP for "Non-coherent IO-PDIR bit".
-		**
-		** Hopefully someone figures out how to patch (NOP) the
-		** FDC/SYNC out at boot time.
-		*/
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+		pdc_capability_altinput("nop", "fdc %%r0(%2)", 
+					PDC_MODEL_IOPDIR_FDC, "r"(pdir_ptr[7]) : "memory");
 
 		iovp     += IOVP_SIZE;
 		byte_cnt -= IOVP_SIZE;
 	}
 
-	asm volatile("sync");
+        pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 	ccio_clear_io_tlb(ioc, CCIO_IOVP(iova), saved_byte_cnt);
 }
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 5d47c59..ca4e4e3 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -39,6 +39,7 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 
+#include <asm/system.h>		/* for instruction patching */
 #include <asm/runway.h>		/* for proc_runway_root */
 #include <asm/pdc.h>		/* for PDC_MODEL_* */
 #include <asm/pdcpat.h>		/* for is_pdc_pat() */
@@ -285,8 +286,6 @@ struct sba_device {
 
 static struct sba_device *sba_list;
 
-static unsigned long ioc_needs_fdc = 0;
-
 /* global count of IOMMUs in the system */
 static unsigned int global_ioc_cnt = 0;
 
@@ -745,8 +744,8 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t
 	 * (bit #61, big endian), we have to flush and sync every time
 	 * IO-PDIR is changed in Ike/Astro.
 	 */
-	if (ioc_needs_fdc)
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
+	pdc_capability_altinput("nop", "fdc %%r0(%2)", PDC_MODEL_IOPDIR_FDC, 
+				"r"(pdir_ptr) : "memory");
 }
 
 
@@ -786,25 +785,13 @@ sba_mark_invalid(struct ioc *ioc, dma_ad
 
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
@@ -819,8 +806,8 @@ sba_mark_invalid(struct ioc *ioc, dma_ad
 	** could dump core on HPMC.
 	*/
 	((u8 *) pdir_ptr)[7] = 0;
-	if (ioc_needs_fdc)
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
+        pdc_capability_altinput("nop", "fdc %%r0(%2)", 
+				PDC_MODEL_IOPDIR_FDC, "r"(pdir_ptr) : "memory");
 
 	WRITE_REG( SBA_IOVA(ioc, iovp, 0, 0), ioc->ioc_hpa+IOC_PCOM);
 }
@@ -927,8 +914,7 @@ sba_map_single(struct device *dev, void 
 	}
 
 	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+        pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 
 #ifdef ASSERT_PDIR_SANITY
 	sba_check_pdir(ioc,"Check after sba_map_single()");
@@ -998,8 +984,7 @@ sba_unmap_single(struct device *dev, dma
 	sba_free_range(ioc, iova, size);
 
 	/* If fdc's were issued, force fdc's to be visible now */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+	pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
 
 	READ_REG(ioc->ioc_hpa+IOC_PCOM);	/* flush purges */
 #endif /* DELAYED_RESOURCE_CNT == 0 */
@@ -1147,8 +1132,8 @@ sba_map_sg(struct device *dev, struct sc
 	filled = iommu_fill_pdir(ioc, sglist, nents, 0, sba_io_pdir_entry);
 
 	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
-	if (ioc_needs_fdc)
-		asm volatile("sync" : : );
+        pdc_capability_alt("nop", "sync", PDC_MODEL_IOPDIR_FDC);
+
 
 #ifdef ASSERT_PDIR_SANITY
 	if (sba_check_pdir(ioc,"Check after sba_map_sg()"))
@@ -1877,7 +1862,6 @@ sba_common_init(struct sba_device *sba_d
 	}
 
 	spin_lock_init(&sba_dev->sba_lock);
-	ioc_needs_fdc = boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC;
 
 #ifdef DEBUG_SBA_INIT
 	/*
diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
index a5a973c..180fe0e 100644
--- a/include/asm-parisc/system.h
+++ b/include/asm-parisc/system.h
@@ -2,6 +2,7 @@
 #define __PARISC_SYSTEM_H
 
 #include <linux/config.h>
+#include <linux/types.h>
 #include <asm/psw.h>
 
 /* The program status word as bitfields.  */
@@ -146,6 +147,59 @@ static inline void set_eiem(unsigned lon
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
+#define ALT_INSTR_ALIGN	"8"
+#define ALT_INSTR_TYPE	".quad"	/* grr, .long doesn't work */
+#else
+#define ALT_INSTR_ALIGN "4"
+#define ALT_INSTR_TYPE	".word"
+#endif /* __LP64__ */
+
+/* values for alt_instr.reason */
+#define ALT_PDC_CAPABILITY	1
+
+#define alternative(oldinstr, newinstr, flag, reason)		\
+	asm volatile ("661:\n\t" oldinstr "\n662:\n"		\
+		      ".section .altinstructions,\"a\"\n"	\
+		      "  .align " ALT_INSTR_ALIGN "\n"		\
+		      "  " ALT_INSTR_TYPE " 661b\n"		\
+		      "  " ALT_INSTR_TYPE " 663f\n"		\
+		      "  " ALT_INSTR_TYPE " %0\n"		\
+		      "  " ALT_INSTR_TYPE " %1\n"		\
+		      ".previous\n"				\
+		      ".section .altinstr_replacement,\"ax\"\n"	\
+		      "  .align 4\n"				\
+		      "663:\n\t" newinstr "\n664:\n"		\
+		      ".previous" :: "i"(flag), "i"(reason)	\
+		        : "memory")
+
+#define alternative_input(oldinstr, newinstr, flag, reason, input...)	\
+        asm volatile ("661:\n\t" oldinstr "\n662:\n"			\
+                      ".section .altinstructions,\"a\"\n"		\
+                      "  .align " ALT_INSTR_ALIGN "\n"			\
+		      "  " ALT_INSTR_TYPE " 661b\n"			\
+		      "  " ALT_INSTR_TYPE " 663f\n"			\
+		      "  " ALT_INSTR_TYPE " %0\n"			\
+		      "  " ALT_INSTR_TYPE " %1\n"			\
+                      ".previous\n"					\
+                      ".section .altinstr_replacement,\"ax\"\n"		\
+		      "  .align 4\n"					\
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
