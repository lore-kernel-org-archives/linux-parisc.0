From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] Call panic() in parisc_terminate() again...
Date: Tue, 17 Aug 2004 02:04:27 -0400
Message-ID: <20040817060427.GR27047@baldric.uwo.ca>
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


willy, 

Can I chedk this in? I promise I'll fix this up properly :)
Two comments and two minor code changes. I promise to fixup the panic
notifiers later, but I would like to get this into our tree so it works
for people who want a reboot or the panic code to run the notifiers for
all the other subsystems.

c.

Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/traps.c,v
retrieving revision 1.18
diff -u -p -r1.18 traps.c
--- arch/parisc/kernel/traps.c	9 Aug 2004 16:38:41 -0000	1.18
+++ arch/parisc/kernel/traps.c	17 Aug 2004 06:00:32 -0000
@@ -373,9 +373,9 @@ void transfer_pim_to_trap_frame(struct p
 
 
 /*
- * This routine handles page faults.  It determines the address,
- * and the problem, and then passes it off to one of the appropriate
- * routines.
+ * This routine is called as a last resort when everything else
+ * has gone clearly wrong. We get called for faults in kernel space,
+ * and HPMC's.
  */
 void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long offset)
 {
@@ -421,9 +421,16 @@ void parisc_terminate(char *msg, struct 
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
-	/* Gutter the processor! */
-	for(;;)
-	    ;
+	/* Call kernel panic() so reboot timeouts work properly 
+	 * FIXME: This function should be on the list of
+	 * panic notifiers, and we should call panic
+	 * directly from the location that we wish. 
+	 * e.g. We should not call panic from
+	 * parisc_terminate, but rather the other way around.
+	 * This hack works, prints the panic message twice,
+	 * and it enables reboot timers!
+	 */
+	panic(msg);
 }
 
 void handle_interruption(int code, struct pt_regs *regs)
@@ -565,9 +572,16 @@ void handle_interruption(int code, struc
 		/* Fall through */
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
-		/* TODO: Still need to add slow path emulation code here */
-		/* TODO: Understand what is meant by the TODO listed
-		         above this one. (Carlos) */
+		/* FIXME: 
+		 	 Still need to add slow path emulation code here!
+		         If the insn used a non-shadow register, then the tlb
+			 handlers could not have their side-effect (e.g. probe
+			 writing to a target register) emulated since rfir would
+			 erase the changes to said register. Instead we have to
+			 setup everything, call this function we are in, and emulate
+			 by hand. Technically we need to emulate:
+			 fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw
+		*/			  
 		fault_address = regs->ior;
 		fault_space = regs->isr;
 		break;
@@ -677,7 +691,7 @@ void handle_interruption(int code, struc
 	}
 
 	if (user_mode(regs)) {
-	    if ((fault_space>>SPACEID_SHIFT) != (regs->sr[7] >> SPACEID_SHIFT)) {
+	    if ((fault_space >> SPACEID_SHIFT) != (regs->sr[7] >> SPACEID_SHIFT)) {
 #ifdef PRINT_USER_FAULTS
 		if (fault_space == 0)
 			printk(KERN_DEBUG "User Fault on Kernel Space ");
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
