Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA20936
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Feb 2000 19:53:12 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12HGp0-0027YHC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sun, 6 Feb 2000 02:49:06 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Received: (from tsbogend@localhost)
	by alpha.franken.de (8.8.7/8.8.5) id CAA03158
	for parisc-linux@thepuffingroup.com; Sun, 6 Feb 2000 02:46:51 +0100
Date: Sun, 6 Feb 2000 02:46:51 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000206024651.B3143@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Tulip driver
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've checked in a new tulip driver, which works for me on the onbard tulip
of the A180. I've tried to use Donald's latest driver (0.91x), but this
driver needs some pci infrastructure, which isn't available in our 2.3 tree,
yet. So I ported the 2.2.14 driver and added cache flushes. Before
that I've added the cache flushes to tulip 0.91x, so whenever we update
our tree, I should have an updated tulip very quick.

The 2.2.14 tulip didn't like the SROM provided by the onboard tulip,
because it didn't provide information about the attached phy (and the
default media is in the wrong endian, but that isn't a big problem).
I fixed that by just not allocating a media table, which works in
my case. It's possible that this may break later. The SROMs of the
tulips behind the card mode dino are looking stranger, they seem
to be from a time before Digital released a sane SROM documentation
and might confuse the driver as well. But since the machine hangs,
when the driver tries to probe the second tulip on the card, this
isn't an issue, yet.

I'm now looking into getting nfs root working.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
