From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: Tue, 7 Sep 2004 09:17:22 -0600
Message-ID: <20040907151722.GC18849@colo.lackof.org>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
	<20040906041952.GA17107@colo.lackof.org>
	<1094480131.2037.6.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1094480131.2037.6.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Sep 06, 2004 at 10:15:29AM -0400, James Bottomley wrote:
> On Mon, 2004-09-06 at 00:19, Grant Grundler wrote:
> > Actaully, I don't think it's irrelevant.  If a lock is contended for,
> > re-ordering by gcc could excerbate the problem by adding additional
> > instructions (good for the instruction pipeline) to the "critical
> > section" (the period we actually hold the lock).
> 
> But that's what placing the mb() after the spinlock code does: confines
> the critical section and prevents gcc reordering around it.

Maybe I'm just confused again. I was thinking gcc could move instructions
between the asm("ldcw") and mb(). And the same thing between
mb() and "lock = 1".

In other words, I'm worried about the "distance" bewteen lock/unlock
ops is greater than the "distance" between two mb() that contain
the critical section of code.

> > This is why I'm asking about use of "memory" in the actual
> > asm instruction that either acquire or release the lock
> > instead of using mb().
> 
> You probably get slightly more confinement by using mb() instead of the
> "memory" clobber in __ldcw().

Erm, how?
Our mb() definition uses asm(:::"memory").
Is that different from using "memory" in the actual bit of assembly?

I just noticed set_eiem(), mtsp() and IRQ support in our system.h
do exactly what I proposed.

> What appeals to me is that the barrier in the spinlocks is explicit.

Yes, me tool.
But I'm suggesting those are superfluous when using "memory" in
the core asm() lock operations.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
