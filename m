From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sun, 23 Jul 2006 22:33:45 -0400
Message-ID: <1153708426.1235.11.camel@mulgrave.il.steeleye.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-07-22 at 13:50 -0400, Carlos O'Donell wrote: 
> After spending ~4 hours of debugging yesterday evening, between
> Thibaut, Dave, and myself, we firmly believe the PA8800 problems are
> data cache issues.

Thanks very much for spending the time to do this!

> a) We think it is not an icache issue, but infact a dcache issue.
> 
> Often it appears as if a register was corrupted, but the truth is that
> the ldw loaded bogus data into a register.

OK, I'll buy this provisionally ... D cache incoherence is far more
difficult to explain than D/I incoherence, but I'll try.

> b) One time, on a later comparison in gdb, the register and data in
> memory did not equal. I stress that we only saw this situation once.

OK, as long as it was a register read, this must have been D
incoherence.

> c) We have often seen the failure with the frame marker on a cacheline
> boundary, for example 0xc0278100 (e.g. 256 bytes).
> 
> It is my hope that these patterns will trigger someone to devise a
> plan for fixing this. If you have any questions about our methods, or
> reproducing this, you can easily talk to Thibaut and we can probably
> setup access to the test sshd binary.

OK .. let me try to think of this one.  To me, the pattern indicates
errors in newly faulted memory (either from stack growth or touching
malloced areas which are mmapped in glibc).  So, here's the only current
theory I can come up with:  Aggressive prefetching is causing us
problems in faulting.  Theoretically, it looks like the culprit should
be anonymous pages (because that's what stack and malloc areas
are---they're not file backed).  However, I tend to discount this
because the only way data gets into anonymous memory is when the user
(or the linker running on behalf of the user) puts it there.  Thus,
there should be no user coherence issues with data in anonymous memory.

> Grant expressed worry that "Pattern 1" was indicative of a dma sync
> problem with the network socket read.

I'm still dubious about this one ... even if we agree it's a D cache
issue, it's definitely a D cache issue affecting program execution (i.e.
function pointers or call indirection).  The data coming out of the
network pipe for ssh never finds its way into the execution stream,
which means it's unlikely to affect these areas.  Additionally, ssh has
message integrity checks which fail noisily (i.e. the network data is
verified against a secure hash before it's used).  So, if we had
incoherent data from the pipe, I would exect to see periodic MIC
failures, which we don't see.

I'm also coming to the conclusion that the aggressive prefetch theory
isn't entirely accurate.  It fits the I/D incoherency theory because we
get I cache prefetches on D cache TLB entries (because of the combined
I/D tlb) then we only flush the D cache because we don't expect I data
there (all our data regions currently seem to be executable as well).
However, for D cache incoherence alone, it seems implausible because we
have to have a tlb entry to move in across a page boundary, and every
tlb entry can only be inserted from a pte (and for every pte we will
flush the cache on object destruction).

One of the suspicious monsters in our code is the PAGE_FLUSH setting,
which allows tlb re-insertion after linux thinks it has been cleared in
violation of the linux tlb philosophy.  However, those mappings are
supposed to be "flush only" and, since the algorithm had a hole in it, I
thought I fixed it not to need PAGE_FLUSH entries (even though we keep
them around).  Regardless, tmpalias flushing completely eliminates any
window we have in this regard, and, as pa8800 still doesn't work, I
think I have to conclude it's not even this.

So, the final thing we're left with is a missed or elided flush
somewhere in the linux code, which is going to be extremely hard to
find.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
