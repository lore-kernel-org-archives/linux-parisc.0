From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Sun, 21 Nov 2010 11:26:49 -0600
Message-ID: <1290360409.3017.4.camel@mulgrave.site>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
	 <20101014153931.GI24144@bombadil.infradead.org> <4CE04DCF.7040306@gmx.de>
	 <20101115195606.GA8332@bombadil.infradead.org> <4CE8453C.5020106@gmx.de>
	 <1290290759.3000.10.camel@mulgrave.site>
	 <20101121002531.GL22651@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101121002531.GL22651@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-11-20 at 19:25 -0500, Kyle McMartin wrote:
> On Sat, Nov 20, 2010 at 04:05:59PM -0600, James Bottomley wrote:
> > commit ba20085c20f1c9e8af546dea6ad0efa421bdef32
> > Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
> > Date:   Wed Oct 13 21:00:55 2010 -0400
> > 
> >     parisc: lay groundwork for killing __do_IRQ
> > 
> > But I haven't found the fix yet ... the commit looks to be an equivalent
> > transformation.
> > 
> 
> The only obvious thing that jumps out is that... no, set_irq_chip
> doesn't look to be doing anything awry.
> 
> But it must be something between what a 'raw' irq_desc looks like, and
> what the helpers initialize them to.

Actually, that all seems to be working.  I've traced the sym interrupt
through with a bunch of printks.  The CPU dino interrupt correctly
triggers.  It calls dino_isr which gets the right dino device and
correctly translates the pending interrupt to the right irq number (23)
in my case.  It looks like generic_handle_irq() (in dino_isr()) doesn't
call the handler, or the handler is somehow ineffective (it takes ages
to loop around and retry with the mask still pending).  That looks nuts
to me because it should be simply calling parisc_do_IRQ which is a
wrapper for the original do_IRQ ... so this should be equivalent.
Unfortunately getting on a 'plane soon and I have no access to a
remotely controllable dino system, so that's probably it for me on the
debugging front.

James


