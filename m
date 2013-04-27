From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: increase kernel stack size to 32k
Date: Sat, 27 Apr 2013 19:09:15 -0400
Message-ID: <BLU0-SMTP100ADB80BC8ECEF0AB6F92A97B00@phx.gbl>
References: <20130423202203.GA7287@p100.box> <51778ADE.4010906@gmx.de> <1366836075.1971.22.camel@dabdike> <20130426223014.GA19671@p100.box> <517C48E7.7050701@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <517C48E7.7050701@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27-Apr-13, at 5:53 PM, Helge Deller wrote:

> On 04/27/2013 12:30 AM, Helge Deller wrote:
>> * James Bottomley <James.Bottomley@HansenPartnership.com>:
>>> On Wed, 2013-04-24 at 09:33 +0200, Helge Deller wrote:
>>>> On 04/23/2013 10:22 PM, Helge Deller wrote:
>>>>> commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
>>>>> Author: Helge Deller <deller@gmx.de>
>>>>> Date:   Tue Apr 23 17:19:37 2013 +0200
>>>>>
>>>>> parisc: increase kernel stack size to 32k
>>>>>
>>>>> --- a/arch/parisc/include/asm/thread_info.h
>>>>> +++ b/arch/parisc/include/asm/thread_info.h
>>>>> -#define THREAD_SIZE_ORDER            2
>>>>> +#define THREAD_SIZE_ORDER            3	/* 32k stack */
>>>>
>>>> I tested again, and it actually needs to be 64k stacks to not  
>>>> crash any longer.
>>>> So, the right temporary fix is:
>>>>
>>>>> +#define THREAD_SIZE_ORDER            4	/* 64k stack */
>>>>
>>>> Will send updated patch soon.
>>>
>>> This is an indicator of something seriously wrong somewhere.  We've
>>> always had the 16k stack just because of our large frames.  In  
>>> theory,
>>> the IRQ stack should only be the same size as the kernel stack, so  
>>> if we
>>> have both in the same place, we should only need at max 32k ... if  
>>> we're
>>> still seeing problems related to stack overrun, then it might be  
>>> we have
>>> an IRQ recursion where we shouldn't have.  To be honest, I have a  
>>> hard
>>> time explaining why our stacks should be over 8k.
>
> Attached is a new version of my irq-stack-patch, which made my  
> system really stable :-)
> As test I did used "hackbench 300" (from the LTP project) which  
> created 12000 threads:
> uptime: 23:44:09 up 17 min,  2 users,  load average: 1232.23,  
> 2966.09, 2466.39
>
> My findings so far:
> * kernel stack: THREAD_SIZE_ORDER needs to be at least 2 (=16k). x86  
> has 1 (8k).
>  With 8k kernel stacks and  DEBUG_STACKOVERFLOW enabled, I get  
> directly after bootup:
> stackcheck: swapper/0 has overflown a kernel stack (sp:bfc52030, stk  
> bottom-top:bfc50000-bfc52000)
>
> * IRQ stack: 16k seems sufficient as well.
>
> So, the combination of 16k kernel stack and 16k irq stacks seems OK.
>
> I still need to clean up my patch, test if backtraces still work  
> (with which I currently
> have problems) and prepare a final patch.


So far, I haven't been able to break the first version of the irqstack  
patch.  It's working far better than
setting THREAD_SIZE_ORDER to 4.  There were various application errors  
with the latter.  Building
new version.

I have the following comments:

+#define get_current_sp(sp)	__asm__("copy %%r30, %0" : "=r"(sp))

Probably, should be __asm__ __volatile__.  I'm not sure that all changes
to the stack pointer are known to GCC.

+/* void call_on_stack(unsigned long param1, void *func, unsigned long  
new_stack) */
+ENTRY(call_on_stack)
+	STREG	%sp, 8(%arg2)
+	STREG	%rp, 16(%arg2)
+
+	/* HPPA calling convention for function pointers */
+#ifdef CONFIG_64BIT
+	LDREG	16(%arg1), %arg1
+	bve,l	(%arg1), %rp
+	addi    0x40, %arg2, %sp
+#else
+	addi    0x40, %arg2, %sp
+	be,l	0(%sr4,%arg1), %sr0, %r31
+	copy	%r31, %rp
+#endif
+
+	addi    -0x40, %sp, %sp
+	LDREG	16(%sp),%rp
+	bv	(%rp)
+	LDREG	8(%sp),%sp
+ENDPROC(call_on_stack)

This doesn't full adhere to calling conventions but may work in  
limited circumstances.  For
example, 64-bit calls nominally require setup of the argument  
pointer.  There's also save
and restore of the PIC register if it can be modified.

Dave
--
John David Anglin	dave.anglin@bell.net



