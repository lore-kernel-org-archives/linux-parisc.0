Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA20031
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Feb 2000 07:56:36 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id GAA20442
	for <parisc-linux@thepuffingroup.com>; Wed, 16 Feb 2000 06:57:09 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id GAA11682 for parisc-linux@thepuffingroup.com; Wed, 16 Feb 2000 06:57:08 -0700 (MST)
Date: Wed, 16 Feb 2000 06:57:08 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002161357.GAA11682@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> This sounds to me like a typical case of doing a static optimization (is
> this a memcpy() to I/O space, from I/O space, to and from I/O space) at
> runtime.

I believe there are some cases in the graphics libraries where it is
not known at runtime whether the destination will be IO (framebuffer)
or memory. But I also tend to agree with you. 99.9% of the use of memcpy
will not be for IO, so it probably would have made more sense for the
graphics libraries, and any other code where there is any possibility
of being handed a pointer to IO space, to handle it in a different way,
rather than having the test be in memcpy.


> > But Perhaps we can have a 16 Mb offset instead.
>
> I think not mapping the first 64 KB and making a copy of page 0 somewhere
> else would make sense.  Then we could use the first 64 KB of the virtual
> address space to implement gateway pages.

We can probably use a smaller offset than 16 Mb but 64 Kb won't work.  We
have to make sure that the kernel space virtual addresses are equivalently
aliased with their physical addresses. 64 Kb would work on a 712, but it
won't work on a C3000.  Currently PCXU supports a maximum external direct
mapped cache size of 4 Mb, and I don't think that has been increased for
PCXW.  I'm not sure what the largest actually implemented direct mapped
cache is, but I know it is at least 2 Mb.  Of course, to take full
advantage of large pages, it might make sense to use a larger offset, i.e.
64 Mb.

Rereading what you said above made me realize that you probably were not
talking about a 64 Kb offset. If so, then you are talking about
still using an offset of 0, but just not mapping the first 64 Kb a memory,
i.e. throwing those pages "away" (actually we can probably find ways
to use them). The only problem with this is that we would be prevented
from using maximally large tlb mappings to map the first 64 Mb of memory.
If we moved the offset to 64 Mb we could use 64 Mb page size mappings
to map the kernel address space. The cost of this is that it reduces
the amount of physical memory we can support.  We can't support 4 Gb
(at least not easily), since we need virtual space for the vmalloc area.
So I'm not sure losing 64 Mb of virtual space at the bottom end is that
much of an issue.

What is the largest amount of physical memory we want to support for the
32 bit implementation?  How hard do we want to work to achieve it?  We
can't support more than 4 Gb.  It would take some work to support 4 Gb.
My feeling is that if we supported 3.5 Gb max that would be more than
adequate.  We could use a 64 Mb offset and use 64 Mb page size mappings to
cover the kernel address space.  This should leave enough space for the
vmalloc area.

> >
> > I like this idea.  The only disadvantage is that if the user modifies sr2
> > by mistake, all of a sudden all of the syscalls stop working (for that
> > process only).
>
> I don't see a real problem with that.  Modifying SR2 requires either direct
> modification (the only code I could see doing that is HP/UX code, which isn't
> supposed to execute with PER_LINUX anytime soon) or executing random bytes,
> which will always break in unexpected ways.
>

I agree that it is not a significant enough problem to stop us from doing
this. So, I propose the following:

    1) When we move the kernel virtual mappings we will leave room at
    the bottom to a) properly trap on null pointer dereferences, and
    b) provide room for a Linux syscall gateway page in the kernel
    address space (space 0). This gateway page will be located at an
    offset within the positive offset range of a ble instruction.

    2) We will set sr2 to zero for each process.

    3) We will only map an HP-UX syscall gateway page into HP-UX
    processes, i.e. we will not map any gateway page into the user
    address space for PER_LINUX processes.

    4) Linux syscalls will use the following 2 instruction sequence
    to reach the gateway page:

	ble <gateway offset>)(%sr2,%r0)
	ldi <syscall #>,%r20

So, if anyone has a significant problem with this proposal, speak up.

John Marvin
jsm@fc.hp.com
