Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A6164944
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 15:15:09 -0600 (MDT)
Date: Fri, 9 Apr 2004 15:15:07 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
Message-ID: <20040409211507.GB32385@colo.lackof.org>
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org> <40770BDF.10209@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40770BDF.10209@tiscali.be>
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

On Fri, Apr 09, 2004 at 08:47:27PM +0000, Joel Soete wrote:
> /*
>  * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
>  * impacts performance though - ditch it if you don't use it.
>  */
> #define CCIO_SEARCH_TIME
> #undef CCIO_MAP_STATS
> #else
> #undef CCIO_SEARCH_TIME
> #undef CCIO_MAP_STATS
> #endif
> 
> CCIO_MAP_STATS is always undef?

yes - it interfers with DMA mapping performance.

> Could it be the panic reason of my c110 (_apparently_ since this patch)?

Not likely.
The above disables code that is (should!) not affect basic functionality.
CCIO_MAP_STATS just collects data for /proc/bus/runway/... output.

grant
