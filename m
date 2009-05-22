From: Helge Deller <deller@gmx.de>
Subject: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Fri, 22 May 2009 22:13:01 +0200
Message-ID: <4A17074D.30602@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since many kernel versions I regularly faced reproducibly kernel hangs when
compiling some bigger files. The machine suddenly just seemed to hang.

With spinlock debugging turned on I found this:

BUG: spinlock recursion on CPU#0, tool/7263
 lock: 10644000, .magic: dead4ead, .owner: tool/7263, .owner_cpu: 0
Backtrace:
 [<10113a94>] show_stack+0x18/0x28

BUG: spinlock lockup on CPU#0, tool/7263, 10644000
Backtrace:
 [<10113a94>] show_stack+0x18/0x28

BUG: soft lockup - CPU#0 stuck for 61s! [tool:7263]
IASQ: 00000000 00000000 IAOQ: 102d55dc 102d557c
 IIR: 03c008b3    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 7d1a4000 CR31: 11111111
 ORIG_R28: 00000000
 IAOQ[0]: _raw_spin_lock+0x15c/0x1c0
 IAOQ[1]: _raw_spin_lock+0xfc/0x1c0
 RP(r2): _raw_spin_lock+0x18c/0x1c0
Backtrace:
 [<102d560c>] _raw_spin_lock+0x18c/0x1c0

Kernel panic - not syncing: softlockup: hung tasks
Backtrace:
 [<10113a94>] show_stack+0x18/0x28


The lock at "10644000" references pa_tlb_lock, which is used to lock the PxTLB 
broadcasts (see comment in cache.c).

So, I think we need to use the irq-blocking functions for purge_tlb_start() and
purge_tlb_end(). I did tested the patch below, and since then I didn't faced one
single hang any longer. 

The patch below is just a hack. It will need a cleanup and is just to open
discussions here on the list.

Helge

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 1f6fd4f..9b92fbe 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -18,8 +18,8 @@
  */
 extern spinlock_t pa_tlb_lock;
 
-#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
-#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
+#define purge_tlb_start(x)	do { unsigned long flags; spin_lock_irqsave(&pa_tlb_lock, flags)
+#define purge_tlb_end(x)	     spin_unlock_irqrestore(&pa_tlb_lock, flags); } while (0)
 
 extern void flush_tlb_all(void);
 extern void flush_tlb_all_local(void *);
