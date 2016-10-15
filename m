From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Implement executable address layout randomization
Date: Sun, 16 Oct 2016 00:02:27 +0200
Message-ID: <20161015220227.GA31338@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add missing code for userspace executable randomization, e.g.
applications compiled with the gcc -pie option.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 71c4a3a..e5cfadb 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -7,6 +7,7 @@ config PARISC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_SYSCALL_TRACEPOINTS
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_HAS_ELF_RANDOMIZE
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index 78c9fd3..a6b2a42 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -348,9 +348,10 @@ struct pt_regs;	/* forward declaration... */
 
 #define ELF_HWCAP	0
 
-#define STACK_RND_MASK	(is_32bit_task() ? \
-				0x7ff >> (PAGE_SHIFT - 12) : \
-				0x3ffff >> (PAGE_SHIFT - 12))
+/* Masks for stack and mmap randomization */
+#define BRK_RND_MASK	(is_32bit_task() ? 0x07ffUL : 0x3ffffUL)
+#define MMAP_RND_MASK	(is_32bit_task() ? 0x1fffUL : 0x3ffffUL)
+#define STACK_RND_MASK	MMAP_RND_MASK
 
 struct mm_struct;
 extern unsigned long arch_randomize_brk(struct mm_struct *);
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 4063943..ea6603e 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -276,11 +276,7 @@ void *dereference_function_descriptor(void *ptr)
 
 static inline unsigned long brk_rnd(void)
 {
-	/* 8MB for 32bit, 1GB for 64bit */
-	if (is_32bit_task())
-		return (get_random_int() & 0x7ffUL) << PAGE_SHIFT;
-	else
-		return (get_random_int() & 0x3ffffUL) << PAGE_SHIFT;
+	return (get_random_int() & BRK_RND_MASK) << PAGE_SHIFT;
 }
 
 unsigned long arch_randomize_brk(struct mm_struct *mm)
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 0a393a0..a81e177 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -225,19 +225,17 @@ static unsigned long mmap_rnd(void)
 {
 	unsigned long rnd = 0;
 
-	/*
-	*  8 bits of randomness in 32bit mmaps, 20 address space bits
-	* 28 bits of randomness in 64bit mmaps, 40 address space bits
-	*/
-	if (current->flags & PF_RANDOMIZE) {
-		if (is_32bit_task())
-			rnd = get_random_int() % (1<<8);
-		else
-			rnd = get_random_int() % (1<<28);
-	}
+	if (current->flags & PF_RANDOMIZE)
+		rnd = get_random_int() & MMAP_RND_MASK;
+
 	return rnd << PAGE_SHIFT;
 }
 
+unsigned long arch_mmap_rnd(void)
+{
+	return (get_random_int() & MMAP_RND_MASK) << PAGE_SHIFT;
+}
+
 static unsigned long mmap_legacy_base(void)
 {
 	return TASK_UNMAPPED_BASE + mmap_rnd();
