From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Thu, 31 Aug 2006 00:06:37 -0600
Message-ID: <20060831060637.GF3999@colo.lackof.org>
References: <44F5F3CB.30806@scarlet.be>
	<20060831035932.GB4919@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831035932.GB4919@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Aug 30, 2006 at 09:59:32PM -0600, Matthew Wilcox wrote:
> Actually, there is a problem with the write locks that I
> noticed during replying to this mail the first time.
> Then palinux crashed.  How ironic.
> Grant and I are fixing that right now ...

Willy,
Here's the patch I ended up with.
Diff is also parked on gsyprf11:~grundler/diff-2.6.18-rc4-pa4-rwlocks-01

This is currently running on iodine (a500-5x).
I don't know how this needs to be tested other than running
"make -j4" on the kernel build. Maybe glibc/toolchain build?

Please feel free to apply with your own commit comment, additional
changes, and S-o-B line.

And kudos for catching this. It's another non-trivial problem that's
been around for a while.

thanks,
grant

Commit Comment:
	We can't use generic__raw_read_trylock() since that will hang instead
	of returning a failure if the rwlock->lock isn't available.
	Similarly, __raw_write_trylock() is broken in that it would
	hang too instead of returning a failure.

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


diff --git a/include/asm-parisc/spinlock.h b/include/asm-parisc/spinlock.h
index a93960e..d4048a6 100644
--- a/include/asm-parisc/spinlock.h
+++ b/include/asm-parisc/spinlock.h
@@ -60,7 +60,6 @@ static inline int __raw_spin_trylock(raw
  * but only one writer.
  */
 
-#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
 
 /* read_lock, read_unlock are pretty straightforward.  Of course it somehow
  * sucks we end up saving/restoring flags twice for read_lock_irqsave aso. */
@@ -68,19 +67,25 @@ #define __raw_read_trylock(lock) generic
 static  __inline__ void __raw_read_lock(raw_rwlock_t *rw)
 {
 	__raw_spin_lock(&rw->lock);
-
 	rw->counter++;
-
 	__raw_spin_unlock(&rw->lock);
 }
 
 static  __inline__ void __raw_read_unlock(raw_rwlock_t *rw)
 {
 	__raw_spin_lock(&rw->lock);
-
 	rw->counter--;
+	__raw_spin_unlock(&rw->lock);
+}
+
+static  __inline__ int __raw_read_trylock(raw_rwlock_t *rw)
+{
+	if (!__raw_spin_trylock(&rw->lock))
+		return 0;
 
+	rw->counter++;
 	__raw_spin_unlock(&rw->lock);
+	return 1;
 }
 
 /* write_lock is less trivial.  We optimistically grab the lock and check
@@ -121,15 +126,15 @@ static  __inline__ void __raw_write_unlo
 
 static  __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
 {
-	__raw_spin_lock(&rw->lock);
+	if (!__raw_spin_trylock(&rw->lock))
+		return 0;
+
 	if (rw->counter != 0) {
-		/* this basically never happens */
 		__raw_spin_unlock(&rw->lock);
