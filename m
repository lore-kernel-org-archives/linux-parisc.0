Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailproxy.de.uu.net (mailproxy.de.uu.net [192.76.144.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54AD0482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 05:41:02 -0600 (MDT)
Received: from hedd.de (1cust-27.au1.dd.de.alter.net [149.228.0.27] (may be forged))
	by mailproxy.de.uu.net (5.5.5/5.5.5) with ESMTP id NAA20156
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Aug 2001 13:41:00 +0200 (MET DST)
Received: from hedd.de (nt10 [192.168.0.110])
	by hedd.de (8.9.3/8.9.3) with ESMTP id MAA04741
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Aug 2001 12:25:01 +0200
Message-ID: <3B693F62.E1E701F7@hedd.de>
Date: Thu, 02 Aug 2001 13:54:10 +0200
From: Martin Eisfeld <me@hedd.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with Installing of 0.9.2 on HP 715/100
List-ID: <linux-parisc.vger.kernel.org>

Hello everyone,
I have a big proplem of installing PA-RISC Linux 0.9.2 on a HP9000 Model
715/100.

I have downloaded the cd-image palinux-0.9.2.iso.gz from
parisc-liux.org, i have decompressed it with gzip on a linux-machine and
burned it with Nero 5.5 on a NT-machine.

When i poweron the hp, i press ESC until i'm in the boot-admin-menu.
Therefrom i boot with
'boot scsi.2.0' (the scsi-id of the cd-rom is 2)
from the cd.

Then a window comes which says
"Attempting to boot."
Then the cd boots. There are lots of different messages.
One warning comes:
"warning: Kernelname doesn't end with 32 or 64"

After that, other messages came on my screen.
The last message is:
"Set default PSW W bit to 0".

Then the the maschine reboots.

I have tried to boot the cd on to different hp9000 model 715/100. The
result is everytime the same.
Bye,
Martin Eisfeld
