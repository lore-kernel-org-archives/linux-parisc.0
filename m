Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D11C48B5
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 21:41:27 -0700 (MST)
Date: Sun, 26 Oct 2003 23:37:05 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Message-ID: <20031027043705.GJ26587@systemhalted>
References: <20031026191804.GM24406@tausq.org> <200310261953.h9QJrgex028823@hiauly1.hia.nrc.ca> <20031026205931.GN24406@tausq.org> <20031026210201.GO24406@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031026210201.GO24406@tausq.org>
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

On Sun, Oct 26, 2003 at 01:02:01PM -0800, Randolph Chung wrote:
> hrm, oops, that's the magical disappearance act... :)
> 
> Index: arch/parisc/kernel/signal.c
> ===================================================================
> RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
> retrieving revision 1.11
> diff -u -p -r1.11 signal.c
> --- arch/parisc/kernel/signal.c	24 Sep 2003 17:54:31 -0000	1.11
> +++ arch/parisc/kernel/signal.c	26 Oct 2003 20:53:14 -0000
> @@ -530,10 +531,68 @@ do_signal(sigset_t *oldset, struct pt_re
>  	/* Did we come from a system call? */
>  	if (in_syscall) {
>  		/* Restart the system call - no handlers present */
> -		if (regs->gr[28] == -ERESTART_RESTARTBLOCK ||
> -		    regs->gr[28] == -ERESTARTNOHAND ||
> -		    regs->gr[28] == -ERESTARTSYS ||
> -		    regs->gr[28] == -ERESTARTNOINTR) {
> +		if (regs->gr[28] == -ERESTART_RESTARTBLOCK) {
> +			unsigned int *usp = (unsigned int *)regs->gr[30];
> +
> +			/* Setup a trampoline to restart the syscall
> +			 * with __NR_restart_syscall
> +			 */
> +#ifndef __LP64__
> +			/* 32-bit version:
> +			 *  0: <frame marker>
> +			 *  4: <return address>
> +			 *  8: ble 0x100(%%sr2, %%r0)
> +			 * 12: ldi __NR_restart_syscall, %r20
> +			 * 16: ldw -60(%sp), %r20
> +			 * 20: bv %r0(%r20)
> +			 * 24: ldwm -64(%sp), %r3
> +			 */

What do you think of:

a. Copy the original rp into a temp register.
b. Setup our rp so we return to the stack trampoline.
c. Return to userspace.
d. Trampoline restores original rp.
e. Make call to restart syscall.
f. Kernel does the magic.
g. Return to the original rp.

You don't care if you get a signal because you are never going to return
to the trampoline, so you don't adjust 'sp' to protect the trampoline.

My fears:

a. Timer tick while on the trampoline before the syscall is made.
	= Signal is delivered... what happens?

As a mater of fact, I'm wholely afraid of stack trampolines for the
explicit reason that your timeslice might expire and odd things might
transpire.

c.
