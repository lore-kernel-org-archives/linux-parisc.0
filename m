Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA30378
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 17:06:08 -0700
Received: from localhost (funnyguy@localhost)
	by morph.net (8.9.3/8.9.3) with ESMTP id SAA02087
	for <parisc-linux@thepuffingroup.com>; Tue, 28 Mar 2000 18:01:18 -0500
Date: Tue, 28 Mar 2000 18:01:18 -0500 (EST)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10003281748330.2059-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] using lan to boot
List-ID: <linux-parisc.vger.kernel.org>


i played with the 735/125 we have here, and i can't get it to sent any
packets.  it has no HD right now.  using snoop to monitor network traffic,
we looked to its hardware address.  no luck.  to go the hardware address,
i type hrdw_addr os something at the boot prompt?  we used that HW
address.  typing "boot lan.<servershwaddr>.0.0" makes the boot fail.  and
there is no network traffic from that machine.  when the computer searches
for bootable devices, it only sees P0 which is the floppy.  It prints out
liek 5 lines of numbers...  000000 000000 000050 etc...  it says boot
failed and stuff and INIT_ENTRY = -7.  could anyone explain.  we're
perflexed whay lan won't send anything.  the externet adapter is flashing
the Tx light though.

i've got an image prefared, and now i just need to boot to it.

mike
