From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: 06 Sep 2004 10:15:29 -0400
Message-ID: <1094480131.2037.6.camel@mulgrave>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
	<20040906041952.GA17107@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040906041952.GA17107@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-09-06 at 00:19, Grant Grundler wrote:
> Actaully, I don't think it's irrelevant.  If a lock is contended for,
> re-ordering by gcc could excerbate the problem by adding additional
> instructions (good for the instruction pipeline) to the "critical
> section" (the period we actually hold the lock).

But that's what placing the mb() after the spinlock code does: confines
the critical section and prevents gcc reordering around it.

> I know, lock contention is bad and it should never happen.
> Reality is some workload will contend for a lock. I want to
> have some confidence gcc is not making it any worse.
> This is why I'm asking about use of "memory" in the actual
> asm instruction that either acquire or release the lock
> instead of using mb().

You probably get slightly more confinement by using mb() instead of the
"memory" clobber in __ldcw().  But really it's insignificant.  What
appeals to me is that the barrier in the spinlocks is explicit.  If the
spinlocks were fully asm coded, like for example x86, then adding a
"memory" clobber would make sense, but they're not, they're coded in C
with a little asm help.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
