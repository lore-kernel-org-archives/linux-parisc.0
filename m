From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Mon, 25 Oct 2010 23:04:42 -0400
Message-ID: <20101026030442.GS8332@bombadil.infradead.org>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca>
 <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz>
 <20101024034314.GQ8332@bombadil.infradead.org>
 <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 26, 2010 at 04:16:39AM +0200, Mikulas Patocka wrote:
> I tried UP build and it is almost twice slower when compiling (obviously). 
> So I don't see any performance advantage in running UP :)
> 
> Generally, performance of two-way 900MHz machine is not that bad --- 5 
> times faster compile than 440MHz sparc. It suffers only on tests involving 
> mostly kernelwork, but no so seriously --- 3.5 times faster than said 
> sparc when doing a "dummy" make of an already compiled project (just 
> testing timestamps) and 1.2 times faster than sparc on make clean (ok, it 
> sucks when re-calculated to clock-to-clock). Generally, I think it's 
> usable for development.
> 

Heh. I think you may be lucking in here... see below.

> I found that gcc 4.3 from Debian 5 is buggy, it miscompiled the UP kernel. 
> Compiling it with -Os worked fine. Could you please recommend a compiler 
> to use? (4.4 from Debian 6 ... or some other version?)
> 

4.4.5 from sid is what I'm using... I think it's working more or less
for me. I've only been building/booting UP/SMP on an rp3440 these days,
so I'm not sure about 32-bit.

> > our cache flushing is a bit... suboptimal right now (doing whole cache
> > flushes on fork and such.)
> 
> What is exactly the problem there? Could you describe it or refer to some 
> document that describes it? Why do you need to flush on fork?
> 
> Sparc has virtually indexed caches too, but there are not many problems 
> with it, basically the only needed thing is to flush the cache when kernel 
> touches some user page via its own mapping. (if they ran with 16kB page 
> size, they wouldn't have to care about data cache coherency at all).
> 

I can't remember exactly why offhand, I'm sure jejb can remind us.

> Another thing I don't understand: the L1 cache is supposed to be 
> direct-mapped, but it's size is 768kB. I can't imagine how is it 
> implemented. Does it mean that the processor does a divide-by-3 on every 
> cache access?
> 
> Or is it a mistake and the cache is 3-way set associative, with set size 
> 256kB? (that would make much more sense)
> 

That's the output from one of the firmware queries, which has been lying
to us for a very long time (apparently HP just doesn't test these things
or something.) It believe the pa8800 L1 caches were 4-way associative.

So, on to the interesting bit!

Does your /proc/cpuinfo actually say 768kB? That's... amazingly
interesting. I wonder (out loud, sorry I should go back and look at the
prior emails) if that's the cause of your cpu issues...

processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8800 (Mako)
cpu MHz         : 999.995500
capabilities    : os64
model           : 9000/800/rp3440  
model name      : Storm Peak Fast
hversion        : 0x00008890
sversion        : 0x00000491
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1998.84
software id     : 4468984695822677774

is what mine says... (with the 32MB L2 cache.)

Anyway, the L1 are usually 2/4-way associative on parisc, iirc, I
believe the L2 is as well.

The main problems we see on the pa8800 is due to the L2, which is
physically indexed, and exclusive. We had some bizarre
corruption due to incorrect evictions there. (And flushing 32MB on
fork is just utterly painful, we really need to fix that someday.)

--Kyle
