From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Fri, 20 Jul 2007 23:40:39 +0200
Message-ID: <200707202340.39353.deller__36976.7388249331$1416624415$gmane$org@gmx.de>
References: <200707151935.27525.deller@gmx.de>
	<200707151849.l6FInDB4011476@hiauly1.hia.nrc.ca>
	<20070715185511.GB9938@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070715185511.GB9938@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 15 July 2007, Randolph Chung wrote:
> > I find the dumps useful.  While in most cases gdb is necessary
> > to fix bugs, it's not 100 % reliable when used to examine core
> > dumps (sorry Randolph).  The getdents bug that I tracked down
> > a few weeks ago was a case in point.
> 
> I agree the dumps are a useful tool in addition to gdb; [....]

Ok, here is an updated patch.
As requested by you I kept the register dump and in addition added full 
string table of the interrupts/traps.

New example:
a.out(1876): Data TLB miss fault/Data page fault (trap #15) for addr 0x0000aabb at ip=0x000105c4
<here comes the full register dump>

Please test.

Helge
______________________
Changes:
- some minor code path cleanups (const strings, drop unneeded return values)
- converted all traps to the form <application>(<pid>): <type_of_crash> (<crash_id>) ...
- use instruction_pointer() macro instead of "regs->iaoq[0] & ~3" 
- mark parisc_terminate() with __noreturn
- added interruption/trap description table

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index bbf029a..0f71d23 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -51,7 +51,7 @@
 DEFINE_SPINLOCK(pa_dbit_lock);
 #endif
 
-static int printbinary(char *buf, unsigned long x, int nbits)
+static void printbinary(char *buf, unsigned long x, int nbits)
 {
 	unsigned long mask = 1UL << (nbits - 1);
 	while (mask != 0) {
@@ -59,8 +59,6 @@ static int printbinary(char *buf, unsigned long x, int nbits)
 		mask >>= 1;
 	}
 	*buf = '\0';
-
-	return nbits;
 }
 
 #ifdef CONFIG_64BIT
@@ -75,7 +73,7 @@ static int printbinary(char *buf, unsigned long x, int nbits)
 		lvl, f, (x), (x+3), (r)[(x)+0], (r)[(x)+1],		\
 		(r)[(x)+2], (r)[(x)+3])
 
-static void print_gr(char *level, struct pt_regs *regs)
+static void print_gr(const char *level, struct pt_regs *regs)
 {
 	int i;
 	char buf[64];
@@ -89,7 +87,7 @@ static void print_gr(char *level, struct pt_regs *regs)
 		PRINTREGS(level, regs->gr, "r", RFMT, i);
 }
 
