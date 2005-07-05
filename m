From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Tue, 05 Jul 2005 09:39:00 +0800
Message-ID: <42C9E4B4.2060303@tausq.org>
References: <20050702135938.GV19114@tausq.org>
	<20050704010044.GA5269@systemhalted.org> <42C897F2.80307@tausq.org>
	<20050704041453.GC5269@systemhalted.org>
	<42C8CDCC.7060308@tausq.org>
	<20050704145417.GE5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050704145417.GE5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> If the lock is locked when copied, the copy is locked.
> 
> Wether or not the thread can enter the critical section is dependant
> upon the programmer. The programmer would have to ensure the lock copy
> was atomic by protecting the structure. Then it could point the two
> threads at the new copy, and delete the old copy.

I have to agree with Dave - this seems like a recipe for disaster.

> If we add a level of indirection we insert a lookup requirement. The
> lookup needs to determine if it has to materialize a lock, index load
> the lock from the table, which might be on a faraway page (requiring
> more searching), and our performance is shot.

sounds like we are implementing a VM with page tables. We need a TLB! :-)

> It still doesn't solve our lock rematerializing issue. I think the issue
> will never go away if we have to provide our own lock cookie namespace 
> management.

In any case rematerializing a lock seems iffy.....

> A threaded lisp interpreter writes a running image to disk, only a
> partial write and not the entire address space. It expects to reload
> this from disk and start a thread up at the same place. If it has lock
> aliasing other threads might collide with the loaded lock cookie.

I'm not sure it can do this without doing fixups after reading from a
disk image. For example, in many object systems pointers are written to
disks as UUIDs and when the object is read back from disk the UUID needs
to be reconverted to a real pointer. I would think the situation is the
same with locks; to have predictable behavior you have to write
information about the state of the lock and manage it yourself, instead
of relying on the underlying representation of the lock.

> I think having the lock data with the lock is the only reasonable
> solution.

Perhaps, but "lock data" should not be the internal representation of
the lock. My reading of the POSIX/SuSv3 pthread spec suggests that the
interface is designed explicitly to allow locks to be allocated dynamically.

> Politics is a part of life, and removing it from the equation means you
> are missing important information when making a decision.

Yes, but I don't think we should settle on an implementation that is
otherwise inferior only to get around the politics of an open source
project.

> I don't know what "more natural" means in this case. It's not a
> measurable quantity. A the POSIX pthread interface it's already a
> structure, so what difference does it make, the internals are opaque.

s/more natural/easier to implement/ then.

> A deferred dynamically allocated lock system faces cookie namespace
> problems.

I think there are two separate "namespace" problems:
1) Shared memory locks - this is relatively easy to solve
2) Serializable locks - this is difficult

> Compliance with the standards is important, but second to a robust and
> working implementation under minimum defined criteria.

I dunno about "second to"....

> Let me run a thought an experiment, let me construct the most idiotic
> implementation of "scalar lock" that comes to mind...
> 
> Implementation of Scalar Locks (Take 1)
> =======================================
> 
> a. glibc has a single aligned master lock.
> b. Every thread uses a scalar for a lock.
> c. The pthread functions do the following:
> 	- If the sig_atomic_t lock != 0
>           Use LWS CAS to take the lock [1]
>           = Done.
> 	- Block signals.
> 	- Increment the sig_atomic_t lock.
> 	- Acquire a master lock.
> 	- Twiddle a bit in the scalar lock.
> 	- Unlock a master lock.
> 	- Decrement the sig_atomic_t lock.
> 	- Unblock signals.

Your increment/decrement operations will also need to be done with a LWS.

One undesirable property of this approach seems to be that as the lock
becomes more contended, you spend an increasing amount of time spinning
in the kernel (doing your LWS CAS). As you told me last night, this
means the kernel has interrupts off, so processes are not getting
scheduled, and your lock contention becomes worse.

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
