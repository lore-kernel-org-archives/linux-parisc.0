From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] pselect/ppoll support
Date: Sun, 9 Apr 2006 22:06:03 -0400
Message-ID: <119aab440604091906m19b9bf33yfd9e8b1cbff22844@mail.gmail.com>
References: <20060409182521.GA27661@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060409182521.GA27661@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/9/06, Kyle McMartin <kyle@mcmartin.ca> wrote:
> First strike at adding TIF_RESTORE_SIGMASK support for the pselect/ppoll
> system calls... Doesn't seem to work at all yet...

Thanks!

> -       .export sys_rt_sigsuspend_wrapper
> -sys_rt_sigsuspend_wrapper:
> -       LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
> -       ldo     TASK_REGS(%r1),%r24
> -       reg_save %r24
> -
> -       STREG   %r2, -RP_OFFSET(%r30)
> -#ifdef CONFIG_64BIT
> -       ldo     FRAME_SIZE(%r30), %r30
> -       b,l     sys_rt_sigsuspend,%r2
> -       ldo     -16(%r30),%r29          /* Reference param save area */
> -#else
> -       bl      sys_rt_sigsuspend,%r2
> -       ldo     FRAME_SIZE(%r30), %r30
> -#endif
> -
> -       ldo     -FRAME_SIZE(%r30), %r30
> -       LDREG   -RP_OFFSET(%r30), %r2
> -
> -       LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
> -       ldo     TASK_REGS(%r1),%r1
> -       reg_restore %r1
> -
> -       bv      %r0(%r2)
> -       nop
> -

This needs more review.

> -asmlinkage int
> -sys_rt_sigsuspend(sigset_t __user *unewset, size_t sigsetsize, struct pt=
_regs *regs)

You've switched over to the kernel generic version of
sys_rt_sigsuspend, and you will have to review if it does exactly what
our version was doing. I suspect it's slightly different, and you
problems start here.

> +/* Setup a trampoline to restart the syscall
> + * with __NR_restart_syscall
> + *
> + *  0: <return address (orig r31)>
> + *  4: <2nd half for 64-bit>
> + *  8: ldw 0(%sp), %r31
> + * 12: be 0x100(%sr2, %r0)
> + * 16: ldi __NR_restart_syscall, %r20
> + */
> +static void setup_restart_syscall_tramp(struct pt_regs *regs)
> +{
> +       unsigned int *usp =3D (unsigned int *)regs->gr[30];
> +
> +#ifdef CONFIG_64BIT
> +       put_user(regs->gr[31] >> 32, &usp[0]);
> +       put_user(regs->gr[31] & 0xffffffff, &usp[1]);
> +       put_user(0x0fc010df, &usp[2]);
> +#else
> +       put_user(regs->gr[31], &usp[0]);
> +       put_user(0x0fc0109f, &usp[2]);
> +#endif
> +       put_user(0xe0008200, &usp[3]);
> +       put_user(0x34140000, &usp[4]);
> +
> +       /* Stack is 64-byte aligned, and we only need
> +        * to flush 1 cache line.
> +        * Flushing one cacheline is cheap.
> +        * "sync" on bigger (> 4 way) boxes is not.
> +        */
> +       asm("fdc %%r0(%%sr3, %0)\n"
> +           "sync\n"
> +           "fic %%r0(%%sr3, %0)\n"
> +           "sync\n"
> +           : : "r"(regs->gr[30]));
> +
> +       regs->gr[31] =3D regs->gr[30] + 8;
> +       /* Preserve original r28. */
> +       regs->gr[28] =3D regs->orig_r28;
> +
> +       return;
>  }

I believe we've always had a race condition in this trampoline.
I'm raising this issue so we can remember that it's there or
completely squash the issue. While returning to userspace
you *cannot* take another restart since the restarts are not
nestable. You must disable restarts and then reenable them
when you return from the trampoline. Linus wrote an email about
this issue. Has this been fixed for us?

> -       /* Everyone else checks to see if they are in kernel mode at
> -          this point and exits if that's the case.  I'm not sure why
> -          we would be called in that case, but for some reason we
> -          are. */
> +       if (!user_mode(regs))
> +               return;

Don't delete the comment unless you are willing to replace it with
one that explains why this might be the case. Please think about
kernel mode threads and why we don't do this for them.

>         /* May need to force signal if handle_signal failed to deliver */
> -       while (1) {
> -
> -               signr =3D get_signal_to_deliver(&info, &ka, regs, NULL);
> -               DBG(3,"do_signal: signr =3D %d, regs->gr[28] =3D %ld\n", =
signr, regs->gr[28]);
> +       signr =3D get_signal_to_deliver(&info, &ka, regs, NULL);
> +       DBG(3,"do_signal: signr =3D %d, regs->gr[28] =3D %ld\n", signr, r=
egs->gr[28]);

Have other arches changed their handlers?
Are we no longer required to loop in an attempt to deliver the signal?

> -       ENTRY_SAME(rt_sigsuspend_wrapper) /* not really SAME -- see the c=
ode */
> +       ENTRY_COMP(rt_sigsuspend)

This was always really ugly. Thanks.


> -       ENTRY_SAME(ni_syscall)          /* 271 ENTRY_COMP(pselect6) */
> -       ENTRY_SAME(ni_syscall)          /* 272 ENTRY_COMP(ppoll) */
> +       ENTRY_COMP(pselect6)
> +       ENTRY_COMP(ppoll)

Yay.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
