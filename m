Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA04514
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Sep 1999 03:06:43 -0600
Date: Thu, 2 Sep 1999 11:08:31 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux-cvs] grundler
Message-ID: <19990902110831.I629@suse.de>
References: <199909012302.RAA04044@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909012302.RAA04044@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Sep 01, 1999 at 05:02:23PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 01, 1999 at 05:02:23PM -0600, grundler@puffin.external.hp.com wrote:
> Update of /home/cvs/parisc/linux/drivers/gecko
> In directory puffin.external.hp.com:/tmp/cvs-serv4014/linux/drivers/gecko
> 
> Modified Files:
> 	dino.c 

okay, let's go through the changes here too:

 - strange STATIC define with a comment about "performance" kernels.

I don't see the point.  Is there one ?

 - use of irq_t all over the place

I don't mind this, but it really doesn't matter and just using int has the
advantage of still being able to printk it.

 - Dino-specific IRQ management

As far as I am concerned, there is no way I want to have 5 different IRQ
managements in the kernel.  It is not needed, the performance loss is minimal,
I don't see any other advantages to it.  (I just skipped that code so you don't
get all my complaints)

 - #if 0-ing out dino_walk_bus

remove it.  we really don't need any #if 0 bodies swimming around our trees.

 - check for potentially defect Dino chips

Nothing negative I can say about that

 - +** TODO: Dino needs a method to look at and possibly "claim" GSC devices.

it's what you #if 0-ed out. (
        struct gsc_dev *dev = gsc_devices;

	while(dev = dev->next) {
		if(is_dino(dev)) {
			blah blah 
		}
	}
).

 - split dino init into two parts

I don't see the point.

 - changes to dino_config_write_byte aso (renaming them in the process)

Is this for supporting more than one PCI bus via pci-to-pci bridges ?
looks unnecessary to me, but I really don't know


 - +** Performance is going to stink if drivers use I/O port instead
   +** of MMIO.

This is not Dino-specific.

 - use of readb aso instead of gsc_readb aso

gsc_readb is there for a reason.

	Philipp Rumpf
