From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Tue, 8 Feb 2011 22:59:22 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102082257470.31804@localhost6.localdomain6>
References: <20110206204411.109238550@linutronix.de>  <1297094535.8577.3.camel@mulgrave.site>  <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6>  <1297100168.8577.42.camel@mulgrave.site>  <alpine.LFD.2.00.1102071924150.31804@localhost6.localdomain6>
  <1297113986.8577.92.camel@mulgrave.site>  <1297125136.8577.113.camel@mulgrave.site>  <alpine.LFD.2.00.1102081518420.31804@localhost6.localdomain6>  <alpine.LFD.2.00.1102081536080.31804@localhost6.localdomain6>  <1297183997.3088.72.camel@mulgrave.site>
 <alpine.LFD.2.00.1102081841180.31804@localhost6.localdomain6> <1297187138.3088.82.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1297187138.3088.82.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 8 Feb 2011, James Bottomley wrote:

> On Tue, 2011-02-08 at 18:42 +0100, Thomas Gleixner wrote:
> > On Tue, 8 Feb 2011, James Bottomley wrote:
> > > On Tue, 2011-02-08 at 15:37 +0100, Thomas Gleixner wrote:
> > > > Gah. You set it indirect via IRQF_PERCPU with setup/request_irq.
> > > > 
> > > > Staring too long into that code makes my brain fuzzy.
> > > 
> > > Yes ... know the feeling over the years trying to keep up with the
> > > various irq schemes.  Got to say, it's a lot easier now: The way parisc
> > > chips accept interrupts is essentially MSI.  Trying to live in the old
> > > world modelled on the x86 PIC wasn't fun.
> > > 
> > > So did you want me to roll all the fixes together and apply them, or is
> > > there something else that needs to happen?
> > 
> > All yours. You might want to split out the CHECK... bugfix first.
> 
> Good idea ... you authorise me to do the split and add your
> signed-off-by?

Yup.
 
> > There will be some minor follow up changes, but they depend on code
> > which I'm going to push soon.
> 
> OK ... we'll wait for those.  I'll plan this for the next merge window.

Push the current lot out. The minor changes will probably come after
all the stuff hit linus tree in the 39 merge window.

Thanks,

	tglx
