Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA14864
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 15:22:02 -0600
Received: from localhost (proskin@localhost)
	by sunapee.transcept.com (8.9.3/8.9.3) with ESMTP id RAA12114
	for <parisc-linux@thepuffingroup.com>; Wed, 24 May 2000 17:22:46 -0400
Date: Wed, 24 May 2000 17:22:46 -0400 (EDT)
From: Pavel Roskin <pavel_roskin@geocities.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0005241559150.11687-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Serial support in IPL
List-ID: <linux-parisc.vger.kernel.org>

Hello!

I'm completely new to PA/Linux and I'm not subscribed to the list, so
excuse me my dummy questions.

I've got C160L without monitor. I also don't know how to connect the
console. There is a connector "HP-HIL" which is somewhat similar to RJ-45,
but I don't know the wiring, and I'm not sure if it's the PDC console.

If the hard drive is connected, I don't see anything interesting except a
packet on the ethernet interface containing words:

HP LAN loop back test packet. LAN2 driver version 1

If I disconnect the drive, the box sends a bootp request and then a tftp
request. I can feed it with the linux kernel, but I see nothing on the
serial port.

If I use a fake kernel it is requested only once. The real kernel is
requested two or three times. I believe, this means that IPL actually
tries to "rewind" tftp to get the kernel.

I'm affraid that I need a version of IPL with serial console support to
get any further. ipl_c.c contains encouraging words:

 * Revision 1.24 1999/10/15 19:30:30 deller
 *
 * The serial console works now !

But it is just revision 1.3 in the anonymous CVS. There must be historic
versions with serial support using different revision numbering, right?

Can anybody build a kernel with the serial support at least in IPL
(ideally, in the kernel too)? Thank you in advance.

Regards,
Pavel Roskin
