From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sun, 14 Jun 2009 19:20:47 -0400
Message-ID: <20090614232046.GA14028@hiauly1.hia.nrc.ca>
References: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca> <4A2ADEC9.2090403@gmx.de> <4A35741F.6000107@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A35741F.6000107@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 15 Jun 2009, Helge Deller wrote:

> On 06/06/2009 11:25 PM, Helge Deller wrote:
>> John David Anglin wrote:
>>> On the rp3440, the spinlock is definitely needed.  With just
>>> preempt_disable/preempt_enable, a crash occurs during bootstrap
>>> at the point unused memory is recovered.  Thus, the tlb purge
>>> issue referred to in the preceeding comment affects more than
>>> just N class.
>>>
>>> On the otherhand, it doesn't seem necessary to disable interrupts
>>> during the purge with UP kernels.
>>
>> My kernel crashes happened with UP-kernels on a B2000 (1 CPU).
>> So, I still have the feeling that it's necessary to disable interrupts
>> on UP kernels as well.
>
> Hi Dave,
>
> I did further testing. Especially I wanted to clarify if disabling
> interrupts are necessary or not.
>
> To test it, I added a WARN_ON(in_interrupt()) to the purge_tlb_start() 
> macro like this:
> +#define purge_tlb_start(flags)	WARN_ON(in_interrupt()); 
> spin_lock_irqsave(&pa_tlb_lock, flags)
> and did ran the compile-test which usually hang my system.
>
> The result is that we really need to disable interrupts.
> The WARN_ON() did triggered for me again as it always did hang the system.
> This is with a UP-kernel (2.6.30-rc8) on a UP-machine (B2000):
>
>
> Badness at arch/parisc/kernel/cache.c:461
>
>
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>
> PSW: 00000000000001101111100100001111 Tainted: G        W
>
> r00-03  0006f90f 10640000 10112760 106f4c40
>
> r04-07  5eadc000 2418e30c 0004eadc 113336f0
>
> r08-11  2418e31c 0000007c 106f4a88 7c5b3c7c
>
> r12-15  104c45ec 106c9da0 00001000 10000000
>
> r16-19  00000fff 1067f13c 105e0560 00000100
>
> r20-23  0000ff00 5eadc10a 5eadc100 00000040
>
> r24-27  00000000 5eadcfc0 5eadd000 10640680
>
> r28-31  106f4000 0000000a 106f4c80 471249e8
>
> sr00-03  00000000 00000000 00000000 00000025
>
> sr04-07  00000000 00000000 00000000 00000000
>
>
>
> IASQ: 00000000 00000000 IAOQ: 10112774 10112778
>
>  IIR: 03ffe01f    ISR: 0424013a  IOR: b72dcfc0
>
>  CPU:        0   CR30: 106f4000 CR31: 11111111
>
>  ORIG_R28: 106f4dc0
>
>  IAOQ[0]: flush_kernel_dcache_page_addr+0x30/0xa0
>
>  IAOQ[1]: flush_kernel_dcache_page_addr+0x34/0xa0
>
>  RP(r2): flush_kernel_dcache_page_addr+0x1c/0xa0
>
> Backtrace:
>
>  [<10112760>] flush_kernel_dcache_page_addr+0x1c/0xa0
>
>
>
> Sadly I didn't got a full backtrace.
> The WARN_ON() triggered around 20 times during the phase where my machine 
> was
> pretty much loaded.
> Interestingly it was always inflush_kernel_dcache_page_addr().
>
> So, I still think my patch at http://patchwork.kernel.org/patch/28458/ 
> should
> be applied to all kernels.

I am convinced that interrupts need to be disabled on SMP kernels to
prevent deadlock.  On UP kernels, I am not convinced that anything bad
happens if we do a tlb purge while handling an interrupt since we don't
have to worry about preventing bus conflicts.  The UP code can't
deadlock.  I'm thinking that we can stay with disabling preemption.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
