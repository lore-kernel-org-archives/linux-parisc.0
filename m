Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA17802
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 15:54:08 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JZ25Q8UOAM001RYF@macalester.edu> for
 parisc-linux@thepuffingroup.com; Thu, 18 Jan 2001 16:48:56 CDT
Date: Thu, 18 Jan 2001 16:47:28 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
To: parisc-linux@thepuffingroup.com
Message-id: <3A677280148.B3CFJCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: [parisc-linux] /proc problems
List-ID: <linux-parisc.vger.kernel.org>

Good afternoon,

(I'm using the .5 image and used the install instructions on
www.parisc-linux.org/install.html to get the booting system on a B160L)

Upon boot, the system is not automatically mounting /proc.
I made sure that the line:
/proc	/proc	proc	defaults
was in /etc/fstab, but the kernel never mounts it.

I also need a script to be run every boot (to set up the ethernet
interface...or if it automatically did this, I would be happy to know
how to do set it up to do this as well.)

(Greg Ingram)
Appending 'rw' at the end of the command line in palo works great to
enable read/write access to the booting volume, thank you.  Though I
don't think it's so much of a hack...I think it's more like a 'feature'
of palo that it doesn't automatically mount the boot volume as
read/write.  An annoying feature, but one that prevents new people from
mucking up the system too bad.

Thank you,
 - Josiah
