From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Tue, 24 Nov 2015 10:51:52 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
References: <20151122115153.GA28471@p100.box>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151122115153.GA28471@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sun, 22 Nov 2015, Helge Deller wrote:

> Hi Linus,
> 
> please pull the latest patches for the parisc architecture for kernel v4.4 from:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.4-2
> 
> This patchset adds Huge Page and HUGETLBFS support for parisc.
> 
> Thanks,
> Helge
> 
> ----------------------------------------------------------------
> Helge Deller (9):
>       parisc: Fix wrong comment regarding first pmd entry flags
>       parisc: Drop definition of start_thread_som for HP-UX SOM binaries
>       parisc: Drop unused MADV_xxxK_PAGES flags from asm/mman.h
>       parisc: Add defines for Huge page support
>       parisc: Initialize the fault vector earlier in the boot process.
>       parisc: Increase initial kernel mapping to 32MB on 64bit kernel
>       parisc: Use long branch to do_syscall_trace_exit
>       parisc: Add Huge Page and HUGETLBFS support
>       parisc: Map kernel text and data on huge pages
> 
>  arch/parisc/Kconfig                 |   3 +
>  arch/parisc/include/asm/hugetlb.h   |  85 +++++++++++++++++++
>  arch/parisc/include/asm/page.h      |  13 ++-
>  arch/parisc/include/asm/pgalloc.h   |   2 +-
>  arch/parisc/include/asm/pgtable.h   |  26 +++++-
>  arch/parisc/include/asm/processor.h |  27 ------
>  arch/parisc/include/uapi/asm/mman.h |  10 ---
>  arch/parisc/kernel/asm-offsets.c    |   8 ++
>  arch/parisc/kernel/entry.S          |  56 ++++++++-----
>  arch/parisc/kernel/head.S           |   4 +-
>  arch/parisc/kernel/setup.c          |  14 +++-
>  arch/parisc/kernel/syscall.S        |   4 +-
>  arch/parisc/kernel/traps.c          |  35 ++++----
>  arch/parisc/kernel/vmlinux.lds.S    |   9 +-
>  arch/parisc/mm/Makefile             |   1 +
>  arch/parisc/mm/hugetlbpage.c        | 161 ++++++++++++++++++++++++++++++++++++
>  arch/parisc/mm/init.c               |  40 ++++-----
>  17 files changed, 382 insertions(+), 116 deletions(-)
>  create mode 100644 arch/parisc/include/asm/hugetlb.h
>  create mode 100644 arch/parisc/mm/hugetlbpage.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi

Since the kernel 4.4-rc2 I'm getting frequent boot failures on PA-RISC. 
When I revert this patchset, the crashes are gone.

Mikulas


