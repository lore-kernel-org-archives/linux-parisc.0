Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA4894845
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Oct 2003 09:07:00 -0600 (MDT)
Message-ID: <3F803388.5090304@tiscali.be>
Date: Sun, 05 Oct 2003 15:06:48 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>,
	Carlos O'Donell <carlos@baldric.uwo.ca>, "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
In-Reply-To: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
Content-Type: multipart/mixed;
 boundary="------------030403020700060302040201"
Subject: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on b2k finaly crash]
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

This is a multi-part message in MIME format.
--------------030403020700060302040201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Joel Soete wrote:

>I am also happy that with 2.6.0-test6-pa6 b2k crash because it is a long
>time that I try to obtain a relevant info (even toc do not help until now).
>And here is the full boot messages:
>  
>
[...]

>
>Unexpected interruption: Code=13 regs=100683c0 (Addr=00000000)
>
>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>PSW: 00000000000001001111111100001111 Not tainted
>r00-03  00000000 ffffffff 10215854 1046d0c4
>r04-07  00000000 10068288 00000013 10388810
>r08-11  00000027 00000000 37e45480 10458884
>r12-15  3b9aca00 10389810 10458810 f0400004
>r16-19  f00008c4 f000017c f0000174 00009600
>r20-23  00000000 41000000 00000cb0 00000000
>r24-27  00000000 00000000 00000000 10372010
>r28-31  00000000 068e7780 100683c0 10210928
>sr0-3   00000000 00000000 00000000 00000000
>sr4-7   00000000 00000000 00000000 00000000
>
>IASQ: 00000000 00000000 IAOQ: 101e930c 101e9310
> IIR: b3202000    ISR: 10240000  IOR: 1a06836c
> CPU:        0   CR30: 10068000 CR31: 103cb000
> ORIG_R28: 10459010
> IAOQ[0]: $$divU+0xc/0x210
> IAOQ[1]: $$divU+0x10/0x210
> RP(r2): serial8250_get_divisor+0x44/0x50
>
>  
>
Hi Carlos and all,

Regarding a bit more about this crash dump, I figure out that your patch 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017565.html> 
was not yet 'aligned' in 2.6.
So may I suggest you this first draft:
--- linux-2.6.0-test6-pa6.orig/arch/parisc/kernel/traps.c       
2003-10-05 16:03:42.000000000 +0200
+++ linux-2.6.0-test6-pa6.test/arch/parisc/kernel/traps.c       
2003-10-05 16:05:24.000000000 +0200
@@ -44,7 +44,7 @@
 #define PRINT_USER_FAULTS /* (turn this on if you want user faults to be */
                          /*  dumped to the console via printk)          */

