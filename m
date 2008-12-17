From: Helge Deller <deller@gmx.de>
Subject: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling
 ruby1.9
Date: Wed, 17 Dec 2008 23:46:05 +0100
Message-ID: <4949812D.7080608@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080903030906080404000306"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------080903030906080404000306
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The Debian bugzilla has a long thread about kernel crashes when
compiling ruby1.9 on hppa. This kernel bug led even to discussions if
hppa should be dropped for lenny.
See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=478717 for details.

It's really easy to reproduce the bug, and it generates this backtrace
(interestingly two backtraces):

     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
miniruby (pid 15221): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 102a9800 101a141c 8210c388
r04-07  00000000 0020fd08 0020fd10 00000001
r08-11  00000000 8210c388 fffffff2 8210c0c8
r12-15  fb0d04c8 402cc3d8 00001000 40007000
r16-19  002120a0 00000010 0020fd90 00000001
r20-23  8210c000 00000000 0020fd0e 8210c39e
r24-27  00000000 00000001 8e7c5660 105e7a90
r28-31  0000000f 00190834 8210c500 101a12b8
sr00-03  00000000 00000000 00000000 00000847
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101a147c 101a1480
 IIR: 0ed5d240    ISR: 00000847  IOR: 0020fd0e
 CPU:        0   CR30: 8210c000 CR31: d22344f0
 ORIG_R28: 00001000
 IAOQ[0]: do_sys_poll+0x1ac/0x1b8
 IAOQ[1]: do_sys_poll+0x1b0/0x1b8
 RP(r2): do_sys_poll+0x14c/0x1b8
Backtrace:
 [<101a1574>] sys_poll+0x84/0xec
 [<10114078>] syscall_exit+0x0/0x28

Backtrace:
 [<1010fdb8>] die_if_kernel+0xe8/0x1ac
 [<10110584>] handle_interruption+0x2fc/0x598
 [<10113078>] intr_check_sig+0x0/0x34


The bug (sometimes but not always!) happens in fs/select.c:do_sys_poll()
when calling __put_user() and writing back fds[0].revents to userspace.
What I quite don't understand yet is, why does copy_from_user() [called
a few lines above the __put_user()] succeeds, and __put_user() sometimes
suddenly fails with a protection id fault.

The attached patch simply adds the lookup for a fixup handler when trap
#27 (protection id trap) happens in kernel space. This was missing in
the code path for trap #27 which is why the kernel then called
die_if_kernel() and crashed.

Even with this patch ruby1.9 may fail to compile, but at least the
kernel crashes are gone.

Any feedback welcome.

Helge

Signed-off-by: Helge Deller <deller@gmx.de>


--------------080903030906080404000306
Content-Type: text/x-patch;
 name="data_protection_id_failure.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="data_protection_id_failure.diff"

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..70eabfe 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -43,6 +43,8 @@
 
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
 
+DECLARE_PER_CPU(struct exception_data, exception_data);
+
 #define PRINT_USER_FAULTS /* (turn this on if you want user faults to be */
 			  /*  dumped to the console via printk)          */
 
@@ -745,6 +747,41 @@ void handle_interruption(int code, struct pt_regs *regs)
 		/* Fall Through */
 	case 27: 
 		/* Data memory protection ID trap */
+		if (code == 27 && !user_mode(regs)) {
+			const struct exception_table_entry *fix;
+
+			/* mostly copied from:
+ 			   arch/parisc/mm/fault.c:do_page_fault()
+			 */
+			fix = search_exception_tables(regs->iaoq[0]);
+			printk(KERN_CRIT "BUG: Kernel Data memory protection ID"
+				" trap at %p (%pS), fix=%p\n",
+				(void*)regs->iaoq[0], (void*)regs->iaoq[0], fix);
+			if (fix) {
+				struct exception_data *d;
+
+				d = &__get_cpu_var(exception_data);
+				d->fault_ip = regs->iaoq[0];
+				d->fault_space = regs->isr;
+				d->fault_addr = regs->ior;
+
+				regs->iaoq[0] = ((fix->fixup) & ~3);
+
+				/*
+				 * NOTE: In some cases the faulting instruction
+				 * may be in the delay slot of a branch. We
+				 * don't want to take the branch, so we don't
+				 * increment iaoq[1], instead we set it to be
+				 * iaoq[0]+4, and clear the B bit in the PSW
+				 */
+
+				regs->iaoq[1] = regs->iaoq[0] + 4;
+				regs->gr[0] &= ~PSW_B; /* IPSW in gr[0] */
+
+				return;
+			}
+		}
+
 		die_if_kernel("Protection id trap", regs, code);
 		si.si_code = SEGV_MAPERR;
 		si.si_signo = SIGSEGV;

--------------080903030906080404000306--
