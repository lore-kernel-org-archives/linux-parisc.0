From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH 3/9] mm: parisc pte atomicity
Date: Sat, 22 Oct 2005 12:08:45 -0500
Message-ID: <1130000925.6461.15.camel__30134.112670976$1416624564$gmane$org@mulgrave>
References: <Pine.LNX.4.61.0510221716380.18047@goblin.wat.veritas.com>
	<Pine.LNX.4.61.0510221722260.18047@goblin.wat.veritas.com>
	<20051022163330.GD3364@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 Hugh Dickins <hugh@veritas.com>,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051022163330.GD3364@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2005-10-22 at 10:33 -0600, Matthew Wilcox wrote:
> On Sat, Oct 22, 2005 at 05:23:27PM +0100, Hugh Dickins wrote:
> > There's a worrying function translation_exists in parisc cacheflush.h,
> > unaffected by split ptlock since flush_dcache_page is using it on some
> > other mm, without any relevant lock.  Oh well, make it a slightly more
> > robust by factoring the pfn check within it.  And it looked liable to
> > confuse a camouflaged swap or file entry with a good pte: fix that too.
> 
> I have to say I really don't understand VM at all.  cc'ing the
> parisc-linux list in case anyone there has a better understanding than I
> do.

Well, I wrote the code for translation_exists() so I suppose that's
me...

Do you have a reference to the thread that triggered this?  I need more
context to decide what the actual problem is.

Let me explain what translation_exists() is though for the benefit of
the mm people.

Parisc is a VIPT architecture, so that would ordinarily entail a lot of
cache flushing through process spaces for shared pages.  However, we use
an optimisation of making all user space shared pages congruent, so
flushing a single one makes the cache coherent for all the others (this
is also a cache usage optimisation).

So, what our flush_dcache_page() does is it selects the first user page
it comes across to flush knowing that flushing this is sufficient to
flush all the others.

Unfortunately, there's a catch: the page we're flushing must have been
mapped into the user process (not guaranteed even if the area is in the
vma list) otherwise the flush has no effect (a VIPT cache flush must
know the translation of the page it's flushing), so we have to check the
validity of the translation before doing the flush.

On parisc, if we try to flush a page without a translation, it's picked
up by our software tlb miss handlers, which actually nullify the
instruction (but since we have to flush a page as a set of non
interlocking cache line flushes [about 128 of them per page with a cache
width of 32]) and the tlb handler is invoked for every flush instruction
(because the translation continues not to exist) it makes that flush
operation extremely slow. (128 interruptions of the execution stream per
flush)

So, the uses of translation_exists() are threefold

1) Make sure we execute flush_dcache_page() correctly (rather than
executing a flush that has no effect)
2) optimise single page flushing: don't excite the tlb miss handlers if
there's no translation
3) optimise pte lookup (that's why translation_exists returns the pte
pointer); since we already have to walk the page tables to answer the
question, the return value may as well be the pte entry or NULL rather
than true or false.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
