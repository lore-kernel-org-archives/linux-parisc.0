From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 4 Sep 2006 23:12:47 -0600
Message-ID: <20060905051247.GB12278@colo.lackof.org>
References: <1157410039.3513.26.camel@mulgrave.il.steeleye.com>
	<200609042352.k84NqpuE028835@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200609042352.k84NqpuE028835@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Sep 04, 2006 at 07:52:51PM -0400, John David Anglin wrote:
> > +	if (likely(now - next_tick < clocktick)) {
> > +		nticks = 1;
> >  		next_tick += clocktick;
> > -		nticks++;
> > +	} else {
> > +		nticks = ((now - next_tick)/clocktick) + 1;
> > +		next_tick += clocktick*nticks;
> > +	}
> 
> I'd rather loop if now - next_tick isn't too many ticks.

Yeah, but we don't know how many times we will loop unless
we've already done the math.

>  Integer division and multiplation are very expensive, particularly when
> running in 64-bit mode.  We don't have optimized millicode to do it.
> So, I don't much like falling into the unlikely case if we are just
> delayed one tick.

How many loops would be a reasonable tradeoff? 5? 10?
We'd need a histogram from a "slow" machine to see that tradeoff.


> I'm still concerned that we may take a TLB exception in this code
> and substantially increase the calculation time.

Hrm...what would cause a TLB exception in timer_interrupt?
Accessing a global var?

> It's somewhat unclear whether any of these tweaks will solve the
> B160 issue.  The halftick margin may not be enough in the slow
> path at 1000 Hz and decreasing the tick rate may be the only fix
> on slow machines.

I'm pretty sure the halftick margin will be plenty.
At 1000Hz, a 50Mhz machine will have 50K cycles per tick.
Even with cache miss for global var (let's say ~300 cycles),
8 cycles for CR16 reads, 300-400 cycles for the math (using div/mul)
we are still under 1K cycles of processing. Say I'm off by a
factor or 2 or 4 and it's still a pretty wide margin.

Instead of a global var access for halftick, would a
hard coded value (e.g. 4k) that's easy to test for be
more efficient?

I'm still thinking of ~0xfffUL or (x>>12).

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
