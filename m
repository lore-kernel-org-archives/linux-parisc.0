Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA04169
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 09:44:45 -0700
Date: Tue, 16 Nov 1999 17:47:33 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        frowand@cup.hp.com, parisc-linux@thepuffingroup.com,
        adevries@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991116174733.C750@mathe.stud.uni-erlangen.de>
References: <19991116170819.B750@mathe.stud.uni-erlangen.de> <E11nmBS-0002tz-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E11nmBS-0002tz-00@the-village.bc.nu>
List-ID: <linux-parisc.vger.kernel.org>

>>  - consistent with what the other ports do / what hardware does for the other
>>    ports (MIPS)
> Not consistent with what some other ports do however. That one is a non
> valid argument.

Consistent with what the widely-used ports do in 2.2 (as far as I can see).

> >  - is already implemented
> True

This actually belongs here (i.e. most of the code is stolen from other architec-
tures while the mapping at 0x0000 0000 one would have to be written AFAIK).

> >  - clear difference between user pointers and kernel pointers (this matters
> >    for debugging, not for a running system)
> You can stick your elf binaries at 0x80000000 for debugging

Sure I could.  It is going to be work though while we get it for free when
mapped at 0x8000 0000.  Furthermore this is likely to cause some meta-
debugging.

> >  - clear difference between physical addresses and kernel pointers.  Think
> >    about vmalloc for one reason this is a good thing.  Also I dislike the
> >    idea of staring at HPMCs for hours just to find out what really happened
> >    is someone forgot to set the D bit and we didn't notice until we happened
> >    to hit a vmalloc area.
> 
> Phys = Virt can help you.

It sure can help from a performance pov.

> Ultrasparc makes good use of tlb bypass bits for this.

We do have load/store word bypassing the TLB instructions, if that's what you
mean.  We also can fix one of SR1-SR3 in kernel mode to be the identical map
if some phys->virt instructions shows up heavily in profiles.

> >  - allows us to catch NULL pointers and use large pages to map the physical
> >    memory [1]
> 
> Only relevant for debug.
> Indeed on x86 with 4Mb maps enabled we dont do 
> null catches in the same way

The day the parisc port reaches the usage counts we can stop caring about
getting Oops/Panic messages (especially if they were unexpected and happened
on a system that seemed stable a long time before) I might agree to the "only".

> >  - conflicts with a rather obscure restriction of PA1.1 cache aliases.  As
> >    Frank pointed out to me, it is only guaranteed you access the same data
> >    using a physical address and a virtual address mapped to the physical if
> >    the physical address is equal to the virtual address (or you are flushing
> >    the cache lines in question).  I do not believe this to be a real problem
> >    with any existing hardware and if it is, the performance hit of the
> >    additional cache flushes may be seen as proper punishment for brain-dead
> >    hardware.
> 
> The goal is to make it work well.
> X86 is brain dead, thats why we do the 3gig/1gig game with it. 

The one point I see is how difficult it's going to be to get both mappings
to the point we have 3.75 GB physical mem / 3.75 GB virtual mem (assuming we
want to do it directly and don't want to do the x86 highmem stuff).

Extending a mapping at 0x8000 0000 to do this is non-trivial, and I would
consider an independent mapping using one of SR[1-3] as the easiest way to do
it.

A mapping at 0x0000 0000 would allow us to do this without any problems, so
this is definitely a disadvantage I missed.

Note that 3.75 GB userspace isn't a problem with either.  My A class looks
pretty packed with 768 MB RAM so I doubt you could fit more than 1.75 GB in
many pa1.1 boxes.

	Philipp Rumpf
