Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E791482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 19:50:59 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17nrE3-0003Tt-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 07 Sep 2002 21:50:59 -0400
Date: Sat, 7 Sep 2002 21:50:59 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020908015059.GN5679@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="61jdw2sOBCFtR2d/"
Subject: [parisc-linux] RFC - Changes to traps.c (Handlers for 13, changes to 16/17)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


parisc,

After some banter on IRC about how one should set the stride
for a cache flush using the 'fic' instruction, I noted the 
following possible problems our trap handler:

a. Non-access instruction TLB miss fault (16)
	- No implemented case statement in traps.c
	- No problem, falls through to do_page_fault.
	- Suggest forcing a sigsegv on the process.

b. Non-access data TLB miss fault (17)
	- Calls parisc_terminate and gutters the cpu.
	- This should not happen.
	- Suggest forcing a sigsegv on the process.

c. Conditional Trap (13)
	- No implemented case statment in traps.c
	- Suggest forcing SIGFPE and setting si_code to zero,
	  and allowing the userspace app the decode the 
	  situation from the signal andler (HPUX seems to 
	  this?) via si_addr.

c. All paths must either return or set the fault_address
   and fault_space values? One place does not, I put a 
   FIXME there. Needs review. Those two values are needed
   by the check after the switch statement in handle_interruption.
   Is setting them to zero, as is done now, good enough?

Patch attached :)

c.


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="traps.c.diff"

--- traps.c.orig	2002-09-07 21:30:15.000000000 -0400
+++ traps.c.new	2002-09-07 21:30:05.000000000 -0400
@@ -425,11 +425,11 @@
 
 
 /*
- * This routine handles page faults.  It determines the address,
+ * This routine handles various exception codes.  It determines the address,
  * and the problem, and then passes it off to one of the appropriate
  * routines.
  */
-void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long offset)
+void parisc_handle_code(char *msg, struct pt_regs *regs, int code, unsigned long offset)
 {
 	static spinlock_t terminate_lock = SPIN_LOCK_UNLOCKED;
 
@@ -444,8 +444,17 @@
 	if (!console_drivers)
 		pdc_console_restart();
 
-	if (code == 1)
-	    transfer_pim_to_trap_frame(regs);
+
+	/* Not all switch paths will gutter the processor... */
+	switch(code){
+
+	case 1:
+		transfer_pim_to_trap_frame(regs);
+		break;
+	    
+	default:
+		/* Fall through */
+	}
 
 	show_stack(regs);
 
@@ -461,6 +470,7 @@
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
+	/* Gutter the processor... */
 	for(;;)
 	    ;
 }
@@ -487,7 +497,7 @@
 
 	case  1:
 		/* High-priority machine check (HPMC) */
-		parisc_terminate("High Priority Machine Check (HPMC)",
+		parisc_handle_code("High Priority Machine Check (HPMC)",
 				regs, code, 0);
 		/* NOT REACHED */
 		
@@ -554,6 +564,7 @@
 
 		die_if_kernel("Privileged register usage", regs, code);
 		si.si_code = ILL_PRVREG;
+		/* Fall thru */
 	give_sigill:
 		si.si_signo = SIGILL;
 		si.si_errno = 0;
@@ -568,6 +579,20 @@
 		si.si_addr = (void *) regs->iaoq[0];
 		force_sig_info(SIGFPE, &si, current);
 		return;
+	
+	case 13:
+		/* Conditional Trap */
+		/* The condition succees in an instruction which traps
+		 * on condition
+		 */
+		si.si_signo = SIGFPE;
+		/* Set to zero, and let the userspace app figure it out from
+		 * the insn pointed to by si_addr 
+		 */
+		si.si_code = 0;
+		si.si_addr = (void *) regs->iaoq[0];
+		force_sig_info(SIGFPE, &si, current);
+		return;
 
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
@@ -575,11 +600,24 @@
 		handle_fpe(regs);
 		return;
 
+	case 15: 
+		/* Data TLB miss fault/Data page fault */	
+		/* Fall thru */
+	case 16:
+		/* Non-access instruction TLB miss fault */
+		/* The instruction TLB entry needed for the target address of the FIC
+		 * is absent, and hardware can't find it, so we get to cleanup
+		 */
+		/* Fall thru */
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
+		/* TODO: Understand what is meant by the TODO listed 
+		 * above this one. (Carlos - Sep 7, 2002) */
+		
 		fault_address = regs->ior;
-		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
+		fault_space = regs->isr;
+		break;
 
 	case 18:
 		/* PCXS only -- later cpu's split this into types 26,27 & 28 */
@@ -589,9 +627,8 @@
 			return;
 		}
 		/* Fall Through */
-
-	case 15: /* Data TLB miss fault/Data page fault */
-	case 26: /* PCXL: Data memory access rights trap */
+	case 26: 
+		/* PCXL: Data memory access rights trap */
 		fault_address = regs->ior;
 		fault_space   = regs->isr;
 		break;
@@ -621,6 +658,11 @@
 		pt_regs_to_ssp(regs, &ssp);
 		kgdb_trap(I_TAKEN_BR, &ssp, 1);
 		ssp_to_pt_regs(&ssp, regs);
+
+		/* FIXME: Should this break without setting fault_address
+		 * and fault_space? They are required for the dump later on.
+		 * (Carlos - Sep 7, 2002) */
+		
 		break;
 #endif /* CONFIG_KWDB */
 
@@ -656,7 +698,6 @@
 			up_read(&current->mm->mmap_sem);
 		}
 		/* Fall Through */
-
 	case 27: 
 		/* Data memory protection ID trap */
 		die_if_kernel("Protection id trap", regs, code);
@@ -690,7 +731,7 @@
 			force_sig_info(SIGBUS, &si, current);
 			return;
 		}
-		parisc_terminate("Unexpected interruption", regs, code, 0);
+		parisc_handle_code("Unexpected interruption", regs, code, 0);
 		/* NOT REACHED */
 	}
 
@@ -719,7 +760,8 @@
 	     */
 
 	    if (fault_space == 0)
-		    parisc_terminate("Kernel Fault", regs, code, fault_address);
+		    parisc_handle_code("Kernel Fault", regs, code, fault_address);
+	    /* NOT REACHED */
 	}
 
 #ifdef CONFIG_KWDB

--61jdw2sOBCFtR2d/--
