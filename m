From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Tue, 26 Oct 2010 18:02:13 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010261729410.25995@artax.karlin.mff.cuni.cz>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca> <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz> <20101024034314.GQ8332@bombadil.infradead.org> <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
 <20101026030442.GS8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101026030442.GS8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Mon, 25 Oct 2010, Kyle McMartin wrote:

> On Tue, Oct 26, 2010 at 04:16:39AM +0200, Mikulas Patocka wrote:
> > I tried UP build and it is almost twice slower when compiling (obviously). 
> > So I don't see any performance advantage in running UP :)
> > 
> > Generally, performance of two-way 900MHz machine is not that bad --- 5 
> > times faster compile than 440MHz sparc. It suffers only on tests involving 
> > mostly kernelwork, but no so seriously --- 3.5 times faster than said 
> > sparc when doing a "dummy" make of an already compiled project (just 
> > testing timestamps) and 1.2 times faster than sparc on make clean (ok, it 
> > sucks when re-calculated to clock-to-clock). Generally, I think it's 
> > usable for development.
> > 
> 
> Heh. I think you may be lucking in here... see below.
> 
> > I found that gcc 4.3 from Debian 5 is buggy, it miscompiled the UP kernel. 
> > Compiling it with -Os worked fine. Could you please recommend a compiler 
> > to use? (4.4 from Debian 6 ... or some other version?)
> > 
> 
> 4.4.5 from sid is what I'm using... I think it's working more or less
> for me. I've only been building/booting UP/SMP on an rp3440 these days,
> so I'm not sure about 32-bit.
> 
> > > our cache flushing is a bit... suboptimal right now (doing whole cache
> > > flushes on fork and such.)
> > 
> > What is exactly the problem there? Could you describe it or refer to some 
> > document that describes it? Why do you need to flush on fork?
> > 
> > Sparc has virtually indexed caches too, but there are not many problems 
> > with it, basically the only needed thing is to flush the cache when kernel 
> > touches some user page via its own mapping. (if they ran with 16kB page 
> > size, they wouldn't have to care about data cache coherency at all).
> > 
> 
> I can't remember exactly why offhand, I'm sure jejb can remind us.
> 
> > Another thing I don't understand: the L1 cache is supposed to be 
> > direct-mapped, but it's size is 768kB. I can't imagine how is it 
> > implemented. Does it mean that the processor does a divide-by-3 on every 
> > cache access?
> > 
> > Or is it a mistake and the cache is 3-way set associative, with set size 
> > 256kB? (that would make much more sense)
> > 
> 
> That's the output from one of the firmware queries, which has been lying
> to us for a very long time (apparently HP just doesn't test these things
> or something.) It believe the pa8800 L1 caches were 4-way associative.

I'd say 3-way. If there are 768kB, the associativity must be 3*(2^n).

> So, on to the interesting bit!
> 
> Does your /proc/cpuinfo actually say 768kB? That's... amazingly
> interesting. I wonder (out loud, sorry I should go back and look at the
> prior emails) if that's the cause of your cpu issues...
> 
> processor       : 0
> cpu family      : PA-RISC 2.0
> cpu             : PA8800 (Mako)
> cpu MHz         : 999.995500
> capabilities    : os64
> model           : 9000/800/rp3440  
> model name      : Storm Peak Fast
> hversion        : 0x00008890
> sversion        : 0x00000491
> I-cache         : 32768 KB
> D-cache         : 32768 KB (WB, direct mapped)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
> bogomips        : 1998.84
> software id     : 4468984695822677774
> 
> is what mine says... (with the 32MB L2 cache.)

My says:
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8900 (Shortfin)
cpu MHz         : 900.000000
capabilities    : os64
model           : 9000/785/C8000
model name      : Unknown machine
hversion        : 0x00008920
sversion        : 0x00000491
I-cache         : 768 KB
D-cache         : 768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1795.68
software id     : 6249854628114153565

PA8900 is wrong, direct mapped is wrong.

So, maybe the cache is the reason why it is fast and why it doesn't run on 
SMP?

> Anyway, the L1 are usually 2/4-way associative on parisc, iirc, I
> believe the L2 is as well.
> 
> The main problems we see on the pa8800 is due to the L2, which is
> physically indexed, and exclusive. We had some bizarre
> corruption due to incorrect evictions there. (And flushing 32MB on
> fork is just utterly painful, we really need to fix that someday.)
> 
> --Kyle

When I read the specification, it says that equivalent virtual addresses 
are those that are 16-MB (or multiplies of) apart. Warning, the PDF is 
wrong (it says 1MB), there's an errata on HP website that extends it to 
16MB.

It also gives an option to hash parts of space-ID to the cache addressing, 
I suppose this is turned off on Linux.

The hardware handles aliasing of equivalent addresses fine (both on UP or 
SMP).

Multiple mappings on non-equivalent addresses are allowed only if all are 
read-only (otherwise it generates machine-check conditions).



Based on the specification, I suppose that the processor finds the cache 
address with a virtual address (and optionally a space-id hashed into it), 
in parallel it finds the physical address using TLB, the cache contains 3 
or 4 lines at a given address, each with a full physical address. The 
phyiscal addresses are compared with the output from the TLB and if match 
is found, that cache line is accessed.



So, if we want to implement it correctly, we must allow aliasing only on 
equivalent virtual addresses.

- fork --- no problem, the mappings are equivalent after fork, I see no 
need to flush cache there, hardware should do. If you see such need, 
describe it.

- kmap (accessing user pages from the kernel) --- kmap will work if we 
deliberately select an equivalent kernel address (that matches the user 
address modulo 16M). If we do, no need to flush cache.

- shared memory --- there is SHMLBA boundary that causes that all mappings 
are aligned to this boundary --- it is **WRONG** in the current kernel!!! 
It is only 4MB and should be 16MB!!!

- mapped files --- I'd simply map them all so that (mapped_address - 
file_offset) is divisiable by 16MB. One problem would be MAP_FIXED, this 
should be simply rejected with -EINVAL and userspace linker be patched to 
use conguent addresses.

Note that aliasing non-equivalent addresses may cause machine-check 
exception according to the specifications, so we simply can't allow the 
userspace to do them. I don't know how many programs will be broken by 
restricting MAP_FIXED, but I don't see any other reasonable way (well, 
you can unmap the other mappings when creating a non-equivalent mapping, 
but what to do with mlock() then?).

How does HP-UX solve MAP_FIXED to non-equivalent addresses? Does it abort 
it with -EINVAL?

If we obey these rules, we can run with no cache flushing in page mapping 
or unmappinh at all. There is one case where we'd need to flush cache --- 
freeing a page and allocating it to a different virtual address. We'd need 
to free cache on all page freeings or allocations. (it could be later 
minigated with an arch-specific wrapper around page allocator)

Mikulas
