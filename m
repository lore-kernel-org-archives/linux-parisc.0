Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: "Adam J. Richter" <adam@yggdrasil.com>,
	James.Bottomley@steeleye.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 09 Nov 2002 03:46:12 GMT." <20021109034612.S12011@parcelfarce.linux.theplanet.co.uk>
References: <200211090128.RAA31693@adam.yggdrasil.com> <adam@yggdrasil.com> <20021109015611.571B44829@dsl2.external.hp.com>  <20021109034612.S12011@parcelfarce.linux.theplanet.co.uk> 
Date: Sat, 09 Nov 2002 10:02:06 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021109170206.DA635482A@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> On Fri, Nov 08, 2002 at 06:56:11PM -0700, Grant Grundler wrote:
> > They don't have PCI slots.
> > I hedge because HP makes a "card-mode Dino" type of card that will
> > fit into 715 which has a GSCtoPCI bus controller on-board along
> > with the target PCI device (eg 21143 tulip)
> 
> Sorry Grant, HP marketing has confused you ;-).  715/33, 715/50 &
> 715/75 have a PCX-T processor (can't do uncached pages), but don't have
> a GSC slot.

ok - well, that's why I pointed at the PCX-[ST] HWDB pages.

> The only machines with GSC and non-coherent memory are the T class
> (unsupportable..) and something like an F, G, H or I class with
> a GeckoBOA adapter... and we
> aren't claiming support for those either.

Right. I'm convinced support for V-class (PCI, IO Coherent) will happen
before T-class (propritary busses, !IO-coherent). Later FGHI-class also
use PCX-L CPU and thus should be ok. rbrad, christoph and a few others
are working on support for those machines but I know SCSI on those
machines is SPIFI-based (HP SCSI controller). In short, looks like
your observations about 53c720 might be one of the few problematic
drivers.

thanks,
grant
