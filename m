From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [RFT] TIF_RESTORE_SIGMASK
Date: Mon, 28 Aug 2006 14:51:32 -0400
Message-ID: <20060828185132.GB11462@athena.road.mcmartin.ca>
References: <20060828011528.GB6785@athena.road.mcmartin.ca>
	<119aab440608281012p293ff783u1472ed66ee9410a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608281012p293ff783u1472ed66ee9410a2@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 28, 2006 at 01:12:01PM -0400, Carlos O'Donell wrote:
> Could you explain what this change does in a paragraph or two? These
> types of changes are not always self-explanatory.
> 

Effectively these changes defer calling do_signal from rt_sigsuspend
by saving the saved signal mask in the task_struct.

> OK, calling do_notify_resume changes the order of the input arguments.
> Is this what other arches do on this path?
> 

No, we don't change the order, we just remove passing the oldset
from assembly since it is now saved in task_struct (oldset was NULL
on entry to do_signal unless it came from sigsuspend previously.)

> >        b       intr_check_sig
> >        nop
> >@@ -2267,16 +2266,14 @@ syscall_do_signal:
> >           consistent with all the relevant state of the process
> >           before the syscall.  We need to verify this. */
> >        LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
> >-       ldo     TASK_REGS(%r1), %r25            /* struct pt_regs *regs */
> >-       reg_save %r25
> >-
> >-       ldi     1, %r24                         /* unsigned long 
> >in_syscall */
> >+       ldo     TASK_REGS(%r1), %r26            /* struct pt_regs *regs */
> >+       reg_save %r26
> >
> > #ifdef CONFIG_64BIT
> >        ldo     -16(%r30),%r29                  /* Reference param save 
> >        area */
> > #endif
> >-       BL      do_signal,%r2
> >-       copy    %r0, %r26                       /* sigset_t *oldset = NULL 
> >*/
> >+       BL      do_notify_resume,%r2
> >+       ldi     1, %r25                         /* long in_syscall */
> 
> OK, similar changes.
> 

We have two paths to deliver signals, return from an interruption,
and return from a syscall. Both are subtlely different, but pretty
much logically the same where I'm changing them.

> >        LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
> >        ldo     TASK_REGS(%r1), %r20            /* reload pt_regs */
> >diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> >index 9a04272..e8de263 100644
> >--- a/arch/parisc/kernel/signal.c
> >+++ b/arch/parisc/kernel/signal.c
> >@@ -58,8 +58,6 @@ #define _BLOCKABLE (~(sigmask(SIGKILL) |
> >  * this. */
> > #define A(__x) ((unsigned long)(__x))
> >
> >-int do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall);
> >-
> > /*
> >  * Atomically swap in the new signal mask, and wait for a signal.
> >  */
> >@@ -93,21 +91,20 @@ #endif
> >                        return -EFAULT;
> >        }
> >
> >+       /* sigmask(SIGKILL) | sigmask(SIGSTOP) */
> >        sigdelsetmask(&newset, ~_BLOCKABLE);
> 
> Could you expand this comment please.
> 

_BLOCKABLE is ~(sigmask(SIGKILL) | sigmask(SIGSTOP))
ergo, ~_BLOCKABLE is... you get the idea.

> >
> >        spin_lock_irq(&current->sighand->siglock);
> >-       saveset = current->blocked;
> >+       current->saved_sigmask = current->blocked;
> 
> Ok.
> 
> >        current->blocked = newset;
> >        recalc_sigpending();
> >        spin_unlock_irq(&current->sighand->siglock);
> >
> >-       regs->gr[28] = -EINTR;
> >-       while (1) {
> >-               current->state = TASK_INTERRUPTIBLE;
> >-               schedule();
> >-               if (do_signal(&saveset, regs, 1))
> >-                       return -EINTR;
> >-       }
> >+       current->state = TASK_INTERRUPTIBLE;
> >+       schedule();
> >+       set_thread_flag(TIF_RESTORE_SIGMASK);
> >+
> >+       return -ERESTARTNOHAND;
> 
> So instead of waiting for a signal we delay the do_signal call until later.
> Could you help me verify why we returned -EINTR and set gr28 to -EINTR?
> Is it ok to return -ERESTARTNOHAND now?
> 

This as other arches do. I have no idea, but if we're calling rt_sigsuspend
odds are we're going to do the do_signal on return from this same syscall...

> > }
> >
> > /*
> >@@ -528,12 +525,13 @@ handle_signal(unsigned long sig, siginfo
> >  * us due to the magic of delayed branching.
> >  */
> >
> >-asmlinkage int
> >-do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall)
> >+asmlinkage void
> >+do_signal(struct pt_regs *regs, long in_syscall)
> > {
> >        siginfo_t info;
> >        struct k_sigaction ka;
> >        int signr;
> >+       sigset_t *oldset;
> >
> >        DBG(1,"\ndo_signal: oldset=0x%p, regs=0x%p, sr7 %#lx, 
> >        in_syscall=%d\n",
> >               oldset, regs, regs->sr[7], in_syscall);
> >@@ -543,7 +541,9 @@ do_signal(sigset_t *oldset, struct pt_re
> >           we would be called in that case, but for some reason we
> >           are. */
> >
> >-       if (!oldset)
> >+       if (test_thread_flag(TIF_RESTORE_SIGMASK))
> >+               oldset = &current->saved_sigmask;
> >+       else
> >                oldset = &current->blocked;
> 
> Ok.
> 
> >        DBG(1,"do_signal: oldset %08lx / %08lx\n",
> >@@ -592,7 +592,9 @@ do_signal(sigset_t *oldset, struct pt_re
> >                if (handle_signal(signr, &info, &ka, oldset, regs, 
> >                in_syscall)) {
> >                        DBG(1,KERN_DEBUG "do_signal: Exit (success), 
> >                        regs->gr[28] = %ld\n",
> >                                regs->gr[28]);
> >-                       return 1;
> >+                       if (test_thread_flag(TIF_RESTORE_SIGMASK))
> >+                               clear_thread_flag(TIF_RESTORE_SIGMASK);
> >+                       return;
> 
> OK, we assume the signal has been handled.
> 
> >                }
> >        }
> >        /* end of while(1) looping forever if we can't force a signal */
> >@@ -653,5 +655,17 @@ #endif
> >        DBG(1,"do_signal: Exit (not delivered), regs->gr[28] = %ld\n",
> >                regs->gr[28]);
> >
> >-       return 0;
> >+       if (test_thread_flag(TIF_RESTORE_SIGMASK)) {
> >+               clear_thread_flag(TIF_RESTORE_SIGMASK);
> >+               sigprocmask(SIG_SETMASK, &current->saved_sigmask, NULL);
> >+       }
> >+
> >+       return;
> >+}
> 
> Is this behaviour correct? We have not delivered the signal, so we
> restore the signal mask and clear the TIF_RESTORE_SIGMASK flag?
> 

        /* if there's no signal to deliver, we just put the saved sigmask
         * back
         */

is the comment from sparc64.

> These header changes are OK. Why don't you check these in first as a
> Step 1 while we review the rest of the patch.
> 

Not really much point...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
