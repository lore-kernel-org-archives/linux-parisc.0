From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [patch] pdc printing
Date: Fri, 30 Jul 2004 09:20:37 -0700
Message-ID: <20040730162037.GG546@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
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

Using debug spinlocks, sometimes we don't see any output, possibly
because of disabled interrupts or because of deadlocks in printk. This
patch makes the debug spinlock prints go through pdc console instead. It
works but i'm not completely happy with the fact that by replacing
printk() with pdc_printf() in debuglocks, the output only goes to
the pdc console and not "linux consoles" ... thoughts?

--- arch/parisc/kernel/pdc_cons.c	19 Jan 2004 05:15:47 -0000	1.6
+++ arch/parisc/kernel/pdc_cons.c	30 Jul 2004 00:47:55 -0000
@@ -71,6 +71,19 @@ void pdc_outc(unsigned char c)
 	pdc_iodc_outc(c);
 }
 
+void pdc_printf(const char *fmt, ...)
+{
+	va_list args;
+	char buf[1024];
+	int i, len;
+
+	va_start(args, fmt);
+	len = vscnprintf(buf, sizeof(buf), fmt, args);
+	va_end(args);
+
+	for (i = 0; i < len; i++)
+		pdc_iodc_outc(buf[i]);
+}
 
 int pdc_console_poll_key(struct console *co)
 {
--- arch/parisc/lib/debuglocks.c	14 Jul 2004 18:20:34 -0000	1.7
+++ arch/parisc/lib/debuglocks.c	30 Jul 2004 00:47:55 -0000
@@ -27,12 +27,14 @@
 #include <linux/spinlock.h>
 #include <asm/system.h>
 #include <asm/hardirq.h>	/* in_interrupt() */
+#include <asm/pdc.h>
 
 #undef INIT_STUCK
 #define INIT_STUCK 1L << 30
 
 #ifdef CONFIG_DEBUG_SPINLOCK
 
+
 void _dbg_spin_lock(spinlock_t * lock, const char *base_file, int line_no)
 {
 	volatile unsigned int *a;
@@ -64,7 +66,7 @@ try_again:
 		while ((*a == 0) && --stuck);
 
 	if (unlikely(stuck <= 0)) {
-		printk(KERN_WARNING
+		pdc_printf(
 			"%s:%d: spin_lock(%s/%p) stuck in %s at %p(%d)"
 			" owned by %s:%d in %s at %p(%d)\n",
 			base_file, line_no, lock->module, lock,
@@ -84,7 +86,7 @@ try_again:
 	lock->bline = line_no;
 
 	if (unlikely(printed)) {
-		printk(KERN_WARNING
+		pdc_printf(
 			"%s:%d: spin_lock grabbed in %s at %p(%d) %ld ticks\n",
 			base_file, line_no, current->comm, inline_pc,
 			cpu, jiffies - started);
@@ -97,7 +99,7 @@ void _dbg_spin_unlock(spinlock_t * lock,
 	volatile unsigned int *a = __ldcw_align(lock);
 	if (unlikely((*a != 0) && lock->babble)) {
 		lock->babble--;
-		printk(KERN_WARNING
+		pdc_printf(
 			"%s:%d: spin_unlock(%s:%p) not locked\n",
 			base_file, line_no, lock->module, lock);
 	}
@@ -150,7 +152,7 @@ void _dbg_write_lock(rwlock_t *rw, const
 	int cpu = smp_processor_id();
 	
 	if(unlikely(in_interrupt())) {	/* acquiring write lock in interrupt context, bad idea */
-		printk(KERN_WARNING "write_lock caller: %s:%d, IRQs enabled,\n", bfile, bline);
+		pdc_printf("write_lock caller: %s:%d, IRQs enabled,\n", bfile, bline);
 		BUG();
 	}
 
@@ -167,7 +169,7 @@ retry:
 		
 		stuck--;
 		if ((unlikely(stuck <= 0)) && (rw->counter < 0)) {
-			printk(KERN_WARNING
+			pdc_printf(
 				"%s:%d: write_lock stuck on writer"
 				" in %s at %p(%d) %ld ticks\n",
 				bfile, bline, current->comm, inline_pc,
@@ -176,7 +178,7 @@ retry:
 			printed = 1;
 		}
 		else if (unlikely(stuck <= 0)) {
-			printk(KERN_WARNING
+			pdc_printf(
 				"%s:%d: write_lock stuck on reader"
 				" in %s at %p(%d) %ld ticks\n",
 				bfile, bline, current->comm, inline_pc,
@@ -194,7 +196,7 @@ retry:
 	rw->counter = -1; /* remember we are locked */
 
 	if (unlikely(printed)) {
-		printk(KERN_WARNING
+		pdc_printf(
 			"%s:%d: write_lock grabbed in %s at %p(%d) %ld ticks\n",
 			bfile, bline, current->comm, inline_pc,
 			cpu, jiffies - started);
@@ -215,7 +217,7 @@ void _dbg_read_lock(rwlock_t * rw, const
 
 	rw->counter++;
 #if 0
-	printk(KERN_WARNING
+	pdc_printf(
 		"%s:%d: read_lock grabbed in %s at %p(%d) %ld ticks\n",
 		bfile, bline, current->comm, inline_pc,
 		cpu, jiffies - started);
--- include/asm-parisc/pdc.h	10 Jul 2004 07:51:15 -0000	1.8
+++ include/asm-parisc/pdc.h	30 Jul 2004 00:47:58 -0000
@@ -754,6 +754,7 @@ void pdc_io_reset_devices(void);
 int pdc_iodc_getc(void);
 void pdc_iodc_putc(unsigned char c);
 void pdc_iodc_outc(unsigned char c);
+void pdc_printf(const char *fmt, ...);
 
 void pdc_emergency_unlock(void);
 int pdc_sti_call(unsigned long func, unsigned long flags,


-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
