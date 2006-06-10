From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sat, 10 Jun 2006 12:41:13 -0500
Message-ID: <200606101241.13801.mszick@morethan.org>
References: <200606070409.k5749BK4009914@hiauly1.hia.nrc.ca>
	<200606070725.43473.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606070725.43473.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed June 7 2006 07:25, Michael S. Zick wrote:
> On Tue June 6 2006 23:09, John David Anglin wrote:
> > 
> > 
> > I've looked at the locking in hpux a bit.  As far as I can tell,
> > the kernel never really spins.  It has code to do pre-arbitration
> > and keeps track of tasks and priorities.  When a lock is released,
> > the code calls into suwaiters to see if the lock should be handed
> > over to another task or released.  When we just spin, we are relying
> > on the bus arbitration to select a winner.  So, when we have a
> > highly contended lock, it might be  possible for a cpu to get locked
> > out for sufficient time to cause a softlockup.
> > 
> 
> I never went back to correct the state tables in the document I worked
> up to match the most recent code snippets...
> 
> I will fix that and then post a link on this list.
> 

Document is now updated.  Intended to be a continuation of Dave's one
spinlock per cache-line experimental patch.

See:
http://www.morethan.org/parisc/pa-spinlocks.html
http://www.morethan.org/parisc/pa-spinlocks.pdf

>
> Right or wrong - that document gives us the ground work for lock passing
> and lock failure recovery without ever having seen HPUX.
>

Document does not yet have pa-risc examples of lock passing and lock failure
recovery - you need to consult the references made for those at this point.
 
> 
> > Dave
> 
> Mike

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
