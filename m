From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix partly 16/64k PAGE_SIZE boot
Date: Thu, 2 May 2013 22:41:45 +0200
Message-ID: <20130502204145.GA16053@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes partly PAGE_SIZEs of 16K or 64K by adjusting the
assembler PTE lookup code and the assembler TEMPALIAS code.  Furthermore
some data alignments for PAGE_SIZE have been limited to 4K (or less) to
not waste too much memory with greater page sizes. As a side note, the
palo loader can (currently) only handle up to 10 ELF segments which is
fixed with tighter aligning as well.

My testings indicated that the ldci command in the sba iommu coding
needed adjustment by the PAGE_SHIFT value and that the I/O PDIR Page
size was only set to 4K for my machine (C3000).

All this fixes partly the boot, but there are still quite some caching
problems left.  Examples are e.g. the symbios logic driver which is
failing:

sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 69                                                                                                                          
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking                                                                                                              
CACHE TEST FAILED: DMA error (dstat=0x81).sym0: CACHE INCORRECTLY CONFIGURED. 

and the tulip network driver which doesn't seem to work correctly
either:

Sending BOOTP requests .net eth0: Setting full-duplex based on MII#1
link partner capability of 05e1                                                                    
..... timed out!   

Beside those kernel fixes glibc will need fixes too to be able to handle
>4K page sizes.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..18f7b28 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -400,7 +400,11 @@
 #if PT_NLEVELS == 3
 	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
+# if PAGE_SIZE > 4096
+	extru		\va,31-ASM_PGDIR_SHIFT,32-ASM_PGDIR_SHIFT,\index
+# else
 	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
+# endif
 #endif
 	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	copy		%r0,\pte
@@ -615,7 +619,7 @@
 
 	.text
 
-	.align	PAGE_SIZE
+	.align 4096
 
 ENTRY(fault_vector_20)
 	/* First vector is invalid (0) */
diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 5595a2f..e158b6f 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -55,13 +55,13 @@
 	 * IODC requires 7K byte stack.  That leaves 1K byte for os_hpmc.
 	 */
 
-	.align	PAGE_SIZE
+	.align 4096
 hpmc_stack:
 	.block 16384
 
 #define HPMC_IODC_BUF_SIZE 0x8000
 
-	.align	PAGE_SIZE
+	.align 4096
 hpmc_iodc_buf:
 	.block HPMC_IODC_BUF_SIZE
 
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 312b484..5e1de60 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -563,6 +563,15 @@ ENDPROC(copy_page_asm)
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
+        /* Drop prot bits and convert to page addr for iitlbt and idtlbt */
+        #define PAGE_ADD_SHIFT  (PAGE_SHIFT-12)
+        .macro          convert_phys_for_tlb_insert20  phys
+        extrd,u         \phys, 56-PAGE_ADD_SHIFT, 32-PAGE_ADD_SHIFT, \phys
+#if _PAGE_SIZE_ENCODING_DEFAULT
+        depdi           _PAGE_SIZE_ENCODING_DEFAULT, 63, (63-58), \phys
+#endif
+	.endm
+
 	/*
 	 * We can't do this since copy_user_page is used to bring in
 	 * file data that might have instructions. Since the data would
@@ -589,15 +598,14 @@ ENTRY(copy_user_page_asm)
 	sub		%r25, %r1, %r23
 
 	ldil		L%(TMPALIAS_MAP_START), %r28
-	/* FIXME for different page sizes != 4k */
 #ifdef CONFIG_64BIT
 #if (TMPALIAS_MAP_START >= 0x80000000)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
-	extrd,u		%r26,56,32, %r26	/* convert phys addr to tlb insert format */
-	extrd,u		%r23,56,32, %r23	/* convert phys addr to tlb insert format */
+	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
+	convert_phys_for_tlb_insert20 %r23	/* convert phys addr to tlb insert format */
 	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,12, %r28		/* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28  /* Clear any offset bits */
 	copy		%r28, %r29
 	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
 #else
@@ -747,11 +755,10 @@ ENTRY(clear_user_page_asm)
 #ifdef CONFIG_64BIT
 #if (TMPALIAS_MAP_START >= 0x80000000)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
-	/* FIXME: page size dependend */
 #endif
-	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
+	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
 	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,12, %r28		/* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
@@ -832,11 +839,10 @@ ENTRY(flush_dcache_page_asm)
 #ifdef CONFIG_64BIT
 #if (TMPALIAS_MAP_START >= 0x80000000)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
-	/* FIXME: page size dependend */
 #endif
