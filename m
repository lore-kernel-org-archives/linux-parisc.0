From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] My a500 reported a bug during gsp reset (Good dump)
Date: Mon, 17 Jul 2006 17:26:12 -0400
Message-ID: <1153171572.3704.8.camel@mulgrave.il.steeleye.com>
References: <119aab440607171419h26cb2aa5ide166b94dbf94796@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607171419h26cb2aa5ide166b94dbf94796@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-07-17 at 17:19 -0400, Carlos O'Donell wrote:
> Here is the clean dump from logs:
> ---
> irq 69: nobody cared (try booting with the "irqpoll" option)
> Debug: sleeping function called from invalid context at mm/slab.c:2096
> in_atomic():1, irqs_disabled():1
> Backtrace:
>  [<0000000010114af0>] dump_stack+0x18/0x28
>  [<0000000010146950>] __might_sleep+0x110/0x128
>  [<000000001019ae70>] kmem_cache_alloc+0x110/0x118
>  [<0000000010114c88>] show_stack+0x80/0xf0
>  [<0000000010114af0>] dump_stack+0x18/0x28
>  [<0000000010186750>] __report_bad_irq+0x50/0x118
>  [<0000000010186904>] note_interrupt+0xac/0x160
>  [<0000000010185398>] __do_IRQ+0x368/0x498
>  [<0000000010116c7c>] do_cpu_irq_mask+0xc4/0x118
>  [<0000000010107074>] intr_return+0x0/0x14

That's a bug in parisc show_stack ... it has a kmalloc GFP_KERNEL in it.

> Backtrace:
>  [<0000000010114af0>] dump_stack+0x18/0x28
>  [<0000000010186750>] __report_bad_irq+0x50/0x118
>  [<0000000010186904>] note_interrupt+0xac/0x160
>  [<0000000010185398>] __do_IRQ+0x368/0x498
>  [<0000000010116c7c>] do_cpu_irq_mask+0xc4/0x118
>  [<0000000010107074>] intr_return+0x0/0x14
> kernel/irq/handle.c:126:
> spin_lock(kernel/irq/handle.c:000000001068a2a8) already locked by
> kernel/irq/handle.c/173
> 
> handlers:
> [<00000000106bd8e0>] (interrupt_stack+0x298e0/0x3fae0)
> Disabling IRQ #69
> kernel/irq/handle.c:169:
> spin_unlock(kernel/irq/handle.c:000000001068a2a8) not locked

What's on IRQ69?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
