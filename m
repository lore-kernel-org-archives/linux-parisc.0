Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA23396
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Dec 1999 09:41:16 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by palrel1.hp.com (Postfix) with ESMTP id E2EE9268
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Dec 1999 08:43:02 -0800 (PST)
Received: (from huck@localhost) by lucy.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id IAA11478 for parisc-linux@thepuffingroup.com; Thu, 16 Dec 1999 08:42:01 -0800 (PST)
Date: Thu, 16 Dec 1999 08:42:01 -0800 (PST)
From: Jerry Huck <huck@cup.hp.com>
Message-Id: <199912161642.IAA11478@lucy.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Comments on non-equivalent aliasing and PA-RISC (long)
List-ID: <linux-parisc.vger.kernel.org>

I would like to comment on the discussion related to equivalent and
non-equivalent aliasing issues on PA-RISC.

In summary, I think the 2.0 and 1.1e3 architecture book is overly
restrictive on aliasing between physical and virtual addresses.  We
are investigating prior designs to ensure that we can restate the
rules to allow transitivity in the equivalent aliasing rules.  We hope
to post updated documentation and a collection of errata to the PA
RISC 2.0 manual in the January timeframe.  (as an aside, I do like the
model where kernel addresses are the same for virtual or physical
accesses; it does get much easier in PA2.0.)

The remainder of this note describes some of the history of PA-RISC on
how we got where we are.  People not interested in virtual memory
aliasing architecture can skip the following.

I've been involved in the PA-RISC architecture development process
since 1983.  The virtual memory model was heavily influenced by the
single-level store work by IBM (in System 3x).  But, that influence
was heavily tempered by hardware designers trying to squeeze it into
very modest LSI.  The big dilemma was the HW interest in having big
virtual-indexed caches to avoid putting the TLB lookup in the critical
path.  There are ways to have big caches and full aliasing support
but it does take effort and reduces performance.

PA-RISC defines a virtual memory model based on global virtual
addresses (GVA).  A virtual address is first transformed into a global
virtual address (via a simple space register lookup and concatenation
for PA1.x) and that address is used to lookup in the TLB.  This allows
a single page table to hold translations for all processes.  A
different mechanism is used to provide protection (protection IDs).  A
specialization of this approach is address space IDs used in some
other RISC architectures.  This augments the per-process address space
to avoid TLB purging on context switch.

When data is not shared between processes, then everything is simple.
Sharing on traditional page-table per process architectures is done via
aliasing.  Sharing on PA-RISC is done by using the same GVA.

Single address space models didn't normally require aliasing.  A
process was always given a global address to the data.  Protection is
done using the Protection IDs.  This works very well when you can
control the system call semantics.  Sharing is easy and the tough
things (like very different access rights to the same VA range) are
just outlawed.  Unix process semantics that suggested aliasing (like
fork) could be easily implemented using shared global addresses.  The
text segment is directly shared by using the same space register ID.
Data segment sharing is done via copy-on-access instead of
copy-on-write.  Sharing is done with SR6 and SR7 being common between
all processes.

The other nice aspect of single address space models is the sharing of
TLB entries.  Sharing is done by using the same global virtual address
- hence it's covered by the same TLB entry.  The OS can keep a single
data structure for that object and just record the processes that
attach to it.  For example, there is a single text segment for all the
"vi" processes.  They all share the same page table and TLB entries for
that segment.

Single address spaces are not without problems.  The biggest in
PA-RISC was the 1G limit for each of the quadrants.  An aliased model
allows a flexible boundary between stack, heap, text, shared data,
etc.  We had to make special hacks to get around the problems - some
that encouraged some limited aliasing.  IBM's RS6000 has a little bit
of the same issue but had 16 space-like registers (upper 4-bits of
each 32-bit offset).  They could more easily adjust boundaries to
allow flexible sizing of process address space.  As many people have
said in the past, "this is not a problem for the 2.0 architecture
since a 62-bit offset is more than enough for the future - or at
least until I retire".

