Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA26547
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 13:56:47 -0700
Date: Mon, 28 Feb 2000 20:56:38 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [mingo@chiara.csoma.elte.hu: new IRQ scalability changes in 2.3.48]
Message-ID: <20000228205638.K812@abacus.local>
References: <20000228110118.X9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000228110118.X9944@thepuffingroup.com>; from willy@thepuffingroup.com on Mon, Feb 28, 2000 at 11:01:18AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> On Sun, 27 Feb 2000, Andrea Arcangeli wrote:
> 
> > I ported the SMP irq affinity code and the per-irq-desc locking to alpha
> > (plus the ->end semantical change). [...]
> 
> here is a summary of all the IA32 IRQ scalability changes which were added
> as of 2.3.48, so that other architectures can make sense of these changes
> and potentially adopt them:
> 
> 	- per-IRQ-source spinlocks and per-IRQ-controller spinlocks
> 	  increasing scalability: now two IRQ handlers on two CPUs
> 	  can run do_IRQ in parallel. Note that level-triggered PCI IRQ
> 	  handlers never actually take the IRQ-controller spinlock in the
> 	  'IRQ handling fast path'.
> 
> 	- got rid of the global_irq_count shared variable, it was
> 	  cache-pingponging like hell during multi-CPU interrupt
> 	  load. The irqs_running() function does it all now - cli()/sti()
> 	  thus got a bit slower, but it's worth it. The change is supposed
> 	  to be an invariant otherwise.
> 
> 	- Reworked (level-triggered) IO-APIC IRQ handlers to never touch
> 	  the IO-APIC registers and keep the interrupt unacked in the
> 	  local APIC while the handler is running. This speeded
> 	  'null IRQ latency' up considerably and also works better with
> 	  hardware features like focus-CPU, and causes better IRQ
> 	  atomicity. The 'legacy' edge-triggered IO-APIC IRQ sources
> 	  still need the slower method to work reliably.
> 
> 	- per-CPU IRQ statistics causing better cache workload
> 
> 	- explicit IRQ affinity (to a group of CPUs) can be set through
> 	  /proc/irq/*. Extended the IRQ controller function template with
> 	  ->set_affinity(). See Documentation/IRQ-affinity.txt for more.
> 
> 	- added /proc/irq/prof_cpu_mask, to enable profiling on a single
> 	  CPU only. (useful to determine the true idleness of a CPU, and
> 	  other interesting things when using CPU-affine IRQs.)
> 
> 	- the irq_handler->end() semantics had to be changed slightly to
> 	  allow the fastest possible IO-APIC IRQ handling on x86.
> 
> architectures that are currently using (a hw-adopted version of) the IA32
> IRQ architecture are: Alpha, IA64, SH and ARM.

PA-RISC isn't on that list, and shouldn't be.  I had a look at the 2.3 IRQ
code (which begins to claim to be architecture-independent) and it does NOT
adopt well to PA-RISC IMHO.

Still there, are some bits which will definitely be taken over, so this
might be of interest to the Dino, Lasi and other "irq region" drivers:

the irq operations are
	startup
	shutdown

	enable
	disable

	ack
	end

the major difference to what we have now is ack/end instead of mask/unmask.

ack acknowledges the IRQ and masks it
end unmasks the IRQ

We will _definitely_ use the new ops, and a structure similar to struct
hw_interrupt_type in include/linux/irq.h.  The difference is I think it
is still a good idea to pass in a void * (this is the only sensible way
to allow several instances of a irq region device in a system).

The other thing we will be doing is to use a linear array for all IRQs
instead of the two-dimensional struct we have now.  This will cost a bit
of memory at runtime, but it'll get our code closer to what the other
architectures have.

> yep. In 2.5 the IA32 irq.c will probably be moved into kernel/irq.c so
> it's important to keep it 64-bit clean. Since there are 11 different
> architectures in the main tree now (and 2-3 not yet integrated ones) this
> can definitely not happen now, but will be very important to do in 2.5.

IMHO not having an efficient way to pass a client pointer to the IRQ
controller operations will break not only for us, but there's a lot of
time before 2.5 to discuss this and prepare a better version.

	Philipp Rumpf
