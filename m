From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Mon, 21 Dec 2015 10:12:58 -0500
Message-ID: <567816FA.2070408@bell.net>
References: <20151218233034.GA24910@p100.box>
 <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
 <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com>
 <5676CE11.9020808@gmx.de> <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net>
 <1413798988.279042.1450708964783.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1413798988.279042.1450708964783.JavaMail.zimbra@efficios.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-21 9:42 AM, Mathieu Desnoyers wrote:
> ----- On Dec 20, 2015, at 1:31 PM, John David Anglin dave.anglin@bell.net wrote:
>
>> On 2015-12-20, at 10:49 AM, Helge Deller wrote:
>>
>>>>>> /* Check if delay branch uses "copy %rX,%r20" */
>>>>>> +	if ((opcode & 0xff00ffff) == 0x08000254) {
>>>>>> +		source_reg = (opcode >> 16) & 31;
>>>>> Can you explain the reasoning behind the & 31 mask ?
>>>>> I'm no parisc expert, but this seems rather odd.
>>>>> Do you really mean "% 31" which translates to "& 5" ?
>>>>> It would make more sense since there are 32 "gr"
>>>>> registers. With & 31, a carefully crafted opcode
>>>>> could overflow the gr[32] array, and cause a kernel
>>>>> overflow allowing to overwrite kernel memory
>>>>> (security issue).
>>>> Hrm, I got my masks temporarily mixed up (early morning
>>>> here). This is why I always use constructs such as:
>>>>
>>>> #define GR_REGS_BITS  5
>>>> #define NR_GR_REGS    (1U << GR_REGS_BITS)
>>>> #define GR_REGS_MASK  (NR_GR_REGS - 1)
>>>>
>>>> and then
>>>>
>>>> v & GR_REGS_MASK;
>>>>
>>>> Which makes everything super-obvious. The & 31 mask
>>>> seems therefore technically correct.
>>> Good. I was struggling with your comments as well :-)
>>>
>>>
>>>> The paragraph below still holds though:
>>>>
>>>>> If it's the case, then it would also be good to
>>>>> check that the register selector within the opcode
>>>>> is not larger than 31 (e.g. applying to fr or sr
>>>>> register), rather than applying the modulo and
>>>>> assuming it's a gr and corrupt userspace state.
>>> I'll check that.
>> The register field cannot be larger than 31.  A fr or sr
>> regster can't be used in a LDO "copy" instruction.
> Independently of the instruction set, if an application
> pulls the carpet from under the kernel from a concurrent
> thread (or possibly ptrace) by forging an invalid
> instruction after the system call has started executing,
> it would be good to catch it and report it with a printk,
> rather than blindly expecting that some bits should always
> be 0.

The mask should be 0xffe0ffff.

Dave

-- 
John David Anglin  dave.anglin@bell.net

