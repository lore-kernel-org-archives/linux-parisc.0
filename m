From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: megaraid hang on parisc
Date: Wed, 03 Jul 2013 13:31:51 -0700
Message-ID: <1372883511.3601.69.camel@dabdike>
References: <51D47B79.7080600@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51D47B79.7080600@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2013-07-03 at 21:28 +0200, Helge Deller wrote:
>                 Cc:
> list parisc-linux
> <parisc-linux@lists.parisc-linux.org>

Wrong list ... we switched to vger long ago (cc updated)

> Hi James,
> 
> one of my parisc machines has a built-in (HP) megaraid controller.
> 
> With Linux kernel 3.10(final) I get a hang in issue_scb_block() in drivers/scsi/megaraid.c
> which is then finally detected and killed by the hung tasks thread.   
> Maybe you have an idea?

It's probably one of

     1. Endianness issue in the driver meaning the command doesn't look
        right to the firmware
     2. Failure to Issue, may be a missed PCI post flush
     3. Interrupt routing problem

But without diagnosing, it's hard to say.

James

> This is not special to 3.10 - it happens with older kernel releases as well.
> 
> Helge
> 
> Synthesizing the initial hotplug events...megaraid_legacy 0000:50:00.1: enabling device (0000 -> 0002)
> megaraid_legacy 0000:50:00.1: enabling SERR and PARITY (0002 -> 0142)
> megaraid: found 0x8086:0x1960:bus 80:slot 0:func 1
> scsi4:Found MegaRAID controller at 0x7e000, IRQ:71
> done.
> Waiting for /dev to be fully populated...
> ....
> BUG: soft lockup - CPU#2 stuck for 23s! [modprobe:1272]
> Modules linked in: megaraid(+)
> CPU: 2 PID: 1272 Comm: modprobe Not tainted 3.10.0-64bit-c3000+ #55
> task: 00000000bedee100 ti: 00000000bdca8000 task.ti: 00000000bdca8000
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000011001111111100001111 Not tainted
> r00-03  000000ff080cff0f 00000000040a3000 00000000040abca0 00000000bdca8bb0
> r04-07  00000000040a3000 00000000bdc87010 00000000bed0b490 00000000bdc87008
> r08-11  0000000000000050 00000000bed0b490 00000000bdca8a88 000000000007e000
> r12-15  ffffffff94000000 00000000bed0b000 0000000000000047 00000000bdc86000
> r16-19  0000000000001228 000000000000000f 0000000000005001 00000000000000ff
> r20-23  00000000bdc8701e 00000000bdca8a96 00000000bf7220c0 0000001ae4d03500
> r24-27  0000000040b58cf0 00000000bdca8a88 00000000bed0b490 00000000040a3000
> r28-31  00000000000000ff 00000000bdca8b80 00000000bdca8c70 00000000000000ff
> sr00-03  0000000000000000 0000000000000000 0000000000000000 000000000007f000
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000040a566c 00000000040a5664
>  IIR: 08000240    ISR: 00000000bdca8d48  IOR: 0000000040c2ef80
>  CPU:        2   CR30: 00000000bdca8000 CR31: ffffffffffffffff
>  ORIG_R28: 0000000000000000
>  IAOQ[0]: issue_scb_block+0x134/0x4d8 [megaraid]
>  IAOQ[1]: issue_scb_block+0x12c/0x4d8 [megaraid]
>  RP(r2): megaraid_probe_one+0x808/0x1a68 [megaraid]
> Backtrace:
>  [<00000000040abca0>] megaraid_probe_one+0x808/0x1a68 [megaraid]
> 
> Kernel panic - not syncing: softlockup: hung tasks
> CPU: 2 PID: 1272 Comm: modprobe Not tainted 3.10.0-64bit-c3000+ #55
> Backtrace:
>  [<000000004012041c>] show_stack+0x2c/0x40
>  [<00000000403bf2fc>] dump_stack+0x64/0x78
>  [<000000004014b4a4>] panic+0x1a4/0x4f0
>  [<00000000401d1840>] watchdog_timer_fn+0x328/0x350
>  [<00000000401891b4>] hrtimer_run_queues+0x14c/0x3e0
>  [<0000000040163e74>] run_local_timers+0x34/0x70
>  [<0000000040163f28>] update_process_times+0x78/0x148
>  [<0000000040121ae0>] timer_interrupt+0x200/0x288
>  [<00000000401d2c98>] handle_irq_event_percpu+0xb8/0x378
>  [<00000000401d8d0c>] handle_percpu_irq+0xbc/0xf8
>  [<00000000401d1d0c>] generic_handle_irq+0x4c/0x68
>  [<00000000401062d0>] syscall_do_resched+0x28/0x34



