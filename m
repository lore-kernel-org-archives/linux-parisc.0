From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] parisc: DMA API: return error instead of BUG_ON for dma
 ops on non dma devs
Date: Wed, 5 Jul 2017 13:33:35 -0700
Message-ID: <20170705203335.GA10792@infradead.org>
References: <20170703084920.142A9508094@solo.franken.de>
 <83ff44f5-8989-c806-bef3-29fb9c909bee@gmx.de>
 <20170705185756.GA18087@infradead.org>
 <9de25038-5a0e-697d-dfb4-b6eb65189079@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christoph Hellwig <hch@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <9de25038-5a0e-697d-dfb4-b6eb65189079@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 05, 2017 at 09:36:09PM +0200, Helge Deller wrote:
> On 05.07.2017 20:57, Christoph Hellwig wrote:
> > I've got a tree pending that removes DMA_ERROR_CODE, and it's been
> > in linux-next for a while.
> 
> I had the parisc patch in for-next as well and didn't received
> any warnings.

There are no warnings, as the macro just won't be used by common code
anymore.

But the commit is from July 3rd, and the pull request to Linus for
it was merged on the same day.  I can't see how it could have been
in linux-next for long.  It certainly wasn't in the last linux-next
release that I looked at before the long weekend (the July 30 one)

> Can we please change this to something like 
> "Prepare parisc to get rid of DMA_ERROR_CODE tree-wide" ?
> It's somewhat more neutral.

Fine with me.
