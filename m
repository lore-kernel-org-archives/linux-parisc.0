Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA27332
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 00:04:53 -0600
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id XAA12838
	for <parisc-linux@thepuffingroup.com>; Wed, 9 Jun 1999 23:04:47 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id XAA26654 for parisc-linux@thepuffingroup.com; Wed, 9 Jun 1999 23:04:43 -0700 (PDT)
Message-Id: <199906100604.XAA26654@meow.sr.hp.com>
Subject: [parisc-linux] booting problems (fwd)
To: parisc-linux@thepuffingroup.com
Date: Wed, 9 Jun 1999 23:04:43 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|SOFT Booted.
|"
|
|And then absolutely nothing.  The cute little heart on the front panel
|is stuck on. According to the inside of the top cover (oh, what a great
|place to put debug info), this means: "System board fault, HPMC or
|Unknown fault".  At this point I'm going for the third.
|
|Looks like we just need to compare a large chunk of the bootable binary
|to figure out what's happening.
|
|- Alex

Just a note about the "cute little heart".  Assuming that the A180 is like
the B180, there are 4 LEDs on the front.  During booting the BootROM
sends one nibble of the chassis code to those 4 LEDs.  WHen HP-UX is
running, the LEDs are written during the timer interrupt.  It's just
a memory mapped register, nothing fancy.  So unless someone has specifically
coded something into Linux to write to the LEDs, it would be the 
expected behavior that they would stay in the last state the BootROM
(or IPL) left them.

	-Bill (Hardware-R-Us) Katz
