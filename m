Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA25464
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 09:04:41 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 16:07:34 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 148lVt-0005Xe-00; Wed, 20 Dec 2000 15:50:45 +0000
Date: Wed, 20 Dec 2000 15:50:45 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alex deVries <adevries@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
Message-ID: <20001220155045.A19376@parcelfarce.linux.theplanet.co.uk>
References: <3A3F82E0.C0FB63D6@linuxcare.com> <200012200256.SAA16519@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012200256.SAA16519@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Dec 19, 2000 at 06:56:32PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 19, 2000 at 06:56:32PM -0800, Grant Grundler wrote:
> Why are you reading this out of a register? Which register?

The chip is so b0rken that it doesn't put its irq number in the standard
register -- reads return 0.  So the quirk code I wrote pulls the irq
number from a different register on the chip -- which i now believe to
be incorrect.

> IIRC, function 0 and 2 *should* return 0 in INTERRUPT_PIN configuration
> register and thus the INTERRUPT_LINE configuration as well.
> But since IOSAPIC driver (when invoked by LBA PCI code) munges the
> INTERRUPT_LINE contents and puts the virtualized IRQ number in 
> dev->irq for the drivers consumption, superio driver should
> not be reading these configuration registers.

That's OK, at least for the code I wrote, the quirk code is called in the
right place (ie before the iosapic code gets its hands on it) that if it can
find the right value and poke it back into dev->irq, the iosapic virtualising
code will deal with it correctly.

> If what I wrote above doesn't make any sense, tell me where to
> to find the code you are talking about and I can look at it.

i'd like to see this code too.  why not commit it to the tree?  it's not
like it works at the moment and things would get broken.

-- 
Revolutions do not require corporate support.
