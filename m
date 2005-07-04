From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Mon, 4 Jul 2005 00:14:56 -0400
Message-ID: <20050704041453.GC5269@systemhalted.org>
References: <20050702135938.GV19114@tausq.org>
	<20050704010044.GA5269@systemhalted.org> <42C897F2.80307@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42C897F2.80307@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 04, 2005 at 09:59:14AM +0800, Randolph Chung wrote:
> > a) Lock serializing (essentially lock copying)
> 
> I still think "lock copying" is a fundamentally flawed idea, but I think
> we can actually support this in a sneaky way.

Copying a lock creates a new lock with the same status as the old lock.
I don't think it's that flawed, it's the same idea as copying a
structure with a lock inside. You don't need an explicit copy operator,
it should just work (tm).

In the case of a cookie it works great.

> All you need to serialize is the state of the lock, either it's locked
> or not.
> 
> We could design the cookie to store this information in the least
> significant bit. When somebody tries to access a cookie that doesn't
> correspond to an existant lock, we can materialize the lock at that point.

This is exactly what I was thinking, but there is an issue:

- A lock that was serliazed may actually coincide with a lock already in
  the system. The code can't tell which is which. Unless we use another
  level of indirection.

It seems to me that it should be perfectly legal for two threads,
working on a datastructure, to be able to serialize that data to disk,
read it back and continue working in a synchronized fashion without the
locks going haywire.

It would seem that at all costs we don't want to allocate the same lock
address twice. This is wasteful of memory, and possibly the wrong thing
to do if we are serializing objects with the intent to free memory.

> A bigger problem as we discussed on IRC is how to handle locks in shared
> memory.
> 
> I suppose we could use an extension of the above trick. If a lock is
> initialized shared (by setting pshared=true in pthread_spin_init), the
> cookie will have a bit to indicate this, and the lock memory is
> initialized in a shared memory segment with a well known name. If
> another process comes along and gets ahold of such a lock, it would then
> attach to the shared memory segment and then get access to the same lock
> object in memory.

I like this idea!

Though I don't like my personal idea of forcing an equal mapping at a
high address. Instead I think a table for indirection would work.

> ?Any software problem can be solved by adding another layer of
> indirection? -SMB

When I feel the weight of a possibly complex implementation getting me
down, I think over a single question:

"What problem are we trying to solve?"

- The core glibc maintainers don't care about odd-ball arches?
- Uninitialized locks are trouble?
- "Locks are int" is not true?

The last two, make it easier to get past the first problem :)

I like the idea of using the last two bits of the lock to indicate
status, taken or not, and shared or not.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
