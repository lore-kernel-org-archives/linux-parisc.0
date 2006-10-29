From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [RFC] vdso for parisc-linux
Date: Sun, 29 Oct 2006 20:49:14 +0800
Message-ID: <4544A34A.6080700@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------080200030008040309060204"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

This is a multi-part message in MIME format.
--------------080200030008040309060204
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

At kyle's urging, i've started an initial implementation of vdso support 
  for parisc-linux. I've attached what I have so far for some initial 
comments. This is primarily based on the ppc vdso infrastructure.

Some things to consider:
1) The vdso object need to be mapped to userspace apps at some "default" 
location. In fact the kernel will look for an available vma using 
get_unmapped_area(). Right now I've arbitrarily picked 0x8000'0000. This 
should be reviewed.... one idea is to just map them at at the same place 
that shared libs are mapped (near 0x4000'0000). The bigger concern is 
whether we should make the mapping with MAP_SHARED so that the shared 
area is mapped congruent in all userspace apps that use the vdso. ppc 
doesn't do this.

2) our mmu_context_t used to be a single int that stores the space id of 
the current process. This has been extended into a struct that stores 
the space id and the vdso base address

3) 64-bit vdso does not work yet. Right now I am seeing binutils errors 
if i try to build a 64-bit vdso. For now this support is disabled -- 
it's not like we have 64-bit userspace anyway.

4) I haven't hooked up all the actual vdso functions yet, but with this 
patch userspace can see the functions exposed from the kernel, we can 
use gdb to put breakpoints in the vdso, etc.

5) We need to figure out which functions we want to expose. Several 
other archs expose gettimeofday and clock_get_time via vdso. For us, 
atomic ops are also prime candidates. Several archs also use the vdso to 
provide a cleaner signal trampoline interface. The latter mostly 
requires somebody to write up all the proper cfi instructions into 
sigtramp.S

As part of testing this, I also noticed that our gas does not support 
cfi directives that were added to binutils some time ago. I've submitted 
a patch for this.

glibc will need some work to get this to work. As a first step we need a 
dl-sysdep.h that defines:
  #define NEED_DL_SYSINFO_DSO     1

If you use upstream glibc this is already enabled for all targets, but 
debian glibc will need this added if you want to test.

Anyway, please let me know if you have any comments.

randolph

--------------080200030008040309060204
Content-Type: text/x-patch;
 name="vdso.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vdso.diff"

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 9b7e424..b6ff54e 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -31,6 +31,16 @@ CROSS_COMPILE	:= hppa-linux-
 endif
 endif
 
+# Set default 32 bits cross compilers for vdso and boot wrapper
+CROSS32_COMPILE ?=
+
+CROSS32CC		:= $(CROSS32_COMPILE)gcc
+CROSS32AS		:= $(CROSS32_COMPILE)as
+CROSS32LD		:= $(CROSS32_COMPILE)ld
+CROSS32AR		:= $(CROSS32_COMPILE)ar
+CROSS32OBJCOPY		:= $(CROSS32_COMPILE)objcopy
+export CROSS32CC CROSS32AS CROSS32LD CROSS32AR CROSS32OBJCOPY
+
 FINAL_LD=$(CROSS_COMPILE)ld --warn-common --warn-section-align 
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 27827bc..db84c0d 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -12,7 +12,7 @@ obj-y	     	:= cache.o pacache.o setup.o
 		   ptrace.o hardware.o inventory.o drivers.o semaphore.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
-		   topology.o
+		   topology.o vdso.o vdso32/
 
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_PA11)	+= pci-dma.o
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index c11a5bc..5effa4b 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -32,12 +32,15 @@ #include <linux/sched.h>
 #include <linux/thread_info.h>
 #include <linux/ptrace.h>
 #include <linux/hardirq.h>
+#include <linux/time.h>
 
 #include <asm/pgtable.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
 #include <asm/uaccess.h>
+#include <asm/vdso_datapage.h>
+#include <asm/compat.h>
 
 #define DEFINE(sym, val) \
 	asm volatile("\n->" #sym " %0 " #val : : "i" (val))
@@ -297,5 +300,29 @@ int main(void)
 	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
 	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
 	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
+
+	/* timeval/timezone offsets for use by vdso */
+	DEFINE(TZONE_TZ_MINWEST, offsetof(struct timezone, tz_minuteswest));
+	DEFINE(TZONE_TZ_DSTTIME, offsetof(struct timezone, tz_dsttime));
+
+	/* vdso datapage offsets */
+	DEFINE(VDSO_SYSCALL_MAP32, offsetof(struct vdso_data, syscall_map_32));
+#ifdef CONFIG_64BIT
+	DEFINE(VDSO_SYSCALL_MAP64, offsetof(struct vdso_data, syscall_map_64));
+#endif
+	DEFINE(VDSO_TZ_MINUTEWEST, offsetof(struct vdso_data, tz_minuteswest));
+	DEFINE(VDSO_TZ_DSTTIME, offsetof(struct vdso_data, tz_dsttime));
+	DEFINE(VDSO_WTOM_CLOCK_SEC, offsetof(struct vdso_data, wtom_clock_sec));
+	DEFINE(VDSO_WTOM_CLOCK_NSEC, offsetof(struct vdso_data, wtom_clock_nsec));
+
+#ifdef CONFIG_64BIT
+	DEFINE(TVAL64_TV_SEC, offsetof(struct timeval, tv_sec));
+	DEFINE(TVAL64_TV_USEC, offsetof(struct timeval, tv_usec));
+	DEFINE(TVAL32_TV_SEC, offsetof(struct compat_timeval, tv_sec));
+	DEFINE(TVAL32_TV_USEC, offsetof(struct compat_timeval, tv_usec));
+#else
+	DEFINE(TVAL32_TV_SEC, offsetof(struct timeval, tv_sec));
+	DEFINE(TVAL32_TV_USEC, offsetof(struct timeval, tv_usec));
+#endif
 	return 0;
 }
