Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from iport.rccl.com (unknown [63.103.130.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3F42482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 21:49:49 -0600 (MDT)
Received: from tpburner ([1.123.30.11]) by iport.rccl.com
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with SMTP id com for <parisc-linux@lists.parisc-linux.org>;
          Mon, 30 Jul 2001 23:47:03 -0400
Message-ID: <004b01c11973$ada28fd0$0b1e7b01@tpburner>
Reply-To: "Anthony Mori" <tonym@compusource.net>
From: "Anthony Mori" <tonym@compusource.net>
To: <parisc-linux@lists.parisc-linux.org>
References: <01073021344600.00877@localhost.localdomain>
Date: Mon, 30 Jul 2001 23:48:31 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] C180 problem
List-ID: <linux-parisc.vger.kernel.org>

Acquired a C180, couldn't get it to work at home, so figuring it was
a screen res problem, took it to work. Plugged it into a 20" IBM
monitor, no problem. Booted into HP-UX (as received) just fine.

In the BIOS, I turned fastboot off, then did a reset, and it never came 
up again.

Before I changed the Fastboot, When the machine was turned on,
LED's 2,3,4 were on briefly, then they went out, and LED 1 stayed on.
Then after a briedf pause, 2,3,4 would start flickering as if it was doing
something (which it was).

Now, 2,3,4 turn on briefly, then go out, and LED 1 turns on, and that's
it. Nothing else. No video, nothing (A4071B video card)

I've tried removing the video card, and the FDDI card, but still get the
same.


Any ideas? Anything else need to be done when fastboot is off, like
terminating external scsi port(s), ensuring ethernet is in, etc?? Or should
it still at least boot and give a BIOS message?

Machine config:

C180
256MB RAM
4.3GB Disk
CDROM
Floppy
A4071B Video card


Tony
