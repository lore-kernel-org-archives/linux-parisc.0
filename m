From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another ccio fix idea?
Date: Fri, 14 Mar 2008 00:02:52 -0600
Message-ID: <20080314060251.GJ24794@colo.lackof.org>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave <dave@hiauly1.hia.nrc.ca>,
	"James.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete.joel" <soete.joel@scarlet.be>,
	grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 12, 2008 at 10:16:29AM +0100, rubisher wrote:
...
> mmm follwing stuff shouldn't so be enough:
> Index: b/drivers/parisc/ccio-dma.c
> ===================================================================
> --- a/drivers/parisc/ccio-dma.c 2008-03-12 08:49:20.000000000 +0000
> +++ b/drivers/parisc/ccio-dma.c 2008-03-12 08:50:54.000000000 +0000
> @@ -624,7 +624,8 @@
>         ** the real mode coherence index generation of U2, the PDIR entry
>         ** must be flushed to memory to retain coherence."
>         */
> -       asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[1]));
> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[0]));

NACK

>         asm volatile("sync");
>  }
> 
> @@ -695,7 +696,7 @@
>                 ** Hopefully someone figures out how to patch (NOP) the
>                 ** FDC/SYNC out at boot time.
>                 */
> -               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> +               asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]));

NACK - keep it simple with the original proposed patch.

> PS: in this doc feb96a6.pdf (easy to find) it was said:
> "[snip]
> Entries in the PA 7200 and PA 8000 caches are stored in lines
> of 32 bytes.
> [snip]
> 
> Because one-word writes occur in the I/O system, for registers,
> semaphores, or short DMA writes it was necessary that the I/O
> adapter implement a one-line-deep cache to buffer cache lines,
> so that these one-word writes could be executed by performing
> a coherent read private transaction on the Runway bus, obtaining
> the most recent copy of the cache line, modifying it locally in
> cache, and finally writing the modified line back to main memory.
...

> 2 thinks:
>     - it seems to confirm that cache line is well 32bytes wide ;-)
> 
>     - for 'one word writes...' how should it be implemented?

"one word writes" refers to DMA writes, not CPU writes.

>       It look like the sba_iommu driver:
>       "READ_REG(ioc-ioc_ha_IOC_PCOM); /* flush purges */
>       but without more detailed docs on U2/UTurn ccio, I don't know how to
>       implement matter, sorry.

The IOMMU driver programs the IO Pdir with the results of "lci" instruction
and this should be all the IOMMU needs to coherently read/modify/write
the cacheline that the "one word" DMA write is targeting. In short,
it's already implemented or I'd think we'd see much worse problems
on ccio platforms.

hth,
grant

> 
> 
> 
> ---
> Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> http://www.scarlet.be/
