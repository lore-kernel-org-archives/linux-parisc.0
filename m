Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36D6F4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 12:22:01 -0700 (MST)
Date: Wed, 13 Nov 2002 14:22:10 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org,
	Jim Hull <jim_hull@hp.com>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021113192210.GC4970@systemhalted>
References: <200211120413.gAC4DBBB003677@hiauly1.hia.nrc.ca> <200211121544.gACFi8Na004766@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211121544.gACFi8Na004766@hiauly1.hia.nrc.ca>
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

On Tue, Nov 12, 2002 at 10:44:07AM -0500, John David Anglin wrote:
> > > __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
> > > 			/* FIXME: is this a proper trap barrier? */
> > > 			"fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0"(d));

So really the fix is to spill into a third register or a memory location
in order to:

1) Prevent reordering and subsequent discard of the insn
2) Trigger the trap since the result of the register is needed

> 1) You probably want to clear the T bit at the beginning of the
>    routine.  This will ensure that you get the correct exception
>    when the first one is raised.  The only way to do this without
>    potentially causing a pending trap to trigger is with a double
>    word store to floating-point register 0.  You can't read register
>    0 before the write without potentially triggering a trap, so
>    you need to know what the current state should be.  See page
>    10-5 of the PA2 arch manual.

Okie, lets see if I have this right:

1) Routine starts
2) Clear T by reading fr0 and writing back with T=0
	= All other pending delayed exceptions are nulled
3) Setup an exception to occur based on requirements
	= insn writes to dX
4) Trap barrier
	= insn where dX is copied to dY (dX!=dY)

> 2) A fcpy insn should raise an exception if it depends on the
>    result of a pending trapping insn (the current code doesn't).
>    It would be best to not use register 0 or the source register
>    for the destination register since in theory the processor
>    would then know the operation is a nop.  Then, the insn could
>    be reordered or discarded.  The fcpy insn is nice since it
>    is non-arithmetic and doesn't cause an invalid operation
>    exception when a NaN is copied.  The fcmp insn isn't quite
>    as nice since it will generate an invalid operation when one
>    of the values is a signaling NaN, or if the low-order bit
>    of the condition code is 1 and one of the values is an NaN.

I liked the fcpy specifically for that reason. It doesn't itself cause a
recursive triggering of more delayed exceptions, eventually filling the
exception queue and delivering an exception anyway ;)

c.
