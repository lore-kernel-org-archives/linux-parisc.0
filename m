Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8817F4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 13:17:04 -0700 (MST)
Message-Id: <200211132016.gADKGvZW008449@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 13 Nov 2002 15:16:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org,
	jim_hull@hp.com
In-Reply-To: <20021113192210.GC4970@systemhalted> from "Carlos O'Donell" at Nov 13, 2002 02:22:10 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> On Tue, Nov 12, 2002 at 10:44:07AM -0500, John David Anglin wrote:
> > > > __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
> > > > 			/* FIXME: is this a proper trap barrier? */
> > > > 			"fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0"(d));
> 
> So really the fix is to spill into a third register or a memory location
> in order to:
> 
> 1) Prevent reordering and subsequent discard of the insn
> 2) Trigger the trap since the result of the register is needed

That's the general idea.  However, fcpy won't always trigger
the trap as the T bit may not be set when it executes even if it
depends on the exception generating instruction.  You have to use
a load or store to %0, or a load or store to %1, or a fcmp,ftest,nop
sequence that depends on the exception generating instruction.
You don't actually have to spill the result.  For example, a
"fldd 0(%%sp),%0" or "fldd 0(%%sp),%1" should raise the exception.
The stack pointer should always be sufficiently aligned.

> 2) Clear T by reading fr0 and writing back with T=0
> 	= All other pending delayed exceptions are nulled

I would suggest saving the whole state.  Reading fr0 with
a double word store will automatically clear T.  I believe
that there is a function do to that.  You might then clear
the exception registers and set the status register to a
state with the exception enables appropriately set.  If you
are paranoid, you could set the enable for just the exception
that you want to raise at each step.

> 3) Setup an exception to occur based on requirements
> 	= insn writes to dX
> 4) Trap barrier
> 	= insn where dX is copied to dY (dX!=dY)

The state can be restored at the end.  I am not quite sure
what is required at this point.  Should the function remove
any or all pending exceptions?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
