Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE112482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 13:27:03 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GLBCP200.UMK for
          <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 11:27:02 -0800
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GLBCP202.Z38 for <parisc-linux@parisc-linux.org>; Tue, 16 Oct
          2001 11:27:02 -0800
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA20938
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 11:17:59 -0800
Date: Tue, 16 Oct 2001 11:17:59 -0800 (AKDT)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
In-Reply-To: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.33.0110161110310.20693-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 10 Oct 2001, Matthew Wilcox wrote:
> Anyone want to review a patch that makes EISA work?  I've only
> tested it on a 715/75 with a Mongoose chip; but Wax is
> supposed to be programmatically identical.  The patch is
> 18k, so rather than post it to the list, it's available from
> ftp://puffin.external.hp.com/pub/parisc/src/eisa.diff

I've updated my 715/100 to -pa57, which gives me startup messages that the
Mirage Was EISA BA is recognized. I plugged in a 3Com 3c597 NIC as a test
card; what I get from the PDC is that an unconfigured EISA card is in and
it'll ignore it, then on boot the NIC is seen as eth0. Unfortunately, when
DHCP tries to pull an address, I get errors that command 0x5800 and 0x2804
didn't complete (twice as a pair), plus a 0x3002 didn't complete when the
DHCP request is sent. Never does pull an IP, but does show as up and
active on eth0. Tonight I'm going to try plugging a static IP into it and
see what happens...

If someone working this wants some dmesg output or anything feel free to
holler...
