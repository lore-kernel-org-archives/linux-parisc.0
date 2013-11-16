From: Simon Baatz <gmbnomis@gmail.com>
Subject: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Sat, 16 Nov 2013 21:07:18 +0100
Message-ID: <20131116200717.GA18939@schnuecks.de>
References: <20131115220529.GA3160@ls3530.box>
 <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>,
	linux-aio@kvack.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 15, 2013 at 02:42:05PM -0800, James Bottomley wrote:
> On Fri, 2013-11-15 at 23:05 +0100, Helge Deller wrote:
> > When a user page mapping is released via kunmap*() functions, the D-cache needs
> > to be flushed via flush_dcache_page() to avoid D-cache aliasing issues.
> > 
> > This patch fixes aio on the parisc platform (and probably others).
> 
> This should be flush_kernel_dcache_page().  flush_dcache_page() is for
> full coherency but for unmap, we know the page was coherent going in and
> may have been modified by the kernel, so only the kernel view needs to
> be sync'd.  Technically, by the kernel API, the flush should be done
> *before* unmapping.  This would have mattered on parisc until we did
> flush via tmpalias which means we no-longer care if the mapping for the
> flush exists or not because we always recreate it via the tmpalias
> pages.

On ARM, flush_kernel_dcache_page() actually assumes that the page is
mapped.  It avoids double flushing of highmem pages by not flushing
in those cases where kunmap_atomic() already takes care of flushing.


- Simon
