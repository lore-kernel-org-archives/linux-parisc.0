Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA00451
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 04:34:50 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 26 Dec 2000 11:37:58 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Arjq-0008Md-00; Tue, 26 Dec 2000 10:53:50 +0000
Date: Tue, 26 Dec 2000 10:53:50 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
Message-ID: <20001226105350.A29860@parcelfarce.linux.theplanet.co.uk>
References: <20001224090504.A11676@parcelfarce.linux.theplanet.co.uk> <200012260716.XAA21626@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012260716.XAA21626@milano.cup.hp.com>; from grundler@cup.hp.com on Mon, Dec 25, 2000 at 11:16:24PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 25, 2000 at 11:16:24PM -0800, Grant Grundler wrote:
> INTERRUPT_PIN is zero for function 0 and 1. And according to PCI spec,
> suckyio function 0 and 1 can't won't generate interrupts regardless
> of what's in INTERRUPT_LINE.
> I don't want to write/modify/support code that implies otherwise.

I thought it was understood that this device was not PCI-conforming?
That it did generate interrupts for functions 0 and 1.  Could we nail
down exactly _how_ this device generates interrupts for the serial & ide
ports?  I can see a few possibilities:

(1) They are only generated on the CPUINT pin.
(2) They're generated on INTD# just like USB is
(3) They're routable to other PCI pins within the device (i doubt it,
    i can't see any hint of this in the spec).
(4) The interrupts are generated but they're not routed to anywhere the
    cpu will ever get notified about, so we have to use a polling driver.
    This would seriously suck.

if it's (1), what is CPUINT tied to?  does it have its own connection to
the IOSAPIC?  Is it connected to the PCI bus somehow?

> We'll end duplicating much of what's in the generic PCI code basically.
> You can understand why I might be less than enthusiastic about this idea.

Yes.  OK, better idea: we can do the quirk fixup in the PCI_FIXUP_FINAL
pass instead of the PCI_FIXUP_HEADER pass.  This is called after the bus
fixup code has set ->irq.  Of course, this might be completely the wrong
thing to do... I really need to know the answer to the above question.

-- 
Revolutions do not require corporate support.
