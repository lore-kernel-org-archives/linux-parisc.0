Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94A9C4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 10:05:56 -0600 (MDT)
Date: Mon, 20 Oct 2003 12:01:58 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
Message-ID: <20031020160158.GC32666@systemhalted>
References: <20031020050229.GC26432@systemhalted> <200310201530.h9KFUYZN000693@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310201530.h9KFUYZN000693@hiauly1.hia.nrc.ca>
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

On Mon, Oct 20, 2003 at 11:30:34AM -0400, John David Anglin wrote:
> > > I suggest looking at page 10-7.  It describes the PA 2.0 behavior
> > > for this situation.  I'm not an IEEE so I don't know offhand what it
> > > mandates.
> > 
> > Multiple exceptions per instruction is not the intended behaviour :)
> > I need two numbers, that when added only overflow, not overflow and
> > inexact. The same to be said for underflow. Perhaps I just need to 
> > dig more.
> 
> Well 10-7 talks explicitly about what happens when you get both
> exceptions on a single instruction.  On the otherhand, the discussion
> of the inexact exception seems to imply that inexact should only occur
> in an overflow/underflow situation when an overflow/underflow exception
> doesn't occur.  Possibly, the PA implementation is not consistent with
> IEEE mandated behavior, but I can't be sure.

My reading of 10-7 and the equivalent sections in the PA 1.1 arch
doc indicate that it _can_ happen outside of an overflow/underflow
situation. It just so happens that it can also be coupled with
underflow/overflow exceptions.

Does having them both at the same time violates the behaviour of
"feraiseexcept" in the ISO C standard (especially in the case of
underflow)? If feraiseexcept is called and only an underflow 
requested, but underflow and inexact are enabled, what then?

c.
