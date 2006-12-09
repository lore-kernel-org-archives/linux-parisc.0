From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] Generic BUG for parisc
Date: Sat, 9 Dec 2006 16:28:38 +0100
Message-ID: <200612091628.38777.deller__31982.6704253957$1416624227$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

I found the following patch, which recently went into Linus' 2.6.20-pre kernel very interesting:
http://git.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=7664c5a1da4711bb6383117f51b94c8dc8f3f1cd

as well as the implementations for i386 and x86-64:
http://git.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=91768d6c2bad0d2766a166f13f2f57e197de3458
http://git.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=c31a0bf3e1bc581676618db7492f18798fd0a73f

You might be able to get this into your trees with "git-cherry-pick 7664c5a1da4711bb6383117f51b94c8dc8f3f1cd".

The attached patch implements this for parisc, and my vmlinux (32bit) shows me after using it:
> hppa-linux-objdump -x vmlinux :
Idx Name          Size      VMA       LMA       File off  Algn
 16 __bug_table   000040a4  104a3000  104a3000  003a4000  2**0

So, there were 1379 BUG()'s covered by that change (0x40a4 = 16548, each entry 12 bytes => 1379 BUG calls).

Since I would like to submit this patch to our tree, I would like to get your feedback first:
- Is the "break" instruction the best one for this task ?
- will it affect runtime of the kernel (maybe break statements, although normally not executed, reduce throughput ?)
- should I submit it as soon as our parisc-tree has the necessary bits from mainline ?
- any other ideas ?

One idea I had was to encode the file line number into the instruction itself (in im5 & im13), since the break instruction is implemented as "break im5, im13" and 16bit fit easily in there.
This would save some space, but I would need to add some ifdefs in the generic implementation which I didn't wanted to touch yet.

Helge

------

[PATCH] Generic BUG for parisc

 arch/parisc/Kconfig              |    5 ++
 arch/parisc/kernel/module.c      |    4 +
 arch/parisc/kernel/traps.c       |   79 ++++++++++++++++-----------------------
 arch/parisc/kernel/vmlinux.lds.S |    2
 include/asm-parisc/bug.h         |   38 ++++++++++++++++--
 5 files changed, 76 insertions(+), 52 deletions(-)

    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index d210123..a946776 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -29,6 +29,11 @@ config GENERIC_FIND_NEXT_BIT
 	bool
 	default y
 
+config GENERIC_BUG
+	bool
+	default y
+	depends on BUG
+
 config GENERIC_HWEIGHT
 	bool
 	default y
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 47ea4e4..1808f85 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -46,6 +46,7 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/bug.h>
 
 #include <asm/unwind.h>
 
@@ -851,10 +852,11 @@ int module_finalize(const Elf_Ehdr *hdr,
 	nsyms = newptr - (Elf_Sym *)symhdr->sh_addr;
 	DEBUGP("NEW num_symtab %lu\n", nsyms);
 	symhdr->sh_size = nsyms * sizeof(Elf_Sym);
-	return 0;
+	return module_bug_finalize(hdr, sechdrs, me);
 }
 
 void module_arch_cleanup(struct module *mod)
 {
 	deregister_unwind_table(mod);
+	module_bug_cleanup(mod);
 }
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 65cd6ca..af6df04 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/console.h>
 #include <linux/kallsyms.h>
+#include <linux/bug.h>
 
 #include <asm/assembly.h>
 #include <asm/system.h>
@@ -49,7 +50,7 @@
 DEFINE_SPINLOCK(pa_dbit_lock);
 #endif
 
