Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2266D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 21:13:18 -0700 (MST)
Message-Id: <200211120413.gAC4DBBB003677@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 23:13:11 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021111232711.GB12433@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 06:27:11 pm
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

> __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
> 			/* FIXME: is this a proper trap barrier? */
> 			"fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0"(d));

Looking at feraiseexcept, I see that you only want to raise one
exception at a time out of a specified set.  Reading the status register
will raise all outstanding exceptions.  I think what needs to be
done is something like the following:

__asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
 		      "fcmp,dbl,!= %%fr0,%0\n\t"
 		      "ftest\n\t"
 		      "nop" : "=f" (d) : "0"(d));

Doing a compare and test of the result of the fmpy insn will ensure
that any exceptions related to that operation are raised prior to
the ftest insn being queued in floating-point coprocessor.

There is some information in pa.md on the floating-point units used with
different processors.  For example, the 7100LC has three floating-point
units: ALU, MUL, and DIV.  The situation in the PA8000 is much more
complicated because of its large reorder buffer (56 entries).

When an exception occurs, it sets the T bit and the coprocessor is
armed to trap if the exception enable for the trap is 1.  The trap
is taken at the next floating point insn.  However, because of the
out of order execution of instructions and multiple floating-point
units, care has to be taken in selecting the following insn.  It
has to have a dependency on the trap generating insn to ensure that
it actually follows.  Possibly, the ftest is unnecessary but it
ensures that any traps related to the previous two insns are taken.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
