Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA18004
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 15:08:00 -0700
Date: Wed, 17 Nov 1999 23:05:31 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: frowand@cup.hp.com
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991117230531.D10209@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de> <3831CFF0.F4B3CE3E@hp.com> <19991117071226.G750@mathe.stud.uni-erlangen.de> <3832FA61.F977451E@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3832FA61.F977451E@hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> You missed my point.  An example: the os_hpmc() that I wrote only works in
> real mode.  If I wanted it to be able to run in virtual mode,

Why would you want to run any code which needs to be run in real-mode in the
first place in virtual mode ?  Any examples ?


> I would either
> have to write a parallel version that uses virtual addresses (instead of
> physical) or every time I used an address I would have to choose whether to
> use the physical or virtual address, based on whether address translation was
> turned on or not.

Or you would have to disable address translation before calling the code.  Dis-
abling address translation is what happens for every interrupt(ion), including
TLB insert handlers which are very common.  So it shouldn't be a big deal.

> If the kernel is equivalently mapped, this problem goes away.

If it exists in the first place.


> Look at os_hpmc() and see where it was not appropriate to use the PA() macro.

Just what I said.  You use

	symbol

where the "right" thing to do would be

	.+(PA(symbol)-PA(.))

But we're working on that (so you can just use "symbol" for code references, as
it is real-mode code.  You also will be able to use "symbol" if it's a
real-mode data reference.  Sounds right to me).

>>Furthermore, there is no publically documented coherent I/O system from HP yet
>> so we have just to assume hardware we only heard rumours about will be sane
>> once we get to see it.

> So listen to the people who have read that documentation (like Grant).

What I really want to know is  which algorithm do recent CPUs use to get the
cache bank index / cache tag.

The answer is either "Just the obvious", "just the obvious but we XOR some
bits from the space registers in" or "we're doing tricks to special-case those
accesses were the virtual address matches the physical, for no apparent reason".

I don't believe the latter to be the case, but we just can't be sure until we
get documentation (and would violate the architecture specification if the
proof below turns out to be valid).



I would agree it would be best to change the design to work according to the
architecture specification if the restriction the "cache coherency issues"
(which might exist) looked sane at all.  It doesn't.

[note: what follows is what I think is a proof we can do what I want to do.
It is very likely to contain formal/grammatical mistakes but I think it should
be valid nontheless].


  The Rules

1. A physical and a virtual address refer to the same physical address (and
caches work) if they are equal.  (and obviously the virtual address translates
to the physical).  If a virtual address and its mapping satisfy this rule, the
address is said to be _equivalently mapped_.

2. Two virtual addresses refer to the same physical address (and caches work)
if they are equal modulo 2^20.  (and obviously translate to the same physical
address).  If two virtual addresses satisfy this rule, they are said to be
_equivalent aliases_.

p0 contains physical address, is used as physical address
p1 contains phys. addr, is used as virtual address, equivalently mapped
p2 is an equivalent alias of p1, but not necessarily equivalently mapped.

p0 and p1 satisfy Rule 1.
p1 and p2 satisfy Rule 2.

Therefore, p1 and p2 refer to the same physical address, and p0 and p1 refer
to the same physical address.

p0 and p2 refer to the same physical address if p1 is ever used to access
memory.

There is no requirement for the access using p1 to occur before the access
using p0 or the access using p2.

There is no requirement for the access using p1 to occur within a certain time
or number of instructions after the access using p0 or the access using p2.

Since delaying the access using p1 indefinitly is possible and there is no
feasible way for the cache system to verify the access won't occur (except
in certain cases which never occur during normal operation), there is no reason
for the access using p1 ever to happen.

Therefore, a physical address and a virtual address are guaranteed to refer to
the same physical address if the virtual address is an equivalent alias of the
equivalent mapping of the physical address.




Any mistakes to point out ?  Misunderstandments in the specification ?  Other-
wise could the specification please get fixed ?


	Philipp Rumpf
