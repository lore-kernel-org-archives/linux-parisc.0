From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: PA caches (was: C8000 cpu upgrade problem)
Date: Tue, 26 Oct 2010 04:16:39 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca> <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz> <20101024034314.GQ8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101024034314.GQ8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, Kyle McMartin wrote:

> On Sun, Oct 24, 2010 at 05:03:25AM +0200, Mikulas Patocka wrote:
> > I tried to measure the cache size, sequential memory read showed cutoff at 
> > 700kB and no cutoff at 32MB. It shows 1.7GB/s below 700kB and 612MB/s 
> > above. Latency measurements (chasing pointer chain) showed drastic cutoff 
> > at 700kB (from 3ns to 300ns) and no cutoff at 32MB.
> > 
> > It may be that the lack of L2 cache is the reason why the CPUs don't 
> > support multiprocessing ... I may buy two better CPUs, if I had actually 
> > guarantee that the machine isn't locked (I don't want to waste more money 
> > just to find out that the firmware lock doesn't go away).
> > 
> 
> FWIW, I'd recommend running in non-SMP mode on pa8800/8900 anyway, as

I tried UP build and it is almost twice slower when compiling (obviously). 
So I don't see any performance advantage in running UP :)

Generally, performance of two-way 900MHz machine is not that bad --- 5 
times faster compile than 440MHz sparc. It suffers only on tests involving 
mostly kernelwork, but no so seriously --- 3.5 times faster than said 
sparc when doing a "dummy" make of an already compiled project (just 
testing timestamps) and 1.2 times faster than sparc on make clean (ok, it 
sucks when re-calculated to clock-to-clock). Generally, I think it's 
usable for development.

I found that gcc 4.3 from Debian 5 is buggy, it miscompiled the UP kernel. 
Compiling it with -Os worked fine. Could you please recommend a compiler 
to use? (4.4 from Debian 6 ... or some other version?)

> our cache flushing is a bit... suboptimal right now (doing whole cache
> flushes on fork and such.)

What is exactly the problem there? Could you describe it or refer to some 
document that describes it? Why do you need to flush on fork?

Sparc has virtually indexed caches too, but there are not many problems 
with it, basically the only needed thing is to flush the cache when kernel 
touches some user page via its own mapping. (if they ran with 16kB page 
size, they wouldn't have to care about data cache coherency at all).

Another thing I don't understand: the L1 cache is supposed to be 
direct-mapped, but it's size is 768kB. I can't imagine how is it 
implemented. Does it mean that the processor does a divide-by-3 on every 
cache access?

Or is it a mistake and the cache is 3-way set associative, with set size 
256kB? (that would make much more sense)

> Which, coupled with the gigantic caches on
> those cpus which must be flushed just tanks performance.
> 
> I've been working on cleaning up jejb's patchset from back in the
> bitkeeper days to properly do deferred flushing, but time is constantly
> against me (sigh, I don't think I've even powered on my C8000 in a few
> years now... explains why I didn't catch your e1000 issue there. :)
> 
> --Kyle

Mikulas
