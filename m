Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA25761
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Dec 1999 16:22:29 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by atlrel1.hp.com (Postfix) with ESMTP id 545F4910F
	for <parisc-linux@thepuffingroup.com>; Mon, 20 Dec 1999 18:24:56 -0500 (EST)
Message-Id: <199912202324.PAA09663@lucy.cup.hp.com>
Subject: Re: [parisc-linux] Comments on non-equivalent aliasing and PA-RISC (long)
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de
Date: Mon, 20 Dec 1999 15:24:41 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991217152206.B1829@mathe.stud.uni-erlangen.de> from Philipp Rumpf at Dec "17," 1999 "03:22:06" pm
From: Jerry Huck <jerry_huck@hp.com>
Reply-To: huck@cup.hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: huck@cup.hp.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Fri, 17 Dec 1999 15:22:06 +0100
> From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
> To: Jerry Huck <huck@cup.hp.com>
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Comments on non-equivalent aliasing and PA-RISC (long)

...

> > A different mechanism is used to provide protection (protection IDs).  A
> > specialization of this approach is address space IDs used in some
> > other RISC architectures.  This augments the per-process address space
> > to avoid TLB purging on context switch.
> > 
> > When data is not shared between processes, then everything is simple.
> > Sharing on traditional page-table per process architectures is done via
> > aliasing.  Sharing on PA-RISC is done by using the same GVA.
> 
> Doesn't sound right to me.  Sharing address spaces between threads can
> be done using the same GVA.  Normal mmap style sharing we can do using
> duplicated TLB entries, right ?

"threads" definitely done with using the same GVA (or VA on traditional
machines).  Not sure what you mean by "duplicated TLB entries".  Normal
mmap style sharing could be done with the same GVA and the same TLB
entry (entries).  It gets complicated if someone wants different
fixed addresses or different protection modes.

> > Single address space models didn't normally require aliasing.  A
> > process was always given a global address to the data.  Protection is
> > done using the Protection IDs.  This works very well when you can
> > control the system call semantics.  Sharing is easy and the tough
> > things (like very different access rights to the same VA range) are
> > just outlawed.  Unix process semantics that suggested aliasing (like
> > fork) could be easily implemented using shared global addresses.  The
> > text segment is directly shared by using the same space register ID.
> 
> This sounds like it'd be hard to get Linux to do right.  Furthermore it's
> a rather minor optimization (it's about copying page tables, not about 
> copying pages).

We might be thinking of different things here.  I don't know if Linux
separates the notion of the program text object from the "owning" process.
My only point was the ability to minimize VM object overhead having
a single instance of the object that multiple processes (and threads) can
"mmap" to themselves.  This saves in kernel structures and page table
entries.

> > Data segment sharing is done via copy-on-access instead of
> > copy-on-write.
> 
> I think there shouldn't be a problem with doing standard COW though.

A pure GVA model does discourage standard COW.  When the process
forks, you would hand out a new data segment ID (say SR5 like HP-UX).
The fork is fast - just change the SR, but each access to SR5 takes
a fault and needs a copy of the original page.  If you put a little
aliasing into place (and take the hit in more live translations) then
you can use a more standard COW.  Again, the comments were restricted
to a more traditional single address space model.  Unix forking is
really matched to an aliasing model.  Are measurements of COA and COW
were inconclusive.  Most things worked well under either model.

> > Sharing is done with SR6 and SR7 being common between
> > all processes.
> > 
> > The other nice aspect of single address space models is the sharing of
> > TLB entries.
> 
> Did I miss the first one ?

I counted the "sharing of a single VM object description and address"
as the first one.

> > Sharing is done by using the same global virtual address
> > - hence it's covered by the same TLB entry.  The OS can keep a single
> > data structure for that object and just record the processes that
> > attach to it.  For example, there is a single text segment for all the
> > "vi" processes.  They all share the same page table and TLB entries for
> > that segment.
> 
> Sounds hard to get to work with the page cache.

We bypass the page cache for these kinds of mapped objects.  Since the
kernel can make "text" objects special it can avoid coherence issues
with the page cache - oddities like: execute a program and then
rewrite or delete the file before that part of the file is executed.

> > Single address spaces are not without problems.  The biggest in
> > PA-RISC was the 1G limit for each of the quadrants.  An aliased model
> > allows a flexible boundary between stack, heap, text, shared data,
> > etc.  We had to make special hacks to get around the problems - some
> > that encouraged some limited aliasing.  IBM's RS6000 has a little bit
> > of the same issue but had 16 space-like registers (upper 4-bits of
> > each 32-bit offset).  They could more easily adjust boundaries to
> > allow flexible sizing of process address space.  As many people have
> > said in the past, "this is not a problem for the 2.0 architecture
> > since a 62-bit offset is more than enough for the future - or at
> > least until I retire".
> 
> If only it was 62 bits.  The space register ORing really makes that part
> less fun.

As a kernel developer, you should really think of space registers
and offsets being concatenated together.  The concatenation point is
up to you and can be different for each SR.  The hardware can think of
the GVA in OR'ing terms.

...snip...

> > The first specs completely outlawed all aliasing.  It was/is expected
> > that the OS flush the range whenever a virtual address (VA) needed to
> > be changed.  An early change was made to allow PA=VA aliasing in '84.  The
> > OS couldn't begin to manage the page tables if that aliasing wasn't
> > allowed.
> 
> Okay, so we don't care about pre-84 boxes (are there any ?)

My dates are connected with architecture releases.  PA1.0 started
shipping in 1986.  Thankfully, I think you can totally ignore any 1.0
machines.  Have the boot driver do:
   arch_rev = PDC_MODEL.return_info.arch_rev
   if( arch_rev  == REV1.0) {
         panic()
   else ...

> > The first 1.1 book (11/90) defined the first virtual aliasing model -
> > limited space aliasing.  It allows space aliasing if certain bits
> > match between the addresses.  For PCX-S, this means you have just 4
> > bits that can be used as an alias. For example, address
> > 0x1234.00000000 (space register contents = 0x1234, offset = 00000000)
> > can be aliased to address 0x2234.00000000.  This change was encouraged
> > by some of the Apollo engineers that wanted to enable some amount of
> > aliasing to help with Domain needs (they wanted more).  Several of the
> > machines used the low-order space bits as part of the cache-index
> > computation.  So two addresses like 0x1.00000000 and 0x2.0000000 would
> > definitely NOT be in the same spot in the cache.
> 
> So on these it's still quite hard to get Linux running and probably not
> worth it.

Fortunately, the architecture was more restrictive than the HW.  You can
assume that all boxes meet the 1.1e3 spec (modulo bugs).  You can have
offset aliasing.

...snip...

> > virtual mode references in TLB miss handler, and manage these aliases in
> 
> Why should the TLB miss handler ever enable address translation ?

I wasn't sure how the forward-mapped page tables would be searched.
Some OSs do a virtual reference.  Sticking to absolute accesses is best.

Jerry
