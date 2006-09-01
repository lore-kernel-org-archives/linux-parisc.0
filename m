From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Fri, 1 Sep 2006 11:19:45 -0600
Message-ID: <20060901171945.GD5658@parisc-linux.org>
References: <44F5F3CB.30806@scarlet.be>
	<20060831035932.GB4919@parisc-linux.org>
	<20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
	<20060831162740.GB16032@colo.lackof.org>
	<20060901140123.GB5658@parisc-linux.org>
	<20060901155731.GA4041@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060901155731.GA4041@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 01, 2006 at 09:57:31AM -0600, Grant Grundler wrote:
> > > Drop the "if (rw->counter < 0)" test and we won't have a deadlock.
> > > But your next idea on fixing that sounds good to me for other reasons.
> > 
> > I don't understand why you think that.  Can you explain?
> 
> Without blocking interrupts, that test is reading a value
> that's not deterministic. ie we don't when if/when we are
> interrupting a writer. Failing the read lock is safe even
> if it's not correct.

Oh, OK.  Understood.  I thought you had a neat optimisation there ;-)

> > > I'm thinking we want to block interrupts here anyway to make sure
> > > the writer gets done and releases the spinlock.
> > 
> > Umm.  Sounds like a spectacularly bad idea.  If the caller wanted to do
> > that, they would have called write_lock_irqsave() or write_lock_irq().
> 
> Well, ok - you're right about caller intentions. But the caller also has
> no clue about parisc rw_locks and how fsck'd the implementation is.
> I'm just "speculating out loud"  in order to make parisc implementation
> work better in practice.

It's not that bad.  Really ;-)

> > With the out-of-line spinlocks (and for that matter, write locks),
> > that's not going to matter.  The only place that calls
> > __raw_write_lock() is in kernel/spinlock.c, so there's no way for gcc to
> > optimise that away.  I can put it in anyway, since it's not going to
> > make a difference.
> 
> I'm not sure that a good reason to put the mb() in.
> Would "it's correct" be a better reason?
> I'm thinking other people will look at the code when trying to
> understand parisc.

I doubt it, or somebody might've spotted the, what, three or four
problems with our rwlocks that I've found?

 - an interrupt while taking or releasing a read_lock can deadlock
   against a read_lock.
 - an interrupt while holding a read_lock will deadlock against a
   read_trylock.
 - an interrupt while holding a write_lock will deadlock against a
   read_trylock or write_trylock.

Anyway, here's the current diff; I have a make -j4; make clean running
in an endless loop on nicol right now.  Any further suggestions for
stress-testing are welcome ... perhaps I'll install apache and run an
apache benchmark.

diff --git a/include/asm-parisc/spinlock.h b/include/asm-parisc/spinlock.h
index a93960e..97115dc 100644
--- a/include/asm-parisc/spinlock.h
+++ b/include/asm-parisc/spinlock.h
@@ -56,50 +56,70 @@ static inline int __raw_spin_trylock(raw
 }
 
 /*
- * Read-write spinlocks, allowing multiple readers
- * but only one writer.
+ * Read-write spinlocks, allowing multiple readers but only one writer.
+ * The spinlock is held by the writer, preventing any readers or other
+ * writers from grabbing the rwlock.  Readers use the lock to serialise their
+ * access to the counter (which records how many readers currently hold the
+ * lock).  Linux rwlocks are unfair to writers; they can be starved for
+ * an indefinite time by readers.  They can also be taken in interrupt context,
+ * so we have to disable interrupts when acquiring the spin lock to be sure
+ * that an interrupting reader doesn't get an inconsistent view of the lock.
  */
 
-#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
-
-/* read_lock, read_unlock are pretty straightforward.  Of course it somehow
- * sucks we end up saving/restoring flags twice for read_lock_irqsave aso. */
-
 static  __inline__ void __raw_read_lock(raw_rwlock_t *rw)
 {
+	unsigned long flags;
+	local_irq_save(flags);
 	__raw_spin_lock(&rw->lock);
-
 	rw->counter++;
-
 	__raw_spin_unlock(&rw->lock);
+	local_irq_restore(flags);
 }
 
 static  __inline__ void __raw_read_unlock(raw_rwlock_t *rw)
 {
+	unsigned long flags;
+	local_irq_save(flags);
 	__raw_spin_lock(&rw->lock);
-
 	rw->counter--;
-
 	__raw_spin_unlock(&rw->lock);
+	local_irq_restore(flags);
 }
 
-/* write_lock is less trivial.  We optimistically grab the lock and check
- * if we surprised any readers.  If so we release the lock and wait till
- * they're all gone before trying again
- *
- * Also note that we don't use the _irqsave / _irqrestore suffixes here.
- * If we're called with interrupts enabled and we've got readers (or other
- * writers) in interrupt handlers someone fucked up and we'd dead-lock
- * sooner or later anyway.   prumpf */
+static __inline__ int __raw_read_trylock(raw_rwlock_t *rw)
+{
+	unsigned long flags;
+ retry:
+	local_irq_save(flags);
+	if (__raw_spin_trylock(&rw->lock)) {
+		rw->counter++;
+		__raw_spin_unlock(&rw->lock);
+		local_irq_restore(flags);
+		return 1;
+	}
+
+	local_irq_restore(flags);
+	/* If write-locked, we fail to acquire the lock */
+	if (rw->counter < 0)
+		return 0;
+
+	/* Wait until we have a realistic chance at the lock */
+	while (__raw_spin_is_locked(&rw->lock) && rw->counter >= 0)
+		cpu_relax();
+
+	goto retry;
+}
 
-static  __inline__ void __raw_write_lock(raw_rwlock_t *rw)
+static __inline__ void __raw_write_lock(raw_rwlock_t *rw)
 {
+	unsigned long flags;
 retry:
+	local_irq_save(flags);
 	__raw_spin_lock(&rw->lock);
 
-	if(rw->counter != 0) {
-		/* this basically never happens */
+	if (rw->counter != 0) {
 		__raw_spin_unlock(&rw->lock);
+		local_irq_restore(flags);
 
 		while (rw->counter != 0)
 			cpu_relax();
@@ -107,31 +127,35 @@ retry:
 		goto retry;
 	}
 
-	/* got it.  now leave without unlocking */
-	rw->counter = -1; /* remember we are locked */
+	rw->counter = -1; /* mark as write-locked */
+	mb();
+	local_irq_restore(flags);
 }
 
-/* write_unlock is absolutely trivial - we don't have to wait for anything */
-
-static  __inline__ void __raw_write_unlock(raw_rwlock_t *rw)
+static __inline__ void __raw_write_unlock(raw_rwlock_t *rw)
 {
 	rw->counter = 0;
 	__raw_spin_unlock(&rw->lock);
 }
 
-static  __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
+static __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
 {
-	__raw_spin_lock(&rw->lock);
-	if (rw->counter != 0) {
-		/* this basically never happens */
-		__raw_spin_unlock(&rw->lock);
