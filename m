Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC5294830
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 02:32:07 -0600 (MDT)
Message-ID: <4077B104.9030707@tiscali.be>
Date: Sat, 10 Apr 2004 08:32:04 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org> <40770BDF.10209@tiscali.be>
	<20040409211507.GB32385@colo.lackof.org>
In-Reply-To: <20040409211507.GB32385@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Grant,

Thanks.

I will so just reversed mentioned patches, check if it is the real cause of my pb.
If yes (I don't see what else) re-apply patch hunk by hunk until it breaks again?

Any better idea?

Joel


Grant Grundler wrote:
> On Fri, Apr 09, 2004 at 08:47:27PM +0000, Joel Soete wrote:
> 
>>/*
>> * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
>> * impacts performance though - ditch it if you don't use it.
>> */
>>#define CCIO_SEARCH_TIME
>>#undef CCIO_MAP_STATS
>>#else
>>#undef CCIO_SEARCH_TIME
>>#undef CCIO_MAP_STATS
>>#endif
>>
>>CCIO_MAP_STATS is always undef?
> 
> 
> yes - it interfers with DMA mapping performance.
> 
> 
>>Could it be the panic reason of my c110 (_apparently_ since this patch)?
> 
> 
> Not likely.
> The above disables code that is (should!) not affect basic functionality.
> CCIO_MAP_STATS just collects data for /proc/bus/runway/... output.
> 
> grant
> 
