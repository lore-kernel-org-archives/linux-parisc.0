From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] kernel panic when reading from a NBD device
Date: Sat, 10 Dec 2005 16:44:23 -0500
Message-ID: <20051210214423.GB6247@tachyon.int.mcmartin.ca>
References: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
	<20051205013921.GA26910@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051205013921.GA26910@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 04, 2005 at 08:39:21PM -0500, Kyle McMartin wrote:
> 		if (q->bounce_pfn >= blk_max_pfn)
> 			return;
>

My mistake, blk_queue_bounce_limit(q, BLK_BOUNCE_HIGH) is called during
during queue init:

nbd.c:667
		disk->queue = blk_init_queue(do_nbd_request, &nbd_lock);

blk_init_queue() calls blk_init_queue_node() which calls

ll_rw_blk.c:1749
	blk_queue_make_request(q, __make_request);

ll_rw_blk.c:261
	/*
	 * by default assume old behaviour and bounce for any highmem page
	 */
	blk_queue_bounce_limit(q, BLK_BOUNCE_HIGH);

This meant that q->bounce_pfn was 0, since:

#define BLK_BOUNCE_HIGH		((u64)blk_max_low_pfn << PAGE_SHIFT)

blk_max_low_pfn was 0, so BLK_BOUNCE_HIGH was 0. 

This sets bounce_pfn in blk_queue_bounce_limit:523 to 0, which means

blk_queue_bounce_limit():

	if (bounce_pfn < blk_max_low_pfn) {
		BUG_ON(dma_addr < BLK_BOUNCE_ISA);
		init_emergency_isa_pool();
		q->bounce_gfp = GFP_NOIO | GFP_DMA;
	} else
		q->bounce_gfp = GFP_NOIO;

	q->bounce_pfn = bounce_pfn;

Sets bounce_gfp to GFP_NOIO, and q->bounce_pfn = 0;

Much later when blk_queue_bounce is called,

highmem.c:477
	if (!(q->bounce_gfp & GFP_DMA)) {
		if (q->bounce_pfn >= blk_max_pfn)
			return;
		pool = page_pool;
	} else {
		BUG_ON(!isa_page_pool);
		pool = isa_page_pool;
	}

	/*
	 * slow path
	 */
	__blk_queue_bounce(q, bio_orig, pool);

Fails the q->bounce_pfn (0) >= blk_max_pfn (0xbig), so pool is set
to page_pool, and we try to bounce. Inside __blk_queue_bounce we
call mempool_alloc(pool, ..);

mempool.c:220
	element = pool->alloc(gfp_temp, pool->pool_data);

Which dereferences pool, which is NULL, because we don't have
CONFIG_HIGHMEM set, so it wasn't initialized,

highmem.c:51
#ifdef CONFIG_HIGHMEM

static void *page_pool_alloc(gfp_t gfp_mask, void *data)
{
	return alloc_page(gfp_mask);
}

And kaboom, we die in an unfortunate way.

With max_low_pfn set, the 
                if (q->bounce_pfn >= blk_max_pfn)
gets hit, and we simply return instead of attempting to bounce
something.

I'm willing to bet this also fixes our ide-lib.c bug we hit earlier in
a cleaner way than changing the structure of that code.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
