From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 14:09:25 +0000 (UTC)
Message-ID: <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com>
References: <20151218233034.GA24910@p100.box> <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

----- On Dec 20, 2015, at 8:59 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> ----- On Dec 18, 2015, at 6:30 PM, Helge Deller deller@gmx.de wrote:
> 
>> On parisc syscalls which are interrupted by signals sometimes fail to restart
>> and instead return -ENOSYS which then in the worst case lead to userspace
>> crashes.
>> A similiar problem existed on MIPS and was fixed by commit e967ef02
>> ("MIPS: Fix restart of indirect syscalls").
>> 
>> On parisc the current syscall restart code assumes hat the syscall number is
>> always loaded in the delay branch of the ble instruction as defined in the
>> unistd.h header file and as such never restored %r20 before returning to
>> userspace:
>>	ble 0x100(%sr2, %r0)
>>	ldi #syscall_nr, %r20
>> 
>> This assumption is at least not true for code which uses the syscall() glibc
>> function, which instead uses this syntax:
>>	ble 0x100(%sr2, %r0)
>>	copy regX, %r20
>> where regX depend on how the compiler optimizes the code and register usage.
>> 
>> This patch fixes this problem by adding code to analyze how the syscall number
>> is loaded in the delay branch and - if needed - copy the syscall number to regX
>> prior returning to userspace for the syscall restart.
>> 
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org
>> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> 
>> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
>> index dc1ea79..b0414ad 100644
>> --- a/arch/parisc/kernel/signal.c
>> +++ b/arch/parisc/kernel/signal.c
>> @@ -435,6 +435,48 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs,
>> int in_syscall)
>> 		regs->gr[28]);
>> }
>> 
>> +/*
>> + * Check the delay branch in userspace how the syscall number gets loaded into
>> + * %r20 and adjust as needed.
> 
> I'm pretty sure "Check the delay branch in userspace how the syscall..."
> is not an English construct. ;-) Suggested rewording:
> 
> "Check how the syscall number gets loaded into %r20 within
> the delay branch in userspace and adjust as needed."
> 
>> + */
>> +
>> +static void check_syscallno_in_delay_branch(struct pt_regs *regs)
>> +{
>> +	unsigned int opcode, source_reg;
> 
> Why "unsigned int" above rather than u32 ? Since we're using
> opcode as target variable for a get_user, it would be clearer
> if the type of the __user * match the type of the target kernel
> variable. (understood that those happen to have the same bitness
> and type size on all Linux architectures, but it would be clearer
> nevertheless).
> 
>> +	u32 __user *uaddr;
>> +
>> +	/* Usually we don't have to restore %r20 (the system call number)
>> +	 * because it gets loaded in the delay slot of the branch external
>> +	 * instruction via the ldi instruction.
>> +	 * In some cases a register-to-register copy instruction might have
>> +	 * been used instead, in which case we need to copy the syscall
>> +	 * number into the source register before returning to userspace.
>> +	 */
>> +
>> +	/* A syscall is just a branch, so all
>> +	 * we have to do is fiddle the return pointer.
>> +	 */
>> +	regs->gr[31] -= 8; /* delayed branching */
>> +
>> +	/* Get assembler opcode of code in delay branch */
>> +	uaddr = (unsigned int *) (regs->gr[31] + 1);
>> +	get_user(opcode, uaddr);
> 
> get_user() can fail due to EFAULT. This error should be
> handled here, otherwise this could lead to the following
> code using an uninitialized opcode variable, which could
> indirectly leak a few bits of kernel stack information
> to userspace (security concern). One attack vector I have
> in mind for this is ptrace(), which might be able to tweak
> those register values.
> 
>> +
>> +	/* Check if delay branch uses "ldi int,%r20" */
>> +	if ((opcode & 0xffff0000) == 0x34140000)
>> +		return;	/* everything ok, just return */
>> +
>> +	/* Check if delay branch uses "copy %rX,%r20" */
>> +	if ((opcode & 0xff00ffff) == 0x08000254) {
>> +		source_reg = (opcode >> 16) & 31;
> 
> Can you explain the reasoning behind the & 31 mask ?
> I'm no parisc expert, but this seems rather odd.
> Do you really mean "% 31" which translates to "& 5" ?
> It would make more sense since there are 32 "gr"
> registers. With & 31, a carefully crafted opcode
> could overflow the gr[32] array, and cause a kernel
> overflow allowing to overwrite kernel memory
> (security issue).

Hrm, I got my masks temporarily mixed up (early morning
here). This is why I always use constructs such as:

#define GR_REGS_BITS  5
#define NR_GR_REGS    (1U << GR_REGS_BITS)
#define GR_REGS_MASK  (NR_GR_REGS - 1)

and then

v & GR_REGS_MASK;

Which makes everything super-obvious. The & 31 mask
seems therefore technically correct. The
paragraph below still holds though:

> 
> If it's the case, then it would also be good to
> check that the register selector within the opcode
> is not larger than 31 (e.g. applying to fr or sr
> register), rather than applying the modulo and
> assuming it's a gr and corrupt userspace state.
> 

Thanks,

Mathieu

> Thanks,
> 
> Mathieu
> 
>> +		regs->gr[source_reg] = regs->gr[20];
>> +		return;
>> +	}
>> +
>> +	pr_warn("syscall restart: %s (pid %d): unexpected opcode 0x%08x\n",
>> +		current->comm, task_pid_nr(current), opcode);
>> +}
>> +
>> static inline void
>> syscall_restart(struct pt_regs *regs, struct k_sigaction *ka)
>> {
>> @@ -457,10 +499,7 @@ syscall_restart(struct pt_regs *regs, struct k_sigaction
>> *ka)
>> 		}
>> 		/* fallthrough */
>> 	case -ERESTARTNOINTR:
>> -		/* A syscall is just a branch, so all
>> -		 * we have to do is fiddle the return pointer.
>> -		 */
>> -		regs->gr[31] -= 8; /* delayed branching */
>> +		check_syscallno_in_delay_branch(regs);
>> 		break;
>> 	}
>> }
>> @@ -510,15 +549,9 @@ insert_restart_trampoline(struct pt_regs *regs)
>> 	}
>> 	case -ERESTARTNOHAND:
>> 	case -ERESTARTSYS:
>> -	case -ERESTARTNOINTR: {
>> -		/* Hooray for delayed branching.  We don't
>> -		 * have to restore %r20 (the system call
>> -		 * number) because it gets loaded in the delay
>> -		 * slot of the branch external instruction.
>> -		 */
>> -		regs->gr[31] -= 8;
>> +	case -ERESTARTNOINTR:
>> +		check_syscallno_in_delay_branch(regs);
>> 		return;
>> -	}
>> 	default:
>> 		break;
>>  	}
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
