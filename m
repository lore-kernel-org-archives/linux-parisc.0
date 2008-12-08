From: Helge Deller <deller@gmx.de>
Subject: 2.6.28: BUG: soft lockup - CPU#0 stuck for 61s!
Date: Tue, 09 Dec 2008 00:28:06 +0100
Message-ID: <493DAD86.8030609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Instead of continuing the thread named "2.6.28-rcX in pretty bad shape
on parisc" I think it makes sense to start a new thread with this bug,
as I think that it different to the one which Dave and Carlos face.

While compiling some larger piece of code, I'm reproducible facing this
kernel lock-up.
-----------
BUG: soft lockup - CPU#0 stuck for 61s! [tool:3582]
Modules linked in: snd_ad1889 snd_ac97_codec snd_pcm_oss snd_pcm
snd_mixer_oss snd_seq_oss snd_seq_midi_event snd_seq snd_timer
snd_seq_device snd soundcore snd_page_alloc ac97_bus

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 105edf50 102a0428 00000000
r04-07  17c78000 105df000 00000000 00069cb9
r08-11  00000000 7c268b88 7eedf22c 104876ac
r12-15  10616ac0 106332c0 00000005 fb6f3a88
r16-19  7c2683c0 0000000a fb6f3e60 00000000
r20-23  ffffffff 00000000 12adac36 102f0794
r24-27  ffffffff 10542c50 105edfa0 105db2c0
r28-31  00000004 00000190 7c268e40 1011c7a0
sr00-03  00000000 00000000 00000000 00000283
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102a031c 102a0320
 IIR: 80969f45    ISR: 00000000  IOR: 1010fc5c
 CPU:        0   CR30: 7c268000 CR31: 11111111
 ORIG_R28: 00000000
 IAOQ[0]: __spin_lock_debug+0x9c/0x140
 IAOQ[1]: __spin_lock_debug+0xa0/0x140
 RP(r2): _raw_spin_lock+0x68/0xa8
Backtrace:
 [<102a0428>] _raw_spin_lock+0x68/0xa8
 [<1010eac4>] flush_kernel_dcache_page_addr+0x20/0x3c
 [<1010e864>] flush_dcache_page+0x80/0x204
 [<104878c8>] xdr_partial_copy_from_skb+0x108/0x21c
 [<10488ecc>] xs_tcp_data_recv+0x394/0x49c
 [<1044875c>] tcp_read_sock+0xe0/0x240
 [<10489038>] xs_tcp_data_ready+0x64/0xa4
 [<10451230>] tcp_rcv_established+0x394/0x534
 [<104585fc>] tcp_v4_do_rcv+0x108/0x110
 [<10458b18>] tcp_v4_rcv+0x514/0x620
 [<1043d010>] ip_local_deliver_finish+0xc8/0x1a4
 [<1043d288>] ip_rcv_finish+0x14c/0x2fc
 [<10420d40>] netif_receive_skb+0x174/0x280
 [<10420f60>] process_backlog+0x8c/0x118
 [<104211b4>] net_rx_action+0x18c/0x1b8
 [<1013a8a4>] __do_softirq+0x108/0x14c

Kernel panic - not syncing: softlockup: hung tasks
----

This is a 32bit 2.6.28-rcX (X=1-7) kernel on a c3000 (single-cpu), but I
saw the same problem already on 2.6.27 as well.
I've tried to narrow it down with strace, but then I couldn't reproduce
the lockups.

Looking at the backtrace my assumption is, that it deadlocks on the
pa_tlb_lock spinlock (defined in arch/parisc/kernel/cache.c).
But it's still unclear to me, how this spinlock is getting stuck forever.

Currently I'm playing with the attached patch. It's just an RFC since I
noticed, that the assembler function __clear_user_page_asm() does not
provide any exception fixups yet.
My thinking is, that maybe __clear_user_page_asm() crashes due to
invalid userspace access, and then the pa_tlb_lock spinlock just stays
locked.
I'm not sure if it is even correct behavior that __clear_user_page_asm()
might be called with invalid userspace regions, but due to the different
kmap_atomic() function implementation with pagefault_disable() and
pagefault_enable() calls (see further details below) I'm under the
impression, that we need to add exception fixups.
I'd be very interested to know, if you others think that my assumption
is correct?


kmap_atomic() and pagefault_[en|dis]able:
32bit and 64bit kernels differ in the implementation of the kmap_XX()
functions [see arch/parisc/include/asm/cacheflush.h vs.
include/linux/highmem.h], which are utilized by the above networking
functions.
The standard kmap_atomic() function (used in 32bit parisc kernels) in
include/linux/highmem.h calls pagefault_dis|enable(), while the 64bit
parisc implementation doesn't (although it adds cache flushing if
parisc_requires_coherency() evaluates to true on 64bit).



diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 5259d8c..5759b3e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -396,14 +396,23 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
 EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);

+/* Those functions are implemented in assembly in pacache.S */
+extern void purge_kernel_dcache_page(unsigned long);
+extern int __clear_user_page_asm(void *page, unsigned long vaddr);
+
 void clear_user_page_asm(void *page, unsigned long vaddr)
 {
-	/* This function is implemented in assembly in pacache.S */
-	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
+	int error;

+	/* if (!preempt_count()) */
 	purge_tlb_start();
-	__clear_user_page_asm(page, vaddr);
+
+	error = __clear_user_page_asm(page, vaddr);
+
+	/* if (!preempt_count()) */
 	purge_tlb_end();
+
+	WARN_ON(error);
 }

 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -439,9 +448,6 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs
online)\n", parisc_cache_flush_threshold, num_online_cpus());
 }

-extern void purge_kernel_dcache_page(unsigned long);
-extern void clear_user_page_asm(void *page, unsigned long vaddr);
-
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
 	purge_kernel_dcache_page((unsigned long)page);
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 09b77b2..f00e93a 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -26,6 +26,8 @@
  *       can be used.
  */

+#include <asm/errno.h>
+
 #ifdef CONFIG_64BIT
 	.level	2.0w
 #else
@@ -559,7 +561,7 @@ ENTRY(__clear_user_page_asm)
 	/* #define	PREFETCHW_OP	ldd		256(%0), %r0 */

 1:	std		%r0, 0(%r28)
-	std		%r0, 8(%r28)
+2:	std		%r0, 8(%r28)
 	std		%r0, 16(%r28)
 	std		%r0, 24(%r28)
 	std		%r0, 32(%r28)
@@ -580,9 +582,8 @@ ENTRY(__clear_user_page_asm)
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1

-1:
-	stw		%r0, 0(%r28)
-	stw		%r0, 4(%r28)
+1:	stw		%r0, 0(%r28)
+2:	stw		%r0, 4(%r28)
 	stw		%r0, 8(%r28)
 	stw		%r0, 12(%r28)
 	stw		%r0, 16(%r28)
@@ -602,12 +603,25 @@ ENTRY(__clear_user_page_asm)
 #endif	/* CONFIG_64BIT */

 	bv		%r0(%r2)
-	nop
+	copy		%r0, %ret0	/* return no error */
 	.exit
