From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Sat, 9 Nov 2002 05:21:50 +0000
Message-ID: <20021109052150.T12011__2470.42333144254$1416621890$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <200211090451.UAA26160@baldur.yggdrasil.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: willy@debian.org, andmike@us.ibm.com, hch@lst.de,
	James.Bottomley@steeleye.com, linux-kernel@vger.kernel.org,
	mochel@osdl.org, parisc-linux@lists.parisc-linux.org
To: "Adam J. Richter" <adam@yggdrasil.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200211090451.UAA26160@baldur.yggdrasil.com>; from adam@yggdrasil.com on Fri, Nov 08, 2002 at 08:51:28PM -0800
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Nov 08, 2002 at 08:51:28PM -0800, Adam J. Richter wrote:
> My patch is a net deletion of 57 lines and will allow simplification
> of parisc DMA allocation.

57 lines of clean elegant code, replacing them with overly generic ugly
code and bloated data structures.  struct device is a round 256 bytes
on x86.  more on 64-bit architectures.

> in.  parisc can use the generic driver API without getting fat.

no.  it can't.

> Problems specific to the generic device API can be incrementally
> improved and nobody is treating it as set in stone.  I think the
> generic device API is close enough already so that it's worth porting
> to, even if future clean-ups will then require some small changes to
> the code that is ported to it.

Everyone's saying "ra!  ra!  generic device model!" without asking
what the cost is.  Don't you think it's reasonable that _as the most
common device type_, struct device should be able to support PCI in a
clean manner?  Don't you think that the fact that it fails to do so is
a problem?  Don't you look at the locks sprinkled all over the struct
device system and wonder what they're all _for_?

Don't get me wrong.  I want a generic device model.  But I think it's
clear the current one has failed to show anything more than eye candy.
Perhaps it's time to start over, with something small and sane -- maybe
kobject (it's not quite what we need, but it's close).  Put one of those
in struct pci_dev.  Remove duplicate fields.  Now maybe grow kobject a
little, or perhaps start a new struct with a kobject as its first member.

And, for gods sake, don't fuck it up by integrating it with USB too early
in the game.  Let's get it right for PCI, maybe some other internal busses
(i'm gagging to write an EISA subsystem ;-).  SCSI is more interesting
than USB.  Above all, don't fall into the trap of "It's a bus and it
has devices on it, therefore it must be a part of devicefs".

*sigh*.  halloween was a week ago.

-- 
Revolutions do not require corporate support.
