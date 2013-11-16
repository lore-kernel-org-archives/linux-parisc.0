From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Sat, 16 Nov 2013 15:09:59 -0500
Message-ID: <20131116200959.GA14098@kvack.org>
References: <20131115220529.GA3160@ls3530.box> <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com> <20131116200717.GA18939@schnuecks.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Simon Baatz <gmbnomis@gmail.com>
Return-path: <owner-linux-aio@kvack.org>
In-Reply-To: <20131116200717.GA18939@schnuecks.de>
List-ID: <linux-aio.kvack.org>

On Sat, Nov 16, 2013 at 09:07:18PM +0100, Simon Baatz wrote:
> On Fri, Nov 15, 2013 at 02:42:05PM -0800, James Bottomley wrote:
> > On Fri, 2013-11-15 at 23:05 +0100, Helge Deller wrote:
> > > When a user page mapping is released via kunmap*() functions, the D-cache needs
> > > to be flushed via flush_dcache_page() to avoid D-cache aliasing issues.
> > > 
> > > This patch fixes aio on the parisc platform (and probably others).
> > 
> > This should be flush_kernel_dcache_page().  flush_dcache_page() is for
> > full coherency but for unmap, we know the page was coherent going in and
> > may have been modified by the kernel, so only the kernel view needs to
> > be sync'd.  Technically, by the kernel API, the flush should be done
> > *before* unmapping.  This would have mattered on parisc until we did
> > flush via tmpalias which means we no-longer care if the mapping for the
> > flush exists or not because we always recreate it via the tmpalias
> > pages.
> 
> On ARM, flush_kernel_dcache_page() actually assumes that the page is
> mapped.  It avoids double flushing of highmem pages by not flushing
> in those cases where kunmap_atomic() already takes care of flushing.

Helge -- are you going to resubmit a version of this patch that makes the 
recommended change?

		-ben

> 
> 
> - Simon

-- 
"Thought is the essence of where you are now."

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
