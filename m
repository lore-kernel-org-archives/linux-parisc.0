From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add flexible mmap memory layout support
Date: Fri, 31 Jan 2014 22:19:52 +0100
Message-ID: <20140131211952.GA11069@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add support for the flexible mmap memory layout (as described in
http://lwn.net/Articles/91829). This is especially very interesting on
parisc since we currently only support 32bit userspace (even with a
64bit Linux kernel).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index ad2b503..369f237 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -348,4 +348,11 @@ struct pt_regs;	/* forward declaration... */
 
 #define ELF_HWCAP	0
 
+/* Stack randomization: 1GB for 64bit, 8MB for 32bit */
+#define STACK_RND_MASK (is_32bit_task() ? 0x7ff : 0x3fffff)
+
+struct mm_struct;
+extern unsigned long arch_randomize_brk(struct mm_struct *);
+#define arch_randomize_brk arch_randomize_brk
+
 #endif
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 34899b5..22b89d1 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -511,6 +511,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 /* We provide our own get_unmapped_area to provide cache coherency */
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index cc2290a..198a86f 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -30,6 +30,8 @@
 #endif
 #define current_text_addr() ({ void *pc; current_ia(pc); pc; })
 
+#define HAVE_ARCH_PICK_MMAP_LAYOUT
+
 #define TASK_SIZE_OF(tsk)       ((tsk)->thread.task_size)
 #define TASK_SIZE	        TASK_SIZE_OF(current)
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index d5f97ea..4b9b10c 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -76,6 +76,16 @@ struct thread_info {
 #define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
 				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT)
 
+#ifdef CONFIG_64BIT
+# ifdef CONFIG_COMPAT
+#  define is_32bit_task()	(test_thread_flag(TIF_32BIT))
+# else
+#  define is_32bit_task()	(0)
+# endif
+#else
+# define is_32bit_task()	(1)
+#endif
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_PARISC_THREAD_INFO_H */
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 55f92b6..0bbbf0d 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -13,7 +13,7 @@
  *    Copyright (C) 2000 Grant Grundler <grundler with parisc-linux.org>
  *    Copyright (C) 2001 Alan Modra <amodra at parisc-linux.org>
  *    Copyright (C) 2001-2002 Ryan Bradetich <rbrad at parisc-linux.org>
- *    Copyright (C) 2001-2007 Helge Deller <deller at parisc-linux.org>
+ *    Copyright (C) 2001-2014 Helge Deller <deller@gmx.de>
  *    Copyright (C) 2002 Randolph Chung <tausq with parisc-linux.org>
  *
  *
@@ -49,6 +49,7 @@
 #include <linux/kallsyms.h>
 #include <linux/uaccess.h>
 #include <linux/rcupdate.h>
+#include <linux/random.h>
 
 #include <asm/io.h>
 #include <asm/asm-offsets.h>
@@ -286,3 +287,21 @@ void *dereference_function_descriptor(void *ptr)
 	return ptr;
 }
 #endif
+
+static inline unsigned long brk_rnd(void)
+{
+	/* 8MB for 32bit, 1GB for 64bit */
+	if (is_32bit_task())
+		return (get_random_int() & 0x7ffUL) << PAGE_SHIFT;
+	else
+		return (get_random_int() & 0x3ffffUL) << PAGE_SHIFT;
+}
+
+unsigned long arch_randomize_brk(struct mm_struct *mm)
+{
+	unsigned long ret = PAGE_ALIGN(mm->brk + brk_rnd());
+
+	if (ret < mm->brk)
+		return mm->brk;
+	return ret;
+}
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 0d3a9d4..b7cadc4 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -5,6 +5,7 @@
  *    Copyright (C) 1999-2003 Matthew Wilcox <willy at parisc-linux.org>
  *    Copyright (C) 2000-2003 Paul Bame <bame at parisc-linux.org>
  *    Copyright (C) 2001 Thomas Bogendoerfer <tsbogend at parisc-linux.org>
+ *    Copyright (C) 1999-2014 Helge Deller <deller@gmx.de>
  *
  *
  *    This program is free software; you can redistribute it and/or modify
@@ -23,6 +24,7 @@
  */
 
 #include <asm/uaccess.h>
+#include <asm/elf.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/linkage.h>
@@ -32,78 +34,230 @@
 #include <linux/syscalls.h>
 #include <linux/utsname.h>
 #include <linux/personality.h>
+#include <linux/random.h>
 
