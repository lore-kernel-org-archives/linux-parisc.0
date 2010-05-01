From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Patch for segfaults in minifail tests
Date: Sat, 01 May 2010 18:39:51 -0500
Message-ID: <1272757191.4570.97.camel@mulgrave.site>
References: <20100501231355.851335057@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	T-Bone@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100501231355.851335057@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-05-01 at 19:13 -0400, John David Anglin wrote:
> Hi Helge,
> 
> > I tried your patch on top of a 2.6.33.2 kernel (SMP, 32bit, PA8500 (PCX-W) CPU).
> > I still do see all the page faults as before. They even seem to trigger 
> > faster than with a few of Dave's patches.
> > 
> > I usually run this command
> > 	i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail_dave; done;
> > in a few screen sessions in parallel.
> 
> The reason running multiple screens in parallel exposes further problems
> is the implementation of ptep_set_wrprotect is broken.  It simply sets the
> write protect bit in the pte and doesn't purge the existing translation.
> So, the parent continues to merrily write to the write protected page until
> the TLB entry is purged and reloaded.  More processes make it more likely the
> entry will be replaced and trigger a COW break.
> 
> This is why my versions of the minifail test which monitor the stack region
> used by the thread don't cause a COW break immediately after the fork.  When
> compiled at -O0, the loop index is constantly being stored to the stack.

Actually, no, this explanation isn't correct.

The way linux works.  You can see roughly how this works in
copy_page_range() where we prepare the COW.  If it's going to be a COW
range, we call mmu notifiers before and after the pte settings.  The
after mmu notifier is supposed to flush the TLB.   Linux always does
memory operations in the form

prepare();
do_something_with_the_ptes()
activate()

It's only after the activate() through the mmu notifiers that we're
supposed to be consistent.

Now the outstanding question is whether we're correctly hooked into the
post mmu update notifier ... but I suspect we are (sorry, heading to a
plane for boston, will try to check this next week).

James


