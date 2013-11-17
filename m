From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Sun, 17 Nov 2013 22:23:08 +0100
Message-ID: <528933BC.50806@gmx.de>
References: <20131115220529.GA3160@ls3530.box> <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com> <20131116200717.GA18939@schnuecks.de> <20131116200959.GA14098@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-aio@kvack.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Benjamin LaHaise <bcrl@kvack.org>, Simon Baatz <gmbnomis@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131116200959.GA14098@kvack.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/16/2013 09:09 PM, Benjamin LaHaise wrote:
> On Sat, Nov 16, 2013 at 09:07:18PM +0100, Simon Baatz wrote:
>> On Fri, Nov 15, 2013 at 02:42:05PM -0800, James Bottomley wrote:
>>> On Fri, 2013-11-15 at 23:05 +0100, Helge Deller wrote:
>>>> When a user page mapping is released via kunmap*() functions, the D-cache needs
>>>> to be flushed via flush_dcache_page() to avoid D-cache aliasing issues.
>>>>
>>>> This patch fixes aio on the parisc platform (and probably others).
>>>
>>> This should be flush_kernel_dcache_page().  flush_dcache_page() is for
>>> full coherency but for unmap, we know the page was coherent going in and
>>> may have been modified by the kernel, so only the kernel view needs to
>>> be sync'd.  Technically, by the kernel API, the flush should be done
>>> *before* unmapping.  This would have mattered on parisc until we did
>>> flush via tmpalias which means we no-longer care if the mapping for the
>>> flush exists or not because we always recreate it via the tmpalias
>>> pages.
>>
>> On ARM, flush_kernel_dcache_page() actually assumes that the page is
>> mapped.  It avoids double flushing of highmem pages by not flushing
>> in those cases where kunmap_atomic() already takes care of flushing.
> 
> Helge -- are you going to resubmit a version of this patch that makes the 
> recommended change?

Sure, I'll do. May need some time for testing the various machine types though.
Maybe in the end you can drop my patch since we might be able to fix it in the 
parisc arch code.

@James, Dave: The patch I sent here was not used on the C8000. The C8000 (PA8800)
works out of the box (and it uses the flush_kernel_dcache_page() function which
is provided by kunmap()). It seems we require the flush_kernel_dcache_page() on
the other machines too?

Helge
