Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04288
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 18:53:45 -0700
Date: Sat, 26 Feb 2000 01:53:35 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000226015335.G812@abacus.local>
References: <200002260035.RAA00437@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002260035.RAA00437@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Fri, Feb 25, 2000 at 05:35:12PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> I'm running on a J5000, which is 99.9% the same as a C3000 if I disable
> one of the processors. The only networking problem I've run into
> is the one I already posted about, for which I have a workaround. I
> have not run into any unaligned traps.

This is another hint that Grant's unaligned trap probably is not network-
related (it might be the network device driver's fault).

> I also do not believe we should do an unaligned trap handler at this
> point. Yes, we may have to do one for the non-standard protocols, but
> the problem is that once we enable the trap handler, you might hide
> a bunch of other performance degrading bugs.

I agree.

> In fact, I would propose that when we do the unaligned handler we
> should have a way of enabling it on a per thread basis for user
> processes. When I say "enable" I don't mean that we would install/deinstall
> the handler, but simply have the handler do a check, and if the fault
> came from user space, check the task structure to determine whether
> we should fix the fault or terminate the process with a signal.

Emulating user space unaligned accesses sounds like a bad idea to me,
unless existing applications assume they can do unaligned accesses and
let the OS handle it.  (and preload a SIGBUS handler for those userspace
applications that want it)

> I believe that the default should be off. If a user doesn't want to
> fix the problem (either due to indifference or lack of source), they
> should explicitly enable the handler (perhaps by a flag bit in the
> elf executable?) so that they know that they will be suffering a
> performance penalty.

LD_PRELOAD is a nicer way to handle that, isn't it ?

> Of course, I'd like to do something similar for kernel unaligned faults,

First, let's try whether we run into unaligned faults in cases other than
the one we know (weird, badly-designed protocols).

> Handling kernel unaligned faults should be configurable, possibly with
> the default on.

I disagree.  Either we accept we will have unaligned accesses, so disabling
them would just generate bogus bug reports;  or we don't, then we want to
see all bug reports caused by them.

> My overall objective in all of this is to insure that we know of
> all the cases where the kernel produces unaligned faults, and make
> a conscious decision on whether or not we fix the code, rather than
> hide unaligned references. My personal bias is to fix every piece
> of code that produces unaligned references, but, based on the
> linux-kernel thread that willy mentioned, we might not be able to
> convince the maintainer of the code to accept those changes.

Just wait until they see the light ... we can fix networking in our tree
should it bother us.

	Philipp Rumpf
