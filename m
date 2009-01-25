From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: timer_interrupt delayed messages 2.6.27-rc7
Date: Sun, 25 Jan 2009 01:04:51 -0700
Message-ID: <20090125080451.GE22539@colo.lackof.org>
References: <20081001055953.GC7348@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081001055953.GC7348@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 30, 2008 at 11:59:53PM -0600, Grant Grundler wrote:
> Hey,
> I tested two 2.6.27-rc7 kernels on an a500.
> The first had CONFIG_HZ=250 and was getting the following messages:
> timer_interrupt(CPU 1): delayed! cycles 100001A37 rem 8C237  next/now 4A954C3C1C/4B954C5653
> timer_interrupt(CPU 0): delayed! cycles 100000E07 rem 8B607  next/now 4A95B8EAF5/4B95B8F8FC
> timer_interrupt(CPU 1): delayed! cycles 1000009CB rem 8B1CB  next/now 4B956525DC/4C95652FA7
> timer_interrupt(CPU 0): delayed! cycles 100000931 rem 8B131  next/now 4B95D1D4B5/4C95D1DDE6
> ...
> 
> Since 8B131+931 looks remarkably close to 550 Mhz/1000,

I'm looking at this again and wondering if I made a thinko.
(8B131-931) gives the same answer for each: 0x8A800 (567296)

> I decided to try a CONFIG_HZ=1000 kernel and now get the following:
> timer_interrupt(CPU 1): delayed! cycles 100001C74 rem 6004  next/now 2BFD187FEA/2CFD189C5E
> timer_interrupt(CPU 1): delayed! cycles 100000E8A rem 521A  next/now 2CFD20A0CA/2DFD20AF54
> timer_interrupt(CPU 1): delayed! cycles 100000A33 rem 4DC3  next/now 2DFD28C1AA/2EFD28CBDD
> timer_interrupt(CPU 1): delayed! cycles 100000C87 rem 5017  next/now 2EFD30E28A/2FFD30EF11

Same here:
    5017-C87=0x4390
    4DC3-A33=0x4390

> ...
> 
> Note that CPU0 no longer reports this error.
> I suspect we have two bugs in play here.
> 
> The first one might be we have some basic bug in how the itimer is
> getting programmed.  I suspect it's always off by 32-bits because IIRC
> we can only program the lower 32-bits of CR16. I suspect the comparison
> code gets the 32-bit rollover wrong. Is that enough clues for someone to
> spot this?

I've looked for this but don't see it. The next/now values above don't
support that theory since they are not within 0x8A800 (first example
at 250Hz) of 4G.

Secondly, at 1000Hz, I'm not seeing the relationship of 0x4390
to any plausible cycles per tick value (440-750Mhz). I should see
something between 0x6B6C0 (440Mhz) and 0xB71B0 (750Mhz).

I'm wondering if this a side effect of some other bug.

thanks,
grant


> The second might be 1000HZ (or 1024?) is still hardcoded in our source
> code someplace.  I can't otherwise explain the "rem" values dropped more
> than 4x while the "cycles" value is roughly the same (2^32 + about 0x1000).
> Also CPU0 stopped reporting this error. Initialization for CPU0 is different
> and those might be useful clues too.
> 
> thanks,
> grant
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
