Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB7224840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 10:31:37 -0600 (MDT)
Message-Id: <200310201631.h9KGVZ49001423@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 20 Oct 2003 12:31:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031020160158.GC32666@systemhalted> from "Carlos O'Donell" at Oct 20, 2003 12:01:58 pm
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

> > > Multiple exceptions per instruction is not the intended behaviour :)
> > > I need two numbers, that when added only overflow, not overflow and
> > > inexact. The same to be said for underflow. Perhaps I just need to 
> > > dig more.
> > 
> > Well 10-7 talks explicitly about what happens when you get both
> > exceptions on a single instruction.  On the otherhand, the discussion
> > of the inexact exception seems to imply that inexact should only occur
> > in an overflow/underflow situation when an overflow/underflow exception
> > doesn't occur.  Possibly, the PA implementation is not consistent with
> > IEEE mandated behavior, but I can't be sure.
> 
> My reading of 10-7 and the equivalent sections in the PA 1.1 arch
> doc indicate that it _can_ happen outside of an overflow/underflow
> situation. It just so happens that it can also be coupled with
> underflow/overflow exceptions.

I wasn't saying that inexact can't happen in other circumstances.  I
was wrong in including undeflow in the above and I mis-rembered the
statement at the top of 10-11.  It actually states that an inexact
exception shall be signaled if an overflow occurs without an overflow
trap.

> Does having them both at the same time violates the behaviour of
> "feraiseexcept" in the ISO C standard (especially in the case of
> underflow)? If feraiseexcept is called and only an underflow 
> requested, but underflow and inexact are enabled, what then?

Does this help?  The standard says

"Whether the feraiseexcept function additionally raises the inexact
exception whenever it raises the overflow or underflow exceptions is
implementation defined."

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
