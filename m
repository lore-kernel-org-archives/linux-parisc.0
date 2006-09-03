From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 13:38:06 -0600
Message-ID: <20060903193806.GB20217@colo.lackof.org>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
	<1157212326.4041.26.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157212326.4041.26.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 02, 2006 at 10:52:06AM -0500, James Bottomley wrote:
> The first problem is that interrupts are re-entrant, so the timer
> interrupt can get re-interrupted.

Doesn't this violate one of the basic tenants of linux interrupts?

I know the interrupt handler (same instance) can't be invoked on
two different CPUs and it seems re-entrance would be a similar
case.

>      1. On SMP, cr16 of the secondary processors (and next_tick) is
>         never initialised ... we just wait for the timer to wrap and
>         then pick up ticking from there.

I saw that too and happen to have committed the fix for it last night.

>      2. processor_probe() blows away all of the next_tick data when it's
>         called (once for every CPU)

Fixed that too :)

>      3. We're regularly missing multiple ticks ... mainly below about
>         30 .. there must be some cause for this but I can't immediately
>         find it.

Ok. I'm not sure how to look for that either.

>      4. we don't obey CONFIG_HZ at all the clock is always either 1000
>         for pa2.0 or 100 for pa1.0

Also committed a fix for that.

> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c

Is it ok if I only add the irqsave/restore to my current patch?
I also like the "avoid div/mul ops" test too.

I'd like to defer discussion on halfticks for now.
I consider that an optimization we can defer for now.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
