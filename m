From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.10-rc1-pa16 still panic on c110 [WAS: [parisc-linux] c110
	panic when try to boot 2.6.10-rc1-pa11?]
Date: Sat, 20 Nov 2004 16:18:37 -0700
Message-ID: <20041120231836.GC11503@colo.lackof.org>
References: <41966398.4070303@tiscali.be> <419FAAF4.4030608@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <419FAAF4.4030608@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 20, 2004 at 08:37:08PM +0000, Joel Soete wrote:
> > IAOQ[1]: mempool_alloc+0xa4/0x18c
> > RP(r2): __blk_queue_bounce+0x210/0x290

My guess is this is because the default value is wrong...hrm..
but ccio driver should be clearing parisc_bus_is_phys.
Let me commit the pending change i have and then see how it goes.


> and I don't understand why reverting this patch:
> diff -u -r1.15 -r1.16
> --- linux-2.6/arch/parisc/mm/init.c	2004/10/24 05:47:27	1.15
> +++ linux-2.6/arch/parisc/mm/init.c	2004/11/10 19:55:37	1.16
> @@ -59,8 +59,6 @@
> 
>  static struct resource sysram_resources[MAX_PHYSMEM_RANGES];
> 
> -static unsigned long max_pfn;
> -
>  /* The following array is initialized from the firmware specific
>   * information retrieved in kernel/inventory.c.
>   */
> 
> solve the pb.
> 
> That doen't make sence to me as far as I test with success this kernel on 
> b180, b2k (32 and 64 bit) and n4k (smp) without pb
> (btw the same success with my rc2 merge on b2k [32 and 64 bit] and b180 :) )

hrm. We bounce when we think an address is greater than the number
of bits a device can DMA directly to. So either the max_pfn or
the dma_mask is being set wrong.

> Well the c110 is the only model I use with NCR 53C720 & LASI ASIC interface 
> (i.e. NCR 53C710)

Either of these drivers may not be setting the corresponding dma_mask.
I need to check.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