-static void print_fr(char *level, struct pt_regs *regs)
+static void print_fr(const char *level, struct pt_regs *regs)
 {
 	int i;
 	char buf[64];
@@ -119,7 +117,7 @@ static void print_fr(char *level, struct pt_regs *regs)
 void show_regs(struct pt_regs *regs)
 {
 	int i;
-	char *level;
+	const char *level;
 	unsigned long cr30, cr31;
 
 	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
@@ -212,16 +210,16 @@ int is_valid_bugaddr(unsigned long iaoq)
 	return 1;
 }
 
-void die_if_kernel(char *str, struct pt_regs *regs, long err)
+void die_if_kernel(const char *str, struct pt_regs *regs, long err)
 {
 	if (user_mode(regs)) {
 		if (err == 0)
 			return; /* STFU */
 
-		printk(KERN_CRIT "%s (pid %d): %s (code %ld) at " RFMT "\n",
-			current->comm, current->pid, str, err, regs->iaoq[0]);
 #ifdef PRINT_USER_FAULTS
-		/* XXX for debugging only */
+		printk(KERN_CRIT "%s(%d): %s (code %ld) at " RFMT "\n",
+			current->comm, current->pid, str, err, 
+			instruction_pointer(regs));
 		show_regs(regs);
 #endif
 		return;
@@ -251,7 +249,7 @@ KERN_CRIT "                     ||     ||\n");
 		pdc_console_restart();
 	
 	if (err)
-		printk(KERN_CRIT "%s (pid %d): %s (code %ld)\n",
+		printk(KERN_CRIT "%s(%d): %s (code %ld)\n",
 			current->comm, current->pid, str, err);
 
 	/* Wot's wrong wif bein' racy? */
@@ -292,7 +290,7 @@ static void handle_gdb_break(struct pt_regs *regs, int wot)
 	si.si_signo = SIGTRAP;
 	si.si_errno = 0;
 	si.si_code = wot;
-	si.si_addr = (void __user *) (regs->iaoq[0] & ~3);
+	si.si_addr = (void __user *) instruction_pointer(regs);
 	force_sig_info(SIGTRAP, &si, current);
 }
 
@@ -303,7 +301,7 @@ static void handle_break(struct pt_regs *regs)
 	if (unlikely(iir == PARISC_BUG_BREAK_INSN && !user_mode(regs))) {
 		/* check if a BUG() or WARN() trapped here.  */
 		enum bug_trap_type tt;
-		tt = report_bug(regs->iaoq[0] & ~3, regs);
+		tt = report_bug(instruction_pointer(regs), regs);
 		if (tt == BUG_TRAP_TYPE_WARN) {
 			regs->iaoq[0] += 4;
 			regs->iaoq[1] += 4;
@@ -315,9 +313,9 @@ static void handle_break(struct pt_regs *regs)
 
 #ifdef PRINT_USER_FAULTS
 	if (unlikely(iir != GDB_BREAK_INSN)) {
-		printk(KERN_DEBUG "break %d,%d: pid=%d command='%s'\n",
-			iir & 31, (iir>>13) & ((1<<13)-1),
-			current->pid, current->comm);
+		printk(KERN_DEBUG "%s(%d): break %d,%d\n",
+			current->comm, current->pid,
+			iir & 31, (iir>>13) & ((1<<13)-1));
 		show_regs(regs);
 	}
 #endif
@@ -415,9 +413,11 @@ void transfer_pim_to_trap_frame(struct pt_regs *regs)
  * has gone clearly wrong. We get called for faults in kernel space,
  * and HPMC's.
  */
-void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long offset)
+void __noreturn parisc_terminate(const char *msg, struct pt_regs *regs,
+				 unsigned long code, unsigned long offset)
 {
 	static DEFINE_SPINLOCK(terminate_lock);
+	struct unwind_frame_info info;
 
 	oops_in_progress = 1;
 
@@ -433,27 +433,15 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 		pdc_console_restart();
 
 	/* Not all paths will gutter the processor... */
-	switch(code){
-
-	case 1:
+	if (code == 1)
 		transfer_pim_to_trap_frame(regs);
-		break;
-
-	default:
-		/* Fall through */
-		break;
-
-	}
 	    
-	{
-		/* show_stack(NULL, (unsigned long *)regs->gr[30]); */
-		struct unwind_frame_info info;
-		unwind_frame_init(&info, current, regs);
-		do_show_stack(&info);
-	}
+	/* show_stack(NULL, (unsigned long *)regs->gr[30]); */
+	unwind_frame_init(&info, current, regs);
+	do_show_stack(&info);
 
 	printk("\n");
-	printk(KERN_CRIT "%s: Code=%d regs=%p (Addr=" RFMT ")\n",
+	printk(KERN_CRIT "%s: trap=%ld regs=%p (Addr=" RFMT ")\n",
 			msg, code, regs, offset);
 	show_regs(regs);
 
@@ -476,7 +464,46 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 	panic(msg);
 }
 
-void handle_interruption(int code, struct pt_regs *regs)
+static const char * const interruption_txt[] = {
+	[1] = "High-priority machine check (HPMC)",
+	[2] = "Power failure interrupt",
+	[3] = "Recovery counter trap",
+	[4] = "External interrupt trap",
+	[5] = "Low-priority machine check",
+	[6] = "Instruction TLB miss fault/Instruction page fault",
+	[7] = "Instruction memory protection trap",
+	[8] = "Illegal instruction trap",
+	[9] = "Break instruction trap",
+	[10] = "Privileged operation trap",
+	[11] = "Privileged register trap",
+	[12] = "Overflow trap",
+	[13] = "Conditional trap",
+	[14] = "Assist exception trap",
+	[15] = "Data TLB miss fault/Data page fault",
+	[16] = "Non-access instruction TLB miss fault",
+	[17] = "Non-access data TLB miss fault/Non-access data page fault",
+	[18] = "Unaligned access trap",
+	[19] = "Data memory break trap",
+	[21] = "Page reference trap",
+	[25] = "Taken branch trap",
+	[26] = "Data memory access rights trap",
+	[27] = "Data memory protection ID trap",
+	[28] = "Unaligned data reference trap",
+	[29] = "Performance monitor interrupt",
+	[30] = "Instruction debug trap",
+};
+
+const char * interruption_descr(unsigned long code)
+{
+	if (code >= ARRAY_SIZE(interruption_txt) ||
+		!interruption_txt[code] )
+		return "Unknown interruption trap"; 
+	else
+		return interruption_txt[code];
+}
+
+
+void handle_interruption(unsigned int code, struct pt_regs *regs)
 {
 	unsigned long fault_address = 0;
 	unsigned long fault_space = 0;
@@ -529,13 +556,13 @@ void handle_interruption(int code, struct pt_regs *regs)
 		/* set up a new led state on systems shipped with a LED State panel */
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_HPMC);
 		    
-	    	parisc_terminate("High Priority Machine Check (HPMC)",
-				regs, code, 0);
+	    	parisc_terminate(interruption_txt[1], regs, code, 0);
 		/* NOT REACHED */
 		
 	case  2:
 		/* Power failure interrupt */
-		printk(KERN_CRIT "Power failure interrupt !\n");
+		printk(KERN_CRIT "%s\n", interruption_txt[2]);
+		kill_cad_pid(SIGPWR, 1);
 		return;
 
 	case  3:
@@ -563,7 +590,7 @@ void handle_interruption(int code, struct pt_regs *regs)
 
 	case  8:
 		/* Illegal instruction trap */
-		die_if_kernel("Illegal instruction", regs, code);
+		die_if_kernel(interruption_txt[8], regs, code);
 		si.si_code = ILL_ILLOPC;
 		goto give_sigill;
 
@@ -574,7 +601,7 @@ void handle_interruption(int code, struct pt_regs *regs)
 	
 	case 10:
 		/* Privileged operation trap */
-		die_if_kernel("Privileged operation", regs, code);
+		die_if_kernel(interruption_txt[10], regs, code);
 		si.si_code = ILL_PRVOPC;
 		goto give_sigill;
 	
@@ -597,7 +624,7 @@ void handle_interruption(int code, struct pt_regs *regs)
 			return;
 		}
 
-		die_if_kernel("Privileged register usage", regs, code);
+		die_if_kernel(interruption_txt[11], regs, code);
 		si.si_code = ILL_PRVREG;
 	give_sigill:
 		si.si_signo = SIGILL;
@@ -632,7 +659,7 @@ void handle_interruption(int code, struct pt_regs *regs)
 		
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
-		die_if_kernel("Floating point exception", regs, 0); /* quiet */
+		die_if_kernel(interruption_txt[14], regs, 0); /* quiet */
 		handle_fpe(regs);
 		return;
 		
@@ -727,7 +754,7 @@ void handle_interruption(int code, struct pt_regs *regs)
 		/* Fall Through */
 	case 27: 
 		/* Data memory protection ID trap */
-		die_if_kernel("Protection id trap", regs, code);
+		die_if_kernel(interruption_descr(code), regs, code);
 		si.si_code = SEGV_MAPERR;
 		si.si_signo = SIGSEGV;
 		si.si_errno = 0;
@@ -746,8 +773,8 @@ void handle_interruption(int code, struct pt_regs *regs)
 	default:
 		if (user_mode(regs)) {
 #ifdef PRINT_USER_FAULTS
-			printk(KERN_DEBUG "\nhandle_interruption() pid=%d command='%s'\n",
-			    current->pid, current->comm);
+			printk(KERN_DEBUG "%s(%d): unknown trap %d in handle_interruption().\n",
+			    current->comm, current->pid, code);
 			show_regs(regs);
 #endif
 			/* SIGBUS, for lack of a better one. */
@@ -767,12 +794,12 @@ void handle_interruption(int code, struct pt_regs *regs)
 	if (user_mode(regs)) {
 	    if ((fault_space >> SPACEID_SHIFT) != (regs->sr[7] >> SPACEID_SHIFT)) {
 #ifdef PRINT_USER_FAULTS
+		printk(KERN_DEBUG "%s(%d): ", current->comm, current->pid);
 		if (fault_space == 0)
-			printk(KERN_DEBUG "User Fault on Kernel Space ");
+			printk("User Fault on Kernel Space\n");
 		else
-			printk(KERN_DEBUG "User Fault (long pointer) (fault %d) ",
+			printk("User Fault (long pointer) (trap #%d)\n",
 			       code);
-		printk("pid=%d command='%s'\n", current->pid, current->comm);
 		show_regs(regs);
 #endif
 		si.si_signo = SIGSEGV;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index f6f6755..ef6394f 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -36,7 +36,7 @@
 DEFINE_PER_CPU(struct exception_data, exception_data);
 
 /*
- * parisc_acctyp(unsigned int inst) --
+ * parisc_acctyp(unsigned long code, unsigned int inst) --
  *    Given a PA-RISC memory access instruction, determine if the
  *    the instruction would perform a memory read or memory write
  *    operation.
@@ -208,13 +208,10 @@ bad_area:
 		struct siginfo si;
 
 #ifdef PRINT_USER_FAULTS
-		printk(KERN_DEBUG "\n");
-		printk(KERN_DEBUG "do_page_fault() pid=%d command='%s' type=%lu address=0x%08lx\n",
-		    tsk->pid, tsk->comm, code, address);
-		if (vma) {
-			printk(KERN_DEBUG "vm_start = 0x%08lx, vm_end = 0x%08lx\n",
-					vma->vm_start, vma->vm_end);
-		}
+		printk(KERN_DEBUG "%s(%d): %s (trap #%ld) for "
+				  "addr 0x%08lx at ip=0x%08lx\n",
+			tsk->comm, tsk->pid, interruption_descr(code), 
+			code, address, instruction_pointer(regs));
 		show_regs(regs);
 #endif
 		/* FIXME: actually we need to get the signo and code correct */
diff --git a/include/asm-parisc/traps.h b/include/asm-parisc/traps.h
index 1945f99..ee92563 100644
--- a/include/asm-parisc/traps.h
+++ b/include/asm-parisc/traps.h
@@ -5,8 +5,9 @@
 struct pt_regs;
 
 /* traps.c */
-void parisc_terminate(char *msg, struct pt_regs *regs,
-		int code, unsigned long offset);
+const char * interruption_descr(unsigned long code);
+void __noreturn parisc_terminate(const char *msg, struct pt_regs *regs,
+		unsigned long code, unsigned long offset);
 
 /* mm/fault.c */
 void do_page_fault(struct pt_regs *regs, unsigned long code,
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