-int printbinary(char *buf, unsigned long x, int nbits)
+static int printbinary(char *buf, unsigned long x, int nbits)
 {
        unsigned long mask = 1UL << (nbits - 1);
        while (mask != 0) {
@@ -408,7 +408,7 @@


 /*
- * This routine handles page faults.  It determines the address,
+ * This routine handles various exception codes.  It determines the 
address,
  * and the problem, and then passes it off to one of the appropriate
  * routines.
  */
@@ -429,8 +429,18 @@
        if (!console_drivers)
                pdc_console_restart();

-       if (code == 1)
-           transfer_pim_to_trap_frame(regs);
+
+       /* Not all switch paths will gutter the processor... */
+       switch(code){
+
+       case 1:
+               transfer_pim_to_trap_frame(regs);
+               break;
+
+       default:
+               /* Fall through */
+               break;
+       }

        show_stack(NULL, (unsigned long *)regs->gr[30]);

@@ -446,34 +456,28 @@
         * system will shut down immediately right here. */
        pdc_soft_power_button(0);

+       /* Gutter the processor... */
        for(;;)
            ;
 }

+
 void handle_interruption(int code, struct pt_regs *regs)
 {
        unsigned long fault_address = 0;
        unsigned long fault_space = 0;
        struct siginfo si;

-       if (code == 1)
-           pdc_console_restart();  /* switch back to pdc if HPMC */
-       else
-           local_irq_enable();
-
-#if 0
-       printk(KERN_CRIT "Interruption # %d\n", code);
-#endif
-
        switch(code) {

        case  1:
                /* High-priority machine check (HPMC) */
-
+               pdc_console_restart();  /* switch back to pdc if HPMC */
+
                /* set up a new led state on systems shipped with a LED 
State panel */
                pdc_chassis_send_status(PDC_CHASSIS_DIRECT_HPMC);
-
-               parisc_terminate("High Priority Machine Check (HPMC)",
+
+               parisc_terminate("High Priority Machine Check (HPMC)",
                                regs, code, 0);
                /* NOT REACHED */
              
@@ -492,8 +496,9 @@
 
        case  5:
                /* Low-priority machine check */
+
                pdc_chassis_send_status(PDC_CHASSIS_DIRECT_LPMC);
-               
+
                flush_all_caches();
                cpu_lpmc(5, regs);
                return;
@@ -542,6 +547,7 @@
 
                die_if_kernel("Privileged register usage", regs, code);
                si.si_code = ILL_PRVREG;
+               /* Fall thru */
        give_sigill:
                si.si_signo = SIGILL;
                si.si_errno = 0;
@@ -556,6 +562,17 @@
                si.si_addr = (void *) regs->iaoq[0];
                force_sig_info(SIGFPE, &si, current);
                return;
+
+       case 13:
+               /* Conditional Trap
+                  The condition succees in an instruction which traps 
on condition  */
+               si.si_signo = SIGFPE;
+               /* Set to zero, and let the userspace app figure it out from
+                  the insn pointed to by si_addr */
+               si.si_code = 0;
+               si.si_addr = (void *) regs->iaoq[0];
+               force_sig_info(SIGFPE, &si, current);
+               return;

        case 14:
                /* Assist Exception Trap, i.e. floating point exception. */
@@ -563,13 +580,22 @@
                handle_fpe(regs);
                return;

+       case 15:
+               /* Data TLB miss fault/Data page fault */
+               /* Fall thru */
+       case 16:
+               /* Non-access instruction TLB miss fault */
+               /* The instruction TLB entry needed for the target 
address of the FIC
+                  is absent, and hardware can't find it, so we get to 
cleanup */
+               /* Fall thru */
        case 17:
                /* Non-access data TLB miss fault/Non-access data page 
fault */
                /* TODO: Still need to add slow path emulation code here */
-               pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
-
+               /* TODO: Understand what is meant by the TODO listed
+                  above this one. (Carlos) */
                fault_address = regs->ior;
-               parisc_terminate("Non access data tlb 
fault!",regs,code,fault_address);
+               fault_space = regs->isr;
+               break;
 
        case 18:
                /* PCXS only -- later cpu's split this into types 26,27 
& 28 */
@@ -579,9 +605,8 @@
                        return;
                }
                /* Fall Through */
-
-       case 15: /* Data TLB miss fault/Data page fault */
-       case 26: /* PCXL: Data memory access rights trap */
+       case 26:
+               /* PCXL: Data memory access rights trap */
                fault_address = regs->ior;
                fault_space   = regs->isr;
                break;
@@ -637,7 +662,6 @@
                        up_read(&current->mm->mmap_sem);
                }
                /* Fall Through */
-
        case 27:
                /* Data memory protection ID trap */
                die_if_kernel("Protection id trap", regs, code);
@@ -671,8 +695,9 @@
                        force_sig_info(SIGBUS, &si, current);
                        return;
                }
-               pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 
+               pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+
                parisc_terminate("Unexpected interruption", regs, code, 0);
                /* NOT REACHED */
        }
@@ -702,18 +727,19 @@
             * The kernel should never fault on its own address space.
             */

-           if (fault_space == 0)
-           {
+           if (fault_space == 0) {
                pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
                parisc_terminate("Kernel Fault", regs, code, fault_address);
-
+               /** NOT REACHED **/
            }
        }

+       local_irq_enable();
        do_page_fault(regs, code, fault_address);
 }


