From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Wed, 17 Dec 2008 23:40:33 GMT
Message-ID: <200812172340.mBHNeXX6002020@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 933cc210f48a36e559fe1aeefb56040b8c59ff0a
Author: Helge Deller <deller@gmx.de>
Date:   Wed Dec 17 23:57:34 2008 +0100

    parisc: fix GFP_KERNEL use while atomic in unwinder
    
    Since unwind_frame_init_from_blocked_task() may be called from
    interrupt/in_atomic context, it needs to kmalloc() memory with
    GFP_ATOMIC instead of GFP_KERNEL.
    
    This fixes this warning (ShowTasks called from sysrq handler):
    
    BUG: sleeping function called from invalid context at mm/slab.c:3044
    in_atomic(): 1, irqs_disabled(): 1, pid: 2119, name: miniruby
    Backtrace:
     [<10132e78>] __might_sleep+0x4c/0x118
     [<1018f644>] kmem_cache_alloc+0x2c/0xb4
     [<1011bae0>] unwind_frame_init_from_blocked_task+0x30/0xa0
     [<1010fd3c>] parisc_show_stack+0x3c/0xac
     [<10132c7c>] show_state_filter+0x80/0xd8
     [<102f4074>] __handle_sysrq+0xd0/0x1b0
     [<102f9558>] receive_chars+0x22c/0x318
     [<102f9940>] serial8250_handle_port+0x40/0x88
     [<102f9a8c>] serial8250_interrupt+0x104/0x10c
     [<10161920>] handle_IRQ_event+0x44/0x94
     [<10161acc>] __do_IRQ+0x15c/0x1dc
     [<102c442c>] superio_interrupt+0x74/0xa8
     [<10161920>] handle_IRQ_event+0x44/0x94
     [<10161acc>] __do_IRQ+0x15c/0x1dc
     [<10110fb4>] do_cpu_irq_mask+0x90/0xbc
     [<10114068>] intr_return+0x0/0x4
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

