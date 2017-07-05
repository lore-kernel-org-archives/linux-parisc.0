From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: DMA API: return error instead of BUG_ON for dma
 ops on non dma devs
Date: Wed, 5 Jul 2017 22:51:55 +0200
Message-ID: <6808d165-9cf9-21d2-a9ad-633a9130999c@gmx.de>
References: <20170703084920.142A9508094@solo.franken.de>
 <83ff44f5-8989-c806-bef3-29fb9c909bee@gmx.de>
 <20170705185756.GA18087@infradead.org>
 <9de25038-5a0e-697d-dfb4-b6eb65189079@gmx.de>
 <20170705203335.GA10792@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170705203335.GA10792@infradead.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05.07.2017 22:33, Christoph Hellwig wrote:
> On Wed, Jul 05, 2017 at 09:36:09PM +0200, Helge Deller wrote:
>> On 05.07.2017 20:57, Christoph Hellwig wrote:
>>> I've got a tree pending that removes DMA_ERROR_CODE, and it's been
>>> in linux-next for a while.
>>
>> I had the parisc patch in for-next as well and didn't received
>> any warnings.
> 
> There are no warnings, as the macro just won't be used by common code
> anymore.

And that's the reason why I didn't checked.
The generic DMA_ERROR_CODE has been there since 3.13 (or something
like that), so I don't think anybody would have assumed that it's
planned to vanish.
On the other side the patch fixed a real kernel crash on parisc,
and the patch applies as-is down to 3.13.
With that in mind, technically it's good that the parisc patch went in 
before yours.

> But the commit is from July 3rd, and the pull request to Linus for
> it was merged on the same day.  I can't see how it could have been
> in linux-next for long.  It certainly wasn't in the last linux-next
> release that I looked at before the long weekend (the July 30 one)

True.
Anyway, let's get your patch in now.

>> Can we please change this to something like 
>> "Prepare parisc to get rid of DMA_ERROR_CODE tree-wide" ?
>> It's somewhat more neutral.
> 
> Fine with me.

I did not changed it.

Helge