+
 int __init check_ivt(void *iva)
 {
        int i;

hmm I am not quiet sure about first hunck (static or not for printbinary?).

I test it successfully on my c110 but if you have some opportunity to 
double check and may be also ci, that would be nice.

Thanks in advance,
    Joel

PS: I do not yet test on my b2k :( so I don't know yet if it help the 
above pb?

PS2: Max may be have this opportunity on your c3k? (thanks)

--------------030403020700060302040201
Content-Type: text/plain;
 name="Traps-2.4-Align"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Traps-2.4-Align"

--- linux-2.6.0-test6-pa6.orig/arch/parisc/kernel/traps.c	2003-10-05 16:03:42.000000000 +0200
+++ linux-2.6.0-test6-pa6.test/arch/parisc/kernel/traps.c	2003-10-05 16:05:24.000000000 +0200
@@ -44,7 +44,7 @@
 #define PRINT_USER_FAULTS /* (turn this on if you want user faults to be */
 			  /*  dumped to the console via printk)          */
 
-int printbinary(char *buf, unsigned long x, int nbits)
+static int printbinary(char *buf, unsigned long x, int nbits)
 {
 	unsigned long mask = 1UL << (nbits - 1);
 	while (mask != 0) {
@@ -408,7 +408,7 @@
 
 
 /*
- * This routine handles page faults.  It determines the address,
+ * This routine handles various exception codes.  It determines the address,
  * and the problem, and then passes it off to one of the appropriate
  * routines.
  */
@@ -429,8 +429,18 @@
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
 
 	show_stack(NULL, (unsigned long *)regs->gr[30]);
 
@@ -446,34 +456,28 @@
 	 * system will shut down immediately right here. */
 	pdc_soft_power_button(0);
 	
+	/* Gutter the processor... */
 	for(;;)
 	    ;
 }
 
+
 void handle_interruption(int code, struct pt_regs *regs)
 {
 	unsigned long fault_address = 0;
 	unsigned long fault_space = 0;
 	struct siginfo si;
 
-	if (code == 1)
-	    pdc_console_restart();  /* switch back to pdc if HPMC */
-	else
-	    local_irq_enable();
-
-#if 0
-	printk(KERN_CRIT "Interruption # %d\n", code);
-#endif
-
 	switch(code) {
 
 	case  1:
 		/* High-priority machine check (HPMC) */
-		
+		pdc_console_restart();  /* switch back to pdc if HPMC */
+
 		/* set up a new led state on systems shipped with a LED State panel */
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_HPMC);
-		    
-	    	parisc_terminate("High Priority Machine Check (HPMC)",
+
+		parisc_terminate("High Priority Machine Check (HPMC)",
 				regs, code, 0);
 		/* NOT REACHED */
 		
@@ -492,8 +496,9 @@
 
 	case  5:
 		/* Low-priority machine check */
+
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_LPMC);
-		
+
 		flush_all_caches();
 		cpu_lpmc(5, regs);
 		return;
@@ -542,6 +547,7 @@
 
 		die_if_kernel("Privileged register usage", regs, code);
 		si.si_code = ILL_PRVREG;
+		/* Fall thru */
 	give_sigill:
 		si.si_signo = SIGILL;
 		si.si_errno = 0;
@@ -556,6 +562,17 @@
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
@@ -563,13 +580,22 @@
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
@@ -579,9 +605,8 @@
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
@@ -637,7 +662,6 @@
 			up_read(&current->mm->mmap_sem);
 		}
 		/* Fall Through */
-
 	case 27: 
 		/* Data memory protection ID trap */
 		die_if_kernel("Protection id trap", regs, code);
@@ -671,8 +695,9 @@
 			force_sig_info(SIGBUS, &si, current);
 			return;
 		}
-		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+
 		parisc_terminate("Unexpected interruption", regs, code, 0);
 		/* NOT REACHED */
 	}
@@ -702,18 +727,19 @@
 	     * The kernel should never fault on its own address space.
 	     */
 
-	    if (fault_space == 0) 
-	    {
+	    if (fault_space == 0) {
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
-	
+		/** NOT REACHED **/
 	    }
 	}
 
+	local_irq_enable();
 	do_page_fault(regs, code, fault_address);
 }
 
 
+
 int __init check_ivt(void *iva)
 {
 	int i;

--------------030403020700060302040201--
