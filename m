From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Sat, 20 Nov 2010 16:05:59 -0600
Message-ID: <1290290759.3000.10.camel@mulgrave.site>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
	 <20101014153931.GI24144@bombadil.infradead.org> <4CE04DCF.7040306@gmx.de>
	 <20101115195606.GA8332@bombadil.infradead.org>  <4CE8453C.5020106@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CE8453C.5020106@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-11-20 at 23:01 +0100, Helge Deller wrote:
> On 11/15/2010 08:56 PM, Kyle McMartin wrote:
> > On Sun, Nov 14, 2010 at 09:59:59PM +0100, Helge Deller wrote:
> >> I just got again a chance to boot up my b160L and 715/64 machines.
> >>
> >> Both broke due to the IRQ changes. I did reverted all of your IRQ
> >> patches (based on current Linus head branch) and now they boot
> >> again.
> >> Basically they just hang during the SCSI initialization (timeouts
> >> while detectings discs).
> >>
> >> So, there is something wrong for Lasi/GSC and Dino busses....
> >>
> >> Any idea?
> >>
> > No, but I'll take a look, it's probably something simple and stupid that
> > I missed. :/
> 
> I tried to look into it, but I'm somewhat lost.
> 
> This is what I get on my B160L.
> Same result btw on the 715/64.

The boot is just showing irq lost (so all the devices hang).

I've got it bisected to this commit on my C360:

commit ba20085c20f1c9e8af546dea6ad0efa421bdef32
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Wed Oct 13 21:00:55 2010 -0400

    parisc: lay groundwork for killing __do_IRQ

But I haven't found the fix yet ... the commit looks to be an equivalent
transformation.

James


