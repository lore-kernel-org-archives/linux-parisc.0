From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] 2.6.28-rc6 update parisc MAINTAINERS
Date: Wed, 3 Dec 2008 01:22:39 -0700
Message-ID: <20081203082239.GC32121@colo.lackof.org>
References: <200811202258.56561.deller@gmx.de> <200811211516.50750.deller@gmx.de> <20081121111705.dc03a465.akpm@linux-foundation.org> <49272F66.1010702@gmx.de> <20081121142013.f8d59b3f.akpm@linux-foundation.org> <20081122055301.GA12724@colo.lackof.org> <20081122122208.GE5707@parisc-linux.org> <20081122180152.GC2690@colo.lackof.org> <20081201072134.GE17583@colo.lackof.org> <493409C6.6050607@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, kyle@hera.kernel.org,
	randolph@tausq.org, stable@kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <493409C6.6050607@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 01, 2008 at 04:59:02PM +0100, Helge Deller wrote:
> Grant Grundler wrote:
...
>> Updated version of this patch: I'm removing my own name as well for some 
>> of the same reasons as willy. 
>
> Grant, even if you are currently only occasionally fixing bugs or reviewing 
> patches, I think it would still be valuable to keep you listed here as one 
> of the parisc maintainers.

Helge,
Thanks!

But it sounds a bit biased coming from you given I just nominated
you to be listed as maintainer. :)

"occasionally fixing bugs" is generous with respect to parisc-linux.
I've prevented a few bugs this year (code review) and substantially helped
the Intel IOMMU driver maintainer code (on linux-pci). But those aren't
reasons to be listed as parisc-linux maintainer.

I will continue to review parisc-linux patches and occasionally work
on "porting" autotest.kernel.org to parisc-linux. I think that would
help the port to avoid regressions. I'm just not able (time and ability)
to fix the latest major issue which we've been guessing is cache
coherency related.

thanks,
grant
