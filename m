From: Graham Gower <graham.gower@gmail.com>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status update)
Date: Thu, 25 Apr 2013 13:52:08 +0930
Message-ID: <CAFk90B-yEO3VmGLL_+6+9jh3_M+wJ1OV79Wt31U_aFP+9ad6dQ@mail.gmail.com>
References: <201304241944.r3OJirJv009740@arbas.nms.ulrich-teichert.org>
	<1725746.7h2TmhW5F7@eto>
	<51784068.10103@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	Ulrich Teichert <krypton@ulrich-teichert.org>,
	Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51784068.10103@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25 April 2013 05:58, John David Anglin <dave.anglin@bell.net> wrote:
> On 4/24/2013 4:08 PM, Rolf Eike Beer wrote:
>>
>> video=radeonfb:off
>
>
> I think this is a thread stack overrun.  See this patch:
> http://www.spinics.net/lists/linux-parisc/msg04680.html
> but increase THREAD_SIZE_ORDER to 4.
>
> There are various manifestations of this but they all involve crashes during
> interrupt handling.

I get the same bug with radeonfb on my c8000. Bumping
THREAD_SIZE_ORDER did not help. Passing the video=radeonfb:off kernel
parameter is an effective workaround.

When building as a module and later loading radeonfb.ko, the hang
remains but the machine responds to ping. I snapped the output below,
which hopefully helps someone. I'm using a stock kernel 3.8.8.

-Graham

burke:~# modprobe radeonfb
[  403.888000] radeonfb 0000:80:00.0: enabling SERR and PARITY (0107 -> 0147)
[  463.712000] INFO: rcu_sched detected stalls on CPUs/tasks: { 3}
(detected by 1, t=15021 jiffies, g=3107, c=3106, q=27)
[  463.856000] Task dump for CPU 3:
[  463.896000] modprobe        R  running task        0  2822   2815 0x00000016
[  463.992000] Backtrace:
[  464.024000]  [<00000000403ca6a8>] __driver_attach+0x100/0x108
[  464.100000]  [<00000000403c7940>] bus_for_each_dev+0x98/0xf8
[  464.172000]  [<00000000403c9c70>] driver_attach+0x28/0x38
[  464.244000]  [<00000000403c9534>] bus_add_driver+0xfc/0x360
[  464.320000]  [<00000000403cad58>] driver_register+0x90/0x1e8
[  464.396000]  [<000000004036a628>] __pci_register_driver+0x48/0x58
[  464.476000]  [<000000001029f04c>] radeonfb_init+0x2c/0x38 [radeonfb]
[  464.560000]  [<0000000040117524>] do_one_initcall+0x18c/0x1e8
[  464.636000]  [<0000000040193998>] load_module+0x1cf0/0x2298
[  464.708000]  [<0000000040194018>] sys_init_module+0xd8/0x110
[  464.784000]  [<0000000040105f48>] syscall_exit+0x0/0x14
[  464.852000]
[  464.872000] timer_interrupt(CPU 1): delayed! cycles 4BEAD5A6 rem
23615A  next/now 8B58E727CD/8B58C3C673
[  476.324000] BUG: soft lockup - CPU#0 stuck for 22s! [sshd:2766]
[  476.324000] Modules linked in: radeonfb(+) i2c_algo_bit fb_ddc
snd_cmipci snd_mpu401_uart snd_opl3_lib snd_hwdep snd_rawmidi
snd_seq_device snd_pcm snd_page_alloc snd_timer snd soundcore
[  476.324000]
[  476.324000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  476.324000] PSW: 00001000000001101111111100001111 Not tainted
[  476.324000] r00-03  000000ff0806ff0f 0000000040820370
000000004018e7d0 000000004073def0
[  476.324000] r04-07  000000004080f370 0000000043626500
00000000406ac1c0 0000000000000001
[  476.324000] r08-11  0000000000000003 0000000040706c70
fffffffffffffffe 00000000407b1890
[  476.324000] r12-15  0000000000000000 00000000406c8540
0000000000000000 000000004075e624
[  476.324000] r16-19  000000007ecea428 0000000000080140
0000000000068848 fffffffffe799000
[  476.324000] r20-23  ffffffffffffffff 0000000043626530
000000000800000f 0000000000000001
[  476.324000] r24-27  0000000000000004 0000000000000004
0000000043626538 000000004080f370
[  476.324000] r28-31  0000000000000001 000000007e140740
000000007e1406a0 0000000000000004
[  476.324000] sr00-03  000000000062d800 0000000000000000
0000000000000000 000000000062d800
[  476.324000] sr04-07  0000000000000000 0000000000000000
0000000000000000 0000000000000000
[  476.324000]
[  476.324000] IASQ: 0000000000000000 0000000000000000 IAOQ:
000000004018e69c 000000004018e6a0
[  476.324000]  IIR: 44bc0040    ISR: 00000000406b7940  IOR: 000000004080f370
[  476.324000]  CPU:        0   CR30: 000000007e140000 CR31: fffffff0f0e034e0
[  476.324000]  ORIG_R28: 0000000000000002
[  476.324000]  IAOQ[0]: smp_call_function_many+0x344/0x3d8
[  476.324000]  IAOQ[1]: smp_call_function_many+0x348/0x3d8
[  476.324000]  RP(r2): on_each_cpu+0x50/0x90
[  476.324000] Backtrace:
[  476.324000]  [<000000004018e7d0>] on_each_cpu+0x50/0x90
[  476.324000]  [<0000000040119aec>] flush_cache_mm+0x24/0x30
[  476.324000]  [<000000004013d158>] dup_mm+0x118/0x5e8
[  476.324000]  [<000000004013e0ec>] copy_process.part.63+0xa24/0x1488
[  476.324000]
[  476.324000] Kernel panic - not syncing: softlockup: hung tasks
[  476.324000] Backtrace:
[  476.324000]  [<000000004011a0f0>] dump_stack+0x18/0x28
[  476.324000]  [<000000004013fbd8>] panic+0x128/0x398
[  476.324000]  [<000000004019af98>] watchdog_timer_fn+0x2b0/0x2c8
[  476.324000]  [<000000004016c714>] hrtimer_run_queues+0x134/0x320
[  476.324000]  [<0000000040151af4>] update_process_times+0x4c/0xc0
[  476.324000]  [<000000004011b7bc>] timer_interrupt+0x19c/0x200
[  476.324000]  [<000000004019bfa4>] handle_irq_event_percpu+0xac/0x300
[  476.324000]  [<00000000401a08f0>] handle_percpu_irq+0xa8/0xe0
[  476.324000]  [<000000004019b3f0>] generic_handle_irq+0x40/0x50
[  476.324000]  [<000000004011c320>] do_cpu_irq_mask+0x1d0/0x2b8
[  476.324000]  [<0000000040105074>] intr_return+0x0/0x4
[  476.324000]
