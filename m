From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Sun, 4 Dec 2011 12:48:18 +0200
Message-ID: <20111204104817.GI15464@redhat.com>
References: <cover.1322163031.git.mst@redhat.com>
 <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 24, 2011 at 10:19:34PM +0200, Michael S. Tsirkin wrote:
> parisc copied pci_iomap from generic code, probably to avoid
> pulling the rest of iomap.c in.  Since that's in
> a separate file now, we can reuse the common implementation.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Sorry to nag, any ACKs/NACKs on the parisc part?
I intend to send this to Linus if there are no
objections. Thanks!

> ---
>  arch/parisc/Kconfig     |    1 +
>  arch/parisc/lib/iomap.c |   23 -----------------------
>  2 files changed, 1 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index fdfd8be..242a1b7 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -14,6 +14,7 @@ config PARISC
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select HAVE_GENERIC_HARDIRQS
>  	select GENERIC_IRQ_PROBE
> +	select GENERIC_PCI_IOMAP
>  	select IRQ_PER_CPU
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  
> diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
> index 8f470c9..fb8e10a 100644
> --- a/arch/parisc/lib/iomap.c
> +++ b/arch/parisc/lib/iomap.c
> @@ -436,28 +436,6 @@ void ioport_unmap(void __iomem *addr)
>  	}
>  }
>  
> -/* Create a virtual mapping cookie for a PCI BAR (memory or IO) */
> -void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long maxlen)
> -{
> -	resource_size_t start = pci_resource_start(dev, bar);
> -	resource_size_t len = pci_resource_len(dev, bar);
> -	unsigned long flags = pci_resource_flags(dev, bar);
> -
> -	if (!len || !start)
> -		return NULL;
> -	if (maxlen && len > maxlen)
> -		len = maxlen;
> -	if (flags & IORESOURCE_IO)
> -		return ioport_map(start, len);
> -	if (flags & IORESOURCE_MEM) {
> -		if (flags & IORESOURCE_CACHEABLE)
> -			return ioremap(start, len);
> -		return ioremap_nocache(start, len);
> -	}
> -	/* What? */
> -	return NULL;
> -}
> -
>  void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
>  {
>  	if (!INDIRECT_ADDR(addr)) {
> @@ -483,5 +461,4 @@ EXPORT_SYMBOL(iowrite16_rep);
>  EXPORT_SYMBOL(iowrite32_rep);
>  EXPORT_SYMBOL(ioport_map);
>  EXPORT_SYMBOL(ioport_unmap);
> -EXPORT_SYMBOL(pci_iomap);
>  EXPORT_SYMBOL(pci_iounmap);
> -- 
> 1.7.5.53.gc233e
