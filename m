From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Mon, 4 Jul 2005 11:35:00 -0400 (EDT)
Message-ID: <200507041535.j64FZ0fY021477@hiauly1.hia.nrc.ca>
References: <20050704145417.GE5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050704145417.GE5269@systemhalted.org> from "Carlos O'Donell"
	at Jul 4, 2005 10:54:21 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Jul 04, 2005 at 01:49:00PM +0800, Randolph Chung wrote:
> > > Copying a lock creates a new lock with the same status as the old lock.
> > > I don't think it's that flawed, it's the same idea as copying a
> > > structure with a lock inside. You don't need an explicit copy operator,
> > > it should just work (tm).
> > 
> > If a currently locked lock is copied, is it still locked? If another
> > thread copies a locked lock, can it now enter a critical section? Does
> > the copied lock refer to the same lock object or a different one?
> 
> If the lock is locked when copied, the copy is locked.
> 
> Wether or not the thread can enter the critical section is dependant
> upon the programmer. The programmer would have to ensure the lock copy
> was atomic by protecting the structure. Then it could point the two
> threads at the new copy, and delete the old copy.

Seems like a recipe for disaster.  How do you ensure that each thread
actually is using the new copy?  It seems to me that this requires another
layer of locking around each lock.  All operations on the lock would have
to be done inside the outer lock.  This increases the possibility of
deadlock and the overhead in acquiring and releasing a lock.  Then,
you are going to tell me that you want the capability to move the outer
protection lock...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
