Received: from hermes.mvista.com (gateway-490.mvista.com [63.192.220.206])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA04661
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 14:14:34 -0700
Sender: frowand@hermes.mvista.com
Message-ID: <3A12FD2C.665AEF89@mvista.com>
Date: Wed, 15 Nov 2000 13:16:28 -0800
From: Frank Rowand <frank_rowand@mvista.com>
Reply-To: frowand@mvista.com
MIME-Version: 1.0
To: law@redhat.com
CC: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>,
        parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Single-stepping
References: <15884.974320259@upchuck>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

law@redhat.com wrote:
> 
>   In message <200011151949.OAA22929@hiauly1.hia.nrc.ca>you write:
>   > >   I've been helping Alan Modra out with kernel changes to support
>   > > single stepping for gdb.  Paul Bame suggested I bounced our ideas
>   > > off you in case you (or anyone else) had any comments.  I havn't
>   > > actually committed my changes yet.
>   > >
>   > > The basic approach is to use the recovery counter to generate
>   > > a trap every instruction.  The scheme is complicated because a
>   > > suspended process may or may not return to user space via an RFI.
>   >
>   > I really don't know enough to comment on the implementation choice.  Why
>   > did you decide on this approach as opposed to inserting breaks and
>   > enabling the taken branch branch trap (T)?  It would appear that the recove
>   > ry
>   > counter was intended to provide software recovery from hardware faults
>   > in fault tolerant systems.  Possibly, Grant could comment on whether
>   > it is actually useful for this purpose.
> Err, we tried that at the UofU in our mach port to the PA -- there's a problem
> with that scheme, though I don't remember precisely what it was.  I believe
> there were cases where the recovery counter doesn't trigger a trap, possibly
> due to nullified instructions.
> 
> You might look at the UofU BSD code, which I believe used breakpoints and
> branch taken traps instad.
> 
> jeff
> 

I implemented two different single step algorithms for a a _kernel_ debugger
for hp-ux.  The algorithm used could be chosen by a compile switch, because
each method had cases that weren't handled well - for some debugging tasks
one algorithm was superior to the other.  Part of my problem with the
recovery counter was that other services in the hp-ux kernel also used the
recovery counter.

I liked the recovery counter method better than my second method (but had to
deal with collisions with the other kernel services).  My second method was
to insert a breakpoint at the target of the single step.  It's a pain to do
that because of issues with delay slots, branching, and nullification.

I guess the point of all this rambling is to say that the recovery counter has
been successfully used by a debugger for single stepping.

-Frank
-- 
Frank Rowand <frank_rowand@mvista.com>
MontaVista Software, Inc
