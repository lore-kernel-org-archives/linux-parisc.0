Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA03470
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Nov 2000 20:57:00 -0700
Received: from localhost by herald.cc.purdue.edu with ESMTP for parisc-linux@thepuffingroup.com; Sat, 11 Nov 2000 22:58:57 -0500
Date: Sat, 11 Nov 2000 22:58:57 -0500 (EST)
From: Brian Poole <rajak@purdue.edu>
Reply-To: rajak@cerias.purdue.edu
To: parisc-linux@thepuffingroup.com
Message-Id: <Pine.SOL.4.21.0011112248330.10852-100000@herald.cc.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Problems booting new beta CD
List-ID: <linux-parisc.vger.kernel.org>

Hello,

My machine is a 715/80 with 88M of RAM, 1G HD, external 4x CD drive &
floppy.

Trying to get the new palinux CD working on my 715/80 here and not having
too much success. Did get the CD to actually boot, but after all the
normal Linux init messages (which were very nice to see btw,
congratulations on how far it has already gotten ;) it stops at 'Switching
from PDC console'. 

Looking thru the FAQ I saw a somewhat similar question, in that it had
'pdc' in it & was booting from the CD (but the 0.1 CD, not the one I am
using), that said the kernel on the CD booted from/to the
serial console. Is this also true of the 0.5 CD? If so, what is necessary
to boot one of these from console? I've been fooling with it to no
success.. I have it automatically booting from the CD, but it doesn't
actually boot. I replug in the monitor & keyboard and find that it can't
boot without the keyboard ('Failed to initiliaze a keyboard\n SYSTEM 
HALTED').. How am I supposed to boot to the console if I can't boot w/o a
keyboard? I imagine if it has a keyboard it will boot to the screen like a
Sun.

Thanks for the help,

-b
