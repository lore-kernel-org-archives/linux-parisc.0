From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Wed, 27 May 2009 21:50:36 -0400 (EDT)
Message-ID: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca>
References: <4A17074D.30602@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A17074D.30602@gmx.de> from "Helge Deller" at May 22, 2009 10:13:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Since many kernel versions I regularly faced reproducibly kernel hangs when
> compiling some bigger files. The machine suddenly just seemed to hang.
> 
> With spinlock debugging turned on I found this:
> 
> BUG: spinlock recursion on CPU#0, tool/7263
>  lock: 10644000, .magic: dead4ead, .owner: tool/7263, .owner_cpu: 0
> Backtrace:
>  [<10113a94>] show_stack+0x18/0x28
> 
> BUG: spinlock lockup on CPU#0, tool/7263, 10644000
> Backtrace:
>  [<10113a94>] show_stack+0x18/0x28
> 
> BUG: soft lockup - CPU#0 stuck for 61s! [tool:7263]
> IASQ: 00000000 00000000 IAOQ: 102d55dc 102d557c
>  IIR: 03c008b3    ISR: 00000000  IOR: 00000000
>  CPU:        0   CR30: 7d1a4000 CR31: 11111111
>  ORIG_R28: 00000000
>  IAOQ[0]: _raw_spin_lock+0x15c/0x1c0
>  IAOQ[1]: _raw_spin_lock+0xfc/0x1c0
>  RP(r2): _raw_spin_lock+0x18c/0x1c0
> Backtrace:
>  [<102d560c>] _raw_spin_lock+0x18c/0x1c0
> 
> Kernel panic - not syncing: softlockup: hung tasks
> Backtrace:
>  [<10113a94>] show_stack+0x18/0x28

I have tested the proposed change using 2.6.30-rc6 and a modified version
of 2.6.22.10.  I tested using SMP kernels running on a rp3440 and UP
kernels on a c3750.  I also tested changing the macros to just use
preempt_disable/preempt_enable.

The patch doesn't cause any new problems as far as I can tell.  However,
it doesn't fix any of the problems that I currently see on these two
machines.  In particular, I see the occasional gcc testsuite timeout
using SMP kernels.  Programs that usually take a few seconds to run
timeout after three minutes.  These timeouts don't occur with UP kernels.

On the rp3440, the spinlock is definitely needed.  With just
preempt_disable/preempt_enable, a crash occurs during bootstrap
at the point unused memory is recovered.  Thus, the tlb purge
issue referred to in the preceeding comment affects more than
just N class.

On the otherhand, it doesn't seem necessary to disable interrupts
during the purge with UP kernels.  With SMP kernels, it would be nice
to know if the lockup was caused by an interruption during the tlb
purge, or a preemption issue.

I have the sense that disabling interrupts is wrong.  That is any
given CPU can only generate one PxTLB inter processor broadcast
at a time.  Disabling interrupts could cause a deadlock if a TLB
purge was needed while the purge code was executing.

The other alternative is to allow the processor that holds the lock
to enter the flush code.  This would fix the deadlock.  Don't know how
to code this (atomic compare and exchange?).

The preempt_disable/preempt_enable crash on the rp3440 made me wonder
if all tlb purge operations are properly protected with the tlb spinlock.
I think we need to look at flush_tlb_all_local and copy_user_page_asm.
They don't seem protected.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
