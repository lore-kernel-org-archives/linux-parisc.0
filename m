From: Graham Gower <graham.gower@gmail.com>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status
 update)
Date: Thu, 25 Apr 2013 18:09:33 +0930
Message-ID: <5178EBC5.2050607@gmail.com>
References: <201304241944.r3OJirJv009740@arbas.nms.ulrich-teichert.org> <1725746.7h2TmhW5F7@eto> <CAEdQ38HjaLRMa_0f=qjVa84-xmerQvmsLH0OBdHxeRReOKQuyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	Ulrich Teichert <krypton@ulrich-teichert.org>,
	Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38HjaLRMa_0f=qjVa84-xmerQvmsLH0OBdHxeRReOKQuyw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/25/2013 02:59 PM, Matt Turner wrote:
> On Wed, Apr 24, 2013 at 1:08 PM, Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
>> video=radeonfb:off
> 
> Has anyone tried with kernel modesetting?
> 
> It seems immensely more interesting than radeonfb.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Looks rather similar.

burke:~# modprobe radeon
[  489.408000] [drm] radeon defaulting to kernel modesetting.
[  489.480000] [drm] radeon kernel modesetting enabled.
[  489.548000] radeon 0000:80:00.0: enabling SERR and PARITY (0107 -> 0147)
[  489.716000] [drm] initializing kernel modesetting (R420 0x1002:0x4A4D 0x1002:0x4A4D).
[  489.860000] [drm] register mmio base: 0x00020000
[  489.920000] [drm] register mmio size: 65536
[  531.016000] BUG: soft lockup - CPU#3 stuck for 22s! [bash:2745]
[  531.092000] Modules linked in: radeon(+) cfbfillrect cfbimgblt cfbcopyarea i2c_algo_bit drm_kms_helper ttm drm parisc_agp agpgart
[  531.248000] 
[  531.268000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  531.332000] PSW: 00001000000001101111111000001111 Not tainted
[  531.408000] r00-03  000000ff0806fe0f 00000000407a78d0 000000004018e790 00000000406cd0f0
[  531.512000] r04-07  00000000407980d0 00000000435c2500 00000000406401c0 0000000000000001
[  531.620000] r08-11  0000000000000003 000000004069aaf0 fffffffffffffff7 0000000040740bd0
[  531.724000] r12-15  0000000000000000 000000004065c540 0000000000000000 00000000406ee624
[  531.828000] r16-19  000000007e0946e8 00000000000fb648 00000000000f6c78 0000000000000000
[  531.936000] r20-23  ffffffffffffffff 00000000435c2530 000000000800000f 0000000000000001
[  532.040000] r24-27  0000000000000003 0000000000000004 00000000435c2538 00000000407980d0
[  532.148000] r28-31  0000000000000001 000000007e050740 000000007e0506a0 0000000000000004
[  532.252000] sr00-03  0000000000658000 0000000000000000 0000000000000000 0000000000658000
[  532.360000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  532.464000] 
[  532.484000] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004018e65c 000000004018e660
[  532.596000]  IIR: 44bc0040    ISR: 000000004064b940  IOR: 000000007f881438
[  532.688000]  CPU:        3   CR30: 000000007e050000 CR31: fffffff0f0e034e0
[  532.776000]  ORIG_R28: 0000000000000002
[  532.828000]  IAOQ[0]: smp_call_function_many+0x344/0x3d8
[  532.896000]  IAOQ[1]: smp_call_function_many+0x348/0x3d8
[  532.968000]  RP(r2): on_each_cpu+0x50/0x90
[  533.020000] Backtrace:
[  533.052000]  [<000000004018e790>] on_each_cpu+0x50/0x90
[  533.120000]  [<0000000040119aac>] flush_cache_mm+0x24/0x30
[  533.196000]  [<000000004013d118>] dup_mm+0x118/0x5e8
[  533.260000]  [<000000004013e0ac>] copy_process.part.63+0xa24/0x1488
[  533.344000] 
[  533.364000] Kernel panic - not syncing: softlockup: hung tasks
[  533.440000] Backtrace:
[  533.472000]  [<000000004011a0b0>] dump_stack+0x18/0x28
[  533.540000]  [<000000004013fb98>] panic+0x128/0x398
[  533.604000]  [<000000004019af58>] watchdog_timer_fn+0x2b0/0x2c8
[  533.680000]  [<000000004016c6d4>] hrtimer_run_queues+0x134/0x320
[  533.760000]  [<0000000040151ab4>] update_process_times+0x4c/0xc0
[  533.840000]  [<000000004011b77c>] timer_interrupt+0x19c/0x200
[  533.916000]  [<000000004019bf64>] handle_irq_event_percpu+0xac/0x300
[  534.000000]  [<00000000401a08b0>] handle_percpu_irq+0xa8/0xe0
[  534.076000]  [<000000004019b3b0>] generic_handle_irq+0x40/0x50
[  534.152000]  [<000000004011c2e0>] do_cpu_irq_mask+0x1d0/0x2b8
[  534.228000]  [<0000000040105074>] intr_return+0x0/0x4
[  534.296000] 
