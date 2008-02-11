From: Roel Kluin <12o3l@tiscali.nl>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c]	pcxl_dma_ops.alloc_noncoherent
 = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 17:57:26 +0100
Message-ID: <47B07E76.9000100@tiscali.nl>
References: <47B07685.5000606@tiscali.nl> <1202748349.3122.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@parisc-linux.org, Matthew Wilcox <matthew@wil.cx>,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1202748349.3122.31.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James Bottomley wrote:
> On Mon, 2008-02-11 at 17:23 +0100, Roel Kluin wrote:
>> duplicate pa11_dma_alloc_consistent; more appropriate appears
>> pa11_dma_alloc_noncoherent here. 
>>
>> Not tested, please confirm that this fix is correct
> 
> No, it looks completely incorrect to me.  What makes you think a pcxl
> box has a problem with coherency?

Ok, please ignore the patch then. It just appeared suspicious to me
that the function did exist, but the names assigned were different.
