From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Sun, 3 Jul 2005 21:00:48 -0400
Message-ID: <20050704010044.GA5269@systemhalted.org>
References: <20050702135938.GV19114@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050702135938.GV19114@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 02, 2005 at 06:59:39AM -0700, Randolph Chung wrote:
> 1) We are moving more compile-time work to run-time; requires memory
>    allocation at run-time, potentially slow.
> 2) The pthread interface allows spinlock locking to fail, and this
>    code may fail a locking operation if memory cannot be allocated,
>    but most code probably don't handle this case and may deadlock
>    or function incorrectly.
> 3) The code is not 64-bit clean, although that can be fixed if needed
>    by making the lock cookie an index.

Randolph,

This is awesome! This is taking the deferred ideas to the extreme! :)
I like the idea, but I don't think it will bake (See my comments about
lock serializing, and shared memory).
 
> There are probably other problems. I *think* this code still works with
> locks in shared memory, but I may be missing some cases.
> 
> Comments?

What about?

a) Lock serializing (essentially lock copying)
b) Lock copying with differing destination alignment.

Our current implementation only supports copying a lock to a destination
that has the same alignment. In reality this is virtually 100% of all the
cases.

Our current implementation also supports serializing the lock to disk
and reading it back again. I've seen some gnome code do weird things
with object state serialization, mind you the lock has a level of
indirection and the addresses are fixed up, in this case though that
sort of thing wouldn't work.

The cookie implementation trivially solves b), but a) is harder.

I believe that compiling and running gnome is the best test of lock
serializing and copying. There is probably a number of libstdc++ test
cases that can test this as well? Dave would know better there.
 
> randolph
> -- 
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
> 
> 
> #include <stdio.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <assert.h>
> #include <errno.h>
> 
> typedef int lock_t;
> 
> /* Exported interface */
> int spin_init(lock_t *lock);
> int spin_destroy(lock_t *lock);
> int spin_lock(lock_t *lock);
> int spin_unlock(lock_t *lock);
> int spin_trylock(lock_t *lock);
> int spin_is_locked(lock_t *lock);
> 
> /* Implementation */
> 
> /* The idea of this implementation is that each lock_t points to
>  * a dynamically allocated, properly aligned lock.
>  *
>  * We manage these dynamically aligned locks as pages of locks. Each
>  * lock page contains a header that contains a simple freelist of
>  * lock objects.
>  */
> 
> #define PAGESIZE 4096
> 
> struct lock_page;
> 
> /* An internal lock is a 16-byte structure that is allocated aligned
>  * to a 16-byte boundary. The first word of the lock structure is
>  * actually used to do ldcw. The other fields can be used for other
>  * accounting purposes.
>  */
> struct internal_lock {
> 	int lockword;
> 	struct lock_page *page;
> 	short next;
> 	short pad1;
> 	int pad2;
> };
> 
> /* Locks are allocated in pages; each page contains this header. */
> struct lock_page_hdr {
> 	struct lock_page *next; /* Chain together allocated pages */
> 	short freelist; /* First available lock index in this page */
> 	/* Pad to 16-bytes, not really needed, but just to make
> 	 * it explicit.
> 	 */
> 	unsigned short pad1[3];
> 	int pad2;
> };
> 
> #define LOCKS_PER_PAGE ((PAGESIZE - sizeof(struct lock_page_hdr))/sizeof(struct internal_lock))
> 
> struct lock_page {
> 	struct lock_page_hdr hdr;
> 	struct internal_lock locks[LOCKS_PER_PAGE];
> };
> 
> /* Internal data */
> static struct internal_lock __lock __attribute__((aligned(16))) = { 1, 0, 0, 0, 0 };
> static struct lock_page *__lock_pages;
> 
> static int
> __ldcw(void *a)
> {
> 	int ret;
> 	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (ret) : "r" (a));
> 	return ret;
> }
> 
> static void
> __raw_spin_lock(struct internal_lock *l)
> {
> 	while (__ldcw(&l->lockword))
> 		while (l->lockword == 0)
> 			/* spin */ ;
> }
> 
> static void
> __raw_spin_unlock(struct internal_lock *l)
> {
> 	l->lockword = 0;
> }

If __raw_spin_unlock is inlined in the same function with
__raw_spin_lock, we may need to force a memory barrier to keep the
ordering correct?
 
