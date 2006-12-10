From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] Generic BUG for parisc
Date: Sun, 10 Dec 2006 16:55:53 +0100
Message-ID: <200612101655.53867.deller__37287.7659545795$1416624229$gmane$org@gmx.de>
References: <200612091628.38777.deller@gmx.de> <457C0DD9.20004@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <457C0DD9.20004@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 10 December 2006 06:37, Grant Grundler wrote:
On Sunday 10 December 2006 14:38, Randolph Chung wrote:
...
Thanks a lot for your both's feedback!

In summary I read, that it's better to keep the patch like it is now without major changes.

Further possible enhancements would be:
- add performance couters to measure how often the tests ran
- implement WARN() the same way 

A slightly modified patch (in asm-parisc/bug.h) is attached. It still has 1-2 minimal other cleanups. 

Kyle/Willy: Do you think you can integrate this patch into what goes to Linus for 2.6.20 ?

Thanks!
Helge


diff-tree 571c18bb8c00794f38bc522a9d62d699ec17f9b8 (from 12166cbf2a4b90bc9d82262f52a8568362166f91)
Author: Helge Deller <deller@gmx.de>
Date:   Sat Dec 9 16:41:00 2006 +0100

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
index 695588d..367e458 100644
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
+		asm volatile(PARISC_BUG_BREAK_ASM : : );		\
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
