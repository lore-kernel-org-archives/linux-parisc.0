From: James Bottomley <James.Bottomley@suse.de>
Subject: Re: [PATCH 4/6] sh: add mm API for DMA to vmalloc/vmap areas
Date: Thu, 10 Sep 2009 00:32:30 +0000
Message-ID: <1252542750.18356.68.camel@mulgrave.site>
References: <1252511536-22066-1-git-send-email-James.Bottomley@suse.de>
	 <1252511536-22066-2-git-send-email-James.Bottomley@suse.de>
	 <1252511536-22066-3-git-send-email-James.Bottomley@suse.de>
	 <1252511536-22066-4-git-send-email-James.Bottomley@suse.de>
	 <1252511536-22066-5-git-send-email-James.Bottomley@suse.de>
	 <20090910002717.GC23674@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>,
	Christoph Hellwig <hch@lst.de>
To: Paul Mundt <lethal@linux-sh.org>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20090910002717.GC23674@linux-sh.org>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2009-09-10 at 09:27 +0900, Paul Mundt wrote:
> On Wed, Sep 09, 2009 at 10:52:14AM -0500, James Bottomley wrote:
> > Signed-off-by: James Bottomley <James.Bottomley@suse.de>
> > ---
> >  arch/sh/include/asm/cacheflush.h |    8 ++++++++
> >  1 files changed, 8 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/sh/include/asm/cacheflush.h b/arch/sh/include/asm/cacheflush.h
> > index 4c5462d..db06611 100644
> > --- a/arch/sh/include/asm/cacheflush.h
> > +++ b/arch/sh/include/asm/cacheflush.h
> > @@ -48,6 +48,14 @@ static inline void flush_kernel_dcache_page(struct page *page)
> >  {
> >  	flush_dcache_page(page);
> >  }
> > +static inline void flush_kernel_dcache_addr(void *addr)
> > +{
> > +	__flush_invalidate_region(addr, PAGE_SIZE);
> > +}
> > +static inline void invalidate_kernel_dcache_addr(void *addr)
> > +{
> > +	__flush_invalidate_region(addr, PAGE_SIZE);
> > +}
> >  
> Actually, I spoke too soon. The first one should be either a
> __flush_purge_region() or __flush_wback_region() I suspect. The former
> does both a writeback and invalidate, while the latter only does the
> writeback.

OK, will update.  I used the _flush_invalidate on the grounds that it
must completely kill the cacheline, so it was the safest semantic ...
actually, it's the only parisc semantic, so it's pretty much what occurs
to me most of the time.

James