> static lock_t
> __allocate_lock(void)
> {
> 	struct lock_page *p;
> 	short target;
> 
> 	__raw_spin_lock(&__lock);
> 	for (p = __lock_pages; p != NULL; p = p->hdr.next)
> 		if (p->hdr.freelist >= 0)
> 			break;
> 
> 	if (p == NULL) {
> 		void *m;
> 		int i;
> 		struct internal_lock *l;
> 
> 		m = mmap(0, PAGESIZE, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_SHARED, -1, 0);

I guess if this replaced the linuxthreads, or nptl implementation we can
assume that mmap is available and we are already relocated.


> 		if (m == MAP_FAILED) {
> 			__raw_spin_unlock(&__lock);
> 			return ENOMEM;
> 		}
> 		p = (struct lock_page *)m;
> 		p->hdr.freelist = 0;
> 
> 		/* Initialize lock linked list */
> 		for (i = 0; i < LOCKS_PER_PAGE; i++) {
> 			l = &p->locks[i];
> 			l->lockword = 1;
> 			l->page = p;
> 			l->next = i + 1;
> 		}
> 		l->next = -1;
> 
> 		p->hdr.next = __lock_pages;
> 		__lock_pages = p;
> 	}
> 
> 	assert(p && p->hdr.freelist >= 0);
> 
> 	target = p->hdr.freelist;
> 	p->hdr.freelist = p->locks[target].next;
> 	p->locks[target].next = -1;
> 	
> 	__raw_spin_unlock(&__lock);
> 
> 	return (int)&p->locks[target];
> }
>
> static int
> __free_lock(lock_t lock)
> {
> 	struct lock_page *p;
> 	struct internal_lock *l;
> 
> 	__raw_spin_lock(&__lock);
> 	l = (struct internal_lock *)lock;
> 	p = l->page;
> 
> 	l->next = p->hdr.freelist;
> 	p->hdr.freelist = l - &p->locks[0];
> 	__raw_spin_unlock(&__lock);
> 
> 	return 0;
> }
> 
> static struct internal_lock *
> __find_lock(lock_t lock)
> {
> 	return (struct internal_lock *)lock;
> }

Why this level of indirection? Have you thought about other indexing
methods other than the address of the lock?
 
> int spin_init(lock_t *lock)
> {
> 	*lock = __allocate_lock();
> 	if (*lock == 0)
> 		return ENOMEM;
> 	return 0;
> }
> 
> int spin_destroy(lock_t *lock)
> {
> 	if (*lock)
> 		return __free_lock(*lock);
> 	return 0;
> }
> 
> int spin_lock(lock_t *lock)
> {
> 	struct internal_lock *l;
> 
> 	/* lazy lock init */
> 	if (*lock == 0) {
> 		if (spin_init(lock) != 0)
> 			return EINVAL;
> 	}
> 
> 	l = __find_lock(*lock);
> 	if (!l)
> 		return EINVAL;
> 
> 	__raw_spin_lock(l);
> 	return 0;
> }
> 
> int spin_unlock(lock_t *lock)
> {
> 	struct internal_lock *l;
> 
> 	/* Assume unallocated locks are unlocked */
> 	if (*lock == 0)
> 		return 0;
> 
> 	l = __find_lock(*lock);
> 	if (!l) 
> 		return EINVAL;
> 
> 	__raw_spin_unlock(l);
> 	return 0;
> }
> 
> int spin_trylock(lock_t *lock)
> {
> 	struct internal_lock *l;
> 
> 	/* lazy lock init */
> 	if (*lock == 0) {
> 		if (spin_init(lock) != 0)
> 			return EINVAL;
> 	}
> 

See my comment below that we need a check for a lock in the initialized
state that has a "locked" state.

We need a check for:

if (*lock == 1) 
  {
    /* Initialize lock held */
  }

> 	l = __find_lock(*lock);
> 	if (!l)
> 		return EINVAL;
> 
> 	return __ldcw(&l->lockword) != 0 ? 0 : EBUSY;
> }
> 
> int spin_is_locked(lock_t *lock)
> {
> 	struct internal_lock *l;
> 
> 	/* Assume unallocated locks are unlocked */

How do you initialize a static lock to a "locked" state code? :)

> 	if (*lock == 0)
> 		return 0;
> 
> 	l = __find_lock(*lock);
> 	if (l)
> 		return l->lockword == 0;
> 
> 	/* Assume invalid locks are unlocked */
> 	return 0;
> }

What happens if you stick this lock in shared memory? Each thread in
each process will see a different lock?

I really think that Dave's implementation, being the simplest works in
99% of the cases, with the only restriction being that a copied lock
must be copied to a destination of the same alignment.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
