From: Rolf Eike Beer <eike@sf-mail.de>
Subject: [PATCH] hppa: fix whitespace errors in arch/parisc/kernel/traps.c
Date: Fri, 19 Aug 2011 20:10:53 +0200
Message-ID: <201108192010.54015.eike@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Things like " \t" and whitespace at end of line. I'm leaving all the other
coding style errors here alone.

Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
---
 arch/parisc/kernel/traps.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index f19e660..2a1ba2b 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -529,10 +529,10 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	 */
 	if (((unsigned long)regs->iaoq[0] & 3) &&
 	    ((unsigned long)regs->iasq[0] != (unsigned long)regs->sr[7])) { 
-	  	/* Kill the user process later */
-	  	regs->iaoq[0] = 0 | 3;
+		/* Kill the user process later */
+		regs->iaoq[0] = 0 | 3;
 		regs->iaoq[1] = regs->iaoq[0] + 4;
-	 	regs->iasq[0] = regs->iasq[1] = regs->sr[7];
+		regs->iasq[0] = regs->iasq[1] = regs->sr[7];
 		regs->gr[0] &= ~PSW_B;
 		return;
 	}
@@ -548,8 +548,8 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 		
 		/* set up a new led state on systems shipped with a LED State panel */
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_HPMC);
-		    
-	    	parisc_terminate("High Priority Machine Check (HPMC)",
+
+		parisc_terminate("High Priority Machine Check (HPMC)",
 				regs, code, 0);
 		/* NOT REACHED */
 		
@@ -591,13 +591,13 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 		/* Break instruction trap */
 		handle_break(regs);
 		return;
-	
+
 	case 10:
 		/* Privileged operation trap */
 		die_if_kernel("Privileged operation", regs, code);
 		si.si_code = ILL_PRVOPC;
 		goto give_sigill;
-	
+
 	case 11:
 		/* Privileged register trap */
 		if ((regs->iir & 0xffdfffe0) == 0x034008a0) {
@@ -641,7 +641,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 		if(user_mode(regs)){
 			si.si_signo = SIGFPE;
 			/* Set to zero, and let the userspace app figure it out from
-		   	   the insn pointed to by si_addr */
+			   the insn pointed to by si_addr */
 			si.si_code = 0;
 			si.si_addr = (void __user *) regs->iaoq[0];
 			force_sig_info(SIGFPE, &si, current);
@@ -655,7 +655,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 		die_if_kernel("Floating point exception", regs, 0); /* quiet */
 		handle_fpe(regs);
 		return;
-		
+
 	case 15:
 		/* Data TLB miss fault/Data page fault */
 		/* Fall through */
@@ -667,15 +667,15 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* FIXME: 
-		 	 Still need to add slow path emulation code here!
-		         If the insn used a non-shadow register, then the tlb
+			 Still need to add slow path emulation code here!
+			 If the insn used a non-shadow register, then the tlb
 			 handlers could not have their side-effect (e.g. probe
 			 writing to a target register) emulated since rfir would
 			 erase the changes to said register. Instead we have to
 			 setup everything, call this function we are in, and emulate
 			 by hand. Technically we need to emulate:
 			 fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw
-		*/			  
+		*/
 		fault_address = regs->ior;
 		fault_space = regs->isr;
 		break;
-- 
1.7.6