-static unsigned long get_unshared_area(unsigned long addr, unsigned long len)
+/* we construct an artificial offset for the mapping based on the physical
+ * address of the kernel mapping variable */
+#define GET_LAST_MMAP(filp)		\
+	(filp ? ((unsigned long) filp->f_mapping) >> 8 : 0UL)
+#define SET_LAST_MMAP(filp, val)	\
+	 { /* nothing */ }
+
+static int get_offset(unsigned int last_mmap)
 {
-	struct vm_unmapped_area_info info;
+	return (last_mmap & (SHMLBA-1)) >> PAGE_SHIFT;
+}
 
-	info.flags = 0;
-	info.length = len;
-	info.low_limit = PAGE_ALIGN(addr);
-	info.high_limit = TASK_SIZE;
-	info.align_mask = 0;
-	info.align_offset = 0;
-	return vm_unmapped_area(&info);
+static unsigned long shared_align_offset(unsigned int last_mmap,
+					 unsigned long pgoff)
+{
+	return (get_offset(last_mmap) + pgoff) << PAGE_SHIFT;
 }
 
-/*
- * We need to know the offset to use.  Old scheme was to look for
- * existing mapping and use the same offset.  New scheme is to use the
- * address of the kernel data structure as the seed for the offset.
- * We'll see how that works...
- *
- * The mapping is cacheline aligned, so there's no information in the bottom
- * few bits of the address.  We're looking for 10 bits (4MB / 4k), so let's
- * drop the bottom 8 bits and use bits 8-17.  
- */
-static int get_offset(struct address_space *mapping)
+static inline unsigned long COLOR_ALIGN(unsigned long addr,
+			 unsigned int last_mmap, unsigned long pgoff)
 {
-	return (unsigned long) mapping >> 8;
+	unsigned long base = (addr+SHMLBA-1) & ~(SHMLBA-1);
+	unsigned long off  = (SHMLBA-1) &
+		(shared_align_offset(last_mmap, pgoff) << PAGE_SHIFT);
+
+	return base + off;
 }
 
-static unsigned long shared_align_offset(struct file *filp, unsigned long pgoff)
+/*
+ * Top of mmap area (just below the process stack).
+ */
+
+static unsigned long mmap_upper_limit(void)
 {
-	struct address_space *mapping = filp ? filp->f_mapping : NULL;
+	unsigned long stack_base;
 
-	return (get_offset(mapping) + pgoff) << PAGE_SHIFT;
+	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
+	stack_base = rlimit_max(RLIMIT_STACK);
+	if (stack_base > (1 << 30))
+		stack_base = 1 << 30;
+
+	return PAGE_ALIGN(STACK_TOP - stack_base);
 }
 
-static unsigned long get_shared_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff)
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	unsigned long task_size = TASK_SIZE;
+	int do_color_align, last_mmap;
 	struct vm_unmapped_area_info info;
 
+	if (len > task_size)
+		return -ENOMEM;
+
+	do_color_align = 0;
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+	last_mmap = GET_LAST_MMAP(filp);
+
+	if (flags & MAP_FIXED) {
+		if ((flags & MAP_SHARED) && last_mmap &&
+		    (addr - shared_align_offset(last_mmap, pgoff))
+				& (SHMLBA - 1))
+			return -EINVAL;
+		goto found_addr;
+	}
+
+	if (addr) {
+		if (do_color_align && last_mmap)
+			addr = COLOR_ALIGN(addr, last_mmap, pgoff);
+		else
+			addr = PAGE_ALIGN(addr);
+
+		vma = find_vma(mm, addr);
+		if (task_size - len >= addr &&
+		    (!vma || addr + len <= vma->vm_start))
+			goto found_addr;
+	}
+
 	info.flags = 0;
 	info.length = len;
