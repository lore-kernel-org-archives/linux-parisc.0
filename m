From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: panic in iommu_is_span_boundary with 32-bit kernel on c3750
Date: Sat, 15 Mar 2008 01:05:48 -0600
Message-ID: <20080315070548.GB2158@colo.lackof.org>
References: <20080314233156.E0DAB4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080314233156.E0DAB4E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Mar 14, 2008 at 07:31:54PM -0400, John David Anglin wrote:
> Kyle's tree (vmlinux-2.6.25-rc4-01283-gef95dd8) panics on my c3750 at
> iommu_is_span_boundary+0x28.

32-bit or 64-bit kernel?

>  Looking at the code, I see the panic is
> caused by a call with r23 = 0.  The call is from sba_alloc_range.  The
> actual call appears to be from an inlined copy of sba_search_bitmap.
> It seems that boundary_size must be 0.
> 
> Should there be a check in sba_search_bitmap, or is the problem
> deeper in dma_get_seg_boundary?

I don't expect a deeper problem given this definition:
static inline unsigned long dma_get_seg_boundary(struct device *dev)
{
        return dev->dma_parms ?
                dev->dma_parms->segment_boundary_mask : 0xffffffff;
}

I'm not sure how boundary_size could ever be zero.
Could this code generate a zero value?

        boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1, 1 << IOVP_SHIFT);
        boundary_size >>= IOVP_SHIFT;

I thought ALIGN() would "ROUND_UP()". So it should always be at least 1
returned.

But in the 32-bit kernel ~0 + 1 == 0 (with overflow).
Will the ALIGN do the right thing in that case?
It looks like it will return 0 because of overflow and I think the
intent is "4GB >> IOVP_SHIFT" (so 20 bits, ie 1MB).
Maybe we want dma_get_seg_boundary() to deal with the ALIGN and other stuff
so it just returns a PAGE_SIZE count?

A simple test before assigning boundary_size would be to check
"dev->dma_parms". If dev->dma_parms is zero, just return 1 << 20
and see if that works for you.

But I'm pretty tired right now (long week) and I can't wrap my brain
around the bit flipping. Would be good if someone else confirmed.

cheers,
grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
