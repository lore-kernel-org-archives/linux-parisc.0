Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kroah.com (12-231-249-244.client.attbi.com [12.231.249.244])
	by dsl2.external.hp.com (Postfix) with SMTP id F3598482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 23:18:35 -0700 (MST)
Date: Tue, 12 Nov 2002 22:13:10 -0800
From: Greg KH <greg@kroah.com>
To: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Cc: Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Message-ID: <20021113061310.GD2106@kroah.com>
References: <20021109060342.GA7798@kroah.com> <200211091533.gA9FXuW02017@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211091533.gA9FXuW02017@localhost.localdomain>
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

On Sat, Nov 09, 2002 at 10:33:56AM -0500, J.E.J. Bottomley wrote:
> 
> > The SCSI people are being drug kicking and screaming into it,
> > _finally_ now (hell, SCSI is still not using the updated PCI
> > interface, those people _never_ update their drivers if they can avoid
> > it.)
> 
> That't not entirely fair.  Most of the unbroken drivers in the tree (those 
> with active 2.5 maintainers) are using the up to date pci/dma interface.  The 
> mid layer is `sort of' using the device api.

I was referring to the pci_module_init() model of PCI drivers, which, as
of 2.5.47, is only implemented in the ips, nsp32 and aic7xxx drivers.
Every other PCI SCSI controller driver will crash and burn a nasty death
if placed in a machine with a PCI hotplug controller, and someone tries
to remove it.  Hopefully someday this will be fixed... :)

> Where I'd like to see the device model go for SCSI is:
> 
> - we have a device node for every struct scsi_device (even unattached ones)
> 
> - unattached devices are really minimal entities with as few resources 
> allocated as we can get away with, so we can have lazy attachment more easily.
> 
> - on attachment, the device node gets customised by the attachment type (and 
> remember, we can have more than one attachment).
> 
> - whatever the permanent `name' field for the device is going to be needs to 
> be writeable from user level, that way it can eventually be determined by the 
> user level and simply written there as a string (rather than having all the 
> wwn fallback cruft in the mid-layer).
> 
> - Ultimately, I'd like us to dump the host/channel/target numbering scheme in 
> favour of the unique device node name (we may still number them in the 
> mid-layer for convenience) so that we finesse the FC mapping problems---FC 
> devices can embed the necessary identification in the target strings.
> 
> - Oh, and of course, we move to a hotplug/coldplug model where the root device 
> is attached in initramfs and everything else is discovered in user space from 
> the boot process.

All of that sounds very reasonable, and would be nice to see
implemented.

> > Patches for this stuff are going to be happening for quite some time
> > now, don't despair.
> 
> > And they are greatly appreciated, and welcomed from everyone :) 
> 
> As far as extending the generic device model goes, I'll do it for the MCA bus. 
>  I have looked at doing it previously, but giving the MCA bus a struct pci_dev 
> is a real pain because of the underlying assumptions when one of these exists 
> in an x86 machine.

What is the real reason for needing this, pci_alloc_consistent()?  We
have talked about renaming that to dev_alloc_consistent() in the past,
which I think will work for you, right?

thanks,

greg k-h