-	info.low_limit = PAGE_ALIGN(addr);
-	info.high_limit = TASK_SIZE;
-	info.align_mask = PAGE_MASK & (SHMLBA - 1);
-	info.align_offset = shared_align_offset(filp, pgoff);
-	return vm_unmapped_area(&info);
+	info.low_limit = mm->mmap_legacy_base;
+	info.high_limit = mmap_upper_limit();
+	info.align_mask = last_mmap ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_offset = shared_align_offset(last_mmap, pgoff);
+	addr = vm_unmapped_area(&info);
+
+found_addr:
+	if (do_color_align && !last_mmap && !(addr & ~PAGE_MASK))
+		SET_LAST_MMAP(filp, addr - (pgoff << PAGE_SHIFT));
+
+	return addr;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+unsigned long
+arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
+			  const unsigned long len, const unsigned long pgoff,
+			  const unsigned long flags)
 {
+	struct vm_area_struct *vma;
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	int do_color_align, last_mmap;
+	struct vm_unmapped_area_info info;
+
+#ifdef CONFIG_64BIT
+	/* This should only ever run for 32-bit processes.  */
+	BUG_ON(!test_thread_flag(TIF_32BIT));
+#endif
+
+	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
 		return -ENOMEM;
+
+	do_color_align = 0;
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+	last_mmap = GET_LAST_MMAP(filp);
+
 	if (flags & MAP_FIXED) {
-		if ((flags & MAP_SHARED) &&
-		    (addr - shared_align_offset(filp, pgoff)) & (SHMLBA - 1))
+		if ((flags & MAP_SHARED) && last_mmap &&
+		    (addr - shared_align_offset(last_mmap, pgoff))
+			& (SHMLBA - 1))
 			return -EINVAL;
-		return addr;
+		goto found_addr;
 	}
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
 
-	if (filp || (flags & MAP_SHARED))
-		addr = get_shared_area(filp, addr, len, pgoff);
-	else
-		addr = get_unshared_area(addr, len);
+	/* requesting a specific address */
+	if (addr) {
+		if (do_color_align && last_mmap)
+			addr = COLOR_ALIGN(addr, last_mmap, pgoff);
+		else
+			addr = PAGE_ALIGN(addr);
+		vma = find_vma(mm, addr);
+		if (TASK_SIZE - len >= addr &&
+		    (!vma || addr + len <= vma->vm_start))
+			goto found_addr;
+	}
+
+	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
+	info.length = len;
+	info.low_limit = PAGE_SIZE;
+	info.high_limit = mm->mmap_base;
+	info.align_mask = last_mmap ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_offset = shared_align_offset(last_mmap, pgoff);
+	addr = vm_unmapped_area(&info);
+	if (!(addr & ~PAGE_MASK))
+		goto found_addr;
+	VM_BUG_ON(addr != -ENOMEM);
+
+	/*
+	 * A failed mmap() very likely causes application failure,
+	 * so fall back to the bottom-up function here. This scenario
+	 * can happen with large stack limits and large mmap()
+	 * allocations.
+	 */
+	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
+
+found_addr:
+	if (do_color_align && !last_mmap && !(addr & ~PAGE_MASK))
+		SET_LAST_MMAP(filp, addr - (pgoff << PAGE_SHIFT));
 
 	return addr;
 }
 
+static int mmap_is_legacy(void)
+{
+	if (current->personality & ADDR_COMPAT_LAYOUT)
+		return 1;
+
+	/* parisc stack always grows up - so a unlimited stack should
+	 * not be an indicator to use the legacy memory layout.
+	 * if (rlimit(RLIMIT_STACK) == RLIM_INFINITY)
+	 *	return 1;
+	 */
+
+	return sysctl_legacy_va_layout;
+}
+
+static unsigned long mmap_rnd(void)
+{
+	unsigned long rnd = 0;
+
+	/*
+	*  8 bits of randomness in 32bit mmaps, 20 address space bits
+	* 28 bits of randomness in 64bit mmaps, 40 address space bits
+	*/
+	if (current->flags & PF_RANDOMIZE) {
+		if (is_32bit_task())
+			rnd = get_random_int() % (1<<8);
+		else
+			rnd = get_random_int() % (1<<28);
+	}
+	return rnd << PAGE_SHIFT;
+}
+
+static unsigned long mmap_legacy_base(void)
+{
+	return TASK_UNMAPPED_BASE + mmap_rnd();
+}
+
+/*
+ * This function, called very early during the creation of a new
+ * process VM image, sets up which VM layout function to use:
+ */
+void arch_pick_mmap_layout(struct mm_struct *mm)
+{
+	mm->mmap_legacy_base = mmap_legacy_base();
+	mm->mmap_base = mmap_upper_limit();
+
+	if (mmap_is_legacy()) {
+		mm->mmap_base = mm->mmap_legacy_base;
+		mm->get_unmapped_area = arch_get_unmapped_area;
+	} else {
+		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
+	}
+}
+
+
 asmlinkage unsigned long sys_mmap2(unsigned long addr, unsigned long len,
 	unsigned long prot, unsigned long flags, unsigned long fd,
 	unsigned long pgoff)
diff --git a/fs/exec.c b/fs/exec.c
index e1529b4..a648162 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -659,6 +659,9 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	if (stack_base > (1 << 30))
 		stack_base = 1 << 30;
 
+	/* add some more stack size for stack randomization */
+	stack_base += STACK_RND_MASK + 1;
+
 	/* Make sure we didn't let the argument array grow too large. */
 	if (vma->vm_end - vma->vm_start > stack_base)
 		return -ENOMEM;
