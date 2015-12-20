From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 21:18:09 +0100
Message-ID: <56770D01.9010608@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <B201D30D-8677-4D06-B3F9-EA4494972EF5@bell.net> <56770606.9020005@gmx.de>
 <A804D424-7C3E-4639-9EC4-5A52653EE0DD@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <A804D424-7C3E-4639-9EC4-5A52653EE0DD@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 21:01, John David Anglin wrote:
> On 2015-12-20, at 2:48 PM, Helge Deller wrote:
> 
>> On 20.12.2015 20:39, John David Anglin wrote:
>>> On 2015-12-18, at 6:30 PM, Helge Deller wrote:
>>>
>>>> +	/* Usually we don't have to restore %r20 (the system call number)
>>>> +	 * because it gets loaded in the delay slot of the branch external
>>>> +	 * instruction via the ldi instruction.
>>>> +	 * In some cases a register-to-register copy instruction might have
>>>> +	 * been used instead, in which case we need to copy the syscall
>>>> +	 * number into the source register before returning to userspace.
>>>> +	 */
>>>
>>> I'm thinking it might be better to fix syscall() in glibc.  The copy could be
>>> moved before ble and a nop placed delay slot.
>>
>> Yes, I think it should be fixed in glibc which makes it cleaner.
>> I looked at dietlibc. There a "nop" is being used.
> 
> A "nop" implies %r20 needs to be restored.

Yes, I tested that. It is being restored correctly, although the comments
imply different behaviour.

>> Nevertheless, it may happen anytime if people forget, that we will see a
>> "copy" there again, so IMHO it's probably safer to include the workaround in 
>> kernel too.
> 
> 
> The current patch assumes regs->gr[source_reg] is restored. 

Yes and no.

The real problem we actually faced is, that the glibc() syscall function
uses %r28 (aka the return value of the syscall) as "source_reg".
That's the reason why we failed with "ENOSYS" in the end, because when we returned
(before my patch) from the first syscall we returned -ERESTARTSYS
in %r28 (which is basically correct), but then the "copy %r28,%r20" in
userspace moved "-ERESTARTSYS" back into %r20, jumped into the kernel, and the
kernel (correctly) reported back "ENOSYS" since there is no such syscall
number with the value of "-ERESTARTSYS".
The problem: %r28 is of course not one of the registers which is being restored.
Quite complicated... I hope I could explain it somewhat...?

> That needs to be
> checked given previous comment about %r20.
> 
> Essentially, all syscall clobbered registers need to be restored.

Yes, they are (with the exception of the return value %r28).

> Can the user space stuff be avoided by jumping to the gateway entry point?

Probably.
I didn't looked into that.

Helge