-	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
+	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
 	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,12, %r28		/* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
@@ -909,11 +915,10 @@ ENTRY(flush_icache_page_asm)
 #ifdef CONFIG_64BIT
 #if (TMPALIAS_MAP_START >= 0x80000000)
 	depdi		0, 31,32, %r28		/* clear any sign extension */
-	/* FIXME: page size dependend */
 #endif
-	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
+	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
 	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,12, %r28		/* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28  /* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
@@ -959,7 +964,7 @@ ENTRY(flush_icache_page_asm)
 	fic,m		%r1(%sr4,%r28)
 	fic,m		%r1(%sr4,%r28)
 	fic,m		%r1(%sr4,%r28)
-	cmpb,COND(<<)		%r28, %r25,1b
+	cmpb,COND(<<)	%r28, %r25,1b
 	fic,m		%r1(%sr4,%r28)
 
 	sync
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index a3328c2..76b63e7 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -129,6 +129,8 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "The 32-bit Kernel has started...\n");
 #endif
 
+	printk(KERN_INFO "Default page size is %dKB.\n", (int)(PAGE_SIZE / 1024));
+
 	pdc_console_init();
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 5e05524..b27f4aa 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -15,6 +15,7 @@
 #include <asm/thread_info.h>
 #include <asm/assembly.h>
 #include <asm/processor.h>
+#include <asm/cache.h>
 
 #include <linux/linkage.h>
 
@@ -643,7 +644,7 @@ ENTRY(end_linux_gateway_page)
 
 	.section .rodata,"a"
 
-	.align PAGE_SIZE
+	.align 8
 	/* Light-weight-syscall table */
 	/* Start of lws table. */
 ENTRY(lws_table)
@@ -652,13 +653,13 @@ ENTRY(lws_table)
 END(lws_table)
 	/* End of lws table */
 
-	.align PAGE_SIZE
+	.align 8
 ENTRY(sys_call_table)
 #include "syscall_table.S"
 END(sys_call_table)
 
 #ifdef CONFIG_64BIT
-	.align PAGE_SIZE
+	.align 8
 ENTRY(sys_call_table64)
 #define SYSCALL_TABLE_64BIT
 #include "syscall_table.S"
@@ -674,7 +675,7 @@ END(sys_call_table64)
 		with ldcw.
 	*/
 	.section .data
-	.align	PAGE_SIZE
+	.align	L1_CACHE_BYTES
 ENTRY(lws_lock_start)
 	/* lws locks */
 	.rept 16
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 42cfcd9..1ff1b67 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -575,7 +575,7 @@ sba_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 
 	mtsp(sid,1);
 	asm("lci 0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
-	pa |= (ci >> 12) & 0xff;  /* move CI (8 bits) into lowest byte */
+	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
 
 	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
 	*pdir_ptr = cpu_to_le64(pa);	/* swap and store into I/O Pdir */
@@ -1376,7 +1376,7 @@ static void
 sba_ioc_init(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
 {
 	u32 iova_space_size, iova_space_mask;
-	unsigned int pdir_size, iov_order;
+	unsigned int pdir_size, iov_order, tcnfg;
 
 	/*
 	** Determine IOVA Space size from memory size.
@@ -1468,8 +1468,19 @@ sba_ioc_init(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
 	WRITE_REG(ioc->ibase | 1, ioc->ioc_hpa+IOC_IBASE);
 	WRITE_REG(ioc->imask, ioc->ioc_hpa+IOC_IMASK);
 
-	/* Set I/O PDIR Page size to 4K */
-	WRITE_REG(0, ioc->ioc_hpa+IOC_TCNFG);
+	/* Set I/O PDIR Page size to system page size */
+	switch (PAGE_SHIFT) {
+		case 12: tcnfg = 0; break;	/*  4K */
+		case 13: tcnfg = 1; break;	/*  8K */
+		case 14: tcnfg = 2; break;	/* 16K */
+		case 16: tcnfg = 3; break;	/* 64K */
+		default:
+			panic(__FILE__ "Unsupported system page size %d",
+				1 << PAGE_SHIFT);
+			break;
+	}
+	/* Set I/O PDIR Page size to PAGE_SIZE (4k/16k/...) */
+	WRITE_REG(tcnfg, ioc->ioc_hpa+IOC_TCNFG);
 
 	/*
 	** Clear I/O TLB of any possible entries.
