From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Remove unused pcibios_init_bus()
Date: Tue, 1 Dec 2015 21:44:54 +0100
Message-ID: <565E06C6.3080707@gmx.de>
References: <20151201164147.18471.52359.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Grant Grundler <grundler@parisc-linux.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151201164147.18471.52359.stgit@bhelgaas-glaptop2.roam.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01.12.2015 17:41, Bjorn Helgaas wrote:
> There are no callers of pcibios_init_bus(), so remove it.

True, pcibios_init_bus() isn't called anywhere, so it should be removed.

But I wonder if we might need to initialize latency and parity for PCI-PCI
bridges somewhere else then?
In one of my machines I have a i960 based RAID controller which isn't working
yet (I think it's internally based on a PCI-PCI bridge), and maybe this
is the reason it doesn't work? I will need to test it (e.g. firmware doesn't
fully initializes PCI-PCI bridges, which is why this code was added once).

Helge
 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  arch/parisc/kernel/pci.c |   18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
> index 64f2764..c99f3dd 100644
> --- a/arch/parisc/kernel/pci.c
> +++ b/arch/parisc/kernel/pci.c
> @@ -171,24 +171,6 @@ void pcibios_set_master(struct pci_dev *dev)
>  }
>  
>  
> -void __init pcibios_init_bus(struct pci_bus *bus)
> -{
> -	struct pci_dev *dev = bus->self;
> -	unsigned short bridge_ctl;
> -
> -	/* We deal only with pci controllers and pci-pci bridges. */
> -	if (!dev || (dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
> -		return;
> -
> -	/* PCI-PCI bridge - set the cache line and default latency
> -	   (32) for primary and secondary buses. */
> -	pci_write_config_byte(dev, PCI_SEC_LATENCY_TIMER, 32);
> -
> -	pci_read_config_word(dev, PCI_BRIDGE_CONTROL, &bridge_ctl);
> -	bridge_ctl |= PCI_BRIDGE_CTL_PARITY | PCI_BRIDGE_CTL_SERR;
> -	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bridge_ctl);
> -}
> -
>  /*
>   * pcibios align resources() is called every time generic PCI code
>   * wants to generate a new address. The process of looking for
> 

