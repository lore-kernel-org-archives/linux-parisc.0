From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Thu, 28 Apr 2005 14:20:58 -0600
Message-ID: <20050428202058.GG10171@colo.lackof.org>
References: <20050428190659.GD10171@colo.lackof.org>
	<200504281942.j3SJgQvL005780@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504281942.j3SJgQvL005780@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Apr 28, 2005 at 03:42:26PM -0400, John David Anglin wrote:
> > Besides the basic issue, this also implies flush_tlb_all() is
> > called twice in the same code path. That might be ok if 
> > flush_tlb_all() took parameters, but it does not.
> 
> Twice?

Yes. Once from
	exit_mmap() -> flush_tlb_mm() -> flush_tlb_all()
and again
	unmap_vmas() -> unmap_page_range() -> tlb_end_vma() ->
		 flush_tlb_range() -> flush_tlb_all()

But flush_tlb_range() only calls flush_tlb_all() IFF:
...
	if (npages >= 512)  /* XXX arbitrary, should be tuned */
		flush_tlb_all();
	else {
...

That may be why I'm not seeing it more often.

jejb, any insight here?

> > Any clue what the basic issue is here?
> 
> flush_tlb_all doesn't call anything.

Eh?! I'm looking at arch/parisc/mm/init.c and it is:
...
        }
        spin_unlock(&sid_lock);
        on_each_cpu((void (*)(void *))flush_tlb_all_local, NULL, 1, 1);
        if (do_recycle) {
...

>   I'm guessing but I think this
> implies that smp_call_function is getting called because a TLB miss
> fault has occured.  It appears from the backtrace that the fault
> has occurred in the part of flush_tlb_all with the REAL_MODE_PSW
> flags set (W and Q).  Interrupts are off, so this causes the warning.

Wouldn't we see more gunk on the stack trace?

If I'm reading the PA 2.0 Arch correctly, PDTLB/PDTLBE insn can NOT cause
a TLB Miss. But I don't really know.

It also doesn't make sense for a TLB miss if we are in REAL_MODE.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
