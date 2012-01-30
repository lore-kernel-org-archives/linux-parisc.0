From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: [PATCH 1/2] parisc: fix compile without CONFIG_PCI
Date: Mon, 30 Jan 2012 11:13:11 +0100
Message-ID: <283f1c4300462d6ed70c92f87e6258cb.squirrel@webmail.sf-mail.de>
References: <6637509.yTD8q5zPsI@eto> <4000012.xgVA85Qcpi@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: "linux-parisc List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4000012.xgVA85Qcpi@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> From f49bd6e33a3b6f499a6039a5980af21893524e86 Mon Sep 17 00:00:00 2001
> From: Rolf Eike Beer <eike-kernel@sf-tec.de>
> Date: Mon, 16 Jan 2012 18:59:29 +0100
> Subject: [PATCH 1/2] parisc: fix compile without CONFIG_PCI
>
> This function is already defined as a noop in include/asm-generic/iomap.h.
>
> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
> ---
>  arch/parisc/lib/iomap.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
> index fb8e10a..b2b0408 100644
> --- a/arch/parisc/lib/iomap.c
> +++ b/arch/parisc/lib/iomap.c
> @@ -436,12 +436,14 @@ void ioport_unmap(void __iomem *addr)
>  	}
>  }
>
> +#ifdef CONFIG_PCI
>  void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
>  {
>  	if (!INDIRECT_ADDR(addr)) {
>  		iounmap(addr);
>  	}
>  }
> +#endif /* CONFIG_PCI */
>
>  EXPORT_SYMBOL(ioread8);
>  EXPORT_SYMBOL(ioread16);
> @@ -461,4 +463,6 @@ EXPORT_SYMBOL(iowrite16_rep);
>  EXPORT_SYMBOL(iowrite32_rep);
>  EXPORT_SYMBOL(ioport_map);
>  EXPORT_SYMBOL(ioport_unmap);
> +#ifdef CONFIG_PCI
>  EXPORT_SYMBOL(pci_iounmap);
> +#endif /* CONFIG_PCI */

James?
