Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89700482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 15:26:45 -0700 (MST)
Date: Tue, 25 Mar 2003 17:27:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: Randolph Chung <tausq@debian.org>
Message-ID: <20030325222709.GB27813@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Trap handlers in 2.5
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

PA,

I noticed that Randolph made a comment about user traps crashing boxes,
and this sounded like some of changes I made to 2.4 in order to fix a
similar issue. Turns out it might be one of those fixes I forgot to send
to 2.5. Here's a diff against my 2.5 tree.

Please comment.

- Added Conditional Trap handler.
- Added Trap 16.
- Made Trap 17 non fatal.
- Put Trap 15 in a numerically ordered position.

This comes from my reading of the PA 1.1 and 2.0 spec, which may be
flawed, but the following works. It also stops users from FIC'ing into
unmapped pages and crashing the box, something that is wholely
unacceptable.

I don't have the time to commit and test this, would someone like to do
this? I'm busy with glibc right now :(

Index: traps.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/traps.c,v
retrieving revision 1.22
diff -u -p -r1.22 traps.c
--- traps.c	14 Feb 2003 15:46:27 -0000	1.22
+++ traps.c	25 Mar 2003 22:19:35 -0000
@@ -545,19 +545,39 @@ void handle_interruption(int code, struc
 		force_sig_info(SIGFPE, &si, current);
 		return;
 
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
+		
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
 		die_if_kernel("Floating point exception", regs, 0); /* quiet */
 		handle_fpe(regs);
 		return;
-
+		
+        case 15:
+		/* Data TLB miss fault/Data page fault */
+		/* Fall thru */
+        case 16:
+		/* Non-access instruction TLB miss fault */
+		/* The instruction TLB entry needed for the target address of the FIC
+		 * is absent, and hardware can't find it, so we get to cleanup */
+		/* Fall thru */
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
-		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
-		
+		/* TODO: Understand what is meant by the TODO listed
+		 * above this one. (Carlos) */
 		fault_address = regs->ior;
-		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
+		fault_space = regs->isr;
+		break;
 
 	case 18:
 		/* PCXS only -- later cpu's split this into types 26,27 & 28 */
@@ -567,8 +587,6 @@ void handle_interruption(int code, struc
 			return;
 		}
 		/* Fall Through */
-
-	case 15: /* Data TLB miss fault/Data page fault */
 	case 26: /* PCXL: Data memory access rights trap */
 		fault_address = regs->ior;
 		fault_space   = regs->isr;
