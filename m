From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 21:35:32 +0100
Message-ID: <56771114.6030201@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
 <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com>
 <5676CE11.9020808@gmx.de> <1450630202.2256.5.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1450630202.2256.5.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 17:50, James Bottomley wrote:
> On Sun, 2015-12-20 at 16:49 +0100, Helge Deller wrote:
>> On 20.12.2015 15:09, Mathieu Desnoyers wrote:
>>> ----- On Dec 20, 2015, at 8:59 AM, Mathieu Desnoyers 
>>> mathieu.desnoyers@efficios.com wrote:
>>>
>>>> ----- On Dec 18, 2015, at 6:30 PM, Helge Deller deller@gmx.de wro
>>>> te:
>>>>
>>>>> On parisc syscalls which are interrupted by signals sometimes
>>>>> fail to restart
>>>>> and instead return -ENOSYS which then in the worst case lead to
>>>>> userspace
>>>>> crashes.
>>>>> A similiar problem existed on MIPS and was fixed by commit
>>>>> e967ef02
>>>>> ("MIPS: Fix restart of indirect syscalls").
>>>>>
>>>>> On parisc the current syscall restart code assumes hat the
>>>>> syscall number is
>>>>> always loaded in the delay branch of the ble instruction as
>>>>> defined in the
>>>>> unistd.h header file and as such never restored %r20 before
>>>>> returning to
>>>>> userspace:
>>>>> 	ble 0x100(%sr2, %r0)
>>>>> 	ldi #syscall_nr, %r20
>>>>>
>>>>> This assumption is at least not true for code which uses the
>>>>> syscall() glibc
>>>>> function, which instead uses this syntax:
>>>>> 	ble 0x100(%sr2, %r0)
>>>>> 	copy regX, %r20
>>>>> where regX depend on how the compiler optimizes the code and
>>>>> register usage.
>>>>>
>>>>> This patch fixes this problem by adding code to analyze how the
>>>>> syscall number
>>>>> is loaded in the delay branch and - if needed - copy the
>>>>> syscall number to regX
>>>>> prior returning to userspace for the syscall restart.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>> Cc: stable@vger.kernel.org
>>>>> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>>>>>
>>>>> diff --git a/arch/parisc/kernel/signal.c
>>>>> b/arch/parisc/kernel/signal.c
>>>>> index dc1ea79..b0414ad 100644
>>>>> --- a/arch/parisc/kernel/signal.c
>>>>> +++ b/arch/parisc/kernel/signal.c
>>>>> @@ -435,6 +435,48 @@ handle_signal(struct ksignal *ksig, struct
>>>>> pt_regs *regs,
>>>>> int in_syscall)
>>>>> 		regs->gr[28]);
>>>>> }
>>>>>
>>>>> +/*
>>>>> + * Check the delay branch in userspace how the syscall number
>>>>> gets loaded into
>>>>> + * %r20 and adjust as needed.
>>>>
>>>> I'm pretty sure "Check the delay branch in userspace how the
>>>> syscall..."
>>>> is not an English construct. ;-) Suggested rewording:
>>>>
>>>> "Check how the syscall number gets loaded into %r20 within
>>>> the delay branch in userspace and adjust as needed."
>>
>> Thanks!
>> I'll change that.
>>
>>
>>>>> + */
>>>>> +
>>>>> +static void check_syscallno_in_delay_branch(struct pt_regs
>>>>> *regs)
>>>>> +{
>>>>> +	unsigned int opcode, source_reg;
>>>>
>>>> Why "unsigned int" above rather than u32 ? Since we're using
>>>> opcode as target variable for a get_user, it would be clearer
>>>> if the type of the __user * match the type of the target kernel
>>>> variable. (understood that those happen to have the same bitness
>>>> and type size on all Linux architectures, but it would be clearer
>>>> nevertheless).
>>
>> Yes, seems OK.
>> I'll change that.
>>
>>>>> +	u32 __user *uaddr;
>>>>> +
>>>>> +	/* Usually we don't have to restore %r20 (the system
>>>>> call number)
>>>>> +	 * because it gets loaded in the delay slot of the
>>>>> branch external
>>>>> +	 * instruction via the ldi instruction.
>>>>> +	 * In some cases a register-to-register copy
>>>>> instruction might have
>>>>> +	 * been used instead, in which case we need to copy
>>>>> the syscall
>>>>> +	 * number into the source register before returning to
>>>>> userspace.
>>>>> +	 */
>>>>> +
>>>>> +	/* A syscall is just a branch, so all
>>>>> +	 * we have to do is fiddle the return pointer.
>>>>> +	 */
>>>>> +	regs->gr[31] -= 8; /* delayed branching */
>>>>> +
>>>>> +	/* Get assembler opcode of code in delay branch */
>>>>> +	uaddr = (unsigned int *) (regs->gr[31] + 1);
>>>>> +	get_user(opcode, uaddr);
>>>>
>>>> get_user() can fail due to EFAULT. This error should be
>>>> handled here, otherwise this could lead to the following
>>>> code using an uninitialized opcode variable, which could
>>>> indirectly leak a few bits of kernel stack information
>>>> to userspace (security concern). One attack vector I have
>>>> in mind for this is ptrace(), which might be able to tweak
>>>> those register values.
>>
>> Yes, generally get_user() can fail.
>> But this would be rather strange in that case, because
>> the syscall was started by userspace from this address.
>> So, without the code at that address in userspace, we would
>> never have reached this get_user().
> 
> Actually, that's not necessarily a safe assumption.  Any memory
> allocation in a syscall path (except GFP_ATOMIC) can trigger reclaim
> and since this is a signal restart path, that's entirely possible. 
>  Reclaim could pull the backing page out from under the syscall, so in
> a low memory situation it is possible get_user() could fail with EFAULT

Really?
Maybe I misunderstood...?
So, let's say we have low memory and the kernel "swapped" out the userspace.
I assume that when there is no memory pressure get_user() would
pull the page in again, and if it's memory pressure, then with the assumption 
there is no memory left it probably return EFAULT (is that true?).
But what happens then when we return to userspace? 
I expect userspace then to segfault.

I will add the check for EFAULT, but just trying to understand...

> unless get_user_page() has been called somewhere to pin the page.

Helge
