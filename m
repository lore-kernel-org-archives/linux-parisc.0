From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH] block: fix q->max_segment_size checking in
 blk_recalc_rq_segments about VMERGE
Date: Tue, 15 Jul 2008 23:20:14 +0900
Message-ID: <20080715231956A.fujita.tomonori@lab.ntt.co.jp>
References: <1216118676-13625-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
	<Pine.LNX.4.64.0807150924250.21598@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: fujita.tomonori@lab.ntt.co.jp, jens.axboe@oracle.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	davem@davemloft.net, linux-parisc@vger.kernel.org
To: mpatocka@redhat.com
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807150924250.21598@devserv.devel.redhat.com>
List-ID: <linux-scsi.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 15 Jul 2008 09:37:05 -0400 (EDT)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> On Tue, 15 Jul 2008, FUJITA Tomonori wrote:
> 
> > blk_recalc_rq_segments assumes that any segments can be merged in the
> > case of BIOVEC_VIRT_MERGEABLE && !BIOVEC_VIRT_OVERSIZE. However, an
> > IOMMU can't merge segments if the total length of the segments is
> > larger than max_segment_size (the LLD restriction).
> >
> > Due to this bug, a LLD may get the larger number of segments than
> > nr_hw_segments because the block layer puts more segments in a request
> > than it should do.
> >
> > This bug could happen on alpha, parisc, and sparc, which use VMERGE.
> 
> Parisc doesn't use virtual merge accounting (there is variable for it but 
> it's always 0).

Hmm, really? Looks like PARISC IOMMUs (ccio-dma.c and sba_iomm.c) set
parisc_vmerge_boundary (CC'ed PARISC mailing list).


> On sparc64 it is broken anyway with or without your patch. 

Yeah, we need to modify SPARC64 IOMMU code (I'm not sure that it's
worth). Right now, the best fix is setting BIO_VMERGE_BOUNDARY to 0.


> And alpha alone doesn't justify substantial code bloat in generic block 
> layer. So I propose this patch to drop it at all.

Jens, what do you think about removing VMERGE code?
