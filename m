From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: panic in iommu_is_span_boundary with 32-bit kernel on c3750
Date: Fri, 14 Mar 2008 19:31:54 -0400 (EDT)
Message-ID: <20080314233156.E0DAB4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle's tree (vmlinux-2.6.25-rc4-01283-gef95dd8) panics on my c3750 at
iommu_is_span_boundary+0x28.  Looking at the code, I see the panic is
caused by a call with r23 = 0.  The call is from sba_alloc_range.  The
actual call appears to be from an inlined copy of sba_search_bitmap.
It seems that boundary_size must be 0.

Should there be a check in sba_search_bitmap, or is the problem
deeper in dma_get_seg_boundary?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
