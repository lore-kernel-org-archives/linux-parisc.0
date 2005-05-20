From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Fri, 20 May 2005 09:15:42 -0600
Message-ID: <20050520151542.GA22835@colo.lackof.org>
References: <4282FEEE00003164@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE00003164@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, May 20, 2005 at 12:42:05PM +0200, Joel Soete wrote:
> > BTW, PDC sets all of this address stuff up AFAIK.
>
> Any idea where is the doc about this feature?

Sorry, I only know this from experience, not a document.

> > This last one seems to be disabled.
> Ah ok (any idea why? hw failure?)

Because it's not needed?
i.e. no devices downstream

> so here is a first patch:

Does this patch work for you?
Which machine(s) did you test it on?

> --- drivers/parisc/ccio-dma.c.orig      2005-05-20 08:47:17.000000000 +0200
> +++ drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +0200
...
> -       res->start = (unsigned long)(signed) __raw_readl(ioaddr) << 16;
> -       res->end = (unsigned long)(signed) (__raw_readl(ioaddr + 4) << 16)
> - 1;
> +       /*
> +        * bracing ((signed) ...) are required for 64bit kernel

	* bracing ((signed) ...) are required for 64bit kernel because
	* we only want to sign extend the lower 16 bits. The upper 16-bits
	* of range registers are hardcoded to 0xffff.

...
> +       /*
> +        * Check if the set of range registers is disable

	* Check if this MMIO range is disable

...
> Some additional stuff:
> --- drivers/parisc/ccio-dma.c.orig      2005-05-20 08:47:17.000000000 +0200
> +++ drivers/parisc/ccio-dma.c.orig1     2005-05-20 12:15:35.000000000 +0200
> @@ -1328,13 +1328,12 @@

I'm ignoring this chunk because it looks identical to the
previous patch. Please re-submit additional changes seperately.
I'm ok with dropping __FILE__ usage.

> -#ifdef __LP64__
> +#ifdef CONFIG_64BIT

I'll replace __LP64__ with CONFIG_64BIT - don't need a patch for that.

> -               __raw_writel(((parent->end)>>16) | 0xffff0000,
> +               WRITE_U32(((parent->end)>>16) | 0xffff0000,
>                              &ioc->ioc_regs->io_io_high);

Please submit a seperate patch for these.

And if everything is working for you,
can you try with this change:
- #define CCIO_INLINE     /* inline */
+ #define CCIO_INLINE inline

I would expect some minor, measurable improvements in performance.


> and btw some stuff which could interesting sba:
> --- drivers/parisc/sba_iommu.c.orig     2005-05-20 09:07:26.000000000 +0200
> +++ drivers/parisc/sba_iommu.c  2005-05-20 09:33:23.000000000 +0200
> @@ -91,7 +91,7 @@
>  #define DBG_RES(x...)
>  #endif
> 
> -#if defined(__LP64__) && !defined(CONFIG_PDC_NARROW)
> +#if defined(CONFIG_64BIT) && !defined(CONFIG_PDC_NARROW)

Yeah, I can apply those as well.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
