Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D5564841
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 14:03:20 -0700 (MST)
Date: Sat, 8 Nov 2003 15:58:25 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: Randolph Chung <tausq@debian.org>
Message-ID: <20031108205825.GI21080@systemhalted>
References: <20031108205955.7039B49402D@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031108205955.7039B49402D@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
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

On Sat, Nov 08, 2003 at 01:59:55PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	03/11/08 13:59:55
> 
> Modified files:
> 	arch/parisc/kernel: traps.c 
> 
> Log message:
> Cleanup trap handling for codes 13,15,16 and 17. In particular forward port 13, and make 17 non-fatal to the kernel (only the process should die).

tausq,

Here's the trap handler cleanup I promised. Please comment.

c.

Index: Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/Makefile,v
retrieving revision 1.83
diff -u -p -r1.83 Makefile
--- Makefile	2 Nov 2003 04:40:49 -0000	1.83
+++ Makefile	8 Nov 2003 20:53:32 -0000
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 0
-EXTRAVERSION = -test9-pa4
+EXTRAVERSION = -test9-pa5
 
 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"
Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/traps.c,v
retrieving revision 1.10
diff -u -p -r1.10 traps.c
--- arch/parisc/kernel/traps.c	8 Oct 2003 20:52:07 -0000	1.10
+++ arch/parisc/kernel/traps.c	8 Nov 2003 20:53:35 -0000
@@ -557,20 +557,41 @@ void handle_interruption(int code, struc
 		si.si_addr = (void *) regs->iaoq[0];
 		force_sig_info(SIGFPE, &si, current);
 		return;
-
+		
+	case 13:
+		/* Conditional Trap
+		   The condition succees in an instruction which traps 
+		   on condition  */
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
-
+		
+	case 15:
+		/* Data TLB miss fault/Data page fault */
+		/* Fall through */
+	case 16:
+		/* Non-access instruction TLB miss fault */
+		/* The instruction TLB entry needed for the target address of the FIC
+		   is absent, and hardware can't find it, so we get to cleanup */
+		/* Fall through */
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
-		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
-		
+		/* TODO: Understand what is meant by the TODO listed
+		         above this one. (Carlos) */
 		fault_address = regs->ior;
-		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
+		fault_space = regs->isr;
+		break;
 
 	case 18:
 		/* PCXS only -- later cpu's split this into types 26,27 & 28 */
@@ -580,9 +601,8 @@ void handle_interruption(int code, struc
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
@@ -638,7 +658,6 @@ void handle_interruption(int code, struc
 			up_read(&current->mm->mmap_sem);
 		}
 		/* Fall Through */
-
 	case 27: 
 		/* Data memory protection ID trap */
 		die_if_kernel("Protection id trap", regs, code);
