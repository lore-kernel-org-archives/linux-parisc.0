Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2377D482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 08:40:43 -0600 (MDT)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GLEORJ01.782 for
          <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 06:40:31 -0800
Date: Thu, 18 Oct 2001 06:31:18 -0800 (AKDT)
From: Tom <palinux@alaskatech.org>
To: Matthew Wilcox <willy@debian.org>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
In-Reply-To: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.33.0110180623430.23109-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 10 Oct 2001, Matthew Wilcox wrote:
> Anyone want to review a patch that makes EISA work?  I've only
[snip]
> I seem to have chosen a not-quite-supported EISA card to test with.
> The ID is plausible, so I don't think it's a byteswapping issue or
> anything.

Okay - I just brought things up with -pa61 and get the same errors about
commands not finishing when DHCP tries to use the 3c597 EISA NIC. However,
I scrounged up a static IP, plugged it in, and brought it online. It
*appears* to take the IP and work fine, but I get console errors that
various hexadecimal commands aren't finishing, then a comment that
"perhaps IRQ3 isn't available?" I also can't find a config program to try
resetting the card's IO etc. info - 3c5x9config from stable doesn't appear
to like the HP and I don't have an EISA-based PC to use the DOS utils
on...

Anyone have any ideas? Or, perhaps I can use the DOS utils (if I find an
EISA PC) and set the card to something that -pa61 detects, so they match?
