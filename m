From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Thu, 31 Aug 2006 07:13:40 -0600
Message-ID: <20060831131340.GD4919@parisc-linux.org>
References: <44F5F3CB.30806@scarlet.be> <20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
	<200608310801.30580.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@morethan.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608310801.30580.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 08:01:30AM -0500, Michael S. Zick wrote:
> better? not sure, but one thing I am looking at using is
> tri-state locks, defined as:
> 
> 0 == Busy, change in process
> &lock == Locked
> other == Unlocked
> 
> Since that can be done with load&clear and the information
> already on hand in the registers.

Yep, although I don't think that actually saves us from the
reader-interrupted-write-lock problem.  The first thing the writer does
is ldcw, then if it's interrupted, the reader-in-interrupt-context can't
tell if it's a heavily contended read-lock (which would eventually
work), or if it's interrupted a write lock attempt.

One thing we could do is limit the number of times we retry.

Hmm, I just thought.  If we interrupted a writer trying to acquire the
lock, the writer was about to successfully acquire the lock.  But we
interrupted them, so they can't be running.  And nobody else can acquire
the lock because the attempting writer holds the spinlock.  So the
reader in interrupt context can be deemed to have successfully acquired
the lock.  Now ... how do we handle releasing that lock, given that it
can't acquire the spinlock ...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
