Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Patch: linux-2.5.47/drivers/parisc/ - pci_dma_supported had side effect 
In-Reply-To: Message from "Adam J. Richter" <adam@yggdrasil.com>
   of "Sat, 16 Nov 2002 05:49:41 PST." <20021116054941.A3448@baldur.yggdrasil.com>
References: <20021116054941.A3448@baldur.yggdrasil.com> 
Date: Sat, 16 Nov 2002 23:20:25 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021117062025.A10E8482E@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"Adam J. Richter" wrote:
> 	pci_dma_supported is not supposed to have any side effects,
> but the parisc versions set pci_dev->dma_mask, which is not the
> intended behavior.

That's my bad. At some point in time, it was in fact correct.
Thanks for catching this.

> A driver could call check pci_dma_supported for a
> variety of values in any particular order without expected the dma
> mask to have actually been changed.

I think pci_dma_supported() is obsoleted by pci_set_dma_mask().
Maybe they mean/do slightly different things.
But most of the drivers I've looked at only use pci_set_dma_mask().

> To change the DMA mask, drivers
> call pci_set_dma_mask (in drivers/pci/pci.c), which, by the way, does
> call machine-specific pci_dma_supported routine to ensure that the
> desired mask is acceptable.

Yes. I can feel a bit better since I suggested davem use a macro
(pci_set_dma_mask()) to set the dma_mask field instead of just
having drivers set the dma_mask field themselves.

> 	The following patch fixes the problem.  It also has the
> benefit of eliminating some direct writing to pci_dev->dma_mask,
> which is what caused me to notice this problem.
> 
> 	I do not have any parisc machines or normally build parisc
> kernels.  So, I have not even verified that this change compiles.
> 
> 	If somebody could give these deletions a whirl and then send
> them by whatever the preferred process is to get them into the
> mainline kernel, I would appreciate it.  If there is more that I
> should do to facilitate this, please let me know.

I'll take care it. Thanks!

grant
