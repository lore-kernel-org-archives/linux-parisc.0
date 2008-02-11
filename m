From: Roel Kluin <12o3l@tiscali.nl>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c] pcxl_dma_ops.alloc_noncoherent
 = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 17:45:56 +0100
Message-ID: <47B07BC4.9010901@tiscali.nl>
References: <47B07685.5000606@tiscali.nl> <20080211164215.GM5299@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@parisc-linux.org, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759154AbYBKQqa@vger.kernel.org>
In-Reply-To: <20080211164215.GM5299@parisc-linux.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Matthew Wilcox wrote:
> On Mon, Feb 11, 2008 at 05:23:33PM +0100, Roel Kluin wrote:
>> duplicate pa11_dma_alloc_consistent; more appropriate appears
>> pa11_dma_alloc_noncoherent here. 
>>
>> Not tested, please confirm that this fix is correct
> 
> I don't think it is.  The memories are fading, so I don't recall why it
> is we do it this way, but I'm pretty sure it's correct the way it is.
> 
Maybe this helps a bit: later I found that something similar occurs in 
drivers/parisc/{ccio-dma.c, sba_iommu.c}:

1010: .alloc_consistent =     ccio_alloc_consistent,
      .alloc_noncoherent =    ccio_alloc_consistent,

1036: .alloc_consistent =     sba_alloc_consistent,
      .alloc_noncoherent =    sba_alloc_consistent,

However in these files the functions {ccio_alloc, sba_alloc}_noncoherent
do not exist.
