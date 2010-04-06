From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 06 Apr 2010 08:37:49 -0500
Message-ID: <1270561069.4493.29.camel@mulgrave.site>
References: <20100405025154.DE1D55160@hiauly1.hia.nrc.ca>
	 <1270484318.2790.38.camel@mulgrave.site>  <4BBABF23.1030405@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: NIIBE Yutaka <gniibe@fsij.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BBABF23.1030405@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-04-06 at 13:57 +0900, NIIBE Yutaka wrote:
> John David Anglin wrote:
> > It is interesting that in the case of the Debian bug that
> > a thread of the parent process causes the COW break and thereby corrupts
> > its own memory.  As far as I can tell, the fork'd child never writes
> > to the memory that causes the fault.
> 
> Thanks for writing and testing a patch.
> 
> The case of #561203 is second scenario.  I think that this case is
> relevant to VIVT-WB machine too (provided kernel does copy by kernel
> address).
> 
> James Bottomley wrote:
> > So this is going to be a hard sell because of the arch churn. There are,
> > however, three ways to do it with the original signature.
> 
> Currently, I think that signature change would be inevitable for
> ptep_set_wrprotect.

Well we can't do it by claiming several architectures are wrong in their
implementation.  We might do it by claiming to need vma knowledge ...
however, even if you want the flush, as I said, you don't need to change
the signature.

> >      1. implement copy_user_highpage ... this allows us to copy through
> >         the child's page cache (which is coherent with the parent's
> >         before the cow) and thus pick up any cache changes without a
> >         flush
> 
> Let me think about this way.
> 
> Well, this would improve both cases of the first scenario of mine and
> the second scenario.
> 
> But... I think that even if we would have copy_user_highpage which
> does copy by user address, we need to flush at ptep_set_wrprotect.  I
> think that we need to keep the condition: no dirty cache for COW page.
> 
> Think about third scenario of threads and fork:
> 
> (1) In process A, there are multiple threads, and a thread A-1 invokes
>     fork.  We have process B, with a different space identifier color.

I don't understand what you mean by space colour ... there's cache
colour which refers to the line in the cache to which the the physical
memory maps.  The way PA is set up, space ID doesn't factor into cache
colour.

> (2) Another thread A-2 in process A runs while A-1 copies memory by
>     dup_mmap.  A-2 writes to the address <x> in a page.  Let's call
>     this page <oldpage>.
> 
> (3) We have dirty cache for <x> by A-2 at the time of
>     ptep_set_wrprotect of thread A-1.  Suppose that we don't flush
>     here.
> 
> (4) A-1 finishes copy, and sleeps.
> 
> (5) Child process B is waken up and sees old value at <x> in <oldpage>,
>     through different cache line.  B sleeps.

This isn't possible.  at this point, A and B have the same virtual
address and mapping for <oldpage> this means they are the same cache
colour, so they both see the cached value.

James

> (6) A-2 is waken up.  A-2 touches the memory again, breaks COW.  A-2
>     copies data on <oldpage> to <newpage>.  OK, <newpage> is
>     consistent with copy_user_highpage by user address.
> 
>     Note that during this copy, the cache line of <x> by A-2 is
>     flushed out to <oldpage>.  It invokes another memory fault and COW
>     break.  (I think that this memory fault is unhealthy.)
>     Then, new value goes to <x> on <oldpage> (when it's physically
>     tagged cache).
> 
>     A-2 sleeps.
> 
> (7) Child process B is waken up.  When it accesses at <x>, it sees new
>     value suddenly.
> 
> 
> If we flush cache to <oldpage> at ptep_set_wrprotect, this couldn't
> occur.
> 
> 
> 			*	*	*
> 
> 
> I know that we should not do "threads and fork".  It is difficult to
> define clean semantics.  Because another thread may touch memory while
> a thread which does memory copy for fork, the memory what the child
> process will see may be inconsistent.  For the child, a page might be
> new, while another page might be old.
> 
> For VIVT-WB cache machine, I am considering a possibility for the
> child process to have inconsistent memory even within a single page
> (when we have no flush at ptep_set_wrprotect).
> 
> It will be needed for me to talk to linux-arch soon or later.


