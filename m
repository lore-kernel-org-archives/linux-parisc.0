From: Greg KH <greg@kroah.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Fri, 8 Nov 2002 22:03:42 -0800
Message-ID: <20021109060342.GA7798__6331.3384810046$1416621890$gmane$org@kroah.com>
References: <200211090451.UAA26160@baldur.yggdrasil.com> <20021109052150.T12011@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021109052150.T12011@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Nov 09, 2002 at 05:21:50AM +0000, Matthew Wilcox wrote:
> 
> Everyone's saying "ra!  ra!  generic device model!" without asking
> what the cost is.  Don't you think it's reasonable that _as the most
> common device type_, struct device should be able to support PCI in a
> clean manner?

No I do not.

> Don't you think that the fact that it fails to do so is a problem?

Yes I do.

> Don't you look at the locks sprinkled all over the struct device
> system and wonder what they're all _for_?

Nope :)
(yes, I do wonder, and yes, they will be cleaned up...)

> Don't get me wrong.  I want a generic device model.  But I think it's
> clear the current one has failed to show anything more than eye candy.
> Perhaps it's time to start over, with something small and sane -- maybe
> kobject (it's not quite what we need, but it's close).  Put one of those
> in struct pci_dev.  Remove duplicate fields.  Now maybe grow kobject a
> little, or perhaps start a new struct with a kobject as its first member.

No, lets start pulling stuff out of pci_dev and relying on struct
device.  The reason this hasn't happened yet is no one has been willing
to break all of the PCI drivers, yet.

I know Pat is going to be doing this soon, and if he doesn't get to it,
I will.  But as Adam said, don't throw away the idea because it looks
crufty now.  This has been a _constantly_ evolving model as we work to
get it right.  It will take time, and we are still getting there.

> And, for gods sake, don't fuck it up by integrating it with USB too early
> in the game.

In my defense, USB was the _only_ bus willing to step up and try to do
the integration to work the initial kinks out.  The SCSI people are
being drug kicking and screaming into it, _finally_ now (hell, SCSI is
still not using the updated PCI interface, those people _never_ update
their drivers if they can avoid it.)

> Let's get it right for PCI, maybe some other internal busses
> (i'm gagging to write an EISA subsystem ;-).  SCSI is more interesting
> than USB.  Above all, don't fall into the trap of "It's a bus and it
> has devices on it, therefore it must be a part of devicefs".

Sure SCSI's more interesting, to you :)

By having USB be one of the first adopters (after PCI), we have found a
_lot_ of issues and bugs that happened due to devices showing up and
disappearing at odd times.  Which was _much_ easier to debug than PCI
would have been.  SCSI can't even do hotplug devices _yet_.  How would
we have debugged this stuff then?

And yes, USB belongs in the model, if for no other reason, that "it's a
bus and it has devices on it" :)

> *sigh*.  halloween was a week ago.

Patches for this stuff are going to be happening for quite some time
now, don't despair.

And they are greatly appreciated, and welcomed from everyone :)

thanks,

greg k-h
