From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Yet another ccio fix idea?
Date: Mon, 10 Mar 2008 14:59:47 -0500
Message-ID: <1205179187.2941.23.camel@localhost.localdomain>
References: <47D3EC43.3070101@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47D3EC43.3070101@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-03-09 at 13:55 +0000, Joel Soete wrote:
> Hello Grant,
> 
> Always tracking this ccio-dma bug, I figure out this stuff could be helpfull:
> --- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
> +++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
> @@ -802,7 +802,7 @@
>   			 * Hopefully someone figures out how to patch (NOP) the
>   			 * FDC/SYNC out at boot time.
>   			 */
> -			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> +			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));

That's the wrong fix.  What it's trying to do is flush the write made
above this to pdir_ptr[7].  Therefore there should be an '&' in front,
so

asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]))

Flushing pdir_ptr may or may not work depending on the cache line width
(pdr_ptr[7] is 28 bytes away, so if the line size is 16 it will fail;
although I think almost every machine with a ccio has a 32 byte or
higher cache line width).

James


