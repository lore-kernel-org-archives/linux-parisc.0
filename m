From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 20:32:52 +0100
Message-ID: <56770264.90706@gmx.de>
References: <20151218233034.GA24910@p100.box>
 <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com>
 <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com>
 <5676CE11.9020808@gmx.de> <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20.12.2015 19:31, John David Anglin wrote:
> On 2015-12-20, at 10:49 AM, Helge Deller wrote:
> 
>>>>> /* Check if delay branch uses "copy %rX,%r20" */
>>>>> +	if ((opcode & 0xff00ffff) == 0x08000254) {
>>>>> +		source_reg = (opcode >> 16) & 31;
>>>>
>>>> Can you explain the reasoning behind the & 31 mask ?
>>>> I'm no parisc expert, but this seems rather odd.
>>>> Do you really mean "% 31" which translates to "& 5" ?
>>>> It would make more sense since there are 32 "gr"
>>>> registers. With & 31, a carefully crafted opcode
>>>> could overflow the gr[32] array, and cause a kernel
>>>> overflow allowing to overwrite kernel memory
>>>> (security issue).
>>>
>>> Hrm, I got my masks temporarily mixed up (early morning
>>> here). This is why I always use constructs such as:
>>>
>>> #define GR_REGS_BITS  5
>>> #define NR_GR_REGS    (1U << GR_REGS_BITS)
>>> #define GR_REGS_MASK  (NR_GR_REGS - 1)
>>>
>>> and then
>>>
>>> v & GR_REGS_MASK;
>>>
>>> Which makes everything super-obvious. The & 31 mask
>>> seems therefore technically correct.
>>
>> Good. I was struggling with your comments as well :-)
>>
>>
>>> The paragraph below still holds though:
>>>
>>>>
>>>> If it's the case, then it would also be good to
>>>> check that the register selector within the opcode
>>>> is not larger than 31 (e.g. applying to fr or sr
>>>> register), rather than applying the modulo and
>>>> assuming it's a gr and corrupt userspace state.
>>
>> I'll check that.
> 
> The register field cannot be larger than 31.  A fr or sr
> regster can't be used 

Both correct.

> in a LDO "copy" instruction.

Actually it's the "OR,cond r1,r2,t" instruction.
https://parisc.wiki.kernel.org/images-parisc/6/68/Pa11_acd.pdf
page 5-105

if ((opcode & 0xff00ffff) == 0x08000254)

The mask should be 0xffe0ffff, so that some bits of r2 (which needs to be 0) are not missed.

Helge 

