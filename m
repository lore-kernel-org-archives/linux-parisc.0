From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix kernel crash when unwinding a userspace process
Date: Thu, 20 Nov 2008 22:58:56 +0100
Message-ID: <200811202258.56561.deller@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
To: linux-parisc@vger.kernel.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Any user on existing parisc 32- and 64bit-kernels can easily crash
the kernel and as such enforce a DSO.
A simple testcase is available here: 
	http://gsyprf10.external.hp.com/~deller/crash.tgz

The problem is introduced by the fact, that the handle_interruption()
crash handler calls the show_regs() function, which in turn tries
to unwind the stack by calling parisc_show_stack().
Since the stack contains userspace addresses, a try to unwind 
the stack is dangerous and useless and leads to the crash.

The fix is trivial: For userspace processes
a) avoid to unwind the stack, and
b) avoid to resolve userspace addresses to kernel symbol names.

While touching this code, I converted print_symbol() to %pS 
printk formats and made parisc_show_stack() static.

An initial patch for this was written by Kyle McMartin back in August:
http://marc.info/?l=linux-parisc&m=121805168830283&w=2

Compile and run-tested with a 64bit parisc kernel.
Patches for -stable series will follow shortly.

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 675f1d0..acea2dc 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -24,7 +24,6 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/console.h>
-#include <linux/kallsyms.h>
 #include <linux/bug.h>
 
 #include <asm/assembly.h>
@@ -51,7 +50,7 @@
 DEFINE_SPINLOCK(pa_dbit_lock);
 #endif
 
-void parisc_show_stack(struct task_struct *t, unsigned long *sp,
+static void parisc_show_stack(struct task_struct *task, unsigned long *sp,
 	struct pt_regs *regs);
 
 static int printbinary(char *buf, unsigned long x, int nbits)
@@ -121,18 +120,19 @@ static void print_fr(char *level, struct pt_regs *regs)
 
 void show_regs(struct pt_regs *regs)
 {
-	int i;
+	int i, user;
 	char *level;
 	unsigned long cr30, cr31;
 
-	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
+	user = user_mode(regs);
+	level = user ? KERN_DEBUG : KERN_CRIT;
 
 	print_gr(level, regs);
 
 	for (i = 0; i < 8; i += 4)
 		PRINTREGS(level, regs->sr, "sr", RFMT, i);
 
-	if (user_mode(regs))
+	if (user)
 		print_fr(level, regs);
 
 	cr30 = mfctl(30);
@@ -145,14 +145,14 @@ void show_regs(struct pt_regs *regs)
 	printk("%s CPU: %8d   CR30: " RFMT " CR31: " RFMT "\n",
 	       level, current_thread_info()->cpu, cr30, cr31);
 	printk("%s ORIG_R28: " RFMT "\n", level, regs->orig_r28);
-	printk(level);
-	print_symbol(" IAOQ[0]: %s\n", regs->iaoq[0]);
-	printk(level);
-	print_symbol(" IAOQ[1]: %s\n", regs->iaoq[1]);
-	printk(level);
-	print_symbol(" RP(r2): %s\n", regs->gr[2]);
-
-	parisc_show_stack(current, NULL, regs);
+
+	if (!user) {
+		printk("%s IAOQ[0]: %pS\n", level, (void *) regs->iaoq[0]);
+		printk("%s IAOQ[1]: %pS\n", level, (void *) regs->iaoq[1]);
+		printk("%s RP(r2): %pS\n", level, (void *) regs->gr[2]);
+
+		parisc_show_stack(current, NULL, regs);
+	}
 }
 
 
@@ -173,20 +173,15 @@ static void do_show_stack(struct unwind_frame_info *info)
 			break;
 
 		if (__kernel_text_address(info->ip)) {
-			printk("%s [<" RFMT ">] ", (i&0x3)==1 ? KERN_CRIT : "", info->ip);
-#ifdef CONFIG_KALLSYMS
-			print_symbol("%s\n", info->ip);
-#else
-			if ((i & 0x03) == 0)
-				printk("\n");
-#endif
+			printk(KERN_CRIT " [<" RFMT ">] %pS\n",
+				info->ip, (void *) info->ip);
 			i++;
 		}
 	}
-	printk("\n");
+	printk(KERN_CRIT "\n");
 }
 
-void parisc_show_stack(struct task_struct *task, unsigned long *sp,
+static void parisc_show_stack(struct task_struct *task, unsigned long *sp,
 	struct pt_regs *regs)
 {
 	struct unwind_frame_info info;
