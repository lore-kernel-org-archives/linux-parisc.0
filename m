Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA26959
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 23:07:19 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id BAA17654
	for <parisc-linux@thepuffingroup.com>; Thu, 10 Jun 1999 01:07:59 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <375F482D.E1E0B53D@thepuffingroup.com>
Date: Thu, 10 Jun 1999 01:07:57 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] booting problems
List-ID: <linux-parisc.vger.kernel.org>


Okay, I've committed a couple of fixes to make the building of the
bootable image go a bit smoother.  Thanks to John for his patch that
doesn't require /dev/zero existing to create the sparse file.

And now it passes the LIF magic and checksum, and dies.  Here's a
hand-typed copy of the console:

"
Main Menu: Enter command > boot p2
Interact with IPL (Y, N, or Cancel)?> n

Booting...
Network Station Address 001039-037944
System IP Address 192.168.1.56
Server IP Address 192.168.1.52

Boot IO Dependant Code (IODC) revision 2


SOFT Booted.
"

And then absolutely nothing.  The cute little heart on the front panel
is stuck on. According to the inside of the top cover (oh, what a great
place to put debug info), this means: "System board fault, HPMC or
Unknown fault".  At this point I'm going for the third.

Looks like we just need to compare a large chunk of the bootable binary
to figure out what's happening.

- Alex
