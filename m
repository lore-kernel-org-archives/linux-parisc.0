From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Thu, 31 Aug 2006 10:08:44 -0600
Message-ID: <20060831160844.GA16032@colo.lackof.org>
References: <44F5F3CB.30806@scarlet.be> <20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
	<200608310801.30580.mszick@morethan.org>
	<20060831131340.GD4919@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831131340.GD4919@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 07:13:40AM -0600, Matthew Wilcox wrote:
> One thing we could do is limit the number of times we retry.

Yes, we have to or we face a variant of deadlock.

> Hmm, I just thought.  If we interrupted a writer trying to acquire the
> lock, the writer was about to successfully acquire the lock.  But we
> interrupted them, so they can't be running.  And nobody else can acquire
> the lock because the attempting writer holds the spinlock.  So the
> reader in interrupt context can be deemed to have successfully acquired
> the lock.  Now ... how do we handle releasing that lock, given that it
> can't acquire the spinlock ...

nononono...please don't go there. It's complicated enough already.
Adding more code just makes it slower and harder to maintain.
I'd much rather block interrupts in the writer code path as
proposed in your previous email.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
