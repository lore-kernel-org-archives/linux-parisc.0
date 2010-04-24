From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP machines)
Date: Sat, 24 Apr 2010 11:48:24 -0400 (EDT)
Message-ID: <20100424154824.C924E5160@hiauly1.hia.nrc.ca>
References: <3E26349A-5670-4643-926D-24C04E75084C@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, grundler@parisc-linux.org
To: T-Bone@parisc-linux.org (=?ISO-8859-1?Q?Thibaut_VAR=C8NE?=)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3E26349A-5670-4643-926D-24C04E75084C@parisc-linux.org> from "=?ISO-8859-1?Q?Thibaut_VAR=C8NE?=" at Apr 24, 2010 04:44:27 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Sounds like it. Though the HPMCs are clearly different than the PTE  
> > issues
> > that jda/carlos are seeing.
> 
> True, but I remember Debian staff complaining about random unexplained  
> hangs, I wouldn't be too surprised if this came into play...

I have been looking at the PTE/TLB code for the last couple of weeks.
I now believe that the majority of the random hangs, segvs at program
startup are related to problems with the PTE/TLB code.

1) minifail bug

As previously identified, there is a cache flush problem in ptep_set_wrprotect.
I did a kernel build with a "WARN_ON(pte_present(old_pte) && pte_dirty(old_pte)"in ptep_set_wrprotect an it triggered immediately.  So, we have to deal with
a dirty cache in ptep_set_wrprotect.  As far as I can tell, this problem
is fixed by putting the flush inside preempt_disable()/preempt_enable().

Helge is triggering other PTE issues when he runs multiple copies of
minifail.  The minifail program fails on a UP system.  With the above fix,
it doesn't fail.

2) SMP page table entry corruption

The needs to be a lock around pte updates to ensure that pte modifications
are consistent on SMP machines.  I have done this and it helps stability
on rp3440.

3) SMP PTE/TLB consistency

We are not purging existing translations when an update to a PTE value
is done such as in ptep_set_wrprotect.  As a result, the parent of a fork
doesn't immediately trigger a COW break on a page when a write occurs
if there is an existing translation.

Adding a TLB purge helps, but even this may be lost.  For example,

page fault (cpu1)
  -> load old pte (cpu1)
    -> store new pte (cpu2)
      -> global tlb purge (cpu2)
        -> insert old pte into tlb (cpu1)

It may be possible to use locking to ensure that purges aren't lost.  However,
this is a bit tricky...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
