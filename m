From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Mon, 04 Jul 2005 13:49:00 +0800
Message-ID: <42C8CDCC.7060308@tausq.org>
References: <20050702135938.GV19114@tausq.org>
	<20050704010044.GA5269@systemhalted.org> <42C897F2.80307@tausq.org>
	<20050704041453.GC5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050704041453.GC5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Copying a lock creates a new lock with the same status as the old lock.
> I don't think it's that flawed, it's the same idea as copying a
> structure with a lock inside. You don't need an explicit copy operator,
> it should just work (tm).

If a currently locked lock is copied, is it still locked? If another
thread copies a locked lock, can it now enter a critical section? Does
the copied lock refer to the same lock object or a different one?

> - A lock that was serliazed may actually coincide with a lock already in
>   the system. The code can't tell which is which. Unless we use another
>   level of indirection.

I don't see how you can fix this even with indirection?

> It seems to me that it should be perfectly legal for two threads,
> working on a datastructure, to be able to serialize that data to disk,
> read it back and continue working in a synchronized fashion without the
> locks going haywire.

You can serialize the data, but to serialize a lock seems to be
questionable. I remain unconvinced that real life programs rely on this
behavior, but I'm willing to be shown an example :)

>>I suppose we could use an extension of the above trick. If a lock is
>>initialized shared (by setting pshared=true in pthread_spin_init), the
>>cookie will have a bit to indicate this, and the lock memory is
>>initialized in a shared memory segment with a well known name. If
>>another process comes along and gets ahold of such a lock, it would then
>>attach to the shared memory segment and then get access to the same lock
>>object in memory.
> I like this idea!
> Though I don't like my personal idea of forcing an equal mapping at a
> high address. Instead I think a table for indirection would work.

Yes. Forcing a fixed mapping seems to be fragile.

> When I feel the weight of a possibly complex implementation getting me
> down, I think over a single question:
> 
> "What problem are we trying to solve?"
> 
> - The core glibc maintainers don't care about odd-ball arches?
> - Uninitialized locks are trouble?
> - "Locks are int" is not true?
> 
> The last two, make it easier to get past the first problem :)

Well, ultimately I hope we would decide on whether or not to do this
based on technical merit rather than the politics of glibc maintainence.
Is it more natural to deal with an implementation that uses scalar lock
objects? Can it really work efficiently? Can we ensure compliance with
the appropriate standards?

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
