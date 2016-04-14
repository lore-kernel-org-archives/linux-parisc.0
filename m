From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: c8000::kernel hangs with 16G DRAM
Date: Thu, 14 Apr 2016 11:07:33 +0200
Message-ID: <CACrbsaCe7StmL82Oevt0_mtt+6V+_sYDpOAtFRkbHc36dRHZzw@mail.gmail.com>
References: <CACrbsaC_FOZ4tG+AmBAtz_Dir+w5XfY9Nc-j-XPqnQkPph+jWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaC_FOZ4tG+AmBAtz_Dir+w5XfY9Nc-j-XPqnQkPph+jWQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Please forget the previus post: it was a defective DIMM.
Booting with 12GB is OK and using another 2GB couple has fixed the issue.
I'm sorry for the false alarm.

   Simone Mannori - ITALY

On 14 April 2016 at 10:46, Simone Mannori <simone.mannori@gmail.com> wrote:
> Dear All,
>
> after upgrading the RAM to 16GB (8 x 2GB modules), the kernel hangs
> just after the "nouveau" module loading.
> With X1 ATI video card, the "radeon" driver has the very same behaviour.
> Booting without ANY video card is OK and the c8000 works perfectly
> (this exlude any memory realted issues like memory
> errors/defective/unmatched DIMM)
>
> With "nouveau" the serial console dump is:
>
> [  OK  ] Reached target Graphical Interface.
> [   73.932000] nuveau 0000:80:00.0: DRM: 0xABCE: Parsing digital
> output script table
>          Starting Update UTMP about Syste[   74.104000] nouveau
> 0000:80:00.0: DRM: 0xABCE: Parsing digital output script table
> m Runlevel Changes...
> [  OK  ] Started Update UTMP about System Runlevel Changes.
> [   95.616000] INFO: rcu_sched detected stalls on CPUs/tasks:
> [   95.680000]  (detected by 1, t=5272 jiffies, g=2108, c=2107, q=121)
> [   95.756000] All QSes seen, last rcu_sched kthread activity 5284
> (4294916235-4294910951), jiffies_till_next_fqs=1, root ->qsmask 0x0
> [   95.896000] dpkg            R  running task        0   941    938 0x00000014
> [   95.984000] Backtrace:
> [   96.012000]  [<0000000040215bc0>] show_stack+0x20/0x38
> [   96.072000]  [<00000000402756e4>] sched_show_task+0x134/0x1d0
> [   96.140000]  [<00000000402adc04>] rcu_check_callbacks+0x9bc/0x9c8
> [   96.216000]  [<00000000402b2494>] update_process_times+0x74/0xd8
> [   96.288000]  [<0000000040216edc>] timer_interrupt+0x1bc/0x220
> [   96.356000]  [<000000004029d714>] handle_irq_event_percpu+0xb4/0x250
> [   96.432000]  [<00000000402a3028>] handle_percpu_irq+0xa8/0xe8
> [   96.500000]  [<000000004029c99c>] generic_handle_irq+0x4c/0x68
> [   96.568000]  [<0000000040205308>] call_on_stack+0x18/0x24
> [   96.636000]
> [   96.652000] rcu_sched kthread starved for 5508 jiffies! g2108 c2107
> f0x2 s3 ->state=0x100
> [   96.752000] timer_interrupt(CPU 1): delayed! cycles 4370CCA7 rem
> 82659  next/now 5AA779EC42/5AA771C5E9
>
>   Simone Mannori - ITALY
