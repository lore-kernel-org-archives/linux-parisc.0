Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA26366
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 09:48:43 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 16:51:42 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 20 Dec 2000 16:51:40 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A40E44D.DBBE58A2@linuxcare.com>
Date: Wed, 20 Dec 2000 11:54:37 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
References: <3A3F82E0.C0FB63D6@linuxcare.com> <200012200256.SAA16519@milano.cup.hp.com> <20001220155045.A19376@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> The chip is so b0rken that it doesn't put its irq number in the standard
> register -- reads return 0.  So the quirk code I wrote pulls the irq
> number from a different register on the chip -- which i now believe to
> be incorrect.

I don't think that's right either...  register 6B is an IDE interrupt
routing register, not the interrupt itself.

If the iosapic system is supposed to remap the register, I don't think
it is and I don't know where this is supposed to happen.  I hope we can
do all of this using just a PCI quirk.

> i'd like to see this code too.  why not commit it to the tree?  it's not
> like it works at the moment and things would get broken.

I've committed it, and it definitely does not work, but I don't think
it'll break anything either.  This is mostly mkp's code.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
