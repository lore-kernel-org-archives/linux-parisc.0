Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04112
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 18:34:32 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id RAA23208
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Feb 2000 17:35:20 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id RAA00437 for parisc-linux@thepuffingroup.com; Fri, 25 Feb 2000 17:35:12 -0700 (MST)
Date: Fri, 25 Feb 2000 17:35:12 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002260035.RAA00437@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> > http://boudicca.tux.org/hypermail/linux-kernel/2000week06/0092.html
> >
> > There was a bug in 2.3.41, looks like it didn't get fixed in .42, that
>
> Apparently it did get fixed in .42, so it might be worth finding out what
> exactly causes Grant's unaligned trap.

I'm running on a J5000, which is 99.9% the same as a C3000 if I disable
one of the processors. The only networking problem I've run into
is the one I already posted about, for which I have a workaround. I
have not run into any unaligned traps.

I also do not believe we should do an unaligned trap handler at this
point. Yes, we may have to do one for the non-standard protocols, but
the problem is that once we enable the trap handler, you might hide
a bunch of other performance degrading bugs.

In fact, I would propose that when we do the unaligned handler we
should have a way of enabling it on a per thread basis for user
processes. When I say "enable" I don't mean that we would install/deinstall
the handler, but simply have the handler do a check, and if the fault
came from user space, check the task structure to determine whether
we should fix the fault or terminate the process with a signal.

I believe that the default should be off. If a user doesn't want to
fix the problem (either due to indifference or lack of source), they
should explicitly enable the handler (perhaps by a flag bit in the
elf executable?) so that they know that they will be suffering a
performance penalty.

Of course, I'd like to do something similar for kernel unaligned faults,
i.e. only handle faults for areas where we expect them, but that is
probably not worth the effort. Handling kernel unaligned faults should
be configurable, possibly with the default on. We of course should
leave it off during development, unless we are testing areas of the
kernel that are known to produce unaligned faults, i.e. ones we
have decided not to fix, e.g. some of the networking protocols. One
possible thing we could do would be to enable the unaligned handler
by default, but have it log a message for the first kernel fault
it handles, e.g. "Unaligned fault at 0xxxx, enabling unaligned fault
handler", so at least people can be made aware that there may be
a performance issue.

My overall objective in all of this is to insure that we know of
all the cases where the kernel produces unaligned faults, and make
a conscious decision on whether or not we fix the code, rather than
hide unaligned references. My personal bias is to fix every piece
of code that produces unaligned references, but, based on the
linux-kernel thread that willy mentioned, we might not be able to
convince the maintainer of the code to accept those changes.

John Marvin
jsm@fc.hp.com
