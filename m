From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Fwd: [BUG] 2.6.17 hangs on ppc/ia64/parisc and
	won't load init
Date: Mon, 24 Jul 2006 07:43:29 -0500
Message-ID: <200607240743.29961.mszick@morethan.org>
References: <7d01f9f00607232039g3d480198w7e206050bca36b0c@mail.gmail.com>
	<7d01f9f00607232041i620d523at60687f9392c3c8d0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607232041i620d523at60687f9392c3c8d0@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun July 23 2006 22:41, Thibaut VARENE wrote:
> Hi pa-ckers,
> 
> Here's what I just sent to lkml
> 
> ----------
> 

Comments following dump.

> 
> Finally, most recently (yesterday to be precise), on of my parisc
> system (rp3440, pa8800 SMP 800MHz, 4GB RAM, 73GB SCSI) crashed while I
> was using it, and again exposed the exact same symptoms. It was
> running  debian sid and 2.6.17-rc6-pa3 64bit. It was up for a
> few hours. Interestingly, I experienced much longer uptimes with that
> very same machine/kernel. The machine was running gdb when it died,
> and this time I got a stack dump on the console. I don't totally trust
> parisc stack unwinder but here it is anyway:
> 
> BUG: soft lockup detected on CPU#1!
> Backtrace:
>  [<0000000010112aa0>] dump_stack+0x18/0x28
>  [<0000000010172558>] softlockup_tick+0x130/0x160
>  [<0000000010152630>] run_local_timers+0x28/0x38
>  [<0000000010152708>] update_process_times+0xc8/0x128
>  [<000000001011d9d8>] smp_do_timer+0x60/0x80
>  [<0000000010113a5c>] timer_interrupt+0xec/0x1f0
>  [<00000000101726fc>] handle_IRQ_event+0x74/0xf8
>  [<0000000010172838>] __do_IRQ+0xb8/0x260
>  [<00000000101145f8>] do_cpu_irq_mask+0x130/0x1f8
>  [<0000000010104074>] intr_return+0x0/0x1c
> 
> BUG: soft lockup detected on CPU#0!
> Backtrace:
>  [<0000000010112aa0>] dump_stack+0x18/0x28
>  [<0000000010172558>] softlockup_tick+0x130/0x160
>  [<0000000010152630>] run_local_timers+0x28/0x38
>  [<0000000010152708>] update_process_times+0xc8/0x128
>  [<000000001011d9d8>] smp_do_timer+0x60/0x80
>  [<0000000010113a5c>] timer_interrupt+0xec/0x1f0
>  [<00000000101726fc>] handle_IRQ_event+0x74/0xf8
>  [<0000000010172838>] __do_IRQ+0xb8/0x260
>  [<00000000101145f8>] do_cpu_irq_mask+0x130/0x1f8
>  [<0000000010104074>] intr_return+0x0/0x1c
>  [<0000000010167708>] hrtimer_run_queues+0x198/0x268
>  [<000000001015239c>] run_timer_softirq+0x54/0x2c0
>  [<000000001014b8cc>] __do_softirq+0x15c/0x180
>  [<000000001010ec14>] do_softirq+0x64/0x70
>  [<000000001014ba1c>] irq_exit+0x6c/0x78
>  [<0000000010114680>] do_cpu_irq_mask+0x1b8/0x1f8
> 
> This bug (so far) never killed our systems as badly as what I'm
> describing, so it could be something else. The rp3440 machine was
> using an ext3 fs.
> 

Joel has also seen that on his N4K (PA8700) - its in the m-l somewhere.

CPU1 - Looks like it is reporting the stack of the softlock up call.
CPU0 - Has been seen here before or when running task lists for signals.

See other recent posts about this chunk of code (quoting Joel):

Q4: imho the most important: 
	with 2 gcc where is the couple of ssm/rsm that jejb introduced in his patch:

<http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2005-October/036211.html>
--- linux-2.6/include/asm-parisc/spinlock.h?????2005/09/14 14:42:11?????1.16
+++ linux-2.6/include/asm-parisc/spinlock.h?????2005/10/20 16:07:04?????1.17
@@ -11,18 +11,25 @@
	return *a == 0;
 }

-#define __raw_spin_lock_flags(lock, flags) __raw_spin_lock(lock)
+#define __raw_spin_lock(lock) __raw_spin_lock_flags(lock, 0)
 #define __raw_spin_unlock_wait(x) \
			do { cpu_relax(); } while (__raw_spin_is_locked(x))

-static inline void __raw_spin_lock(raw_spinlock_t *x)
+static inline void __raw_spin_lock_flags(raw_spinlock_t *x,
+unsigned long flags)
 {
	volatile unsigned int *a;

	mb();
	a = __ldcw_align(x);
	while (__ldcw(a) == 0)
-		while (*a == 0);
+		while (*a == 0)
+			if (flags & PSW_SM_I) {
+				local_irq_enable();
+				cpu_relax();
+				local_irq_disable();
+			} else
+				cpu_relax();
		mb();
	}

(My e-mail client just trashed the whitespace in the above.)
Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
