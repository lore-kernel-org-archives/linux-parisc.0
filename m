From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] My a500 reported a bug during gsp reset.
Date: Mon, 17 Jul 2006 17:15:49 -0400
Message-ID: <119aab440607171415o723ffd5fqc4c64106394bc85b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

parisc,

I reset the GSP on my A500 during a heavy-load situation while the
A500 was building glibc. I noticed the following on the console:

Debug: sleeping function called from invalid context at mm/slab.c:2096
in_atomic():1, irqs_disabled():1
Backtrace:
          k+0x18/0x28
 [<0000000010146950>] __might_sleep+0x110/0x128
 [<000000001019ae70>] kmem_cache_alloc+0x110/0x118
 [<0000000010114c88>] show_stack+0x80/0xf0
 [<0000000010114af0>] dump_stack+0x18/0x28
 [<0000000010186750>] __report_bad_irq+0x50/0x118
 [<0000000010186904>] note_interrupt+0xac/0x160
 [<0000000010185398>] __do_IRQ+0x368/0x498
 [<0000000010116c7c>] do_cpu_irq_mask+0xc4/0x118
 [<0000000010107074>] intr_return+0x0/0x14

Backtrace:
 [<0000000010114af0>] dump_stack+0x18/0x28
 [<0000000010186750>] __report_bad_irq+0x50/0x118
 [<0000000010186904>] note_interrupt+0xac/0x160
 [<0000000010185398>] __do_IRQ+0x368/0x498
 [<0000000010116c7c>] do_cpu_irq_mask+0xc4/0x118
 [<0000000010107074>] intr_return+0x0/0x14
kernel/irq/handle.c:126:
spin_lock(kernel/irq/handle.c:000000001068a2a8) already3

handlers:
[<00000000106bd8e0>] (interrupt_stack+0x298e0/0x3fae0)
Disabling IRQ #69
kernel/irq/handle.c:169:
spin_unlock(kernel/irq/handle.c:000000001068a2a8) not ld
---

It's a bit garbled from the serial console I had open at the moment.
The box *did not* crash.

Any clue why this bug is there?
This kernel is 2.6.13-rc3-pa0, so I should probably upgrade, and
attempt to reproduce.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
