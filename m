From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 11:10:51 -0400 (EDT)
Message-ID: <200605021510.k42FAps6000117@hiauly1.hia.nrc.ca>
References: <20060502060028.GA14414@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060502060028.GA14414@colo.lackof.org> from "Grant Grundler" at
	May 2, 2006 00:00:28 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I also suggest using an ordered store for the unlock operation.  This
> > doesn't cost anything and may help to ensure that the order of memory
> > accesses as seen by another processor occur in the expected sequence.
> 
> I've had it drilled into my head that all parisc implmentations
> have strongly ordered memory subsystems. John Marvin (jsm) has
> stated that more than a few times on this list. So "ordered store"
> is the same as a regular store.

Yes, I know this has been said and I've seen it in documents.
However, HP-UX 11i uses lots of "ordered" stores and one is never
quite sure about the currency of information in documentation.

> > It all comes down to this crucial bit of code in the ldcw description:
> 
> I'd rather have someone like Jerry Huck or someone in his experience
> comment on this before we go down this path.  I'll try to find
> someone to consult with this week.

That would be great and I think help to clear up our questions.

> > It may be this is only reliable on fully coherent systems.  While
> > the N-class is classified as a UMA machine, it has two system buses
> > separated by a memory controller.  Each system bus can handle four
> > processors with L1 and L2 cache.
> 
> AFAIK, N-class has no L2 cache.

However, the rp7400 and rp7420 certainly do.  See
<http://www.ccns.pl/zasoby/13/rp7400techwp5.pdf>.  The rp7420
appears to have 32MB or 64MB of L2 per processor module.

> But it's worse than you think.
> N-class has two _Merced_ busses connected to the memory controller. 
> Each Processor is connected via a double pumped Runway Bus to "Dew"
> which acts as a "bridge" to one of the Merced Busses.
> 
> [ Digression - certain document says:
> 	In PA-RISC, code fetches are non-coherent, such that PCX-W doesn't
> 	even supply Vindex bits that would allow the code fetches to be
> 	coherent.
> ]

Because of this, if you want to execute instructions on the stack,
you have to flush the lines from both the instruction and data cache,
and do a sync before transferring to the code on the stack.

I just think that in machines with multiple data caches, we have to
be careful about the coherence of the data in these caches.  You have
pointed out that I-cache code fetches are non-coherent.  The L2 caches
in the rp7420 are combined.  The logic could provide different behavior
for I and D accesses, then again it might not.

If the hardware on all PA-RISC machines guarantees full coherence
of the D-cache on all machines except the V class, then my concern
is misplaced.  In that case, coherent_system should be 1 and the
",co" completer should have no effect on the semaphore operation,
other than to reduce the alignment requirement on PA 2.0 machines.
This would also imply that the store byte operation shown in the
semaphore paper doesn't improve spinlock performance.

Are there any PA 2.0 machines for which the value of coherent_system
is 0?  If so, which ones?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
