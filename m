From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fix BUG: sleeping function called from invalid context at
 mm/slab.c:3044
Date: Wed, 17 Dec 2008 23:57:34 +0100
Message-ID: <494983DE.2050105@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090306010406000602030706"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------090306010406000602030706
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

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

--------------090306010406000602030706
Content-Type: text/x-patch;
 name="invalid_context_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="invalid_context_fix.patch"

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 6773c58..69dad5a 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -372,7 +372,7 @@ void unwind_frame_init_from_blocked_task(struct unwind_frame_info *info, struct
 	struct pt_regs *r = &t->thread.regs;
 	struct pt_regs *r2;
 
-	r2 = kmalloc(sizeof(struct pt_regs), GFP_KERNEL);
+	r2 = kmalloc(sizeof(struct pt_regs), GFP_ATOMIC);
 	if (!r2)
 		return;
 	*r2 = *r;

--------------090306010406000602030706--
