Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Robert Stanford <rob@rotapile.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Robert Stanford <rob@rotapile.com>
   of "26 May 2002 10:48:56 +1000." <1022374136.14232.89.camel@rotapile>
References: <1022374136.14232.89.camel@rotapile> 
Date: Sun, 26 May 2002 00:09:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020526060948.0676E4834@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Robert Stanford wrote:
> Regarding the below post, have the SMP issues been worked out on 2.4.18
> yet? Im running 2.4.18-25 and the machine seems to lock whenever I try
> to use apt with an smp kernel.

uhm...I see that I'm using UP kernels on my boxes right now.
I'll rebuild SMP and retest.

I did just find an SMP problem in the current EIEM handling.
Can't say if this is really causing any problems right now though.
Stop reading now if you don't know about (or don't want to) EIEM.

If enable_irq or disable_irq gets called from a CPU other than
the one the device driver is supposed to interrupt, it will set the
EIEM bit in only *that* (the wrong) CPU. The result is the interrupt
will remain masked on the target CPU. I think the solution
is to use a global "eiem_val" (set/clear bits here) to match
the global EIRR switch table.  I've thought about moving to a
per-CPU EIEM/EIRR switch table. But that's more work than I
have time for right now and would have a similar problem.
For now, we just need to update EIEM on all CPUs whenever the
eiem_val global changes.

We do NOT currently distribute interrupts.
I did write a patch to distribute IO interrupts:
	ftp://ftp.parisc-linux.org/patches/irq_distr.diff

This diff can't be applied until the EIEM issue is fixed.

I suspect we don't (usually) have a problem with EIEM since all
interrupts are going to CPU 0 (aka Monarch) and nearly all driver
initialization takes place before the system is multithreaded.
The only other possibility is processes are only running on CPU 0.
ie when loading a device driver later, it always gets initialized on the
monarch. This scenario would also match the "top" output where
a 2-way system is always 50% idle and a 4-way is 75% idle.

I'd like to learn some way of seeing which CPU is running which
processes. top doesn't seem to indicate that. I'll look at sysstat
package later.

grant
