From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] spinlock debug
Date: Tue, 13 Jul 2004 21:29:10 -0700
Message-ID: <20040714042909.GM546@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: varenet@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut,

I'm just looking at your debuglocks stuff again. It doesn't look right
to me.

	/* Do the actual locking */
	/* <T-Bone> ggg: we can't get stuck on the outter loop?
	 * <ggg> T-Bone: We only hit the outer loop when the data
	 *	changes and the first time. We can hit the outer one
	 *	alot if multiple CPUs are constantly racing for a lock
	 *	and the backplane is NOT fair about which CPU sees
	 *	the update first. But it won't hang since every failed
	 *	attempt will drop us back into the inner loop and
	 *	decrement `stuck'.
	 * <ggg> K-class and some of the others are NOT fair in the HW
	 * 	implementation so we could see false positives.
	 * 	But fixing the lock contention is easier than
	 * 	fixing the HW to be fair.
	 */
	a = __ldcw_align(lock);
	while ((__ldcw(a) == 0))
		while ((*a == 0) && --stuck);

I don't think the comment is correct. Lets say someone is holding the
lock when you enter this code, your outer loop test always succeeds, and
you spin on the inner loop until stuck == 0. At that point you go back
to the outer loop, the lock is still held, so you go back to the inner
loop and continue spinning, and you never timeout the lock.

you probably need a "&& stuck > 0" in the outer loop.

for some reason this still doesn't work for me though, but i don't see 
why :( with a TOC i see we are spinning and i never see the printk.
it might be that it's actually printing and just that the output is not
going to the console... dunno

what am i missing? :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
