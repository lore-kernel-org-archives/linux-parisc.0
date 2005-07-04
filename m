From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Mon, 4 Jul 2005 10:54:21 -0400
Message-ID: <20050704145417.GE5269@systemhalted.org>
References: <20050702135938.GV19114@tausq.org>
	<20050704010044.GA5269@systemhalted.org> <42C897F2.80307@tausq.org>
	<20050704041453.GC5269@systemhalted.org>
	<42C8CDCC.7060308@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42C8CDCC.7060308@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 04, 2005 at 01:49:00PM +0800, Randolph Chung wrote:
> > Copying a lock creates a new lock with the same status as the old lock.
> > I don't think it's that flawed, it's the same idea as copying a
> > structure with a lock inside. You don't need an explicit copy operator,
> > it should just work (tm).
> 
> If a currently locked lock is copied, is it still locked? If another
> thread copies a locked lock, can it now enter a critical section? Does
> the copied lock refer to the same lock object or a different one?

If the lock is locked when copied, the copy is locked.

Wether or not the thread can enter the critical section is dependant
upon the programmer. The programmer would have to ensure the lock copy
was atomic by protecting the structure. Then it could point the two
threads at the new copy, and delete the old copy.

A lock is a lock. It doesn't refer to anything unless you the programmer
give it some meaning.

The copy of the lock *can* have a different lock cookie, if that's what
you're asking? It just has to have the same status :)

If you serliaze two locks with the same cookie, the rematerialized locks
IMO *can* be allowed to have different cookies.

> > - A lock that was serliazed may actually coincide with a lock already in
> >   the system. The code can't tell which is which. Unless we use another
> >   level of indirection.
> 
> I don't see how you can fix this even with indirection?

You're right, we can't. After 2^32 locks are initialized the value
wraps. That's a fundamental problem with reusing the lock storage. If
the lock were to be serialized with the object it could uses the object
namespace as a level of indirection. Providing our own level of
indirection with a single data word is difficult. It gets better with
two words... even better with three words... but where will our
performance go?

If we add a level of indirection we insert a lookup requirement. The
lookup needs to determine if it has to materialize a lock, index load
the lock from the table, which might be on a faraway page (requiring
more searching), and our performance is shot.

We could get a full 32-bit address space if we used a space register to
store the locks into a different space? The space could also be shared
with other processes in the same way shared libraries would have been
implemented using space register?

It still doesn't solve our lock rematerializing issue. I think the issue
will never go away if we have to provide our own lock cookie namespace 
management.

> > It seems to me that it should be perfectly legal for two threads,
> > working on a datastructure, to be able to serialize that data to disk,
> > read it back and continue working in a synchronized fashion without the
> > locks going haywire.
> 
> You can serialize the data, but to serialize a lock seems to be
> questionable. I remain unconvinced that real life programs rely on this
> behavior, but I'm willing to be shown an example :)

A threaded lisp interpreter writes a running image to disk, only a
partial write and not the entire address space. It expects to reload
this from disk and start a thread up at the same place. If it has lock
aliasing other threads might collide with the loaded lock cookie.

What about gnome's object managment system? Surely it's threaded at some
level, and it requires that objects have locks for their thread critical
data. Perhaps you want to lock an objects data, and push it across the
network. The remote system only has serialized state information and
would need to rematerialize a lock on a different host :)

I think having the lock data with the lock is the only reasonable
solution.

> >>I suppose we could use an extension of the above trick. If a lock is
> >>initialized shared (by setting pshared=true in pthread_spin_init), the
> >>cookie will have a bit to indicate this, and the lock memory is
> >>initialized in a shared memory segment with a well known name. If
> >>another process comes along and gets ahold of such a lock, it would then
> >>attach to the shared memory segment and then get access to the same lock
> >>object in memory.
> > I like this idea!
> > Though I don't like my personal idea of forcing an equal mapping at a
> > high address. Instead I think a table for indirection would work.
> 
> Yes. Forcing a fixed mapping seems to be fragile.

That's why I liked your idea of shm_open better.

> > When I feel the weight of a possibly complex implementation getting me
> > down, I think over a single question:
> > 
> > "What problem are we trying to solve?"
> > 
> > - The core glibc maintainers don't care about odd-ball arches?
> > - Uninitialized locks are trouble?
> > - "Locks are int" is not true?
> > 
> > The last two, make it easier to get past the first problem :)
> 
> Well, ultimately I hope we would decide on whether or not to do this
> based on technical merit rather than the politics of glibc maintainence.
> Is it more natural to deal with an implementation that uses scalar lock
> objects? Can it really work efficiently? Can we ensure compliance with
> the appropriate standards?

Politics is a part of life, and removing it from the equation means you
are missing important information when making a decision.

I don't know what "more natural" means in this case. It's not a
measurable quantity. A the POSIX pthread interface it's already a
structure, so what difference does it make, the internals are opaque.

A deferred dynamically allocated lock system faces cookie namespace
problems.

Compliance with the standards is important, but second to a robust and
working implementation under minimum defined criteria.

Let me run a thought an experiment, let me construct the most idiotic
implementation of "scalar lock" that comes to mind...

Implementation of Scalar Locks (Take 1)
=======================================

a. glibc has a single aligned master lock.
b. Every thread uses a scalar for a lock.
c. The pthread functions do the following:
	- If the sig_atomic_t lock != 0
          Use LWS CAS to take the lock [1]
          = Done.
	- Block signals.
	- Increment the sig_atomic_t lock.
	- Acquire a master lock.
	- Twiddle a bit in the scalar lock.
	- Unlock a master lock.
	- Decrement the sig_atomic_t lock.
	- Unblock signals.

Cons:
= Signal handling latency goes up when doing lots of locking.
= A kill signal while taking the lock requires a fallback to
  the kernel for protection against concurrent accesses.

Pros:
= Simple scalar locks.
= The master locks can be extended to N master locks
  whose selection is based on a hash of the address
  of the scalar lock, improving SMP performance.
= No lock cookie namespace management.
= Locks can be copied.
= Locks can be serialized.

[1] This is because we took a signal in the critical section
of the locking code, and we need the kernel to arbitrate the lock
access.

Actually, this sorta worked out nice. What do you think?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
