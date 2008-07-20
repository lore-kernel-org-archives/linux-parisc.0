From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] ccio_clear_io_tlb() don't need to compute io page
	number a second time.
Date: Sat, 19 Jul 2008 22:27:40 -0400
Message-ID: <20080720022740.GA6427@phobos.i.cabal.ca>
References: <48825DD0.5000308@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48825DD0.5000308@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 19, 2008 at 09:34:08PM +0000, Joel Soete wrote:
> --- a/drivers/parisc/ccio-dma.c	2008-07-19 21:17:37.000000000 +0000
> +++ b/drivers/parisc/ccio-dma.c	2008-07-19 21:32:54.000000000 +0000
> @@ -643,7 +643,6 @@
>  {
>  	u32 chain_size = 1 << ioc->chainid_shift;
>
> -	iovp &= IOVP_MASK;	/* clear offset bits, just want pagenum */
>  	byte_cnt += chain_size;
>
>  	while(byte_cnt > chain_size) {

applied.
