Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85DF34829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Nov 2002 22:41:57 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 189fQb-0001Bf-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 07 Nov 2002 00:42:05 -0500
Date: Thu, 7 Nov 2002 00:42:04 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021107054204.GA4465@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Subject: [parisc-linux] If you feel bored, test these 2.5 changes...
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

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


pa's,

If you feel good and bored, or willing to test something,
the following cvs diff needs atleast a round of tests in 
2.5 before I commit. Right now I'm *uber* busy with glibc,
and tausq hid my kernel tree ;)

- Added the last enumerations to the cpu list.
	= These are probably incorrect.

- Forward port of trap handler changes.
	= Virtually identical to 2.4 code which 
	= has been running for almost 5 months without
	= problems.

- Added a code comment about non-returning functions.
	= Purely cosmetic...

Apply, test and get back to the list? :)

c.


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="traps-fault-2.5.changes"

Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/setup.c,v
retrieving revision 1.9
diff -u -p -r1.9 setup.c
--- arch/parisc/kernel/setup.c	5 Nov 2002 22:16:49 -0000	1.9
+++ arch/parisc/kernel/setup.c	7 Nov 2002 05:31:26 -0000
@@ -212,6 +212,11 @@ static void parisc_proc_mkdir(void)
                         proc_runway_root = proc_mkdir("bus/runway", 0);
                 }
                 break;
+	case pcx:
+	case pcxs:
+	case pcxt:
+		/* Are not assured to have any of the above busses */
+		break;
 	}
 }
 
Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/traps.c,v
retrieving revision 1.16
diff -u -p -r1.16 traps.c
--- arch/parisc/kernel/traps.c	2 Nov 2002 03:00:29 -0000	1.16
+++ arch/parisc/kernel/traps.c	7 Nov 2002 05:31:26 -0000
@@ -434,9 +434,17 @@ void parisc_terminate(char *msg, struct 
 	if (!console_drivers)
 		pdc_console_restart();
 
-	if (code == 1)
-	    transfer_pim_to_trap_frame(regs);
+        /* Not all switch paths will gutter the processor... */
+        switch(code){
+
+        case 1:
+                transfer_pim_to_trap_frame(regs);
+                break;
 
+	default:
+		/* Fall through */
+	}
+		
 	show_stack((unsigned long *)regs->gr[30]);
 
 	printk("\n");
@@ -451,6 +459,7 @@ void parisc_terminate(char *msg, struct 
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
+	/* Gutter the processor */
 	for(;;)
 	    ;
 }
@@ -547,6 +556,7 @@ void handle_interruption(int code, struc
 
 		die_if_kernel("Privileged register usage", regs, code);
 		si.si_code = ILL_PRVREG;
+		/* Fall Through */		
 	give_sigill:
 		si.si_signo = SIGILL;
 		si.si_errno = 0;
@@ -561,21 +571,42 @@ void handle_interruption(int code, struc
 		si.si_addr = (void *) regs->iaoq[0];
 		force_sig_info(SIGFPE, &si, current);
 		return;
-
+		
+        case 13:
+		/* Conditional Trap:
+		   Thee condition succees in an instruction which traps on condition  */
+		si.si_signo = SIGFPE;
+		/* Set to zero, and let the userspace app figure it out from
+		   the insn pointed to by si_addr */
+		si.si_code = 0;
+		si.si_addr = (void *) regs->iaoq[0];
+		force_sig_info(SIGFPE, &si, current);
+		return;
+												
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
 		die_if_kernel("Floating point exception", regs, 0); /* quiet */
 		handle_fpe(regs);
 		return;
 
-	case 17:
+	case 15:
+		/* Data TLB miss fault/Data page fault */
+		/* Fall thru */
+	case 16:
+		/* Non-access instruction TLB miss fault */
+		/* The instruction TLB entry needed for the target address of the FIC
+		   is absent, and hardware can't find it, so we get to cleanup */
+		/* Fall thru */			
+        case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
-		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+		/* TODO: Understand what is meant by the TODO listed
+		   above this one. (Carlos) */
 		
 		fault_address = regs->ior;
-		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
-
+		fault_space = regs->isr;
+		break;
+								
 	case 18:
 		/* PCXS only -- later cpu's split this into types 26,27 & 28 */
 		/* Check for unaligned access */
@@ -585,7 +616,6 @@ void handle_interruption(int code, struc
 		}
 		/* Fall Through */
 
-	case 15: /* Data TLB miss fault/Data page fault */
 	case 26: /* PCXL: Data memory access rights trap */
 		fault_address = regs->ior;
 		fault_space   = regs->isr;
@@ -710,7 +740,7 @@ void handle_interruption(int code, struc
 	    {
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
-	
+		/* NOT REACHED */	
 	    }
 	}
 
Index: arch/parisc/mm/fault.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/mm/fault.c,v
retrieving revision 1.3
diff -u -p -r1.3 fault.c
--- arch/parisc/mm/fault.c	20 Jul 2002 16:27:06 -0000	1.3
+++ arch/parisc/mm/fault.c	7 Nov 2002 05:31:26 -0000
@@ -257,7 +257,8 @@ no_context:
 	}
 
 	parisc_terminate("Bad Address (null pointer deref?)", regs, code, address);
-
+	/* NOT REACHED */
+	
   out_of_memory:
 	up_read(&mm->mmap_sem);
 	printk(KERN_CRIT "VM: killing process %s\n", current->comm);

--h31gzZEtNLTqOjlF--
