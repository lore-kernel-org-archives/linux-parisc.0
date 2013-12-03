From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add flexible mmap layout support
Date: Tue, 3 Dec 2013 23:18:46 +0100
Message-ID: <20131203221846.GA23704@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dave.anglin@bell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

- initial version
- add mmap address & stack randomization
- probably fixes a few other bugs in the mmap code
- can be enabled/turned off by "echo 0/1 > /proc/sys/vm/legacy_va_layout
- new flexible mmap layout is by default turned on

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index ad2b503..80db5b2 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -348,4 +348,11 @@ struct pt_regs;	/* forward declaration... */
 
 #define ELF_HWCAP	0
 
+/* Stack randomization: 1GB for 64bit, 8MB for 32bit */
+#ifdef CONFIG_64BIT
+# define STACK_RND_MASK (test_thread_flag(TIF_32BIT) ? 0x7ff : 0x3fffff)
+#else
+# define STACK_RND_MASK (0x7ff)
+#endif
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
index 9cbee39..75985b8 100644
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
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 0d3a9d4..dd22137 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -23,6 +23,7 @@
  */
 
 #include <asm/uaccess.h>
+#include <asm/elf.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/linkage.h>
@@ -32,19 +33,7 @@
 #include <linux/syscalls.h>
 #include <linux/utsname.h>
 #include <linux/personality.h>
-
-static unsigned long get_unshared_area(unsigned long addr, unsigned long len)
-{
-	struct vm_unmapped_area_info info;
-
-	info.flags = 0;
-	info.length = len;
-	info.low_limit = PAGE_ALIGN(addr);
-	info.high_limit = TASK_SIZE;
-	info.align_mask = 0;
-	info.align_offset = 0;
-	return vm_unmapped_area(&info);
-}
+#include <linux/random.h>
 
 /*
  * We need to know the offset to use.  Old scheme was to look for
@@ -58,7 +47,7 @@ static unsigned long get_unshared_area(unsigned long addr, unsigned long len)
  */
 static int get_offset(struct address_space *mapping)
 {
-	return (unsigned long) mapping >> 8;
+	return ((unsigned long) mapping >> 8) & ((SHMLBA-1) >> PAGE_SHIFT);
 }
 
 static unsigned long shared_align_offset(struct file *filp, unsigned long pgoff)
@@ -68,42 +57,215 @@ static unsigned long shared_align_offset(struct file *filp, unsigned long pgoff)
 	return (get_offset(mapping) + pgoff) << PAGE_SHIFT;
 }
 
-static unsigned long get_shared_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff)
+static inline unsigned long COLOR_ALIGN(unsigned long addr,
+					 struct file *filp, unsigned long pgoff)
+{
+	unsigned long base = (addr+SHMLBA-1)&~(SHMLBA-1);
+	unsigned long off = (shared_align_offset(filp, pgoff) << PAGE_SHIFT)
+			     & (SHMLBA-1);
+
+	return base + off;
+}
+
+/*
+ * Top of mmap area (just below the process stack).
+ */
+
+static unsigned long mmap_upper_limit(void)
+{
+	unsigned long stack_base;
+
+	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
+	stack_base = rlimit_max(RLIMIT_STACK);
+	if (stack_base > (1 << 30))
+		stack_base = 1 << 30;
+
+	return PAGE_ALIGN(STACK_TOP - stack_base);
+}
+
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	unsigned long task_size = TASK_SIZE;
+	int do_color_align;
 	struct vm_unmapped_area_info info;
 
+	if (len > task_size)
+		return -ENOMEM;
+	if (flags & MAP_FIXED) {
+		if ((flags & MAP_SHARED) &&
+		    (addr - shared_align_offset(filp, pgoff)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	do_color_align = 0;
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (addr) {
+		if (do_color_align)
+			addr = COLOR_ALIGN(addr, filp, pgoff);
+		else
+			addr = PAGE_ALIGN(addr);
+
+		vma = find_vma(mm, addr);
+		if (task_size - len >= addr &&
+		    (!vma || addr + len <= vma->vm_start))
+			return addr;
+	}
+
 	info.flags = 0;
 	info.length = len;
-	info.low_limit = PAGE_ALIGN(addr);
-	info.high_limit = TASK_SIZE;
-	info.align_mask = PAGE_MASK & (SHMLBA - 1);
+	info.low_limit = mm->mmap_legacy_base;
+	info.high_limit = mmap_upper_limit();
+	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = shared_align_offset(filp, pgoff);
-	return vm_unmapped_area(&info);
+	addr = vm_unmapped_area(&info);
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
+	int do_color_align;
+	struct vm_unmapped_area_info info;
+
+	/* This should only ever run for 32-bit processes.  */
+	BUG_ON(!test_thread_flag(TIF_32BIT));
+
+	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
 		return -ENOMEM;
+
 	if (flags & MAP_FIXED) {
 		if ((flags & MAP_SHARED) &&
 		    (addr - shared_align_offset(filp, pgoff)) & (SHMLBA - 1))
 			return -EINVAL;
 		return addr;
 	}
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
 
+	do_color_align = 0;
 	if (filp || (flags & MAP_SHARED))
-		addr = get_shared_area(filp, addr, len, pgoff);
-	else
-		addr = get_unshared_area(addr, len);
+		do_color_align = 1;
+
+	/* requesting a specific address */
+	if (addr) {
+		if (do_color_align)
+			addr = COLOR_ALIGN(addr, filp, pgoff);
+		else
+			addr = PAGE_ALIGN(addr);
+		vma = find_vma(mm, addr);
+		if (TASK_SIZE - len >= addr &&
+		    (!vma || addr + len <= vma->vm_start))
+			return addr;
+	}
 
-	return addr;
+	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
+	info.length = len;
+	info.low_limit = PAGE_SIZE;
+	info.high_limit = mm->mmap_base;
+	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_offset = shared_align_offset(filp, pgoff);
+	addr = vm_unmapped_area(&info);
+	if (!(addr & ~PAGE_MASK))
+		return addr;
+	VM_BUG_ON(addr != -ENOMEM);
+
+	/*
+	 * A failed mmap() very likely causes application failure,
+	 * so fall back to the bottom-up function here. This scenario
+	 * can happen with large stack limits and large mmap()
+	 * allocations.
+	 */
+	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
+}
+
+static int mmap_is_legacy(void)
+{
+	if (current->personality & ADDR_COMPAT_LAYOUT)
+		return 1;
+
+	/* parisc stack always grows up - so a unlimited stack should
+	 * not be an indicator to use the legacy memory layout. */
+	if (rlimit(RLIMIT_STACK) == RLIM_INFINITY)
+		return 1;
+
+	return sysctl_legacy_va_layout;
+}
+
+/*
+ * True if 32bit task
+ */
+static inline int mmap_is_32bit(void)
+{
+#ifndef CONFIG_64BIT
+	return 1;
+#endif
+#ifdef CONFIG_COMPAT
+	if (test_thread_flag(TIF_32BIT))
+		return 1;
+#endif
+	return 0;
 }
 
+static unsigned long mmap_rnd(void)
+{
+	unsigned long rnd = 0;
+
+	/*
+	*  8 bits of randomness in 32bit mmaps, 20 address space bits
+	* 28 bits of randomness in 64bit mmaps, 40 address space bits
+	*/
+	if (current->flags & PF_RANDOMIZE) {
+		if (mmap_is_32bit())
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
+ * Flexible mmap layout support
+ * http://lwn.net/Articles/91829
+ * echo 0/1 /proc/sys/vm/legacy_va_layout
+ *
+ */
+
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
