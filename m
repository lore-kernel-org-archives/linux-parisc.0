Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D0344837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 16:27:09 -0600 (MDT)
Received: from [192.168.94.3] (ppp17.scram.de [195.226.127.210])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id f8QMR6i18314
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 00:27:06 +0200 (CEST)
Date: Thu, 27 Sep 2001 00:26:31 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109270017460.1714-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 720 - some progress
List-ID: <linux-parisc.vger.kernel.org>

Hi,

i created this patch for the cause 18 on the 720. Without the patch and 
fallthrough to case 26, the following program will just hang:

#include <stdio.h>

int main()
{
  int i,j,k;
  char *p;

  i=0;
  j=1;
  k=0;

  p = (char *) &j;
  p++;
  i = *(int *) p;

  printf("%d\n",i);
}

With the patch, the output is:

sh-2.05# ./unaligned
unaligned(20): unaligned access to 0xfaf002cd at ip=0x0001050f
256
                  
So the patch appears to work correctly at least for this case...

However, the user space tools ls, tar, sleep still crash for me.
This is the dmesg output:

!!die_if_kernel: ls.x(22): Privileged register - shouldn't happen! 11
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 4019e57c 4008648f 401a057c
r4-7     401a057c 40199140 401a057c faf00318
r8-11    00000000 0001bb24 0002df58 faf000e8
r12-15   0002df58 0002df58 000c41b0 0002df58
r16-19   00000000 00000000 10350000 401cf930
r20-23   40029122 401b33f8 4019b0a0 4019fd7c
r24-27   00000000 faf00318 40199140 0002df58
r28-31   4017722c 0002f048 faf00440 40083393
sr0-3    0000002c 0000002c 00000000 0000002c
sr4-7    0000002c 0000002c 0000002c 0000002c

IASQ: 0000002c 0000002c IAOQ: 401b340f 401b3413
 IIR: 036008a4    ISR: 0000002c  IOR: 0002df58
 CPU:        0   CR30: 11b68000 CR31: 10358000
 ORIG_R28: 0002f000

Does anyone know what the cause 11 means?

Cheers,
Jochen
--- linux.orig/arch/parisc/kernel/traps.c	Wed Sep 19 12:02:30 2001
+++ linux/arch/parisc/kernel/traps.c	Thu Sep 27 00:02:23 2001
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
@@ -274,6 +278,11 @@
 	unsigned long fault_address = 0;
 	unsigned long fault_space = 0;
 	struct siginfo si;
+	unsigned long acc_type;
+	pte_t * pte;
+	pgd_t * pgd;
+	pmd_t * pmd;
+
 #ifdef CONFIG_KWDB
 	struct save_state ssp;
 #endif /* CONFIG_KWDB */   
@@ -322,12 +331,15 @@
 		fault_address = regs->ior;
 		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
 
+	pagefault:
+#ifdef DEBUG_CASE18
+		printk("to pagefault\n");
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
@@ -416,6 +428,57 @@
 		force_sig_info(SIGSEGV, &si, current);
 		return;
 
+	case 18:
+#ifdef DEBUG_CASE18
+		printk(KERN_DEBUG "got case18 -");
+#endif
+		fault_address = regs->iaoq[0];
+		fault_space = regs->iasq[0];
+
+		if (in_interrupt() || !(current->mm))
+			goto pagefault; /* shouldn't happen */
+		/* FIXME: do propper locking here */
+
+		/* page directory */
+		pgd = pgd_offset(current->mm, fault_address);
+		if (pgd_none(*pgd) || pgd_bad(*pgd))
+			goto pagefault; /* expandable stack etc */
+
+		/* middle page directory */
+		pmd = pmd_offset(pgd, fault_address);
+		if (pmd_none(*pmd) || pmd_bad(*pmd))
+		        goto pagefault; /* expandable stack etc */
+
+		/* page table entry */
+		pte = pte_offset(pmd, fault_address);
+		if (pte_none(*pte))
+		        goto pagefault; /* expandable stack etc */
+
+		if (!pte_present(*pte)) /* is this test sufficient? */
+		        goto pagefault; /* page not loaded */
+
+		acc_type = parisc_acctyp(code,regs->iir);
+
+		if ((acc_type & VM_WRITE) && (!(pte_write(*pte))))
+		        goto pagefault; /* Write protected access */
+
+		if ((acc_type & VM_READ) && (!(pte_read(*pte))))
+			goto pagefault; /* Read protected access */
+
+		if ((acc_type & VM_EXEC) && (!(pte_read(*pte))))
+		        goto pagefault; /* Exec protected access */
+
+		if (!(regs->ior & 3)) {
+#ifdef DEBUG_CASE18
+			printk("spurious? -");
+#endif
+			goto pagefault;
+		}
+		/* fall through to case 28 */
+#ifdef DEBUG_CASE18
+		printk("to unaligned\n");
+		show_regs(regs);
+#endif
 	case 28:  /* Unaligned just causes SIGBUS for now */
 		handle_unaligned(regs);
 #if 0
diff -u -r linux.orig/arch/parisc/mm/fault.c linux/arch/parisc/mm/fault.c
--- linux.orig/arch/parisc/mm/fault.c	Wed Aug 29 12:02:07 2001
+++ linux/arch/parisc/mm/fault.c	Wed Sep 26 22:54:46 2001
@@ -49,7 +49,7 @@
  *   VM_WRITE if write operation
  *   VM_EXEC  if execute operation
  */
-static unsigned long
+unsigned long
 parisc_acctyp(unsigned long code, unsigned int inst)
 {
 	if (code == 6 || code == 16)
