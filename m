From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Tue, 25 Apr 2006 17:42:52 -0400 (EDT)
Message-ID: <200604252142.k3PLgrxB009232@hiauly1.hia.nrc.ca>
References: <200604251352.28932.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604251352.28932.mszick@morethan.org> from "Michael S. Zick"
	at Apr 25, 2006 01:52:28 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue April 25 2006 10:17, Michael S. Zick wrote:
> > On Mon April 24 2006 10:35, John David Anglin wrote:
> > > > ldcw,co target_address
> > > > 
> > > > Where target_address includes the magic byte[0] of 
> > > > the cache line.
> > > 
> > > Where is this documented?
> > > 
> > Close, not quite there yet:
> > 
> > HP patent number: 4,713,755
> > 
> > The page to retrieve this by number:
> > http://patft1.uspto.gov/netahtml/PTO/srchnum.htm
> > 
> > Now it should be a 'simple' matter to just read
> > every patent that references this one.
> > 
> 
> One more conjecture confirmed,
> 
> The cache lines are a master/slave arrangement,
> only one processor (or device) can be the master
> (owner) of the cache line.
> 
> This is accomplished by keeping the cpu id (address)
> of the master in the virtual tag.
> 
> Ref: HP patent number: 5,197,146
> 
> That is how the logical 'makePrivate' of the formal
> memory model happens.

That's pretty much what I said this morning.

Correct me if I'm wrong but wouldn't an ldcw,co on a different
cpu cause a transfer of ownership?  However, it's not clear to
me that a cpu that doesn't own the line can unlock the semaphore
owned by a different cpu.  As far as I can tell, the only
instructions that appear to perform a coherent store are ldcw,co
and ldcd,co, and these can't do an unlock.  Hmmm, maybe doing a
flush and sync (see G-3 and G-4) before the store would do the trick.

> Translation:
> 
> Thou shall not allow load balancing to migrate a
> task that holds a spinlock - you leave the master
> of that cache line on the prior processor.

Page G-3 says that a SYNC is necessary when switching tasks.  Possibly,
this together with the flush allows spinlocks in user code.

I see the PA-8200 has a CINCD instruction (coherent 64-bit increment).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
