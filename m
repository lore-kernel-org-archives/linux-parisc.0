From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Fri, 7 Aug 2009 10:22:42 -0600
Message-ID: <20090807162242.GA18373@lackof.org>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca> <Pine.SOC.4.64.0907302054100.20870@math.ut.ee> <4A724818.4080909@tausq.org> <Pine.SOC.4.64.0907310923520.710@math.ut.ee> <20090805174507.GB11458@lackof.org> <Pine.SOC.4.64.0908052241550.4076@math.ut.ee> <20090806141542.bf48febf.berndg@fsim-ev.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Bernd Gietzelt <berndg@fsim-ev.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090806141542.bf48febf.berndg@fsim-ev.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Aug 06, 2009 at 02:15:42PM +0200, Bernd Gietzelt wrote:
> On Wed, 5 Aug 2009 22:42:34 +0300 (EEST)
> Meelis Roos <mroos@linux.ee> wrote:
> 
> > > It would be helpful to know if 2.6.30.x kernels (from unstable)
> > > show the same problem.
> > 
> > Will test.
> 
> I've done some test with actual and older kernels from debian because
> my system shows the same behavior.

Wow! Thank you!

> 
> 2.6.18-5-parisc64-smp 	Kernel panic at statfs
> 2.6.18-6-parisc64-smp 	Kernel panic at statfs
> 2.6.26-2-parisc64-smp 	SERR & PARITY
> 2.6.30-1-parisc64-smp 	Kernel panic
> at /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kernel/smp.c:369

In my linux-2.6.30 source tree, kernel/smp.c:369 has this code:
361 void smp_call_function_many(const struct cpumask *mask,
362                             void (*func)(void *), void *info, bool wait)
363 {
364         struct call_function_data *data;
365         unsigned long flags;
366         int cpu, next_cpu, this_cpu = smp_processor_id();
367 
368         /* Can deadlock when called with interrupts disabled */
369         WARN_ON_ONCE(irqs_disabled() && !oops_in_progress);
370 
371         /* So, what's a CPU they want? Ignoring this one. */
372         cpu = cpumask_first_and(mask, cpu_online_mask);
373         if (cpu == this_cpu)
374                 cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
375 
...

And I don't expect the WARN_ON_ONCE() is directly related to whatever
is panic'ing later since the expected symptom is a deadlock.


> 2.6.30-1-parisc64 	SERR & PARITY 
> 
> The complete logs can be found here:
> http://89.144.17.178/~bernd/lasatonline.de/dokuwiki/doku.php?id=programmieren:administration:computer:ulrike

Well done - thanks!

In general, adding "pdcchassis=0" will stop the GSP (aka MP) from
putting it's footprint on top of the regular console output:
...
[    7.232000] Freeing unused kernel memory: <0>------------[ cut here ]------------
[    7.388000] Badness at /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kernel/smp.c:369
...
[    9.092000] Backtrace:

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00
...


The pdcchassis support obscured some of the console output.  The obscured
console output is available by going into the GSP/MP and showing the
console log.  It's easier to disable this "feature" by adding
pdchassis=0 to the kernel parameters and cut/paste the regular output.


> Some idea what's behind this failure message?

"Badness at ..." is the WARN_ON_ONCE().  It's not the panic message.
IIRC, this particular message is known to only occur on the first fork
when /sbin/init (process 0) is started.

I hate to ask you to try 2.6.30-1-parisc64-smp again with "pdcchassis=0"
but can't think of any other way to collect the panic output
at this point.

> <snap>
> Begin: Running /scripts/init-bottom ... done.
> run-init: statfsKernel panic - not syncing: Attempted to kill init!
>  /: Function not 
> </snap>
> 
> 
> If some additional test/logs needed: I'm compliant to deliever them.

Thank you so much since I'm not seeing this on my own machines.

cheers,
grant
