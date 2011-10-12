From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC running CMake Nightly tests
Date: Tue, 11 Oct 2011 22:32:01 -0600
Message-ID: <20111012043201.GA22657@parisc-linux.org>
References: <d21336a9332d91f209ba666bd94f3acd.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d21336a9332d91f209ba666bd94f3acd.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 27, 2011 at 09:32:37AM +0200, Rolf Eike Beer wrote:
> I'm running the CMake tests every night. This is the second time in a row
> that my C3600 did not survive this. Since I was warned I connected a
> serial console.
...

> But then the machine got killed:
> 
> Backtrace:
>  [<1030b9ec>] tulip_get_stats+0x34/0x5c
>  [<1038ac20>] dev_get_stats+0x98/0xe8
>  [<102946b4>] led_work_func+0x11c/0x310
>  [<10145204>] process_one_work+0x120/0x3ac
>  [<10147110>] worker_thread+0x174/0x338
>  [<1014b0b4>] kthread+0x9c/0xa4
>  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24
> 
> 
> High Priority Machine Check (HPMC): Code=1 regs=10551080 (Addr=00000000)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001110 Not tainted
> r00-03  0004ff0e 105bf000 1030b9ec 2fc72000
> r04-07  0000000f 00000000 00000000 00000000
> r08-11  2fc72000 105bf600 2fea4208 7f000000
> r12-15  2fea4210 105ba000 10544000 2fc2f408
> r16-19  1041d1dc f000017c f0000174 2fea4210
> r20-23  0099f055 0099f050 1030b9b8 00000000
> r24-27  2ff57008 2fea4210 0004a040 10544000
> r28-31  0004a040 f68e066d 2fea4400 1038ac20
> sr00-03  00000000 00000000 00000000 00000017
> sr04-07  00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 10284394 10284398
>  IIR: 0f80109c    ISR: a627ffd0  IOR: 0204a040
>  CPU:        0   CR30: 2fea4000 CR31: ffffdffe
>  ORIG_R28: 00000000
>  IAOQ[0]: ioread32+0xc/0x4c

Usually the HMPC means tulip tried to read something
from MMIO space that didn't respond and this
resulted in a "Master Abort" (PCI bus controller
had to abort the transaction). On PCs that's not
fatal but is on many RISC architectures.

If you can decode the instruction pointer (ioread32+0x10) to figure out
which register is used to dereference the MMIO address, it would
be obvious what the offending address is - just to confirm the
pointer isn't pointing off into the weeds. It will be one of the
registers that contains a 0xfnnnnnnn address.

Also possible is something before already offended the SBA 
("System Bus Adapter" : has IOMMU and mem controller in it)
by trying to DMA to an unmapped address. SBA is "fatal"
at that point and the next MMIO read causes the CPU to
recognize the fatal state of the SBA. Decoding the HPMC (see
below) can help determine that.


>  IAOQ[1]: ioread32+0x10/0x4c
>  RP(r2): tulip_get_stats+0x34/0x5c
> Backtrace:
>  [<1030b9ec>] tulip_get_stats+0x34/0x5c
>  [<1038ac20>] dev_get_stats+0x98/0xe8
>  [<102946b4>] led_work_func+0x11c/0x310
>  [<10145204>] process_one_work+0x120/0x3ac
>  [<10147110>] worker_thread+0x174/0x338
>  [<1014b0b4>] kthread+0x9c/0xa4
>  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24
> 
> Kernel panic - not syncing: High Priority Machine Check (HPMC)
> Backtrace:
>  [<1010edec>] panic+0x90/0x23c
>  [<101143b8>] parisc_terminate+0xbc/0xd4
>  [<1011458c>] handle_interruption+0x1bc/0x718
>  [<10103078>] intr_check_sig+0x0/0x34
>  [<10284398>] ioread32+0x10/0x4c
>  [<103e8fc0>] bictcp_acked+0x0/0x228
> 
> I'm running 3.0.4 with d7dd2ff11b7fcd425aca5a875983c862d19a67ae reverted.
> 
> Any hints?

Interrupt the boot process and collect the HPMC dump as described:
   http://www.parisc-linux.org/faq/kernelbug-howto.html> 

The output will include the offending address that the ioread32 was
trying to access to confirm the instruction was decoded correctly.
If anyone has access to the magic decoder ring, we might be able to tell more.

cheers,
grant
