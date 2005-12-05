From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] kernel panic when reading from a NBD device
Date: Sun, 4 Dec 2005 20:39:21 -0500
Message-ID: <20051205013921.GA26910@quicksilver.road.mcmartin.ca>
References: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 04, 2005 at 08:27:10PM +0100, Guy Martin wrote:
>  IAOQ[0]: mempool_alloc+0x38/0x100
>  IAOQ[1]: mempool_alloc+0x3c/0x100
>  RP(r2): blk_queue_bounce+0xf0/0x320

If I had to guess, this is because the pool argument of
mempool_alloc is NULL. As it is directly dereferenced
in mm/mempool.c:mempool_alloc() line 220.

	element = pool->alloc(gfp_temp, pool->pool_data);

Called from mm/highmem.c:blk_queue_bounce() which must be
setting pool to page_pool, which would be uninitialized because
CONFIG_HIGHMEM is not set. I would guess that blk_queue_bounce
is missing this 

		if (q->bounce_pfn >= blk_max_pfn)
			return;

if-clause... blk_max_pfn is set from max_pfn in 
arch/parisc/mm/init.c:setup_bootmem(). q->bounce_pfn is unset because
blk_bounce_queue_limit() hasn't been called.

I'm unsure of the best way to proceed from here, it seems clear
we have a bug of some sort. I'm not sure that your patch is 
generically correct... might want to bring this up with the nbd
folks until we figure out what our bug is here.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
