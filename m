From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] fix crash when using XFS on loopback
Date: Mon, 6 Jan 2014 12:54:22 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401061237120.6190@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1401041241590.4648@file01.intranet.prod.int.rdu2.redhat.com> <20140106073549.GA25771@lge.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Andi Kleen <ak@linux.intel.com>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@iki.fi>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140106073549.GA25771@lge.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

On Mon, 6 Jan 2014, Joonsoo Kim wrote:

> Hello,
> 
> I'm surprised that this VM_BUG_ON() has not been triggered until now. It was
> introduced in 2007 by commit (b5fab14). Maybe there is no person who test
> with CONFIG_DEBUG_VM.

Last time I tried it, PS-RISC didn't work with CONFIG_DEBUG_VM at all.

> There is one more bug report same as this.
> * possible regression on 3.13 when calling flush_dcache_page
>   (lkml.org/lkml/2013/12/12/255)

That link doesn't show anything.

> As mentioned in the description of commit (b5fab14), slab object may not be
> properly aligned and use of page oriented function to this object can be
> dangerous. I searched the XFS code and found that they only try to allocate
> multiple of 512 bytes, so there is no problem for now. But, IMHO, it is better
> not to use slab objects for this purpose.

If slab debugging is enabled, kmalloc memory is not aligned.

In XFS in xfs_buf_allocate_memory they test if the kmalloc memory crosses 
page boundary - if it does, they free the kmalloc memory and allocate a 
full page. Maybe this approach could still run into problems with some 
bus-master adapters that assume alignment in hardware...


dm-bufio also does I/O to slab-allocated buffers, but it allocates the 
object from slab (not kmalloc) with proper alignment.

> And I rapidly searched every callsites of page_mapping() and, IMHO, this 
> patch would work correctly. But possibly reverting original commit is 
> better solution.

Reverting the original commit wouldn't fix that VM_BUG_ON.

> Hello, Pekka and Christoph.
> Could you teach me which direction we have to go?
> 
> Thanks.

Mikulas
