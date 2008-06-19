From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: in ccio_io_pdir_entry(), BUG_ON() seems to break gcc-4.2	optimization?
Date: Thu, 19 Jun 2008 19:44:43 +0000
Message-ID: <485AB72B.2090304@scarlet.be>
References: <48550D05.2060501@scarlet.be> <20080619160441.GA6049@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: rubisher <rubisher@scarlet.be>, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080619160441.GA6049@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



Grant Grundler wrote:
> On Sun, Jun 15, 2008 at 12:37:25PM +0000, rubisher wrote:
>> Hello all,
>>
>> looking at this hunk:
>> void CCIO_INLINE
>> ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
>>                    unsigned long hints)
>> {
>>         register unsigned long pa;
>>         register unsigned long ci; /* coherent index */
>>
>>         /* We currently only support kernel addresses */
>>         BUG_ON(sid != KERNEL_SPACE);
> ...
>> and I noticed that resulting code looks like:
>>    0:   cb 39 a0 60     movb,<> r25,r25,38 <ccio_io_pdir_entry+0x38>
>>    4:   34 1c 00 00     ldi 0,ret0
> 
> The BUG_ON is causing the movb to be inserted. And then the compiler knows
> the value is zero and can either copy from a register or "load immediate 0".
> It probably chose the "ldi 0" because it avoids register interlocks and
> can always be executed.
> 
> The movb will either branch to +0x38 (and nullifies the delay slot)
> or execute the ldi. So it looks right to me.
> 
> BTW, I think the BUG_ON can go away. It's good for debugging but doesn't
> need to be in every kernel.
> 
> ...
>> And my worry was about lines 4: and 8:.
>> According to the C code, I don't understand why optimization want to 
>> initialize sr1 to 0 while it should be set to r25 (i.e. arg1)?
> 
> Does the BUG_ON explaination make sense to you?
> 
Well I nerver imagine that a compiler can make proof of this kind of induction spirit ;-) but that's give the sense, tx.

>> Otoh, the sba botherhood code didn't showing the same behaviour:
>>    0:   22 a0 0e 01     ldil L%-10000000,r21
>>    4:   34 1c 00 00     ldi 0,ret0
>>    8:   34 1d 20 01     ldi -1000,ret1
>>    c:   0a b8 0a 15     add,l r24,r21,r21
>>   10:   08 15 02 56     copy r21,r22
>>   14:   34 15 00 00     ldi 0,r21
>>   18:   0b 95 02 15     and r21,ret0,r21
>>   1c:   0b b6 02 16     and r22,ret1,r22
>>   20:   00 19 58 20     mtsp r25,sr1
>>   24:   07 00 53 13     lci r0(sr1,r24),r19
>>   28:   d2 73 1a 6c     extrw,u r19,19,20,r19
>>   2c:   23 80 00 01     ldil L%-80000000,ret0
>>   30:   34 1d 00 00     ldi 0,ret1
>>
>> but didn't start with BUG_ON(),
> 
> Right. That should be a clue. :)
> 
> hth,
> grant
> 
Tx again,
	J.

ps: ccio_io_pdir_entry() seems to works fine without BUG_ON().
>> I simply try to remove this from ccio code 
>> and get a better result:
>> 00000000 <ccio_io_pdir_entry>:
>>    0:   00 19 58 20     mtsp r25,sr1
>>    4:   23 80 0e 01     ldil L%-10000000,ret0
>>    8:   0b 98 0a 1c     add,l r24,ret0,ret0
>>    c:   d7 97 0c 14     depw r23,31,12,ret0
>>   10:   0f 5c 12 88     stw ret0,4(r26)
>>   14:   07 00 53 18     lci r0(sr1,r24),r24
>>   18:   d3 18 1a 74     extrw,u r24,19,12,r24
>>   1c:   34 1c 00 00     ldi 0,ret0
>>   20:   d7 98 0e 14     depw r24,15,12,ret0
>>   24:   0f 5c 12 80     stw ret0,0(r26)
>>   28:   07 40 12 80     fdc r0(r26)
>>   2c:   00 00 04 00     sync
>>   30:   e8 40 c0 02     bv,n r0(rp)
>> Disassembly of section .init.text:
>>
>> But this time, it seems not consider assembly:
>>         asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
>>         asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
>>         asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
>>
>> as a 'volatile' block and insert line 1c:
>> This could may be solved by re-write as an one 'volatile' asm block like:
>> 	asm volatile (
>> 	"lci %%r0(%%sr1, %1), %1"
>> 	"\textru        %1,19,12,%1\n"
>> 	"\tdepw         %1,15,12,%0\n"
>> 	: "=r" (pa)
>> 	: "r" (vba));
>>
>> and even add a clobber 'memory'
>> 	asm volatile (
>> 	"lci %%r0(%%sr1, %1), %1"
>> 	"\textru        %1,19,12,%1\n"
>> 	"\tdepw         %1,15,12,%0\n"
>> 	: "=r" (pa)
>> 	: "r" (vba)
>> 	: "memory");
>>
>> But I have no clue how to restore BUG_ON() and avoid wrong optimization?
>>
>> Any idea?
>>
>> Tia,
>> 	r.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
