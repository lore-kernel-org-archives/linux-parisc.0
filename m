Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24712
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 10:00:37 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id LAA16173
	for parisc-linux@thepuffingroup.com; Mon, 28 Feb 2000 11:01:18 -0500
Date: Mon, 28 Feb 2000 11:01:18 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000228110118.X9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [mingo@chiara.csoma.elte.hu: new IRQ scalability changes in 2.3.48]
List-ID: <linux-parisc.vger.kernel.org>


I thought this may be of interest.

----- Forwarded message from Ingo Molnar <mingo@chiara.csoma.elte.hu> -----

Delivered-To: thepuffi-willy@thepuffingroup.com
Date: 	Sun, 27 Feb 2000 16:04:13 +0100 (CET)
From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
To: Andrea Arcangeli <andrea@suse.de>
Cc: linux-kernel@vger.rutgers.edu, linux-alpha@vger.rutgers.edu,
        Richard Henderson <rth@cygnus.com>,
        "David S. Miller" <davem@redhat.com>,
        Linus Torvalds <torvalds@transmeta.com>
Subject: new IRQ scalability changes in 2.3.48
In-Reply-To: <Pine.LNX.4.21.0002270501160.473-100000@alpha.random>
Precedence: bulk
X-Loop: 	majordomo@vger.rutgers.edu
X-Orcpt: rfc822;linux-kernel-outgoing-dig


On Sun, 27 Feb 2000, Andrea Arcangeli wrote:

> I ported the SMP irq affinity code and the per-irq-desc locking to alpha
> (plus the ->end semantical change). [...]

here is a summary of all the IA32 IRQ scalability changes which were added
as of 2.3.48, so that other architectures can make sense of these changes
and potentially adopt them:

	- per-IRQ-source spinlocks and per-IRQ-controller spinlocks
	  increasing scalability: now two IRQ handlers on two CPUs
	  can run do_IRQ in parallel. Note that level-triggered PCI IRQ
	  handlers never actually take the IRQ-controller spinlock in the
	  'IRQ handling fast path'.

	- got rid of the global_irq_count shared variable, it was
	  cache-pingponging like hell during multi-CPU interrupt
	  load. The irqs_running() function does it all now - cli()/sti()
	  thus got a bit slower, but it's worth it. The change is supposed
	  to be an invariant otherwise.

	- Reworked (level-triggered) IO-APIC IRQ handlers to never touch
	  the IO-APIC registers and keep the interrupt unacked in the
	  local APIC while the handler is running. This speeded
	  'null IRQ latency' up considerably and also works better with
	  hardware features like focus-CPU, and causes better IRQ
	  atomicity. The 'legacy' edge-triggered IO-APIC IRQ sources
	  still need the slower method to work reliably.

	- per-CPU IRQ statistics causing better cache workload

	- explicit IRQ affinity (to a group of CPUs) can be set through
	  /proc/irq/*. Extended the IRQ controller function template with
	  ->set_affinity(). See Documentation/IRQ-affinity.txt for more.

	- added /proc/irq/prof_cpu_mask, to enable profiling on a single
	  CPU only. (useful to determine the true idleness of a CPU, and
	  other interesting things when using CPU-affine IRQs.)

	- the irq_handler->end() semantics had to be changed slightly to
	  allow the fastest possible IO-APIC IRQ handling on x86.

architectures that are currently using (a hw-adopted version of) the IA32
IRQ architecture are: Alpha, IA64, SH and ARM.

> I checked it works fine here. The sys_dp264 is the only port that
> actively uses SMP irq affinity it (because it's the only one capable
> of SMP irq scaling) and so it's also the only one who currently needs
> lowlevel controller locking. There are also a few common code changes
> (the irq_stat is useless on alpha, on alpha there's a better cpu_data
> smp struct where all the per-cpu things gets allocated) There are a
> few IA32 irq.c cleanups for some 64bit issue. [...]

yep. In 2.5 the IA32 irq.c will probably be moved into kernel/irq.c so
it's important to keep it 64-bit clean. Since there are 11 different
architectures in the main tree now (and 2-3 not yet integrated ones) this
can definitely not happen now, but will be very important to do in 2.5.

Manfred Spraul does have some ideas/patches wrt. per-CPU data structures -
i believe these concepts have to be unified in 2.5 as well (together with
the unification of the irq code). Sparc64 had these per-CPU data
structures for ages.

a related 'SMP-scalability' note: i've implemented a new type of
read-write spinlock which does not cause cacheline pingpong in the read
path (and is thus extremely scalable and cache-friendly), David Miller
added his own ideas and ported it to Sparc - this should show up soon.

	Ingo


-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/

----- End forwarded message -----
