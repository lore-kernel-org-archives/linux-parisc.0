From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Tue, 16 Nov 2004 09:09:39 -0700
Message-ID: <20041116160939.GB4176@colo.lackof.org>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 16, 2004 at 03:07:48PM +0000, Matthew Wilcox wrote:
> Er, what?  Eh?  sym2 only uses a 32-bit DMA mask if you configure it to.
> And it appears we do tell it to ;-(

yeah...I'm probably responsible for that setting.
It worked the best. :^/
The 39/40 bit or full 64-bit support don't help on parisc-linux anyway.

> All machines include setup.c ... that's fine.

cool

> > +#ifndef CONFIG_PA20
> > +	parisc_bus_is_phys = FALSE;
> > +#endif
>
> Ifdefs suck.  Try this ...
> 
> +	parisc_has_iommu();

Yes - that's a good idea.

> /*
>  * If the PCI device's view of memory is the same as the CPU's view of memory,
>  * PCI_DMA_BUS_IS_PHYS is true.  The networking and block device layers use
>  * this boolean for bounce buffer decisions.
>  */
> #ifdef CONFIG_PA20
> /* All PA-2.0 machines have an IOMMU. */
> #define PCI_DMA_BUS_IS_PHYS	0
> #define parisc_has_iommu()	do { } while (0)
> #else
> #define PCI_DMA_BUS_IS_PHYS	parisc_bus_is_phys
> #define parisc_has_iommu()	do { parisc_bus_is_phys = 1; } while (0)
> #endif

This looks way better to me too.

> I'm tempted to define a couple of new config symbols rather than use
> CONFIG_PA20 -- if PCI_LBA and CCIO are both deselected (eg 712 build),
> we know the answer is 1.

Yes, that's true.

> Equally, if GSC is deselected, this must be
> a pure PCI machine (if it boots ;-) and they all have an IOMMU, though
> I guess you'd always select PA20 for that case.  In any case, I think
> a couple of new symbols are in order.

Hrm....I was trying to avoid new config symbols.
We have three cases where I only saw two before:
1) PA20=y, always have IOMMU (SBA or CCIO _MUST_ be enabled).
2) PA11=y, if SBA=n and CCIO=n, never IOMMU.
3) PA11=y, if SBA=y _or_ CCIO=y, requires runtime check

I think this is straight forward enough to code up in pci.h.

Further:
CCIO depends on GSC
SBA  depends on PCI

ergo Enabling PA20 and GSC but not PCI means CCIO *MUST* be enabled.
ergo Enabling PA20 and PCI but not GSC means SBA  *MUST* be enabled.

Could someone else look at Kconfig files to verify the above two
rules are enforced?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
