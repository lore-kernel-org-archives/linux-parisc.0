From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 17:25:13 -0400 (EDT)
Message-ID: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
References: <20060430171331.GB1358@skunkworks.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060430171331.GB1358@skunkworks.cabal.ca> from "Kyle McMartin"
	at Apr 30, 2006 01:13:31 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Our in-kernel spinlocks respect this, minus the pretest which probably
> isn't necessary for anything but performance. See include/asm-parisc/spinlock.h
> __raw_ macros for more details. I suspect mb() is probably a good equivalent
> for the notation used as a compiler barrier in that document.

They also lack the optimization discussed in section 4.1 paragraph 4
(write zero byte to high order byte of lock word to try to make the
cacheline dirty for the executing cpu).  The mb() should work as a
compiler barrier.

I also suggest using an ordered store for the unlock operation.  This
doesn't cost anything and may help to ensure that the order of memory
accesses as seen by another processor occur in the expected sequence.

> Note, the document also uses LDCW,CO so I suspect this is correct
> in our implementation as well.

I've come to believe that using the ",CO' completer may be a bug.
I think it would be better to drop using the ",CO' completer and use
the trick of storing a zero byte to high-byte of the lock word to
make the cacheline dirty.

It all comes down to this crucial bit of code in the ldcw description:

  (indivisible)
  if (cache line is present and dirty || coherent_system || cc != 0) {
    GR[t] <-- zero_ext(mem_load(space,offset,0,31,NO_HINT),32);
    mem_store(space,offset,0,31,NO_HINT,0);
  } else {
    Dcache_flush(space, offset);
    GR[t] <-- zero_ext(mem_load(space,offset,0,31,NO_HINT),32);
    store_in_memory(space,offset,0,31,NO_HINT,0);
  }

and what happens when we have a MP system that supports cc and
coherent_system == 0.  Obviously, specifying ",CO" on a system
that's fully coherent doesn't make a difference.

This is what the ",CO" completer is supposed to do:

  "The Coherent Operation cache control hint is a recommendation
   to the processor that, if the addressed data is already in the
   cache, it can operate on the addressed data in the cache rather
   than having to update memory."

Note the line doesn't have to be dirty.  Unless extreme care is
used, the line could have been be brought into cache by a load for
data elsewhere on the line.  So for correct operation of 'ldcw,co',
there really must be no inter-processor timing problems in kicking
out cachelines.  Otherwise, we could end up with two dirty cachelines
and a broken spinlock.

It may be this is only reliable on fully coherent systems.  While
the N-class is classified as a UMA machine, it has two system buses
separated by a memory controller.  Each system bus can handle four
processors with L1 and L2 cache.  Thus, it would seem safer to adopt
the prewrite and use ldcw without the cache control completer.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