[    3.296666] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
[    3.453332] Setting cache flush threshold to 65536 kB
[    3.519999] Not-handled unaligned insn 0x43ffff80
[    3.593332] Setting TLB flush threshold to 52 kB
[   12.069998] random: nonblocking pool is initialized
[   63.869993] INFO: rcu_sched self-detected stall on CPU
[   63.869993]  0-...: (17936 ticks this GP) idle=033/140000000000001/0 softirq=11/11 fqs=8965
[   63.869993]   (t=18000 jiffies g=-293 c=-294 q=0)
[   63.869993] Task dump for CPU 0:
[   63.869993] swapper/0       R  running task        0     1      0 0x00000004
[   63.869993] Backtrace:
[   63.869993]  [<00000000402149a4>] show_stack+0x14/0x20
[   63.869993]  [<000000004026807c>] sched_show_task+0x134/0x1d0
[   63.869993]  [<000000004026a96c>] dump_cpu_task+0x5c/0x78
[   63.869993]  [<000000004028cedc>] rcu_dump_cpu_stacks+0xfc/0x188
[   63.869993]  [<00000000402915b4>] rcu_check_callbacks+0x564/0x980
[   63.869993]  [<0000000040294034>] update_process_times+0x54/0xb0
[   63.869993]  [<0000000040215b2c>] timer_interrupt+0x19c/0x200
[   63.869993]  [<0000000040283de8>] handle_irq_event_percpu+0xa8/0x230
[   63.869993]  [<0000000040288efc>] handle_percpu_irq+0x9c/0xd0
[   63.869993]  [<00000000402831b8>] generic_handle_irq+0x40/0x50
[   63.869993]  [<0000000040216a00>] do_cpu_irq_mask+0x1b8/0x2a8
[   63.869993]  [<0000000040204074>] intr_return+0x0/0xc
[   63.869993]  [<00000000402a69dc>] smp_call_function_many+0x33c/0x3a0
[   63.869993]  [<00000000402a6cc4>] smp_call_function+0x3c/0x50
[   63.869993]  [<00000000402a6d38>] on_each_cpu+0x30/0x78
[   63.869993]  [<0000000040213a24>] flush_cache_all+0x24/0x30
[   63.869993]
[   63.873326] timer_interrupt(CPU 0): delayed! cycles 645CA37E rem 2BD984  next/now 1EE1C3D259/1EE197F8D5
(rs s
Resetting System.

[    3.283333] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
[    3.436666] Setting cache flush threshold to 65536 kB
[    3.506666] Not-handled unaligned insn 0x43ffff80
[    3.506666] Setting TLB flush threshold to 176 kB
[    3.733332] SBA found Pluto 2.3 at 0xfffffffffed00000
[    3.873332] Unaligned handler failed, ret = -1
[    3.946666]       _______________________________
[    3.946666]      < Your System ate a SPARC! Gah! >
[    3.946666]       -------------------------------
[    3.946666]              \   ^__^
[    3.946666]                  (__)\       )\/\
[    3.946666]                   U  ||----w |
[    3.946666]                      ||     ||
[    4.359999] swapper/3 (pid 0): Unaligned data reference (code 28)
[    4.453332] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 4.4.0-rc2 #1
[    4.549999] task: 000000007fca6900 ti: 000000007fcf4000 task.ti: 000000007fcf4000
[   11.313332]
[   11.313332]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   11.313332] PSW: 00001000000001001111111100000000 Not tainted
** 10665 printk messages dropped ** [   11.333332]  [<000000004020fb60>] schedule_timeout+0x158/0x1f8
** 33399 printk messages dropped ** [   11.396665]  [<000000004020fb60>] schedule_timeout+0x158/0x1f8
** 33416 printk messages dropped ** [   11.469998]  [<00000000402630a4>] deactivate_task+0x84/0xa0
** 32424 printk messages dropped ** [   11.589998]  [<0000000040293f00>] msleep+0x38/0x50
** 29540 printk messages dropped ** [   11.709998]  [<0000000040293f00>] msleep+0x38/0x50
** 29550 printk messages dropped ** [   11.826665] Backtrace:
** 20455 printk messages dropped ** [   11.933332]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
** 31472 printk messages dropped ** [   12.036665]  [<0000000040293f00>] msleep+0x38/0x50
** 29553 printk messages dropped ** [   12.109998]  [<000000004026b5a0>] dequeue_task_idle+0x40/0x60
** 33125 printk messages dropped ** [   12.223332]  [<0000000040293f00>] msleep+0x38/0x50
** 29573 printk messages dropped ** [   12.326665]  [<000000004026b5a0>] dequeue_task_idle+0x40/0x60
** 33122 printk messages dropped ** [   12.446665]  [<000000004020ca64>] schedule+0x44/0xe8
** 30208 printk messages dropped ** [   12.553332]  [<000000004027a5a4>] cpu_startup_entry+0x13c/0x300
** 33750 printk messages dropped ** [   12.776665]  [<000000004020ca64>] schedule+0x44/0xe8
** 30188 printk messages dropped ** [   12.776665]  [<000000004027a5a4>] cpu_startup_entry+0x13c/0x300
** 33724 printk messages dropped ** [   13.006665] Backtrace:
** 20455 printk messages dropped ** [   13.006665]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
** 31454 printk messages dropped ** [   13.126665]  [<000000004021dd60>] handle_unaligned+0x908/0x958
** 33380 printk messages dropped ** [   13.199998]  [<0000000040215350>] handle_interruption+0x338/0x910
** 34395 printk messages dropped ** [   13.429998]  [<000000004020fc24>] schedule_timeout_uninterruptible+0x24/0x30
** 37954 printk messages dropped ** [   13.553331]  [<000000004026b5a0>] dequeue_task_idle+0x40/0x60
** 33004 printk messages dropped ** [   13.553331]  [<000000004020fc24>] schedule_timeout_uninterruptible+0x24/0x30
** 37859 printk messages dropped ** [   13.809998]  [<000000004020fc24>] schedule_timeout_uninterruptible+0x24/0x30
** 37918 printk messages dropped ** [   13.943331]  [<000000004020fb60>] schedule_timeout+0x158/0x1f8
** 33399 printk messages dropped ** [   13.943331]  [<000000004020fb60>] schedule_timeout+0x158/0x1f8
** 33391 printk messages dropped ** [   14.079998] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D         4.4.0-rc2 #1
** 39246 printk messages dropped ** [   14.319998]  [<000000004020ca64>] schedule+0x44/0xe8
** 30202 printk messages dropped ** [   14.319998]  [<0000000040293f00>] msleep+0x38/0x50
** 29526 printk messages dropped ** [   14.459998]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
** 31393 printk messages dropped ** [   14.566665]  [<0000000040214bd8>] die_if_kernel+0x220/0x298
** 32365 printk messages dropped ** [   14.673331]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
** 31414 printk messages dropped ** [   14.783331]  [<000000004021dd60>] handle_unaligned+0x908/0x958
** 33411 printk messages dropped ** [   14.899998]  [<000000004026b5a0>] dequeue_task_idle+0x40/0x60
** 33047 printk messages dropped ** [   15.013331]  [<000000004021dd60>] handle_unaligned+0x908/0x958
** 33387 printk messages dropped ** [   15.133331] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D         4.4.0-rc2 #1
** 39268 printk messages dropped ** [   15.369998]  [<000000004020fc24>] schedule_timeout_uninterruptible+0x24/0x30
** 37924 printk messages dropped ** [   15.509998]  [<000000004023e5d0>] irq_exit+0x58/0xa0
** 30079 printk messages dropped ** [   15.509998]  [<000000004023e5d0>] irq_exit+0x58/0xa0
** 30107 printk messages dropped ** [   15.646665]  [<00000000402149a4>] show_stack+0x14/0x20
** 30817 printk messages dropped ** [   15.753331] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D         4.4.0-rc2 #1
** 39240 printk messages dropped ** [   15.969998] Backtrace:
** 20424 printk messages dropped ** [   15.969998]  [<000000004020c438>] __schedule+0xe8/0x560
** 31127 printk messages dropped ** [   16.109998]  [<000000004023e5d0>] irq_exit+0x58/0xa0
** 30177 printk [   16.1[<00000083331]  00402153[<00000050>] han00402153dle_inte50>] hanrruptiondle_inte+0x338/0rruptionx910
+0x338/00>] handx910
le_unali[   16.1gned+0x983331]  08/0x958[<000000
004023e5d0>] irq_exit+0x58/0xa0
[   16.183331]  [<0000000040204074>] intr_return+0x0/0xc
[   16.183331]  [<000000004027a5a4>] cpu_startup_entry+0x13c/0x300
[   16.183331]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
[   16.183331]
[   16.183331] bad: scheduling from the idle thread!
[   16.183331] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D         4.4.0-rc2 #1
[   16.183331] Backtrace:
[   16.183331]  [<00000000402149a4>] show_stack+0x14/0x20
[   16.183331]  [<0000000040410c18>] dump_stack+0x88/0x100
[   16.183331]  [<000000004026b5a0>] dequeue_task_idle+0x40/0x60
[   16.183331]  [<00000000402630a4>] deactivate_task+0x84/0xa0
[   16.183331]  [<000000004020c438>] __schedule+0xe8/0x560
[   16.183331]  [<000000004020ca64>] schedule+0x44/0xe8
[   16.183331]  [<000000004020fb60>] schedule_timeout+0x158/0x1f8
[   16.183331]  [<000000004020fc24>] schedule_timeout_uninterruptible+0x24/0x30
[   16.183331]  [<0000000040293f00>] msleep+0x38/0x50
[   16.183331]  [<0000000040214bd8>] die_if_kernel+0x220/0x298
[   16.183331]  [<000000004021dd60>] handle_unaligned+0x908/0x958
[   16.183331]  [<0000000040215350>] handle_interruption+0x338/0x910
[   16.183331]  [<000000004023e5d0>] irq_exit+0x58/0xa0
[   16.183331]  [<0000000040204074>] intr_return+0x0/0xc
[   16.183331]  [<000000004027a5a4>] cpu_startup_entry+0x13c/0x300
[   16.183331]  [<0000000040104f84>] smp_callin+0x1a4/0x1c0
[   16.183331]

