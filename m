Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA10104
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 15:54:48 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JYZDHCGXVO001OW1@macalester.edu> for
 parisc-linux@thepuffingroup.com; Tue, 16 Jan 2001 16:58:27 CDT
Date: Tue, 16 Jan 2001 16:57:00 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
To: parisc-linux@thepuffingroup.com
Message-id: <3A64D1BC3C8.29B5JCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: [parisc-linux] I'm having a couple problems
List-ID: <linux-parisc.vger.kernel.org>

Alright...

Now that I've been mucking around with the .5 image for a week, I
thought I would ask two questions to solve the riddles that I am butting
my head on...

1. After following the directions listed on
http://www.parisc-linux.org/install.html, then booting off the newly
created bootable hard drive...I'm left with a read only volume. 
Numerous reboots to the image, chmods, changing of fstab and such on the
hard drive...I still cannot install debian packages (I get errors about
a read-only volume...hey, isn't that why I changed fstab?)
How do I get _actual_ r/w access to the volume that the system boots
>from?

2. How do I set up the ethernet interface within parisc-linux?  I've
never done this manually (always let redhat and netbsd do it's thing).

Thank you,
 - Josiah
