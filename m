Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 3 Nov 2002 19:58:13 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20021104005813.GB4192@systemhalted>
References: <20021104004626.651BC4829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
In-Reply-To: <20021104004626.651BC4829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
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

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	carlos	02/11/03 17:46:26
> 
> Modified files:
> 	arch/parisc/kernel: traps.c 
> 
> Log message:
> Add support for Trap 13 (Conditionals). Fix Trap 16/17 so they don't hose the processor. Cosmetic changes and the addition of a few comments.
> 

This code has been sitting in my tree since Krystof managed to figure
out a really cool way to hang my C3K and A500. It looks like FIC'ing
into an unmapped page will cause a Trap 17, which should really signal
the process and not gutter the processor in parisc_termiante.

I also added a somewhat shakey implementation of Trap 13, based on a
reverse engineering of old code that was meant for HP/UX.

Initially Grant and myself took the code to Frank Rowand, who admitted
that his PARISC knowledge was too out of date to validate the patch.

Jsm, I know you're busy, so I've just put the code into CVS, even if
it's wrong it's a closer step towards correctness :) It also stops
regular users from hosing the box.

c.



--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="traps.diff"

Index: traps.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/traps.c,v
retrieving revision 1.66
diff -u -p -r1.66 traps.c
--- traps.c	21 Oct 2002 15:31:56 -0000	1.66
+++ traps.c	4 Nov 2002 00:38:59 -0000
@@ -426,7 +426,7 @@ void transfer_pim_to_trap_frame(struct p
 
 
 /*
- * This routine handles page faults.  It determines the address,
+ * This routine handles various exception codes.  It determines the address,
  * and the problem, and then passes it off to one of the appropriate
  * routines.
  */
@@ -445,8 +445,18 @@ void parisc_terminate(char *msg, struct 
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
+		break;
+	}
 
 	show_stack(regs);
 
@@ -462,6 +472,7 @@ void parisc_terminate(char *msg, struct 
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
+	/* Gutter the processor... */
 	for(;;)
 	    ;
 }
@@ -562,6 +573,7 @@ void handle_interruption(int code, struc
 
 		die_if_kernel("Privileged register usage", regs, code);
 		si.si_code = ILL_PRVREG;
+		/* Fall thru */
 	give_sigill:
 		si.si_signo = SIGILL;
 		si.si_errno = 0;
@@ -576,6 +588,17 @@ void handle_interruption(int code, struc
 		si.si_addr = (void *) regs->iaoq[0];
 		force_sig_info(SIGFPE, &si, current);
 		return;
+	
+	case 13:
+		/* Conditional Trap 
+		   The condition succees in an instruction which traps on condition  */
+		si.si_signo = SIGFPE;
+		/* Set to zero, and let the userspace app figure it out from
+		   the insn pointed to by si_addr */
+		si.si_code = 0;
+		si.si_addr = (void *) regs->iaoq[0];
+		force_sig_info(SIGFPE, &si, current);
+		return;
 
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
@@ -583,14 +606,22 @@ void handle_interruption(int code, struc
 		handle_fpe(regs);
 		return;
 
+	case 15: 
+		/* Data TLB miss fault/Data page fault */	
+		/* Fall thru */
+	case 16:
+		/* Non-access instruction TLB miss fault */
+		/* The instruction TLB entry needed for the target address of the FIC
+		   is absent, and hardware can't find it, so we get to cleanup */
+		/* Fall thru */
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
-		
-		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
-
+		/* TODO: Understand what is meant by the TODO listed 
+		   above this one. (Carlos) */
 		fault_address = regs->ior;
-		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
+		fault_space = regs->isr;
+		break;
 
 	case 18:
 		/* PCXS only -- later cpu's split this into types 26,27 & 28 */
@@ -600,9 +631,8 @@ void handle_interruption(int code, struc
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
@@ -632,6 +662,11 @@ void handle_interruption(int code, struc
 		pt_regs_to_ssp(regs, &ssp);
 		kgdb_trap(I_TAKEN_BR, &ssp, 1);
 		ssp_to_pt_regs(&ssp, regs);
+
+		/* FIXME: Should this break without setting fault_address
+		   and fault_space? They are required for the dump later on.
+		   (Carlos) */
+		
 		break;
 #endif /* CONFIG_KWDB */
 
@@ -667,7 +702,6 @@ void handle_interruption(int code, struc
 			up_read(&current->mm->mmap_sem);
 		}
 		/* Fall Through */
-
 	case 27: 
 		/* Data memory protection ID trap */
 		die_if_kernel("Protection id trap", regs, code);
@@ -734,8 +768,8 @@ void handle_interruption(int code, struc
 
 	    if (fault_space == 0) {
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
-
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
+		/** NOT REACHED **/
 	    }
 	}
 

--x+6KMIRAuhnl3hBn--
