Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA13401
	for <parisc-linux@puffin.external.hp.com>; Sun, 24 Dec 2000 02:41:34 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 24 Dec 2000 09:44:40 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14A75U-0003Or-00; Sun, 24 Dec 2000 09:05:04 +0000
Date: Sun, 24 Dec 2000 09:05:04 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
Message-ID: <20001224090504.A11676@parcelfarce.linux.theplanet.co.uk>
References: <20001220155045.A19376@parcelfarce.linux.theplanet.co.uk> <200012201824.KAA17332@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012201824.KAA17332@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Dec 20, 2000 at 10:24:36AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 20, 2000 at 10:24:36AM -0800, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > That's OK, at least for the code I wrote, the quirk code is called in the
> > right place (ie before the iosapic code gets its hands on it) that if it can
> > find the right value and poke it back into dev->irq, the iosapic virtualising
> > code will deal with it correctly.
> 
> It won't. I just checked. :^(
> 
> lba_fixup_bus() invokes iosapic_fixup_irq() for each PCI device.
> iosapic_fixup_irq() invokes iosapic_xlate_pin() to locate both the
> INTERRUPT_LINE and parent IOSAPIC. xlate_pin reads the INTERRUPT_PIN
> and *ignores* the INTERRUPT_LINE. This behavior has to remain in order
> to support PAT PDC platforms (which do not initialize the PCI device).

To my mind, we're doing this backwards.  What the current code tries to do
is recover from a situation where the generic PCI code has been run over
a bus which hasn't been configured by the POST -- and in the process we
lose any work done by the quirk code.  What I _think_ we should be doing
instead is doing our own run over the PCI bus first before the generic
code gets a look at it, and sorting out the interrupt routing there.
Then we can write the appropriate values into INTERRUPT_LINE, which the
generic PCI bus scan code will pick up and the quirk code will propogate
it into the other functions.

> I doubt we can use pci_quirks to fixup the dev->irq.
> I've proposed to Alex to use a "bus devices" scheme (a' la LASI).
> So some "central" code will manage IRQ routing for devices below suckyio.
> I.e. suckyio will have it's own IRQ region and collectively manage
> all three PCI functions as "one device".

We can do that.  But we don't _need_ to, all these devices are capable of
sharing one IRQ without further interrupt decoding being done.  I'm not
sure we want to do it -- extra latency and more code versus more interrupt
handers being called.

-- 
Revolutions do not require corporate support.
