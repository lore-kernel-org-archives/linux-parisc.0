From: Helge Deller <deller@gmx.de>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Mon, 27 May 2013 21:20:50 +0200
Message-ID: <51A3B212.8010908@gmx.de>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee> <51929EAB.3020503@gmx.de> <alpine.SOC.1.00.1305150957460.29631@math.ut.ee> <5193D0F5.4060706@gmx.de> <51968FFB.6040707@gmx.de> <alpine.SOC.1.00.1305271012160.1179@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Meelis Roos <mroos@linux.ee>, Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1305271012160.1179@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/27/2013 09:15 AM, Meelis Roos wrote:
> I saw that 3.10-rc3 is out with a new bunch of parisc fixes. Tried it on
> my RP3440 and it works - thank you!
Thanks. Great!

> Only one new minor problem has appeared: a warning from cpu_idle during
> bootup. Seems harmless but not good. It does not reappear under load -
> I did Gentoo upgrade with
> emerge --sync&&  emerge -u -N world&&  emerge --depclean
> and no further problems.

That's a known problem.
Patch from James Bottomley is here:
https://patchwork.kernel.org/patch/2541701/

@Thomas, it would be great if you could comment on that patch....

Another known problem is, that the sti framebuffer driver currently does 
not work, which means you won't get a graphical login screen....

Helge
> [    3.132000] sym0:<1010-66>  rev 0x1 at pci 0000:20:01.0 irq 21
> [    3.136000] sym0: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
> [    3.168000] sym0: SCSI BUS has been reset.
> [    3.176000] scsi0 : sym-2.2.3
> [    3.176000] ------------[ cut here ]------------
> [    3.176000] WARNING: at kernel/cpu/idle.c:98
> [    3.176000] Modules linked in:
> [    3.176000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.10.0-rc3 #30
> [    3.176000] task: 00000000405ff580 ti: 000000004057e000 task.ti: 000000004057e000
>
> [    3.184000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [    3.184000] PSW: 00001000000001001110100100001110 Not tainted
> [    3.192000] r00-03  000000ff0804e90e 00000000406b8210 0000000040174ecc 000000004057e350
> [    3.192000] r04-07  00000000406a9210 000000004057e3d0 0000000000000001 00000000405ded3e
> [    3.200000] r08-11  0000000000000001 0000000040597c2c 000000000804000e 000000004011407c
> [    3.204000] r12-15  0000000000000013 0000000000000000 00000000000130e4 0000000000000000
> [    3.204000] r16-19  00000000f0d00b0c 00000000000130e4 0000000000000000 0000000000000000
> [    3.212000] r20-23  0000000000000000 0000000000000002 00000000000000d7 0000000000000001
> [    3.220000] r24-27  0000000000000001 000000004057e000 0000000000000000 00000000406a9210
> [    3.220000] r28-31  0000000000000000 000000004057e3d0 000000004057e400 0000000000000001
> [    3.228000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    3.236000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>
> [    3.244000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040174f9c 0000000040174fa0
> [    3.244000]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000
> [    3.248000]  CPU:        0   CR30: 000000004057e000 CR31: fffffff0f0e05ee0
> [    3.248000]  ORIG_R28: 000000004016bb90
> [    3.260000]  IAOQ[0]: cpu_idle_loop+0x15c/0x170
> [    3.260000]  IAOQ[1]: cpu_idle_loop+0x160/0x170
> [    3.260000]  RP(r2): cpu_idle_loop+0x8c/0x170
> [    3.264000] Backtrace:
> [    3.268000]  [<0000000040174ff8>] cpu_startup_entry+0x48/0x50
> [    3.268000]  [<000000004010bc40>] rest_init+0xf0/0x108
> [    3.276000]  [<00000000406ccd50>] start_kernel+0x550/0x578
> [    3.276000]  [<0000000040497560>] packet_ioctl+0x1a0/0x238
> [    3.276000]  [<000000004047a540>] ip_mroute_getsockopt+0x88/0x138
> [    3.284000]  [<0000000040457fbc>] udp_ioctl+0xcc/0xd8
> [    3.284000]  [<0000000040455880>] udp_lib_getsockopt+0x30/0x130
> [    3.288000]  [<0000000040452c18>] raw_probe_proto_opt+0x118/0x130
>
> [    3.288000] ---[ end trace c7ab5f13fa5da8f2 ]---

