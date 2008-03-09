From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another ccio fix idea?
Date: Sun, 9 Mar 2008 11:48:25 -0600
Message-ID: <20080309174825.GB19976@colo.lackof.org>
References: <47D3EC43.3070101@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47D3EC43.3070101@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 09, 2008 at 01:55:15PM +0000, Joel Soete wrote:
> Hello Grant,
>
> Always tracking this ccio-dma bug, I figure out this stuff could be 
> helpfull:
> --- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
> +++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
> @@ -802,7 +802,7 @@
>  			 * Hopefully someone figures out how to patch (NOP) the
>  			 * FDC/SYNC out at boot time.
>  			 */
> -			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> +			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));

BTW, once you've tested/demostrated this fixes the DMA problems on C-xxx,
please resend with "Signed-off-by:" line.

thanks,
grant

>
> What's your opinion?
>
> Tx,
> 	r.