Our second problem with single address spaces that we didn't fix
until PA2.0, was good support for instruction stream space crossing.
The Apollo folks tried to get better shared library support in 1.1
('89ish) but the design (PA7000) was too far along and we just did the
FP part of their proposal.  Also, I didn't have a good handle on
shared library design to support the proposal.

A final general problem is the ability to incorporate other designs
into our "different" environment.  For example, a 3rd party file
system might be designed to coordinate between mapped files and the
buffer pool using aliasing.  While it is not hard to manage coherence
using GVAs, it will involve a lot of rework to use.

For this discussion, I'm ignoring aliasing support where all aliased
translations are ping-ponged between the different aliases via
protection faults.  We can handle any kind of alias if you're willing to
take the time to remap the page.  Some minimization of the ping-ponging
must be considered.

So the rest of the note is a little chronology of the how the aliasing
architecture evolved to the current definition.

The first specs completely outlawed all aliasing.  It was/is expected
that the OS flush the range whenever a virtual address (VA) needed to
be changed.  An early change was made to allow PA=VA aliasing in '84.  The
OS couldn't begin to manage the page tables if that aliasing wasn't
allowed.

The first 1.1 book (11/90) defined the first virtual aliasing model -
limited space aliasing.  It allows space aliasing if certain bits
match between the addresses.  For PCX-S, this means you have just 4
bits that can be used as an alias. For example, address
0x1234.00000000 (space register contents = 0x1234, offset = 00000000)
can be aliased to address 0x2234.00000000.  This change was encouraged
by some of the Apollo engineers that wanted to enable some amount of
aliasing to help with Domain needs (they wanted more).  Several of the
machines used the low-order space bits as part of the cache-index
computation.  So two addresses like 0x1.00000000 and 0x2.0000000 would
definitely NOT be in the same spot in the cache.

This wasn't enough, by the last 1.1 book (1.1e3 published 2/94) we
added 1MByte offset aliasing (page 3-6).  We also included a PDC call
to disable space hashing on the newer machines.  Once disabled, SW
could then alias any 2 virtual addresses provided the low 20-bits were
equal.  HP-UX never used this feature since it cut performance in high
multi-programmed environments (ex. TPC-A at the time).

We also introduced "non-equivalent" aliasing in the 1.1e3 book.  It
allows aliasing down to the 4k boundary if some very special rules
were followed.  In all the old designs, read-only aliasing did happen
to work, but the PA7200 had a little wrinkle that would HPMC if you didn't
carefully transition a page from read-only to read-write.

The 2.0 architecture extended the architecture to support 64-bit
offsets.  Space registers were extended to 64-bits in width (although
today's PA8xxx processors only implement 32-bits).  Aliasing rules
were changed in a small way (2.0 page F-6).  First, the space bits
that could be used in cache hashing were moved from 3 different places
to a continuous group above the low 48-bits of the GVA.  The PDC call
to disable space hashing remains.

More recently, we changed the aliasing boundary to be a range from
4K-16M that the machine communicates through PDC_CACHE.D_conf.alias.
Machines either return 0 which means "can't count on offset
aliasing" or the offset aliasing boundary.

One additional comment, a couple of recent designs do not fully meet
the read-only non-equivalent aliasing rules.  We're having some
internal discussion on how to best document the architecture.  If you
don't absolutely need the non-equivalent aliasing, avoid it or send me
mail to figure out a solution.

So, what does this mean to the PA-RISC Linux port.  I would try to
think about a 2 level approach.  The first level is a "use the global
address space if it's easy".  This would mimic the current simple HP-UX
address space layout.  If the process uses < 1Gbyte for text, data,
and shared structures (SR4, SR5, and SR6 respectively), then great.
Once a process needs resources or sharing that isn't easily
accommodated, then switch to an "all or nearly all alias" model.
In the alias model, encourage aliases that don't require flushing,
otherwise ping-pong the translations as needed.  If you use a
page-table translation SW cache in front of the real page tables,
you can use the hardware walker, avoid lots of virtual mode references
in TLB miss handler, and manage these aliases in one spot.  No doubt
some coordination problems will exist.  Just some thoughts.

Hope this helps.  As an additional FYI, we are preparing a set of
errata pages to augment the 2.0 Kane book and will post them to the web
once we complete them.  Included will be clarifications on this
non-equivalent aliasing issue.

Jerry Huck (jerry_huck@hp.com)
PA-RISC and IA-64 Architecture
Hewlett-Packard
