From: Greg KH <greg@kroah.com>
Subject: [parisc-linux] Re: How to determine whether a device is PCI or not
Date: Fri, 29 Oct 2004 19:37:18 -0700
Message-ID: <20041030023718.GA1099@kroah.com>
References: <20041027121955.GH3450@parcelfarce.linux.theplanet.co.uk>
	<416174800000772D@mail-4-bnl.tiscali.it>
	<20041027141522.GK3450@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pci@atrey.karlin.mff.cuni.cz,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041027141522.GK3450@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 27, 2004 at 03:15:22PM +0100, Matthew Wilcox wrote:
> On Wed, Oct 27, 2004 at 03:32:16PM +0200, Joel Soete wrote:
> >  	while (dev != &root) {
> > +#ifdef CONFIG_PCI
> >  		if (dev->bus == &pci_bus_type) {
> >  			unsigned int devfn = to_pci_dev(dev)->devfn;
> >  			path->bc[i--] = PCI_SLOT(devfn) | (PCI_FUNC(devfn)<< 5);
> >  		} else if (dev->bus == &parisc_bus_type) {
> > +#else
> > +		if (dev->bus == &parisc_bus_type) {
> > +#endif
> >  			path->bc[i--] = to_parisc_device(dev)->hw_path;
> >  		}
> >  		dev = dev->parent;
> 
> The problem here is that pci_bus_type is declared inside an #ifdef
> CONFIG_PCI.  What we *actually* want to know is "is this device a
> pci_dev?"  and this isn't the best way to ask this question.  How about
> we add exactly that question to <linux/pci.h>, something like:

Ick, no.  Devices do not "show" their type, you have to explicitly know
what type they are in order to use them.

Why are you wanting to know this?  What are you trying to do with a
generic struct device * where you don't know exactly what type it is?

thanks,

greg k-h

p.s. bonus points to the first person who finds in the kernel where I
myself have violated the second sentance in this response :)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
