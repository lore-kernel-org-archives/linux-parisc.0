From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sat, 24 Feb 2007 19:27:19 -0600
Message-ID: <1172366840.3401.31.camel__30062.8440025777$1416624314$gmane$org@mulgrave.il.steeleye.com>
References: <1172328689.3401.3.camel@mulgrave.il.steeleye.com>
	<20070225004603.GB18944@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070225004603.GB18944@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-24 at 17:46 -0700, Grant Grundler wrote:
> Isn't sr3 part of the context?

It is the user context above the kernel, yes.

> ie if we need to change the sr3 for a given context shouldn't
> the code be modifying the value in the struct context instead

That's what tausq's change does.  It updates active_mm->context but then
it has to propagate the change on an SMP system, which is what the IPI
is supposed to do.

> the actual register unless we know we are in that context?

That's why the IPI checks current->active_mm against the mm being
changed.  If the CPU isn't executing in that context, nothing happens.
If it has, since we just changed mm->context, the new context gets
loaded into sr3, as it should be.

> The IPI code should know the sr3 was saved and where.

It does: in mm->context.

> The change to assembly.h has me very nervous since I don't understand it.
> You probably have it right and I'm being a bit dense.

Actually, I think it's pointless saving any space register for an
interrupt ... no interrupt should muck with the space registers since no
interrupt should ever be mucking with anything in user context ...
However, sr3 is special ... even if we get interrupts mucking with space
registers, they'll never touch sr3.

> I was trying to track down other uses of "mtsp sr3" and schedule()
> seems to be one:
> 	schedule() -> context_switch() -> switch_mm() -> load_context()
> 
> I'm not seeing where this path disables local interrupts.

It doesn't need to.  The IPI either updates sr3 or it doesn't.  The
load_context() will actually update it anyway, and sr3 isn't used until
the kernel accesses userspace, which is nowhere in that sequence, so
it's all quite safe.

> Sounds like it should before calling load_context() or we should
> in our switch_mm() or add a prepare_arch_switch() to asm-parisc/system.h.

Not really ... like I said, the IPI's effect will be known even if we're
beginning a context switch.

> >   As far as I can tell, this is pretty much only non local cache
> > flushing.
> 
> ISTR copy and one or two other places use sr3 as well.

No, pa_memcpy uses sr1 and sr2 ... it's only the non-local flushing that
uses sr3.

> > The following patch fixes the IPI to work (by not saving %sr3
> > across an interruption) and patches up temporary %sr3 usage.
> > 
> > The sharp eyed will also notice I've corrected a Protection ID bug with
> > the non current flushes.
> 
> That's not me :)
> Was the fix to place "pgd = mfctl(25)" after the local_irq_disable()?

No, it was changing the mtsp(xx, 3) to load_context(xx).  The problem is
that if we don't update %cr8 then the new context in sr3 is completely
ineffective since the protection IDs will mismatch in the TLBs, so, as
far as I can tell, the non local flush was never effective.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
