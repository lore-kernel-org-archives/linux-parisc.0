From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Mon, 07 Feb 2011 11:36:08 -0600
Message-ID: <1297100168.8577.42.camel@mulgrave.site>
References: <20110206204411.109238550@linutronix.de>
	 <1297094535.8577.3.camel@mulgrave.site>
	 <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2011-02-07 at 17:53 +0100, Thomas Gleixner wrote:
> On Mon, 7 Feb 2011, James Bottomley wrote:
> 
> > On Sun, 2011-02-06 at 20:45 +0000, Thomas Gleixner wrote:
> > > The following series converts parisc to the new irq_chip functions and
> > > sets GENERIC_HARDIRQS_NO_DEPRECATED. Compile tested only.
> > 
> > You don't really need one patch per file in the irq function changes do
> > you? ... unless you're being rechristened Joe Perches ...
> 
> WTF ? It's damn easier to review and make sure that you did not miss
> anything that way. That's not a 100 patches series doing spelling
> fixes or other trivial shite.
> 
> Feel free to bulk apply them, I don't care. Next time I'm going to
> ignore parisc and just mark it broken, then you can fix it up yourself
> as you like.

sorry, outgoing humour filter stopped picking up .de addresses for some
reason ... I've fixed it ...

> > I can't get the last patch to apply ... it looks like there are lots of
> > other Kconfig changes besides the one liner it does; what's missing?
> 
> Tested it against -next as well, had to fix up crap there and sent out
> that queue instead the one against linus.

Actually, you'll be pleased to hear this was entirely my fault:  The irq
branch of the parisc tree wasn't where I thought it was (it was about a
month behind.

There's some problem in arch/parisc/kernel.c it's giving me undefined
references to irq (oh and some easily fixed compile issues).  I'll see
if I can sort it out and get back to you.

> Yours grumpy,

Well, I'd like to be happy ... but I guess after the git cockup I'll
have to settle for dopey.

James


