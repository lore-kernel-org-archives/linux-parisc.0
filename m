Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA27478
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 16:15:12 -0700
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.9.3/8.9.3) id SAA01297
	for parisc-linux@thepuffingroup.com; Thu, 18 Nov 1999 18:16:42 -0500 (EST)
Message-Id: <199911182316.SAA01297@hiauly1.hia.nrc.ca>
To: parisc-linux@thepuffingroup.com
Date: Thu, 18 Nov 1999 18:16:42 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Progress
List-ID: <linux-parisc.vger.kernel.org>

With today's cvs patches, things are going better.  The kernel booted
to the following point:

...
VFS: Mounted root (ext2 filesystem)
Warning: unable to open an initial console.
Attempting to execute '/sbin/init'
It seems to be a valid SOM executable.

I am using the PDC_CONSOLE.  I think there was a changed needed to allow
opening the PDC_CONSOLE that was discussed previously.  Does anybody
remember?  Maybe with this change I can get to sash.

I also need to slow down the console messages.

The space registers are all zero.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
