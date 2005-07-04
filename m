From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Mon, 04 Jul 2005 09:59:14 +0800
Message-ID: <42C897F2.80307@tausq.org>
References: <20050702135938.GV19114@tausq.org>
	<20050704010044.GA5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=windows-1252
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050704010044.GA5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> a) Lock serializing (essentially lock copying)

I still think "lock copying" is a fundamentally flawed idea, but I think
we can actually support this in a sneaky way.

All you need to serialize is the state of the lock, either it's locked
or not.

We could design the cookie to store this information in the least
significant bit. When somebody tries to access a cookie that doesn't
correspond to an existant lock, we can materialize the lock at that point.

A bigger problem as we discussed on IRC is how to handle locks in shared
memory.

I suppose we could use an extension of the above trick. If a lock is
initialized shared (by setting pshared=true in pthread_spin_init), the
cookie will have a bit to indicate this, and the lock memory is
initialized in a shared memory segment with a well known name. If
another process comes along and gets ahold of such a lock, it would then
attach to the shared memory segment and then get access to the same lock
object in memory.

“Any software problem can be solved by adding another layer of
indirection” -SMB

:-)

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
