Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id NAA06367
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 13:07:41 -0500
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903221741.MAA10607@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] Picky details of TLB fault handlers
In-Reply-To: <m10P9Bi-0007U1C@the-village.bc.nu> from Alan Cox at "Mar 22, 99 06:12:34 pm"
To: hppa-linux@thepuffingroup.com
Date: Mon, 22 Mar 1999 12:41:52 -0500 (EST)
Cc: hppa-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Alan Cox:
> > HP-UX does exactly this sort of thing for handling many traps and
> > interrupts.  It is fairly expensive, though, since you have to have
> > a stack on which to save the IPSW/IIAQ and probably a bunch of other
> > registers, and it's too much messing around for a TLB miss.
> 
> I'm right in assuming its legal to swap the return address - so the TLB
> handler can do a short piece of TLB handling for a present page miss,
> then stash the return into the kernel stack and rfi into the page fault handler
> so it will in turn return to the user context ?

i'd say that a miss handler would not _ever_ exceed 100 instructions total time
to successfully lookup and insert a missing translation into a tlb and
using just shadowed registers, so by doing that w/ all the interrupts
disabled (and keeping some data in direct-mapped segment) no need
to save even a single bit of context (since it's all in the shadows).
then the handler can save the whole context and call pagefault() routine to
process a complex page fault (ie one that has no translation
in the page table), since the whole context is saved it's safe to
receive any other page faults and/or interrupts.

this schema was first implemented in the lites (and mklinux later).
doing this way is like simulating the hardware TLB walker as present
on certain machines (712 at least, maybe any 7100lc, HP help!?)
there are certain constraints on page table organization, but
doing so would greatly speed up the tlb-walker equipped machines,
leaving the rest still in the best shape possible.
building a tlb-walker-ONLY kernel (as an option) may save about 10 other
instructions.

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
