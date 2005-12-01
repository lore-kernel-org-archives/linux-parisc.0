From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] FLT CBFB on B1000 when accessing second graphics
	card
Date: Thu, 1 Dec 2005 00:06:12 -0500
Message-ID: <20051201050612.GA30663@tachyon.int.mcmartin.ca>
References: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
	<200511301224.39435.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200511301224.39435.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 30, 2005 at 12:24:39PM -0700, Bjorn Helgaas wrote:
> I don't follow parisc development enough to know whether this
> scenario is supposed to work.  Based on what I do know about
> HP chipsets and the ia64 kernel, I expect this to fail for the
> following reason:
>
[Executive summary: No, using X to do any hardware programming is
 definitely going to fail spectacularly]

Iirc when I brought up doing this a few months ago, Grant mentioned
that this feature of the chipset (I don't recall whether it was
Astro or Elroy offhand) was broken/untested for the parisc based
revisions of the chip until some later version.
 
> When you have two video cards in the system, HP chipsets route those
> ranges to one card or the other, not both.  So my guess is that X
> is either trying to use the second card uninitialized, or it is
> trying to emulate the option ROM on the second card, and the MMIO
> or IO port accesses done by the option ROM code are being routed to
> the primary card.
>

At the moment, there's absolutely no support for legacy VGA
registers. Legacy IO port accesses will likely timeout doing an access
to the PCI bus behind rope0. Legacy VGA mmio will, uh, do something
funny.

Firmware probably (I say probably instead of 'definitely' because I'm
in no position to know for certain) doesn't do anything at all with a
VGA card, as none of the supported graphics cards do legacy VGA.

The best thing to do is to not use an X driver, and hope the framebuffer
driver can initialize the card without legacy VGA accesses. Browsing
random popular PC graphics cards framebuffer drivers, I would speculate
that an nVidia PCI card would work, as they appear to do all programming
via proper mmio. Whether the nvidiafb driver supports a card that has
not been initialized by firmware is anyone's guess, I don't have one
to test with. (And I'm more interested in making the Visualize FX series
work).

> Bad things will happen in either case.
> 

> I have code for ia64 that makes this work, and it should be fairly
> easy to port to parisc.  It works by reprogramming the chipset to
> route the VGA MMIO and IO port resource to the appropriate card.
> There are a few related X server changes, too.
> 
> This is a bit of a work-in-progress, but I'll attach the current
> ia64 kernel patch so you can get an idea of what I'm doing.
> 

Thanks! If I can scrounge some time over holidays I'll investigate
if there's a possibility of this working on parisc.

> Bjorn
>

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