diff --git a/arch/parisc/kernel/vdso.c b/arch/parisc/kernel/vdso.c
new file mode 100644
index 0000000..d419f52
--- /dev/null
+++ b/arch/parisc/kernel/vdso.c
@@ -0,0 +1,617 @@
+/*
+ *  Copyright (c) 2006 Randolph Chung <tausq@debian.org>
+ *
+ *  Based on ppc64 version by Benjamin Herrenschmidt
+ *  <benh@kernel.crashing.org>
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU General Public License
+ *  as published by the Free Software Foundation; either version
+ *  2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/smp.h>
+#include <linux/smp_lock.h>
+#include <linux/stddef.h>
+#include <linux/unistd.h>
+#include <linux/slab.h>
+#include <linux/user.h>
+#include <linux/elf.h>
+#include <linux/security.h>
+#include <linux/bootmem.h>
+
+#include <asm/pgtable.h>
+#include <asm/system.h>
+#include <asm/processor.h>
+#include <asm/sections.h>
+#include <asm/mmu.h>
+#include <asm/mmu_context.h>
+#include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
+
+#undef DEBUG
+
+#ifdef DEBUG
+#define DBG(fmt...) printk(fmt)
+#else
+#define DBG(fmt...)
+#endif
+
+/* Max supported size for symbol names */
+#define MAX_SYMNAME	64
+
+extern char vdso32_start, vdso32_end;
+static void *vdso32_kbase = &vdso32_start;
+unsigned int vdso32_pages;
+unsigned long vdso32_sigtramp;
+unsigned long vdso32_rt_sigtramp;
+
+#ifdef CONFIG_64BIT_BROKEN
+extern char vdso64_start, vdso64_end;
+static void *vdso64_kbase = &vdso64_start;
+unsigned int vdso64_pages;
+unsigned long vdso64_rt_sigtramp;
+#endif /* CONFIG_64BIT_BROKEN */
+
+static union {
+	struct vdso_data	data;
+	u8			page[PAGE_SIZE];
+} vdso_data_store __attribute__((__section__(".data.page_aligned")));
+struct vdso_data *vdso_data = &vdso_data_store.data;
+
+/*
+ * Some infos carried around for each of them during parsing at
+ * boot time.
+ */
+struct lib32_elfinfo
+{
+	Elf32_Ehdr	*hdr;		/* ptr to ELF */
+	Elf32_Sym	*dynsym;	/* ptr to .dynsym section */
+	unsigned long	dynsymsize;	/* size of .dynsym section */
+	char		*dynstr;	/* ptr to .dynstr section */
+	unsigned long	text;		/* offset of .text section in .so */
+};
+
+struct lib64_elfinfo
+{
+	Elf64_Ehdr	*hdr;
+	Elf64_Sym	*dynsym;
+	unsigned long	dynsymsize;
+	char		*dynstr;
+	unsigned long	text;
+};
+
+
+#ifdef __DEBUG
+static void dump_one_vdso_page(struct page *pg, struct page *upg)
+{
+	printk("kpg: %p (c:%d,f:%08lx)", __va(page_to_pfn(pg) << PAGE_SHIFT),
+	       page_count(pg),
+	       pg->flags);
+	if (upg/* && pg != upg*/) {
+		printk(" upg: %p (c:%d,f:%08lx)", __va(page_to_pfn(upg)
+						       << PAGE_SHIFT),
+		       page_count(upg),
+		       upg->flags);
+	}
+	printk("\n");
+}
+
+static void dump_vdso_pages(struct vm_area_struct * vma)
+{
+	int i;
+
+	if (!vma || test_thread_flag(TIF_32BIT)) {
+		printk("vDSO32 @ %016lx:\n", (unsigned long)vdso32_kbase);
+		for (i=0; i<vdso32_pages; i++) {
+			struct page *pg = virt_to_page(vdso32_kbase +
+						       i*PAGE_SIZE);
+			struct page *upg = (vma && vma->vm_mm) ?
+				follow_page(vma, vma->vm_start + i*PAGE_SIZE, 0)
+				: NULL;
+			dump_one_vdso_page(pg, upg);
+		}
+	}
+	if (!vma || !test_thread_flag(TIF_32BIT)) {
+		printk("vDSO64 @ %016lx:\n", (unsigned long)vdso64_kbase);
+		for (i=0; i<vdso64_pages; i++) {
+			struct page *pg = virt_to_page(vdso64_kbase +
+						       i*PAGE_SIZE);
+			struct page *upg = (vma && vma->vm_mm) ?
+				follow_page(vma, vma->vm_start + i*PAGE_SIZE, 0)
+				: NULL;
+			dump_one_vdso_page(pg, upg);
+		}
+	}
+}
+#endif /* DEBUG */
+
+/*
+ * Keep a dummy vma_close for now, it will prevent VMA merging.
+ */
+static void vdso_vma_close(struct vm_area_struct * vma)
+{
+}
+
+/*
+ * Our nopage() function, maps in the actual vDSO kernel pages, they will
+ * be mapped read-only by do_no_page(), and eventually COW'ed, either
+ * right away for an initial write access, or by do_wp_page().
+ */
+static struct page * vdso_vma_nopage(struct vm_area_struct * vma,
+				     unsigned long address, int *type)
+{
+	unsigned long offset = address - vma->vm_start;
+	struct page *pg;
+#ifdef CONFIG_64BIT_BROKEN
+	// TODO: review
+	void *vbase = (vma->vm_mm->task_size > DEFAULT_TASK_SIZE32) ?
+		vdso64_kbase : vdso32_kbase;
+#else
+	void *vbase = vdso32_kbase;
+#endif
+
+	DBG("vdso_vma_nopage(current: %s, address: %016lx, off: %lx)\n",
+	    current->comm, address, offset);
+
+	if (address < vma->vm_start || address > vma->vm_end)
+		return NOPAGE_SIGBUS;
+
+	/*
+	 * Last page is systemcfg.
+	 */
+	if ((vma->vm_end - address) <= PAGE_SIZE)
+		pg = virt_to_page(vdso_data);
+	else
+		pg = virt_to_page(vbase + offset);
+
+	get_page(pg);
+	DBG(" ->page count: %d\n", page_count(pg));
+
+	return pg;
+}
+
+static struct vm_operations_struct vdso_vmops = {
+	.close	= vdso_vma_close,
+	.nopage	= vdso_vma_nopage,
+};
+
+/*
+ * This is called from binfmt_elf, we create the special vma for the
+ * vDSO and insert it into the mm struct tree
+ */
+int arch_setup_additional_pages(struct linux_binprm *bprm,
+				int executable_stack)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	unsigned long vdso_pages;
+	unsigned long vdso_base;
+	int rc;
+
+#ifdef CONFIG_64BIT_BROKEN
+	if (test_thread_flag(TIF_32BIT)) {
+		vdso_pages = vdso32_pages;
+		vdso_base = VDSO32_MBASE;
+	} else {
+		vdso_pages = vdso64_pages;
+		vdso_base = VDSO64_MBASE;
+	}
+#else
+	vdso_pages = vdso32_pages;
+	vdso_base = VDSO32_MBASE;
+#endif
+
+	current->mm->context.vdso_base = 0;
+
+	/* vDSO has a problem and was disabled, just don't "enable" it for the
+	 * process
+	 */
+	if (vdso_pages == 0)
+		return 0;
+	/* Add a page to the vdso size for the data page */
+	vdso_pages ++;
+
+	/*
+	 * pick a base address for the vDSO in process space. We try to put it
+	 * at vdso_base which is the "natural" base for it, but we might fail
+	 * and end up putting it elsewhere.
+	 */
+	down_write(&mm->mmap_sem);
+	vdso_base = get_unmapped_area(NULL, vdso_base,
+				      vdso_pages << PAGE_SHIFT, 0, 0);
+	if (IS_ERR_VALUE(vdso_base)) {
+		rc = vdso_base;
+		goto fail_mmapsem;
+	}
+
+
+	/* Allocate a VMA structure and fill it up */
+	vma = kmem_cache_zalloc(vm_area_cachep, SLAB_KERNEL);
+	if (vma == NULL) {
+		rc = -ENOMEM;
+		goto fail_mmapsem;
+	}
+	vma->vm_mm = mm;
+	vma->vm_start = vdso_base;
+	vma->vm_end = vma->vm_start + (vdso_pages << PAGE_SHIFT);
+
+	/*
+	 * our vma flags don't have VM_WRITE so by default, the process isn't
+	 * allowed to write those pages.
+	 * gdb can break that with ptrace interface, and thus trigger COW on
+	 * those pages but it's then your responsibility to never do that on
+	 * the "data" page of the vDSO or you'll stop getting kernel updates
+	 * and your nice userland gettimeofday will be totally dead.
+	 * It's fine to use that for setting breakpoints in the vDSO code
+	 * pages though
+	 */
+	vma->vm_flags = VM_READ|VM_EXEC|VM_MAYREAD|VM_MAYWRITE|VM_MAYEXEC;
+	vma->vm_flags |= mm->def_flags;
+	vma->vm_page_prot = protection_map[vma->vm_flags & 0x7];
+	vma->vm_ops = &vdso_vmops;
+
+	/* Insert new VMA */
+	rc = insert_vm_struct(mm, vma);
+	if (rc)
+		goto fail_vma;
+
+	/* Put vDSO base into mm struct and account for memory usage */
+	current->mm->context.vdso_base = vdso_base;
+	mm->total_vm += (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+	up_write(&mm->mmap_sem);
+	return 0;
+
+ fail_vma:
+	kmem_cache_free(vm_area_cachep, vma);
+ fail_mmapsem:
+	up_write(&mm->mmap_sem);
+	return rc;
+}
+
+const char *arch_vma_name(struct vm_area_struct *vma)
+{
+	if (vma->vm_mm && vma->vm_start == vma->vm_mm->context.vdso_base)
+		return "[vdso]";
+	return NULL;
+}
+
+
+
+static void * __init find_section32(Elf32_Ehdr *ehdr, const char *secname,
+				  unsigned long *size)
+{
+	Elf32_Shdr *sechdrs;
+	unsigned int i;
+	char *secnames;
+
+	/* Grab section headers and strings so we can tell who is who */
+	sechdrs = (void *)ehdr + ehdr->e_shoff;
+	secnames = (void *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+	/* Find the section they want */
+	for (i = 1; i < ehdr->e_shnum; i++) {
+		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0) {
+			if (size)
+				*size = sechdrs[i].sh_size;
+			return (void *)ehdr + sechdrs[i].sh_offset;
+		}
+	}
+	*size = 0;
+	return NULL;
+}
+
+static Elf32_Sym * __init find_symbol32(struct lib32_elfinfo *lib,
+					const char *symname)
+{
+	unsigned int i;
+	char name[MAX_SYMNAME], *c;
+
+	for (i = 0; i < (lib->dynsymsize / sizeof(Elf32_Sym)); i++) {
+		if (lib->dynsym[i].st_name == 0)
+			continue;
+		strlcpy(name, lib->dynstr + lib->dynsym[i].st_name,
+			MAX_SYMNAME);
+		c = strchr(name, '@');
+		if (c)
+			*c = 0;
+		if (strcmp(symname, name) == 0)
+			return &lib->dynsym[i];
+	}
+	return NULL;
+}
+
+/* Note that we assume the section is .text and the symbol is relative to
+ * the library base
+ */
+static unsigned long __init find_function32(struct lib32_elfinfo *lib,
+					    const char *symname)
+{
+	Elf32_Sym *sym = find_symbol32(lib, symname);
+
+	if (sym == NULL) {
+		printk(KERN_WARNING "vDSO32: function %s not found !\n",
+		       symname);
+		return 0;
+	}
+	return sym->st_value - VDSO32_LBASE;
+}
+
+#ifdef CONFIG_64BIT_BROKEN
+
+static void * __init find_section64(Elf64_Ehdr *ehdr, const char *secname,
+				  unsigned long *size)
+{
+	Elf64_Shdr *sechdrs;
+	unsigned int i;
+	char *secnames;
+
+	/* Grab section headers and strings so we can tell who is who */
+	sechdrs = (void *)ehdr + ehdr->e_shoff;
+	secnames = (void *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+	/* Find the section they want */
+	for (i = 1; i < ehdr->e_shnum; i++) {
+		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0) {
+			if (size)
+				*size = sechdrs[i].sh_size;
+			return (void *)ehdr + sechdrs[i].sh_offset;
+		}
+	}
+	if (size)
+		*size = 0;
+	return NULL;
+}
+
+static Elf64_Sym * __init find_symbol64(struct lib64_elfinfo *lib,
+					const char *symname)
+{
+	unsigned int i;
+	char name[MAX_SYMNAME], *c;
+
+	for (i = 0; i < (lib->dynsymsize / sizeof(Elf64_Sym)); i++) {
+		if (lib->dynsym[i].st_name == 0)
+			continue;
+		strlcpy(name, lib->dynstr + lib->dynsym[i].st_name,
+			MAX_SYMNAME);
+		c = strchr(name, '@');
+		if (c)
+			*c = 0;
+		if (strcmp(symname, name) == 0)
+			return &lib->dynsym[i];
+	}
+	return NULL;
+}
+
+/* Note that we assume the section is .text and the symbol is relative to
+ * the library base
+ */
+static unsigned long __init find_function64(struct lib64_elfinfo *lib,
+					    const char *symname)
+{
+	Elf64_Sym *sym = find_symbol64(lib, symname);
+
+	if (sym == NULL) {
+		printk(KERN_WARNING "vDSO64: function %s not found !\n",
+		       symname);
+		return 0;
+	}
+#ifdef VDS64_HAS_DESCRIPTORS
+	return *((u64 *)(vdso64_kbase + sym->st_value - VDSO64_LBASE)) -
+		VDSO64_LBASE;
+#else
+	return sym->st_value - VDSO64_LBASE;
+#endif
+}
+
+#endif /* CONFIG_64BIT_BROKEN */
+
+
+static __init int vdso_do_find_sections(struct lib32_elfinfo *v32,
+					struct lib64_elfinfo *v64)
+{
+	void *sect;
+
+	/*
+	 * Locate symbol tables & text section
+	 */
+
+	v32->dynsym = find_section32(v32->hdr, ".dynsym", &v32->dynsymsize);
+	v32->dynstr = find_section32(v32->hdr, ".dynstr", NULL);
+	if (v32->dynsym == NULL || v32->dynstr == NULL) {
+		printk(KERN_ERR "vDSO32: required symbol section not found\n");
+		return -1;
+	}
+	sect = find_section32(v32->hdr, ".text", NULL);
+	if (sect == NULL) {
+		printk(KERN_ERR "vDSO32: the .text section was not found\n");
+		return -1;
+	}
+	v32->text = sect - vdso32_kbase;
+
+#ifdef CONFIG_64BIT_BROKEN
+	v64->dynsym = find_section64(v64->hdr, ".dynsym", &v64->dynsymsize);
+	v64->dynstr = find_section64(v64->hdr, ".dynstr", NULL);
+	if (v64->dynsym == NULL || v64->dynstr == NULL) {
+		printk(KERN_ERR "vDSO64: required symbol section not found\n");
+		return -1;
+	}
+	sect = find_section64(v64->hdr, ".text", NULL);
+	if (sect == NULL) {
+		printk(KERN_ERR "vDSO64: the .text section was not found\n");
+		return -1;
+	}
+	v64->text = sect - vdso64_kbase;
+#endif /* CONFIG_64BIT_BROKEN */
+
+	return 0;
+}
+
+static __init void vdso_setup_trampolines(struct lib32_elfinfo *v32,
+					  struct lib64_elfinfo *v64)
+{
+	/*
+	 * Find signal trampolines
+	 */
+
+#ifdef CONFIG_64BIT_BROKEN
+	vdso64_rt_sigtramp = find_function64(v64, "__kernel_sigtramp_rt64");
+#endif
+	vdso32_sigtramp	   = find_function32(v32, "__kernel_sigtramp32");
+	vdso32_rt_sigtramp = find_function32(v32, "__kernel_sigtramp_rt32");
+}
+
+static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
+				       struct lib64_elfinfo *v64)
+{
+	Elf32_Sym *sym32;
+#ifdef CONFIG_64BIT_BROKEN
+	Elf64_Sym *sym64;
+
+       	sym64 = find_symbol64(v64, "__kernel_datapage_offset");
+	if (sym64 == NULL) {
+		printk(KERN_ERR "vDSO64: Can't find symbol "
+		       "__kernel_datapage_offset !\n");
+		return -1;
+	}
+	*((int *)(vdso64_kbase + sym64->st_value - VDSO64_LBASE)) =
+		(vdso64_pages << PAGE_SHIFT) -
+		(sym64->st_value - VDSO64_LBASE);
+#endif /* CONFIG_64BIT_BROKEN */
+
+	sym32 = find_symbol32(v32, "__kernel_datapage_offset");
+	if (sym32 == NULL) {
+		printk(KERN_ERR "vDSO32: Can't find symbol "
+		       "__kernel_datapage_offset !\n");
+		return -1;
+	}
+	*((int *)(vdso32_kbase + (sym32->st_value - VDSO32_LBASE))) =
+		(vdso32_pages << PAGE_SHIFT) -
+		(sym32->st_value - VDSO32_LBASE);
+
+	return 0;
+}
+
+static __init int vdso_setup(void)
+{
+	struct lib32_elfinfo	v32;
+	struct lib64_elfinfo	v64;
+
+	v32.hdr = vdso32_kbase;
+#ifdef CONFIG_64BIT_BROKEN
+	v64.hdr = vdso64_kbase;
+#endif
+	if (vdso_do_find_sections(&v32, &v64))
+		return -1;
+
+	if (vdso_fixup_datapage(&v32, &v64))
+		return -1;
+
+	vdso_setup_trampolines(&v32, &v64);
+
+	return 0;
+}
+
+/*
+ * Called from setup_arch to initialize the bitmap of available
+ * syscalls in the systemcfg page
+ */
+static void __init vdso_setup_syscall_map(void)
+{
+	unsigned int i;
+	extern unsigned long *sys_call_table;
+	extern unsigned long sys_ni_syscall;
+
+
+	for (i = 0; i < __NR_Linux_syscalls; i++) {
+#ifdef CONFIG_64BIT_BROKEN
+		if (sys_call_table[i*2] != sys_ni_syscall)
+			vdso_data->syscall_map_64[i >> 5] |=
+				0x80000000UL >> (i & 0x1f);
+		if (sys_call_table[i*2+1] != sys_ni_syscall)
+			vdso_data->syscall_map_32[i >> 5] |=
+				0x80000000UL >> (i & 0x1f);
+#else /* CONFIG_64BIT_BROKEN */
+		if (sys_call_table[i] != sys_ni_syscall)
+			vdso_data->syscall_map_32[i >> 5] |=
+				0x80000000UL >> (i & 0x1f);
+#endif /* CONFIG_64BIT_BROKEN */
+	}
+}
+
+
+void __init vdso_init(void)
+{
+	int i;
+
+#ifdef CONFIG_64BIT_BROKEN
+	/*
+	 * Calculate the size of the 64 bits vDSO
+	 */
+	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
+	DBG("vdso64_kbase: %p, 0x%x pages\n", vdso64_kbase, vdso64_pages);
+#endif /* CONFIG_64BIT_BROKEN */
+
+
+	/*
+	 * Calculate the size of the 32 bits vDSO
+	 */
+	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
+	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
+
+
+	/*
+	 * Setup the syscall map in the vDOS
+	 */
+	vdso_setup_syscall_map();
+	/*
+	 * Initialize the vDSO images in memory, that is do necessary
+	 * fixups of vDSO symbols, locate trampolines, etc...
+	 */
+	if (vdso_setup()) {
+		printk(KERN_ERR "vDSO setup failure, not enabled !\n");
+		vdso32_pages = 0;
+#ifdef CONFIG_64BIT_BROKEN
+		vdso64_pages = 0;
+#endif
+		return;
+	}
+
+	/* Make sure pages are in the correct state */
+	for (i = 0; i < vdso32_pages; i++) {
+		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
+		ClearPageReserved(pg);
+		get_page(pg);
+
+	}
+#ifdef CONFIG_64BIT_BROKEN
+	for (i = 0; i < vdso64_pages; i++) {
+		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
+		ClearPageReserved(pg);
+		get_page(pg);
+	}
+#endif /* CONFIG_64BIT_BROKEN */
+
+	get_page(virt_to_page(vdso_data));
+}
+
+int in_gate_area_no_task(unsigned long addr)
+{
+	return 0;
+}
+
+int in_gate_area(struct task_struct *task, unsigned long addr)
+{
+	return 0;
+}
+
+struct vm_area_struct *get_gate_vma(struct task_struct *tsk)
+{
+	return NULL;
+}
+
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
new file mode 100644
index 0000000..89ab197
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -0,0 +1,41 @@
+
+# List of files in the vdso, has to be asm only for now
+
+obj-vdso32 = gettimeofday.o note.o datapage.o sigtramp.o
+
+# Build rules
+
+#ifneq ($(CONFIG_64BIT),y)
+#CROSS32CC := $(CC)
+#endif
+
+targets := $(obj-vdso32) vdso32.so
+obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
+
+
+EXTRA_CFLAGS := -shared -s -fno-common -fno-builtin
+EXTRA_CFLAGS += -nostdlib -Wl,-soname=linux-vdso32.so.1 \
+		$(call ld-option, -Wl$(comma)--hash-style=sysv)
+EXTRA_AFLAGS := -D__VDSO32__ -s
+
+obj-y += vdso32_wrapper.o
+extra-y += vdso32.lds
+CPPFLAGS_vdso32.lds += -P -C -Uhppa
+
+# Force dependency (incbin is bad)
+$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so
+
+# link rule for the .so file, .lds has to be first
+$(obj)/vdso32.so: $(src)/vdso32.lds $(obj-vdso32)
+	$(call if_changed,vdso32ld)
+
+# assembly rules for the .S files
+$(obj-vdso32): %.o: %.S
+	$(call if_changed_dep,vdso32as)
+
+# actual build commands
+quiet_cmd_vdso32ld = VDSO32L $@
+      cmd_vdso32ld = $(CROSS32CC) $(c_flags) -Wl,-T $^ -o $@
+quiet_cmd_vdso32as = VDSO32A $@
+      cmd_vdso32as = $(CROSS32CC) $(a_flags) -c -o $@ $<
+
diff --git a/arch/parisc/kernel/vdso32/datapage.S b/arch/parisc/kernel/vdso32/datapage.S
new file mode 100644
index 0000000..e9fdc59
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/datapage.S
@@ -0,0 +1,35 @@
+/*
+ * Access to the shared data page by the vDSO & syscall map
+ *
+ * Copyright (C) 2006 Randolph Chung <tausq@debian.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
+#include <asm/processor.h>
+#include <asm/asm-offsets.h>
+#include <asm/unistd.h>
+#include <asm/vdso.h>
+
+	.text
+	.globl __get_datapage
+	.type __get_datapage, @function
+__get_datapage:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+	/* We don't want that exposed or overridable as we want other objects
+	 * to be able to bl directly to here
+	 */
+	bl	.+12, %r1
+	depi	0, 31, 2, %r1
+	.global	__kernel_datapage_offset;
+__kernel_datapage_offset:
+	.long	0
+1:
+	bv	%r0(%r2)
+	ldw	0(%r1), %r28
+	.exit
+	.procend
diff --git a/arch/parisc/kernel/vdso32/gettimeofday.S b/arch/parisc/kernel/vdso32/gettimeofday.S
new file mode 100644
index 0000000..2cd753c
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/gettimeofday.S
@@ -0,0 +1,64 @@
+/*
+ * Userland implementation of gettimeofday() for 32 bits processes
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <asm/processor.h>
+#include <asm/vdso.h>
+#include <asm/asm-offsets.h>
+#include <asm/unistd.h>
+
+	.text
+/*
+ * Exact prototype of gettimeofday
+ *
+ * int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz);
+ *
+ */
+	.globl __kernel_gettimeofday
+	.type __kernel_gettimeofday, @function
+__kernel_gettimeofday:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+	copy	%r2, %r1
+	bl	__get_datapage, %r2
+	nop
+	copy	%r1, %r2
+	ldw	VDSO_WTOM_CLOCK_SEC(%r28), %r20
+	ldw	VDSO_WTOM_CLOCK_NSEC(%r28), %r21
+	stw	%r20, TVAL32_TV_SEC(%r26)
+	cmpib,=	0, %r25, 1f		 /* Check if tz is NULL */
+	stw	%r21, TVAL32_TV_USEC(%r26) /* delay slot */
+
+	ldw	VDSO_TZ_MINUTEWEST(%r28), %r20
+	ldw	VDSO_TZ_DSTTIME(%r28), %r22
+	stw	%r20, TZONE_TZ_MINWEST(%r25)
+	stw	%r21, TZONE_TZ_DSTTIME(%r25)
+
+1:
+  	bv,n %r0(%r2)
+	.exit
+	.procend
+
+
+/*
+ * Exact prototype of clock_gettime()
+ *
+ * int __kernel_clock_gettime(clockid_t clock_id, struct timespec *tp);
+ *
+ */
+V_FUNCTION_BEGIN(__kernel_clock_gettime)
+	.globl __kernel_clock_gettime
+	.type __kernel_clock_gettime, @function
+__kernel_clock_gettime:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+	bv,n %r0(%r2)
+	.exit
+	.procend
+
diff --git a/arch/parisc/kernel/vdso32/note.S b/arch/parisc/kernel/vdso32/note.S
new file mode 100644
index 0000000..d4b5be4
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/note.S
@@ -0,0 +1,25 @@
+/*
+ * This supplies .note.* sections to go into the PT_NOTE inside the vDSO text.
+ * Here we can supply some information useful to userland.
+ */
+
+#include <linux/uts.h>
+#include <linux/version.h>
+
+#define ASM_ELF_NOTE_BEGIN(name, flags, vendor, type)			      \
+	.section name, flags;						      \
+	.balign 4;							      \
+	.long 1f - 0f;		/* name length */			      \
+	.long 3f - 2f;		/* data length */			      \
+	.long type;		/* note type */				      \
+0:	.asciz vendor;		/* vendor name */			      \
+1:	.balign 4;							      \
+2:
+
+#define ASM_ELF_NOTE_END						      \
+3:	.balign 4;		/* pad out section */			      \
+	.previous
+
+	ASM_ELF_NOTE_BEGIN(".note.kernel-version", "a", UTS_SYSNAME, 0)
+	.long LINUX_VERSION_CODE
+	ASM_ELF_NOTE_END
diff --git a/arch/parisc/kernel/vdso32/sigtramp.S b/arch/parisc/kernel/vdso32/sigtramp.S
new file mode 100644
index 0000000..005cfe2
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/sigtramp.S
@@ -0,0 +1,167 @@
+/*
+ * Signal trampolines for 32 bits processes.
+ *
+ * Copyright (C) 2006 Randolph Chung <tausq@debian.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <asm/processor.h>
+#include <asm/unistd.h>
+#include <asm/vdso.h>
+
+	.text
+
+/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
+   the return address to get an address in the middle of the presumed
+   call instruction.  Since we don't have a call here, we artifically
+   extend the range covered by the unwind info by adding a nop before
+   the real start.  */
+	nop
+	.globl __kernel_sigtramp_rt32
+	.type __kernel_sigtramp_rt32, @function
+__kernel_sigtramp_rt32:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+.Lsigrt_start = . - 4
+	ble  0x100(%sr2, %r0)
+	ldi  __NR_rt_sigreturn, %r20
+.Lsigrt_end:
+	.exit
+	.procend
+
+	.section .eh_frame,"a",@progbits
+
+/* Register r1 can be found at offset 4 of a pt_regs structure.
+   A pointer to the pt_regs is stored in memory at the old sp plus PTREGS.  */
+#define cfa_save \
+  .byte 0x0f;			/* DW_CFA_def_cfa_expression */		\
+  .uleb128 9f - 1f;		/*   length */				\
+1:									\
+  .byte 0x71; .sleb128 PTREGS;	/*     DW_OP_breg1 */			\
+  .byte 0x06;			/*     DW_OP_deref */			\
+  .byte 0x23; .uleb128 RSIZE;	/*     DW_OP_plus_uconst */		\
+  .byte 0x06;			/*     DW_OP_deref */			\
+9:
+
+/* Register REGNO can be found at offset OFS of a pt_regs structure.
+   A pointer to the pt_regs is stored in memory at the old sp plus PTREGS.  */
+#define rsave(regno, ofs) \
+  .byte 0x10;			/* DW_CFA_expression */			\
+  .uleb128 regno;		/*   regno */				\
+  .uleb128 9f - 1f;		/*   length */				\
+1:									\
+  .byte 0x71; .sleb128 PTREGS;	/*     DW_OP_breg1 */			\
+  .byte 0x06;			/*     DW_OP_deref */			\
+  .ifne ofs;								\
+    .byte 0x23; .uleb128 ofs;	/*     DW_OP_plus_uconst */		\
+  .endif;								\
+9:
+
+/* This is where the pt_regs pointer can be found on the stack.  */
+#define PTREGS 64+28
+
+/* Size of regs.  */
+#define RSIZE 4
+
+/* Describe where general purpose regs are saved.  */
+#define EH_FRAME_GEN \
+  cfa_save;								\
+  rsave ( 0,  0*RSIZE);							\
+  rsave ( 2,  2*RSIZE);							\
+  rsave ( 3,  3*RSIZE);							\
+  rsave ( 4,  4*RSIZE);							\
+  rsave ( 5,  5*RSIZE);							\
+  rsave ( 6,  6*RSIZE);							\
+  rsave ( 7,  7*RSIZE);							\
+  rsave ( 8,  8*RSIZE);							\
+  rsave ( 9,  9*RSIZE);							\
+  rsave (10, 10*RSIZE);							\
+  rsave (11, 11*RSIZE);							\
+  rsave (12, 12*RSIZE);							\
+  rsave (13, 13*RSIZE);							\
+  rsave (14, 14*RSIZE);							\
+  rsave (15, 15*RSIZE);							\
+  rsave (16, 16*RSIZE);							\
+  rsave (17, 17*RSIZE);							\
+  rsave (18, 18*RSIZE);							\
+  rsave (19, 19*RSIZE);							\
+  rsave (20, 20*RSIZE);							\
+  rsave (21, 21*RSIZE);							\
+  rsave (22, 22*RSIZE);							\
+  rsave (23, 23*RSIZE);							\
+  rsave (24, 24*RSIZE);							\
+  rsave (25, 25*RSIZE);							\
+  rsave (26, 26*RSIZE);							\
+  rsave (27, 27*RSIZE);							\
+  rsave (28, 28*RSIZE);							\
+  rsave (29, 29*RSIZE);							\
+  rsave (30, 30*RSIZE);							\
+  rsave (31, 31*RSIZE);							\
+  rsave (67, 32*RSIZE);		/* ap, used as temp for nip */		\
+  rsave (65, 36*RSIZE);		/* lr */				\
+  rsave (70, 38*RSIZE)		/* cr */
+
+/* Describe where the FP regs are saved.  */
+#define EH_FRAME_FP \
+  rsave (32, 48*RSIZE +  0*8);						\
+  rsave (33, 48*RSIZE +  1*8);						\
+  rsave (34, 48*RSIZE +  2*8);						\
+  rsave (35, 48*RSIZE +  3*8);						\
+  rsave (36, 48*RSIZE +  4*8);						\
+  rsave (37, 48*RSIZE +  5*8);						\
+  rsave (38, 48*RSIZE +  6*8);						\
+  rsave (39, 48*RSIZE +  7*8);						\
+  rsave (40, 48*RSIZE +  8*8);						\
+  rsave (41, 48*RSIZE +  9*8);						\
+  rsave (42, 48*RSIZE + 10*8);						\
+  rsave (43, 48*RSIZE + 11*8);						\
+  rsave (44, 48*RSIZE + 12*8);						\
+  rsave (45, 48*RSIZE + 13*8);						\
+  rsave (46, 48*RSIZE + 14*8);						\
+  rsave (47, 48*RSIZE + 15*8);						\
+  rsave (48, 48*RSIZE + 16*8);						\
+  rsave (49, 48*RSIZE + 17*8);						\
+  rsave (50, 48*RSIZE + 18*8);						\
+  rsave (51, 48*RSIZE + 19*8);						\
+  rsave (52, 48*RSIZE + 20*8);						\
+  rsave (53, 48*RSIZE + 21*8);						\
+  rsave (54, 48*RSIZE + 22*8);						\
+  rsave (55, 48*RSIZE + 23*8);						\
+  rsave (56, 48*RSIZE + 24*8);						\
+  rsave (57, 48*RSIZE + 25*8);						\
+  rsave (58, 48*RSIZE + 26*8);						\
+  rsave (59, 48*RSIZE + 27*8);						\
+  rsave (60, 48*RSIZE + 28*8);						\
+  rsave (61, 48*RSIZE + 29*8);						\
+  rsave (62, 48*RSIZE + 30*8);						\
+  rsave (63, 48*RSIZE + 31*8)
+
+.Lcie:
+	.long .Lcie_end - .Lcie_start
+.Lcie_start:
+	.long 0			/* CIE ID */
+	.byte 1			/* Version number */
+	.string "zRS"		/* NUL-terminated augmentation string */
+	.uleb128 4		/* Code alignment factor */
+	.sleb128 -4		/* Data alignment factor */
+	.byte 2			/* Return address register column, ap */
+	.uleb128 1		/* Augmentation value length */
+	.byte 0x1b		/* DW_EH_PE_pcrel | DW_EH_PE_sdata4. */
+	.byte 0x0c,30,0		/* DW_CFA_def_cfa: r30 ofs 0 */
+	.balign 4
+.Lcie_end:
+
+	.long .Lfde0_end - .Lfde0_start
+.Lfde0_start:
+	.long .Lfde0_start - .Lcie	/* CIE pointer. */
+	.long .Lsigrt_start - .		/* PC start, length */
+	.long .Lsigrt_end - .Lsigrt_start
+	.uleb128 0			/* Augmentation */
+	EH_FRAME_GEN
+	EH_FRAME_FP
+	.balign 4
+.Lfde0_end:
diff --git a/arch/parisc/kernel/vdso32/vdso32.lds.S b/arch/parisc/kernel/vdso32/vdso32.lds.S
new file mode 100644
index 0000000..f3e6966
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/vdso32.lds.S
@@ -0,0 +1,111 @@
+
+/*
+ * This is the infamous ld script for the 32 bits vdso
+ * library
+ */
+#include <asm/vdso.h>
+
+/* Default link addresses for the vDSOs */
+OUTPUT_FORMAT("elf32-hppa-linux")
+OUTPUT_ARCH(hppa)
+ENTRY(_start)
+
+SECTIONS
+{
+  . = VDSO32_LBASE + SIZEOF_HEADERS;
+  .hash           : { *(.hash) }			:text
+  .gnu.hash       : { *(.gnu.hash) }
+  .dynsym         : { *(.dynsym) }
+  .dynstr         : { *(.dynstr) }
+  .gnu.version    : { *(.gnu.version) }
+  .gnu.version_d  : { *(.gnu.version_d) }
+  .gnu.version_r  : { *(.gnu.version_r) }
+
+  .note		  : { *(.note.*) } 			:text	:note
+
+  . = ALIGN (16);
+  .text :
+  {
+    *(.text .stub .text.* .gnu.linkonce.t.*)
+  }
+  PROVIDE (__etext = .);
+  PROVIDE (_etext = .);
+  PROVIDE (etext = .);
+
+  /* Other stuff is appended to the text segment: */
+  .rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
+  .rodata1		: { *(.rodata1) }
+
+  .eh_frame_hdr		: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
+  .eh_frame		: { KEEP (*(.eh_frame)) }	:text
+  .gcc_except_table	: { *(.gcc_except_table) }
+  .fixup		: { *(.fixup) }
+
+  .dynamic		: { *(.dynamic) }		:text	:dynamic
+  .plt : { *(.plt) }
+  .got : { *(.got) }
+
+  _end = .;
+  __end = .;
+  PROVIDE (end = .);
+
+
+  /* Stabs debugging sections are here too
+   */
+  .stab 0 : { *(.stab) }
+  .stabstr 0 : { *(.stabstr) }
+  .stab.excl 0 : { *(.stab.excl) }
+  .stab.exclstr 0 : { *(.stab.exclstr) }
+  .stab.index 0 : { *(.stab.index) }
+  .stab.indexstr 0 : { *(.stab.indexstr) }
+  .comment 0 : { *(.comment) }
+  .debug 0 : { *(.debug) }
+  .line 0 : { *(.line) }
+
+  .debug_srcinfo 0 : { *(.debug_srcinfo) }
+  .debug_sfnames 0 : { *(.debug_sfnames) }
+
+  .debug_aranges 0 : { *(.debug_aranges) }
+  .debug_pubnames 0 : { *(.debug_pubnames) }
+
+  .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) }
+  .debug_abbrev 0 : { *(.debug_abbrev) }
+  .debug_line 0 : { *(.debug_line) }
+  .debug_frame 0 : { *(.debug_frame) }
+  .debug_str 0 : { *(.debug_str) }
+  .debug_loc 0 : { *(.debug_loc) }
+  .debug_macinfo 0 : { *(.debug_macinfo) }
+
+  .debug_weaknames 0 : { *(.debug_weaknames) }
+  .debug_funcnames 0 : { *(.debug_funcnames) }
+  .debug_typenames 0 : { *(.debug_typenames) }
+  .debug_varnames 0 : { *(.debug_varnames) }
+
+  /DISCARD/ : { *(.note.GNU-stack) }
+  /DISCARD/ : { *(.data .data.* .gnu.linkonce.d.* .sdata*) }
+  /DISCARD/ : { *(.bss .sbss .dynbss .dynsbss) }
+}
+
+
+PHDRS
+{
+  text PT_LOAD FILEHDR PHDRS FLAGS(5); /* PF_R|PF_X */
+  note PT_NOTE FLAGS(4); /* PF_R */
+  dynamic PT_DYNAMIC FLAGS(4); /* PF_R */
+  eh_frame_hdr 0x6474e550; /* PT_GNU_EH_FRAME, but ld doesn't match the name */
+}
+
+
+/*
+ * This controls what symbols we export from the DSO.
+ */
+VERSION
+{
+  VDSO_VERSION_STRING {
+    global:
+	__kernel_datapage_offset; /* Has to be there for the kernel to find */
+	__kernel_gettimeofday;
+	__kernel_clock_gettime;
+    local: *;
+  };
+}
diff --git a/arch/parisc/kernel/vdso32/vdso32_wrapper.S b/arch/parisc/kernel/vdso32/vdso32_wrapper.S
new file mode 100644
index 0000000..edd9e91
--- /dev/null
+++ b/arch/parisc/kernel/vdso32/vdso32_wrapper.S
@@ -0,0 +1,13 @@
+#include <linux/init.h>
+#include <asm/page.h>
+
+	.section ".data.page_aligned"
+
+	.globl vdso32_start, vdso32_end
+	.balign PAGE_SIZE
+vdso32_start:
+	.incbin "arch/parisc/kernel/vdso32/vdso32.so"
+	.balign PAGE_SIZE
+vdso32_end:
+
+	.previous
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 0e449f9..06c74de 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -29,6 +29,7 @@ #include <asm/tlb.h>
 #include <asm/pdc_chassis.h>
 #include <asm/mmzone.h>
 #include <asm/sections.h>
