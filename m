Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5D684829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 08:44:17 -0700 (MST)
Message-Id: <200211121544.gACFi8Na004766@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 12 Nov 2002 10:44:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
In-Reply-To: <200211120413.gAC4DBBB003677@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 11, 2002 11:13:11 pm
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

> > __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
> > 			/* FIXME: is this a proper trap barrier? */
> > 			"fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0"(d));
> 
> Looking at fraiseexcept, I see that you only want to raise one
> exception at a time out of a specified set.  Reading the status register
> will raise all outstanding exceptions.  I think what needs to be
> done is something like the following:

After a night's sleep, I had a couple more thoughts on this.

1) You probably want to clear the T bit at the beginning of the
   routine.  This will ensure that you get the correct exception
   when the first one is raised.  The only way to do this without
   potentially causing a pending trap to trigger is with a double
   word store to floating-point register 0.  You can't read register
   0 before the write without potentially triggering a trap, so
   you need to know what the current state should be.  See page
   10-5 of the PA2 arch manual.

2) A fcpy insn should raise an exception if it depends on the
   result of a pending trapping insn (the current code doesn't).
   It would be best to not use register 0 or the source register
   for the destination register since in theory the processor
   would then know the operation is a nop.  Then, the insn could
   be reordered or discarded.  The fcpy insn is nice since it
   is non-arithmetic and doesn't cause an invalid operation
   exception when a NaN is copied.  The fcmp insn isn't quite
   as nice since it will generate an invalid operation when one
   of the values is a signaling NaN, or if the low-order bit
   of the condition code is 1 and one of the values is an NaN.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
