Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80B494872
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 07:39:14 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id JAA28860
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 09:39:09 -0400
Message-Id: <200109291339.JAA28860@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Sat, 29 Sep 2001 09:39:09 -0400
Sender: jurij@mail.lokmail.net
Subject: [parisc-linux] Cumulative patch for 720
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I've put together Jochen's patch of trap 18 and patch
for trap 11, corrected according to Matthew's and Jochen's
remarks, which will supposedly make all 720 people very 
happy :-). It compiles, at least.

Jurij

--- linux.orig/arch/parisc/kernel/traps.c       Wed Sep 19 12:02:30 2001
+++ linux/arch/parisc/kernel/traps.c    Sat Sep 29 15:14:18 2001
@@ -46,8 +46,12 @@
 #define PRINT_USER_FAULTS /* (turn this on if you want user faults to be */
                         /*  dumped to the console via printk)          */
 
+#define DEBUG_CASE18
+
 void handle_unaligned(struct pt_regs *regs);
 
+unsigned long parisc_acctyp(unsigned long code, unsigned int inst);
+
 static int printbinary(char *buf, unsigned long x, int nbits)
 {
        unsigned long mask = 1UL << (nbits - 1);
@@ -273,6 +277,11 @@
 {
        unsigned long fault_address = 0;
        unsigned long fault_space = 0;
+       int fromcr,togr;
+        unsigned long acc_type;
+        pte_t * pte;
+        pgd_t * pgd;
+        pmd_t * pmd;
        struct siginfo si;
 #ifdef CONFIG_KWDB
        struct save_state ssp;
@@ -322,12 +331,15 @@
                fault_address = regs->ior;
                parisc_terminate("Non access data tlb fault!",regs,code,fault_ad
dress);
 
+       pagefault:
+#ifdef DEBUG_CASE18
+               printk("to pagefault\n");
+#endif
        case 15:
        case 26:
                fault_address = regs->ior;
                fault_space   = regs->isr;
                break;
-
        case 19:
                regs->gr[0] |= PSW_X; /* So we can single-step over the trap */
                /* fall thru */
@@ -363,6 +375,24 @@
                si.si_code = ILL_PRVOPC;
                goto give_sigill;
        case 11:
+               if(!(regs->iir & 0xfc000000) && (((regs->iir & 0x1fe0)>>5) == 0x
45)) {
+                 /* This is MFCTL instruction */
+                 fromcr = (regs->iir & 0x03e00000)>>21;
+                 togr = (regs->iir & 0x1f);
+                 /* Emulate the instruction if the read is from cr27 */
+                 if(fromcr == 26) {
+                   regs->gr[togr] = mfctl(26);
+                   regs->iaoq[0] = regs->iaoq[1];
+                   regs->iaoq[1] = regs->iaoq[0] + 4;
+                   return; 
+                 } else if (fromcr == 27) {
+                   regs->gr[togr] = mfctl(27);
+                   regs->iaoq[0] = regs->iaoq[1];
+                   regs->iaoq[1] = regs->iaoq[0] + 4;
+                   return;
+                 }
+               }
+               /* Something else is wrong */
                die_if_kernel("Privileged register - shouldn't happen!", regs, c
ode);
                si.si_code = ILL_PRVREG;
        give_sigill:
@@ -415,7 +445,57 @@
                    si.si_addr = (void *) regs->ior;
                force_sig_info(SIGSEGV, &si, current);
                return;
-
+       case 18:
+#ifdef DEBUG_CASE18
+               printk(KERN_DEBUG "got case18 -");
+#endif
+               fault_address = regs->iaoq[0];
+               fault_space = regs->iasq[0];
+               
+               if (in_interrupt() || !(current->mm))
+                 goto pagefault; /* shouldn't happen */
+               /* FIXME: do propper locking here */
+               
+               /* page directory */
+               pgd = pgd_offset(current->mm, fault_address);
+               if (pgd_none(*pgd) || pgd_bad(*pgd))
+                 goto pagefault; /* expandable stack etc */
+               
+               /* middle page directory */
+               pmd = pmd_offset(pgd, fault_address);
+               if (pmd_none(*pmd) || pmd_bad(*pmd))
+                 goto pagefault; /* expandable stack etc */
+               
+               /* page table entry */
+               pte = pte_offset(pmd, fault_address);
+               if (pte_none(*pte))
+                 goto pagefault; /* expandable stack etc */
+               
+               if (!pte_present(*pte)) /* is this test sufficient? */
+                goto pagefault; /* page not loaded */
+              
+               acc_type = parisc_acctyp(code,regs->iir);
+              
+               if ((acc_type & VM_WRITE) && (!(pte_write(*pte))))
+                goto pagefault; /* Write protected access */
+
+               if ((acc_type & VM_READ) && (!(pte_read(*pte))))
+                goto pagefault; /* Read protected access */
+              
+               if ((acc_type & VM_EXEC) && (!(pte_read(*pte))))
+                       goto pagefault; /* Exec protected access */
+              
+               if (!(regs->ior & 3)) {
+#ifdef DEBUG_CASE18
+                printk("spurious? -");
+#endif
+                goto pagefault;
+               }
+               /* fall through to case 28 */
+#ifdef DEBUG_CASE18
+               printk("to unaligned\n");
+               show_regs(regs);
+#endif
        case 28:  /* Unaligned just causes SIGBUS for now */
                handle_unaligned(regs);
 #if 0