-int printbinary(char *buf, unsigned long x, int nbits)
+static int printbinary(char *buf, unsigned long x, int nbits)
 {
 	unsigned long mask = 1UL << (nbits - 1);
 	while (mask != 0) {
@@ -204,6 +205,11 @@ HERE:
 	do_show_stack(&info);
 }
 
+int is_valid_bugaddr(unsigned long iaoq)
+{
+	return 1;
+}
+
 void die_if_kernel(char *str, struct pt_regs *regs, long err)
 {
 	if (user_mode(regs)) {
@@ -222,7 +228,7 @@ void die_if_kernel(char *str, struct pt_
 	oops_in_progress = 1;
 
 	/* Amuse the user in a SPARC fashion */
-	printk(
+	if (err) printk(
 "      _______________________________ \n"
 "     < Your System ate a SPARC! Gah! >\n"
 "      ------------------------------- \n"
@@ -242,8 +248,9 @@ void die_if_kernel(char *str, struct pt_
 	if (!console_drivers)
 		pdc_console_restart();
 	
-	printk(KERN_CRIT "%s (pid %d): %s (code %ld)\n",
-		current->comm, current->pid, str, err);
+	if (err)
+		printk(KERN_CRIT "%s (pid %d): %s (code %ld)\n",
+			current->comm, current->pid, str, err);
 	show_regs(regs);
 
 	if (in_interrupt())
@@ -273,70 +280,50 @@ int syscall_ipi(int (*syscall) (struct p
 
 /* gdb uses break 4,8 */
 #define GDB_BREAK_INSN 0x10004
-void handle_gdb_break(struct pt_regs *regs, int wot)
+static void handle_gdb_break(struct pt_regs *regs, int wot)
 {
 	struct siginfo si;
 
-	si.si_code = wot;
-	si.si_addr = (void __user *) (regs->iaoq[0] & ~3);
 	si.si_signo = SIGTRAP;
 	si.si_errno = 0;
+	si.si_code = wot;
+	si.si_addr = (void __user *) (regs->iaoq[0] & ~3);
 	force_sig_info(SIGTRAP, &si, current);
 }
 
-void handle_break(unsigned iir, struct pt_regs *regs)
+static void handle_break(struct pt_regs *regs)
 {
-	struct siginfo si;
-
-	switch(iir) {
-	case 0x00:
-#ifdef PRINT_USER_FAULTS
-		printk(KERN_DEBUG "break 0,0: pid=%d command='%s'\n",
-		       current->pid, current->comm);
-#endif
-		die_if_kernel("Breakpoint", regs, 0);
-#ifdef PRINT_USER_FAULTS
-		show_regs(regs);
-#endif
-		si.si_code = TRAP_BRKPT;
-		si.si_addr = (void __user *) (regs->iaoq[0] & ~3);
-		si.si_signo = SIGTRAP;
-		force_sig_info(SIGTRAP, &si, current);
-		break;
+	unsigned iir = regs->iir;
 
-	case GDB_BREAK_INSN:
-		die_if_kernel("Breakpoint", regs, 0);
-		handle_gdb_break(regs, TRAP_BRKPT);
-		break;
+	if (unlikely(iir == PARISC_BUG_BREAK_INSN && !user_mode(regs))) {
+		/* check if a BUG() or WARN_ON() trapped here.  */
+		enum bug_trap_type tt;
+		tt = report_bug(regs->iaoq[0] & ~3);
+		die_if_kernel("Unknown kernel breakpoint", regs, 
+			(tt == BUG_TRAP_TYPE_NONE) ? 9 : 0);
+	}
 
-	default:
 #ifdef PRINT_USER_FAULTS
-		printk(KERN_DEBUG "break %#08x: pid=%d command='%s'\n",
-		       iir, current->pid, current->comm);
+	if (unlikely(iir != GDB_BREAK_INSN)) {
+		printk(KERN_DEBUG "break %d,%d: pid=%d command='%s'\n",
+			(iir>>13) & ((1<<13)-1), iir & 31,
+			current->pid, current->comm);
 		show_regs(regs);
-#endif
-		si.si_signo = SIGTRAP;
-		si.si_code = TRAP_BRKPT;
-		si.si_addr = (void __user *) (regs->iaoq[0] & ~3);
-		force_sig_info(SIGTRAP, &si, current);
-		return;
 	}
-}
-
+#endif
 
-int handle_toc(void)
-{
-	printk(KERN_CRIT "TOC call.\n");
-	return 0;
+	/* send standard GDB signal */
+	handle_gdb_break(regs, TRAP_BRKPT);
 }
 
+
 static void default_trap(int code, struct pt_regs *regs)
 {
 	printk(KERN_ERR "Trap %d on CPU %d\n", code, smp_processor_id());
 	show_regs(regs);
 }
 
-void (*cpu_lpmc) (int code, struct pt_regs *regs) = default_trap;
+void (*cpu_lpmc) (int code, struct pt_regs *regs) __read_mostly = default_trap;
 
 
 void transfer_pim_to_trap_frame(struct pt_regs *regs)
@@ -572,7 +559,7 @@ void handle_interruption(int code, struc
 
 	case  9:
 		/* Break instruction trap */
-		handle_break(regs->iir,regs);
+		handle_break(regs);
 		return;
 	
 	case 10:
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 7b943b4..7b149df 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -68,6 +68,8 @@ SECTIONS
 
   RODATA
 
+  BUG_TABLE
+
   /* writeable */
   . = ALIGN(ASM_PAGE_SIZE);	/* Make sure this is page aligned so
   				   that we can properly leave these
diff --git a/include/asm-parisc/bug.h b/include/asm-parisc/bug.h
index 695588d..b01c34b 100644
--- a/include/asm-parisc/bug.h
+++ b/include/asm-parisc/bug.h
@@ -1,14 +1,42 @@
 #ifndef _PARISC_BUG_H
 #define _PARISC_BUG_H
 
+/*
+ * Tell the user there is some problem.
+ * The offending file and line are encoded in the __bug_table section.
+ */
+
 #ifdef CONFIG_BUG
 #define HAVE_ARCH_BUG
-#define BUG() do { \
-	printk("kernel BUG at %s:%d!\n", __FILE__, __LINE__); \
-	dump_stack(); \
-	panic("BUG!"); \
-} while (0)
+
+/* the break instruction is used as BUG() marker.  */
+#define	PARISC_BUG_BREAK_ASM	"break 0x1f, 0x1fff"
+#define	PARISC_BUG_BREAK_INSN	0x03ffe01f  /* PARISC_BUG_BREAK_ASM */
+
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define BUG()								\
+	do {								\
+		asm volatile("\n"					\
+			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
+			     "\t.pushsection __bug_table,\"a\"\n"	\
+			     "2:\t.long 1b, %c0\n"			\
+			     "\t.short %c1, 0\n"			\
+			     "\t.org 2b+%c2\n"				\
+			     "\t.popsection"				\
+			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     "i" (sizeof(struct bug_entry)) );		\
+		for(;;) ;						\
+	} while(0)
+
+#else
+#define BUG()								\
+	do {								\
+		asm volatile("break 0x1f, 0x1fff\n" : : );		\
+		for(;;) ;						\
+	} while(0)
+#endif
 #endif
 
 #include <asm-generic/bug.h>
 #endif
+
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
