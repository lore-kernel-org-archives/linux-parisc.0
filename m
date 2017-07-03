From: Helge Deller <deller@gmx.de>
Subject: Re: BUG: workqueue lockup (after powerdown)
Date: Mon, 3 Jul 2017 18:01:05 +0200
Message-ID: <fc3f4979-f533-b411-3794-4bf971bd02a7@gmx.de>
References: <alpine.LRH.2.20.1707031031180.28253@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        Linux Kernel list <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1707031031180.28253@math.ut.ee>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.07.2017 09:34, Meelis Roos wrote:
> Today I tested 4.12 release on my RP3440 (HP parisc). It worked fine, 
> then on shutdown I got this strange message from kernel after shutdown:
> 
> reboot: Power down
> System shut down completed.
> Please power this system off now.
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 40s!
> 
> and this continues with longer and longer times.
> 
> Is it something hppa specific or general?

No idea.
Maybe other platforms (like x86_64) physically drop power on machine 
so you won't see it. On parisc we can't power off on many machines,
so instead we will keep running in an endless for-next loop.

Btw, I'm seeing a similar BUG:

[  308.432664] reboot: Power down
[  308.479625] System shut down completed.
[  308.479625] Please power this system off now.
[  332.523916] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [halt:1807]
[  332.523916] Modules linked in:
[  332.523916] CPU: 0 PID: 1807 Comm: halt Not tainted 4.12.0-64bit+ #724
[  332.523916] task: 00000000af379e00 task.stack: 00000000af00c000
[  332.523916] 
[  332.523916] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004022d180 000000004022d17c
[  332.523916]  IIR: 08030241    ISR: 0000000000000000  IOR: 0000000000000000
[  332.523916]  CPU:        0   CR30: 00000000af00c000 CR31: 00000000d23345e2
[  332.523916]  ORIG_R28: 0000000000000000
[  332.523916]  IAOQ[0]: machine_restart+0x0/0xa0
[  332.523916]  IAOQ[1]: machine_power_off+0x104/0x108
[  332.523916]  RP(r2): machine_power_off+0x104/0x108
[  332.523916] Backtrace:
[  332.523916]  [<000000004022d17c>] machine_power_off+0x104/0x108
[  332.523916]  [<000000004028ff3c>] kernel_power_off+0x1ac/0x1c0
[  332.523916]  [<00000000402902a8>] SyS_reboot+0x250/0x340
[  332.523916]  [<0000000040209020>] syscall_exit+0x0/0x14

Helge
