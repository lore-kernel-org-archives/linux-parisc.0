Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA28676
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 May 2000 17:41:41 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by palrel1.hp.com (Postfix) with SMTP id 0EF4629A22
	for <parisc-linux@puffin.external.hp.com>; Fri,  5 May 2000 15:54:43 -0700 (PDT)
Sender: xam@mailserv2.iuinc.com
Message-ID: <39135191.83F05FBD@ngi.de>
Date: Sat, 06 May 2000 00:56:17 +0200
From: "M. Grabert" <xam@ngi.de>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] some questions ...
List-ID: <linux-parisc.vger.kernel.org>

hi all,

I want to test linux/HPPA.
I have one HP9000/800/F10 (16MB RAM), but it has
unfortunately no gfx and no network interface card.
Now I also got a HP9000/730 (32MB RAM, CRX-Graphics)
with an integrated network interface card.

Since I want/have to mount the (linux-)boot partition via
nfs, I can only use the "King Cobra" HP9000/730.

But as I wanted to test the network card, I recognized that it
does not work properly; but I don't now wether it is my fault
or not ...

I'm using HP/UX  10.10 (I know that this mailing list is for
linux/HPPA, but since I can't use the network, I don't know
if I can use the machine for linux/HPPA testing) and
configured a 192.168.0.0 net (class C).
The workstation is connected via BNC, but I seems that there
is no link. (ping was hanging, and when i used "arp -s", ping
said that there is some probably some link/carrier problem)
And the light on my hub is not blinking, either.

The same routing table (just loopback, no default gateway)
is working for my XTerminal (RX700) and my linux/ix86 computers.

Perhaps the computer was connected via AUI before,
and I don't know how to change between AUI/BNC.
Is there a dip switch/jumper/software configuration thing ?
I didn't see anything in "SAM", but perhaps there is something for the
CLI ?

I configured the network interface to use Ethernet Frames,
(other possible configuration is IEEE803.2/Ethernet and IEEE803.2).
Is this the possible source of error ?



is there something I have to be aware of when testing linux/HPPA ?
Is it just getting the linux-kernel, booting it and mount the rest
via nfs ?


thanks in advance, max
