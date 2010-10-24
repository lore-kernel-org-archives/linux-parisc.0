From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 23:43:15 -0400
Message-ID: <20101024034314.GQ8332@bombadil.infradead.org>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca>
 <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 24, 2010 at 05:03:25AM +0200, Mikulas Patocka wrote:
> I tried to measure the cache size, sequential memory read showed cutoff at 
> 700kB and no cutoff at 32MB. It shows 1.7GB/s below 700kB and 612MB/s 
> above. Latency measurements (chasing pointer chain) showed drastic cutoff 
> at 700kB (from 3ns to 300ns) and no cutoff at 32MB.
> 
> It may be that the lack of L2 cache is the reason why the CPUs don't 
> support multiprocessing ... I may buy two better CPUs, if I had actually 
> guarantee that the machine isn't locked (I don't want to waste more money 
> just to find out that the firmware lock doesn't go away).
> 

FWIW, I'd recommend running in non-SMP mode on pa8800/8900 anyway, as
our cache flushing is a bit... suboptimal right now (doing whole cache
flushes on fork and such.) Which, coupled with the gigantic caches on
those cpus which must be flushed just tanks performance.

I've been working on cleaning up jejb's patchset from back in the
bitkeeper days to properly do deferred flushing, but time is constantly
against me (sigh, I don't think I've even powered on my C8000 in a few
years now... explains why I didn't catch your e1000 issue there. :)

--Kyle