+#include <asm/vdso.h>
 
 DEFINE_PER_CPU(struct mmu_gather, mmu_gathers);
 
@@ -541,6 +542,8 @@ #ifdef CONFIG_DEBUG_KERNEL /* double-san
 	       _text, _etext,
 	       ((unsigned long)_etext - (unsigned long)_text) >> 10);
 #endif
+
+	vdso_init();
 }
 
 unsigned long *empty_zero_page __read_mostly;
diff --git a/include/asm-parisc/auxvec.h b/include/asm-parisc/auxvec.h
index 9c3ac4b..d49902d 100644
--- a/include/asm-parisc/auxvec.h
+++ b/include/asm-parisc/auxvec.h
@@ -1,4 +1,9 @@
 #ifndef __ASMPARISC_AUXVEC_H
 #define __ASMPARISC_AUXVEC_H
 
+/* The vDSO location. We have to use the same value as x86 for glibc's
+ * sake :-)
+ */
+#define AT_SYSINFO_EHDR		33
+
 #endif
diff --git a/include/asm-parisc/cacheflush.h b/include/asm-parisc/cacheflush.h
index 2bc41f2..b62563d 100644
--- a/include/asm-parisc/cacheflush.h
+++ b/include/asm-parisc/cacheflush.h
@@ -83,13 +83,13 @@ static inline void flush_cache_range(str
 {
 	int sr3;
 
-	if (!vma->vm_mm->context) {
+	if (!vma->vm_mm->context.space_id) {
 		BUG();
 		return;
 	}
 
 	sr3 = mfsp(3);
-	if (vma->vm_mm->context == sr3) {
+	if (vma->vm_mm->context.space_id == sr3) {
 		flush_user_dcache_range(start,end);
 		flush_user_icache_range(start,end);
 	} else {
@@ -149,7 +149,7 @@ flush_user_cache_page_non_current(struct
 
 	/* make us current */
 	mtctl(__pa(vma->vm_mm->pgd), 25);
-	mtsp(vma->vm_mm->context, 3);
+	mtsp(vma->vm_mm->context.space_id, 3);
 
 	flush_user_dcache_page(vmaddr);
 	if(vma->vm_flags & VM_EXEC)
@@ -164,7 +164,7 @@ flush_user_cache_page_non_current(struct
 static inline void
 __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
-	if (likely(vma->vm_mm->context == mfsp(3))) {
+	if (likely(vma->vm_mm->context.space_id == mfsp(3))) {
 		flush_user_dcache_page(vmaddr);
 		if (vma->vm_flags & VM_EXEC)
 			flush_user_icache_page(vmaddr);
@@ -176,7 +176,7 @@ __flush_cache_page(struct vm_area_struct
 static inline void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn)
 {
-	BUG_ON(!vma->vm_mm->context);
+	BUG_ON(!vma->vm_mm->context.space_id);
 
 	if (likely(translation_exists(vma, vmaddr, pfn)))
 		__flush_cache_page(vma, vmaddr);
diff --git a/include/asm-parisc/elf.h b/include/asm-parisc/elf.h
index adea65f..81e232d 100644
--- a/include/asm-parisc/elf.h
+++ b/include/asm-parisc/elf.h
@@ -297,6 +297,17 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_N
 
 struct task_struct;
 
+#define ARCH_HAS_SETUP_ADDITIONAL_PAGES
+struct linux_binprm;
+extern int arch_setup_additional_pages(struct linux_binprm *bprm,
+				       int executable_stack);
+#define VDSO_AUX_ENT(a,b) NEW_AUX_ENT(a,b);
+
+#define ARCH_DLINFO						\
+do {								\
+	NEW_AUX_ENT(AT_SYSINFO_EHDR, current->mm->context.vdso_base); \
+} while (0)
+
 extern int dump_task_fpu (struct task_struct *, elf_fpregset_t *);
 #define ELF_CORE_COPY_FPREGS(tsk, elf_fpregs) dump_task_fpu(tsk, elf_fpregs)
 
diff --git a/include/asm-parisc/mmu.h b/include/asm-parisc/mmu.h
index 6a310cf..b9175c9 100644
--- a/include/asm-parisc/mmu.h
+++ b/include/asm-parisc/mmu.h
@@ -1,7 +1,9 @@
 #ifndef _PARISC_MMU_H_
 #define _PARISC_MMU_H_
 
-/* On parisc, we store the space id here */
-typedef unsigned long mm_context_t;
+typedef struct {
+	unsigned long space_id;
+	unsigned long vdso_base;
+} mm_context_t;
 
 #endif /* _PARISC_MMU_H_ */
diff --git a/include/asm-parisc/mmu_context.h b/include/asm-parisc/mmu_context.h
index 9c05836..0fa9679 100644
--- a/include/asm-parisc/mmu_context.h
+++ b/include/asm-parisc/mmu_context.h
@@ -21,24 +21,24 @@ init_new_context(struct task_struct *tsk
 {
 	BUG_ON(atomic_read(&mm->mm_users) != 1);
 
-	mm->context = alloc_sid();
+	mm->context.space_id = alloc_sid();
 	return 0;
 }
 
 static inline void
 destroy_context(struct mm_struct *mm)
 {
-	free_sid(mm->context);
-	mm->context = 0;
+	free_sid(mm->context.space_id);
+	mm->context.space_id = 0;
 }
 
 static inline void load_context(mm_context_t context)
 {
-	mtsp(context, 3);
+	mtsp(context.space_id, 3);
 #if SPACEID_SHIFT == 0
-	mtctl(context << 1,8);
+	mtctl(context.space_id << 1,8);
 #else
-	mtctl(context >> (SPACEID_SHIFT - 1),8);
+	mtctl(context.space_id >> (SPACEID_SHIFT - 1),8);
 #endif
 }
 
@@ -65,8 +65,8 @@ static inline void activate_mm(struct mm
 
 	BUG_ON(next == &init_mm); /* Should never happen */
 
-	if (next->context == 0)
-	    next->context = alloc_sid();
+	if (next->context.space_id == 0)
+	    next->context.space_id = alloc_sid();
 
 	switch_mm(prev,next,current);
 }
diff --git a/include/asm-parisc/page.h b/include/asm-parisc/page.h
index dcf9047..091048d 100644
--- a/include/asm-parisc/page.h
+++ b/include/asm-parisc/page.h
@@ -12,9 +12,11 @@ # define PAGE_SHIFT	16
 #else
 # error "unknown default kernel page size"
 #endif
-#define PAGE_SIZE	(1UL << PAGE_SHIFT)
+#define PAGE_SIZE	(1 << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE-1))
 
+/* We do define AT_SYSINFO_EHDR but don't use the gate mechanism */
+#define __HAVE_ARCH_GATE_AREA		1
 
 #ifndef __ASSEMBLY__
 
diff --git a/include/asm-parisc/processor.h b/include/asm-parisc/processor.h
index fd7866d..74ba37b 100644
--- a/include/asm-parisc/processor.h
+++ b/include/asm-parisc/processor.h
@@ -181,7 +181,7 @@ typedef unsigned int elf_caddr_t;
 
 #define start_thread_som(regs, new_pc, new_sp) do {	\
 	unsigned long *sp = (unsigned long *)new_sp;	\
-	__u32 spaceid = (__u32)current->mm->context;	\
+	__u32 spaceid = (__u32)current->mm->context.space_id;	\
 	unsigned long pc = (unsigned long)new_pc;	\
 	/* offset pc for priv. level */			\
 	pc |= 3;					\
@@ -285,7 +285,7 @@ #endif
 
 #define start_thread(regs, new_pc, new_sp) do {		\
 	elf_addr_t *sp = (elf_addr_t *)new_sp;		\
-	__u32 spaceid = (__u32)current->mm->context;	\
+	__u32 spaceid = (__u32)current->mm->context.space_id;	\
 	elf_addr_t pc = (elf_addr_t)new_pc | 3;		\
 	elf_caddr_t *argv = (elf_caddr_t *)bprm->exec + 1;	\
 							\
diff --git a/include/asm-parisc/tlbflush.h b/include/asm-parisc/tlbflush.h
index f662e83..5625b76 100644
--- a/include/asm-parisc/tlbflush.h
+++ b/include/asm-parisc/tlbflush.h
@@ -47,9 +47,9 @@ #ifdef CONFIG_SMP
 	flush_tlb_all();
 #else
 	if (mm) {
-		if (mm->context != 0)
-			free_sid(mm->context);
-		mm->context = alloc_sid();
+		if (mm->context.space_id != 0)
+			free_sid(mm->context.space_id);
+		mm->context.space_id = alloc_sid();
 		if (mm == current->active_mm)
 			load_context(mm->context);
 	}
@@ -66,7 +66,7 @@ static inline void flush_tlb_page(struct
 	/* For one page, it's not worth testing the split_tlb variable */
 
 	mb();
-	mtsp(vma->vm_mm->context,1);
+	mtsp(vma->vm_mm->context.space_id,1);
 	purge_tlb_start();
 	pdtlb(addr);
 	pitlb(addr);
@@ -82,7 +82,7 @@ static inline void flush_tlb_range(struc
 	if (npages >= 512)  /* 2MB of space: arbitrary, should be tuned */
 		flush_tlb_all();
 	else {
-		mtsp(vma->vm_mm->context,1);
+		mtsp(vma->vm_mm->context.space_id,1);
 		purge_tlb_start();
 		if (split_tlb) {
 			while (npages--) {
diff --git a/include/asm-parisc/vdso.h b/include/asm-parisc/vdso.h
new file mode 100644
index 0000000..9fe98c9
--- /dev/null
+++ b/include/asm-parisc/vdso.h
@@ -0,0 +1,44 @@
+#ifndef __PARISC_VDSO_H__
+#define __PARISC_VDSO_H__
+
+#ifdef __KERNEL__
+
+/* Default link addresses for the vDSOs */
+#define VDSO32_LBASE	0x80000000
+#define VDSO64_LBASE	0x80000000
+
+/* Default map addresses */
+#define VDSO32_MBASE	VDSO32_LBASE
+#define VDSO64_MBASE	VDSO64_LBASE
+
+#define VDSO_VERSION_STRING	LINUX_2.6.19
+
+#ifndef __ASSEMBLY__
+
+extern unsigned int vdso64_pages;
+extern unsigned int vdso32_pages;
+
+/* Offsets relative to thread->vdso_base */
+extern unsigned long vdso64_rt_sigtramp;
+extern unsigned long vdso32_sigtramp;
+extern unsigned long vdso32_rt_sigtramp;
+
+extern void vdso_init(void);
+
+#else /* __ASSEMBLY__ */
+
+#define V_FUNCTION_BEGIN(name)		\
+	.globl name;			\
+	.type name,@function; 		\
+	name:				\
+
+#define V_FUNCTION_END(name)		\
+	.size name,.-name;
+
+#define V_LOCAL_FUNC(name) (name)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __KERNEL__ */
+
+#endif /* __PARISC_VDSO_H__ */
diff --git a/include/asm-parisc/vdso_datapage.h b/include/asm-parisc/vdso_datapage.h
new file mode 100644
index 0000000..b79879a
--- /dev/null
+++ b/include/asm-parisc/vdso_datapage.h
@@ -0,0 +1,43 @@
+#ifndef _VDSO_DATAPAGE_H
+#define _VDSO_DATAPAGE_H
+#ifdef __KERNEL__
+
+/*
+ * Copyright (C) 2006 Randolph Chung <tausq@debian.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2.
+ */
+
+
+#ifndef __ASSEMBLY__
+
+#include <linux/unistd.h>
+
+#define SYSCALL_MAP_SIZE      ((__NR_Linux_syscalls + 31) / 32)
+
+struct vdso_data {
+	__u64 tb_orig_stamp;		/* Timebase at boot		0x30 */
+	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
+	__u64 tb_to_xs;			/* Inverse of TB to 2^20	0x40 */
+	__u64 stamp_xsec;		/*				0x48 */
+	__u32 tb_update_count;		/* Timebase atomicity ctr	0x50 */
+	__u32 tz_minuteswest;		/* Minutes west of Greenwich	0x58 */
+	__u32 tz_dsttime;		/* Type of dst correction	0x5C */
+	__s32 wtom_clock_sec;			/* Wall to monotonic clock */
+	__s32 wtom_clock_nsec;
+#ifdef CONFIG_64BIT
+   	__u32 syscall_map_64[SYSCALL_MAP_SIZE]; /* map of syscalls  */
+#endif
+   	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
+};
+
+#ifdef __KERNEL__
+extern struct vdso_data *vdso_data;
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __KERNEL__ */
+#endif /* _VDSO_DATAPAGE_H */

--------------080200030008040309060204
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------080200030008040309060204--
