Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6916482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 09:08:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15uEmT-0000Xx-00; Thu, 18 Oct 2001 16:08:21 +0100
Date: Thu, 18 Oct 2001 16:08:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: Tom <palinux@alaskatech.org>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011018160821.C25234@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.33.0110180623430.23109-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110180623430.23109-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Thu, Oct 18, 2001 at 06:31:18AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 18, 2001 at 06:31:18AM -0800, Tom wrote:
> Okay - I just brought things up with -pa61 and get the same errors about
> commands not finishing when DHCP tries to use the 3c597 EISA NIC. However,
> I scrounged up a static IP, plugged it in, and brought it online. It
> *appears* to take the IP and work fine, but I get console errors that
> various hexadecimal commands aren't finishing, then a comment that
> "perhaps IRQ3 isn't available?" I also can't find a config program to try
> resetting the card's IO etc. info - 3c5x9config from stable doesn't appear
> to like the HP and I don't have an EISA-based PC to use the DOS utils
> on...

3c597 isn't going to work until someone (probably me...) gets EISA DMA
working.  That depends on getting consensus for how to implement the pci_*
host DMA mapping support (which I think we have now).  Implementing it
is going to depend on some changes such as the iotree.  rbrad & I have
been working on that, and I think we're close to getting finished.

-- 
Revolutions do not require corporate support.
