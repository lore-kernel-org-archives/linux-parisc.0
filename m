From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] handle_interruption should restore I-bit state.
Date: Tue, 17 Aug 2004 14:57:50 -0400
Message-ID: <20040817185750.GT27047@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 LaMont Jones <lamont@debian.org>,
 John Marvin <jsm@udlkern.fc.hp.com>,
 Randolph Chung <tausq@debian.org>
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


pa,

I believe that handle_interruption should honour the previous state of
the I-bit and should save/restore the state around the rest of the
functions.

For example if some assembly code traps with I-bit off, when it comes
back to the code the I-bit should still be off, even it had been
temporarily turned on for the sake of the trap.

What do people think? I wonder if I can get jsm's quick comment on this
fact, he mentioned at OLS that he thought we should probably be
saving/restoring I-bit state from the exception handler.

Cheers,
Carlos.

Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/traps.c,v
retrieving revision 1.18
diff -u -p -r1.18 traps.c
--- arch/parisc/kernel/traps.c	9 Aug 2004 16:38:41 -0000	1.18
+++ arch/parisc/kernel/traps.c	17 Aug 2004 18:50:15 -0000
@@ -431,11 +431,15 @@ void handle_interruption(int code, struc
 	unsigned long fault_address = 0;
 	unsigned long fault_space = 0;
 	struct siginfo si;
+	unsigned long flags;
 
-	if (code == 1)
+	if (code == 1) {
 	    pdc_console_restart();  /* switch back to pdc if HPMC */
-	else
+	}
+	else {
+	    local_irq_save(flags);
 	    local_irq_enable();
+	}
 
 #if 0
 	printk(KERN_CRIT "Interruption # %d\n", code);
@@ -710,6 +714,9 @@ void handle_interruption(int code, struc
 	}
 
 	do_page_fault(regs, code, fault_address);
+	/* We know we are note code==1, the first case
+	   handles this. So we restore the PSW state */
+	local_irq_restore(flags);
 }
 
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
