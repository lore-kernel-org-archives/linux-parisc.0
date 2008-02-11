From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c]
	pcxl_dma_ops.alloc_noncoherent = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 10:45:49 -0600
Message-ID: <1202748349.3122.31.camel@localhost.localdomain>
References: <47B07685.5000606@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyle@parisc-linux.org, Matthew Wilcox <matthew@wil.cx>,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
To: Roel Kluin <12o3l@tiscali.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47B07685.5000606@tiscali.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Mon, 2008-02-11 at 17:23 +0100, Roel Kluin wrote:
> duplicate pa11_dma_alloc_consistent; more appropriate appears
> pa11_dma_alloc_noncoherent here. 
> 
> Not tested, please confirm that this fix is correct

No, it looks completely incorrect to me.  What makes you think a pcxl
box has a problem with coherency?

James
