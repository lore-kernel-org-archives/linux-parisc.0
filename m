Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EBFA4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 09:53:39 -0700 (MST)
Date: Sun, 26 Oct 2003 11:49:26 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Message-ID: <20031026164926.GE26587@systemhalted>
References: <20030812060244.GE21328@tausq.org> <20031026073751.GH24406@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031026073751.GH24406@tausq.org>
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

On Sun, Oct 26, 2003 at 12:37:51AM -0700, Randolph Chung wrote:
> here's a patch that implements the required logic. probably can be
> improved some.... comments appreciated.
> 
> About __NR_restart_syscall, some archs use syscall #0 (unused for pa
> afaict), others define a new syscall number. Any preferences? If it's
> zero then i think i will remove the reassemble_14 logic.

I don't see why #0 can't be used here. Then again, why can't you code
the syscall number directly into the hex? Are you expecting it to
change? :)

> +		if (regs->gr[28] == -ERESTART_RESTARTBLOCK) {
> +			unsigned int *usp = (unsigned int *)regs->gr[30];
> +
> +			/* Setup a trampoline to restart the syscall
> +			 * with __NR_restart_syscall
> +			 *
> +			 *  0: ble 0x100(%%sr2, %%r0)
> +			 *  4: ldi __NR_restart_syscall, %r20
> +			 *  8: b,l .+8, %r21
> +			 * 12: depi 0,31,2,%r21
> +			 * 16: ldw 16(%r21), %rp
> +			 * 20: bv %r0(%rp)
> +			 * 24: ldo -64(%sp), %sp

Adding stack here can be detremental to the userspace program. It's not
expecting you to have a stack, and it expects the syscall to live within 
its calling frame. When we setup the signal return trampoline we don't
mess with the stack either :) Though this context is different.

> +			 * 28: nop
> +			 * 32: <return address> (2 slots for 64-bit)
> +			 */

c.
