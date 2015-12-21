From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] parisc: Fix syscall restarts (v2)
Date: Mon, 21 Dec 2015 20:27:23 +0000 (UTC)
Message-ID: <997901782.279317.1450729643512.JavaMail.zimbra@efficios.com>
References: <20151218233034.GA24910@p100.box> <20151221091933.GA22935@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151221091933.GA22935@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

----- On Dec 21, 2015, at 4:19 AM, Helge Deller deller@gmx.de wrote:

> This is version 2 of the patch:
> 
> On parisc syscalls which are interrupted by signals sometimes failed to
> restart and instead returned -ENOSYS which in the worst case lead to
> userspace crashes.
> A similiar problem existed on MIPS and was fixed by commit e967ef02
> ("MIPS: Fix restart of indirect syscalls").
> 
> On parisc the current syscall restart code assumes that all syscall
> callers load the syscall number in the delay slot of the ble
> instruction. That's how it is e.g. done in the unistd.h header file:
>	ble 0x100(%sr2, %r0)
>	ldi #syscall_nr, %r20
> Because of that assumption the current code never restored %r20 before
> returning to userspace.
> 
> This assumption is at least not true for code which uses the glibc
> syscall() function, which instead uses this syntax:
>	ble 0x100(%sr2, %r0)
>	copy regX, %r20
> where regX depend on how the compiler optimizes the code and register
> usage.
> 
> This patch fixes this problem by adding code to analyze how the syscall
> number is loaded in the delay branch and - if needed - copy the syscall
> number to regX prior returning to userspace for the syscall restart.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> 
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index dc1ea79..2264f68 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -435,6 +435,55 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs,
> int in_syscall)
> 		regs->gr[28]);
> }
> 
> +/*
> + * Check how the syscall number gets loaded into %r20 within
> + * the delay branch in userspace and adjust as needed.
> + */
> +
> +static void check_syscallno_in_delay_branch(struct pt_regs *regs)
> +{
> +	u32 opcode, source_reg;
> +	u32 __user *uaddr;
> +	int err;
> +
> +	/* Usually we don't have to restore %r20 (the system call number)
> +	 * because it gets loaded in the delay slot of the branch external
> +	 * instruction via the ldi instruction.
> +	 * In some cases a register-to-register copy instruction might have
> +	 * been used instead, in which case we need to copy the syscall
> +	 * number into the source register before returning to userspace.
> +	 */
> +
> +	/* A syscall is just a branch, so all we have to do is fiddle the
> +	 * return pointer so that the ble instruction gets executed again.
> +	 */
> +	regs->gr[31] -= 8; /* delayed branching */
> +
> +	/* Get assembler opcode of code in delay branch */
> +	uaddr = (unsigned int *) ((regs->gr[31] & ~3) + 4);

Is it valid to have unaligned instructions ? Does the architecture
allow it, or it's a fumble and we should pr_warn ?

> +	err = get_user(opcode, uaddr);
> +	if (err)

Should we add a pr_warn here ?

> +		return;
> +
> +	/* Check if delay branch uses "ldi int,%r20" */
> +	if ((opcode & 0xffff0000) == 0x34140000)
> +		return;	/* everything ok, just return */
> +
> +	/* Check if delay branch uses "nop" */
> +	if (opcode == INSN_NOP)
> +		return;

When we find a NOP in the delay slot, how can we be sure %r20
still holds the syscall value when we re-play the branch
instruction ? Can it be overwritten during the syscall,
either from start of syscall to here, or from here to
return to userspace ?

> +
> +	/* Check if delay branch uses "copy %rX,%r20" */
> +	if ((opcode & 0xffe0ffff) == 0x08000254) {
> +		source_reg = (opcode >> 16) & 31;
> +		regs->gr[source_reg] = regs->gr[20];

Similar question here, how can we be sure regs->gr[20]
still has the system call number at this point (not
overwritten from start of syscall to here) ?

Thanks,

Mathieu

> +		return;
> +	}
> +
> +	pr_warn("syscall restart: %s (pid %d): unexpected opcode 0x%08x\n",
> +		current->comm, task_pid_nr(current), opcode);
> +}
> +
> static inline void
> syscall_restart(struct pt_regs *regs, struct k_sigaction *ka)
> {
> @@ -457,10 +506,7 @@ syscall_restart(struct pt_regs *regs, struct k_sigaction
> *ka)
> 		}
> 		/* fallthrough */
> 	case -ERESTARTNOINTR:
> -		/* A syscall is just a branch, so all
> -		 * we have to do is fiddle the return pointer.
> -		 */
> -		regs->gr[31] -= 8; /* delayed branching */
> +		check_syscallno_in_delay_branch(regs);
> 		break;
> 	}
> }
> @@ -510,15 +556,9 @@ insert_restart_trampoline(struct pt_regs *regs)
> 	}
> 	case -ERESTARTNOHAND:
> 	case -ERESTARTSYS:
> -	case -ERESTARTNOINTR: {
> -		/* Hooray for delayed branching.  We don't
> -		 * have to restore %r20 (the system call
> -		 * number) because it gets loaded in the delay
> -		 * slot of the branch external instruction.
> -		 */
> -		regs->gr[31] -= 8;
> +	case -ERESTARTNOINTR:
> +		check_syscallno_in_delay_branch(regs);
> 		return;
> -	}
> 	default:
> 		break;
>  	}

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
