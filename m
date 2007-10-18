From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Fix /proc/iomem
Date: Thu, 18 Oct 2007 15:31:48 -0600
Message-ID: <20071018213148.GA20102__4950.10604286126$1416624646$gmane$org@colo.lackof.org>
References: <20071014144826.GF29934@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071014144826.GF29934@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 14, 2007 at 08:48:27AM -0600, Matthew Wilcox wrote:
> 
> commit 5d04e33a34814d0cc3029f4b1ba0e62829cb4610
> Author: Matthew Wilcox <matthew@wil.cx>
> Date:   Sun Oct 14 10:13:31 2007 -0400
> 
>     parisc: Fix infinite loop in /proc/iomem
>     
>     pcibios_link_hba_resources() could corrupt the resource tree by inserting
>     resources in the wrong place.  Fix this by calling pci_claim_resource()
>     for PCI-PCI bridges.  Delete pcibios_link_hba_resources as we shouldn't
>     need it any more.  Also get rid of lba_claim_dev_resources() and just
>     call pci_claim_resource() directly.

Nice!

Just one question on this bit:

> @@ -803,6 +768,9 @@ lba_fixup_bus(struct pci_bus *bus)
>  				DBG("lba_fixup_bus() WTF? 0x%lx [%lx/%lx] XXX",
>  					res->flags, res->start, res->end);
>  			}
> +			if ((i != PCI_ROM_RESOURCE) ||
> +			    (res->flags & IORESOURCE_ROM_ENABLE))
> +				pci_claim_resource(dev, i);
>  		}
>  

Why would ROM_ENABLE be set for something that's not a ROM?
I would expect "is ROM BAR _and_ ROM_ENABLE".

What am I missing? Maybe add a comment for this?

the rest looks good.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
