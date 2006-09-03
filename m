From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 03 Sep 2006 10:17:49 -0500
Message-ID: <1157296669.3486.9.camel@mulgrave.il.steeleye.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
	<1157212326.4041.26.camel@mulgrave.il.steeleye.com>
	<119aab440609030800h264c16bcn2958a78558a2ef48@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609030800h264c16bcn2958a78558a2ef48@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-09-03 at 11:00 -0400, Carlos O'Donell wrote:
> You address two issues here 1) Long times between timer_interrupts,
> 2) negative offsets in gettimeoffset().
> 
> The first issue is a problem I had not considered. It is a very likely
> scenario that timer_interrupt is interrupted by another
> timer_interrupt, and overwrites the cr16 value of the most recent
> interrupt. Your patch here is definately correct, I had considered the
> reentrancy of this function.

Actually, we don't have a re-entrancy problem: the way the EIEM works,
we can't get another timer_interrupt until we come out of this one.  We
can, however, get all other interrupts in this code.   Like I said, on
pa8800 the culprit was cache flushing IPI's, which can take > 1ms to
execute (because the cache is so huge).

> Your guess that this is the solution to problem 2) is not quite right.
> I will argue that the "halftick" counting is at fault here. When a
> "halftick" is counted as a full tick the system time moves into the
> future. All calls to gettimeoffset must therefore return negative
> adjustments. I think removing the erroneous halftick counting is the
> solution to issue 2.

Memory is cheap in this array.  What we should really have is two cycle
values:  prev_tick and next_tick.  Then we can run do_gettimeoffset from
prev_tick (the cycle value at last interrupt) and thus not muck about
trying to work out from jiffies if this is a halftick or a multiple
tick.

James



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
