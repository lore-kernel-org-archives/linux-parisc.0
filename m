Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA07040
	for <parisc-linux@puffin.external.hp.com>; Mon, 5 Jul 1999 22:09:04 -0600
Date: Mon, 5 Jul 1999 22:09:09 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199907060409.WAA22770@fast.cs.utah.edu>
To: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] Mach sources?
List-ID: <linux-parisc.vger.kernel.org>

> Date: Mon, 5 Jul 1999 13:40:02 +0200
> From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
> To: parisc-linux@thepuffingroup.com
> Subject: [parisc-linux] Mach sources?
> 
> It's quite a pain to actually find the sources from the reference on
> the puffin group website.  There's a morass of broken links and the
> OSF no longer seem to distribute the source.  So for everyone's
> convenience, the URL for the latest set of Mach/PARISC sources is:
> 
> ftp://flux.cs.utah.edu/flux/mach/ALPHA/
> 
> Jeff, does 9th Jan 1996 sound like the most recent version to you?
> 

I'll give you the authoritative answer...
 
For the Utah code (Mach3 + 4.4BSD server), that was the last release,
in particular:

	ftp://flux.cs.utah.edu/flux/mach/ALPHA/pa-snapshot2.tar.gz

For the OSF code (OSF Mach + Linux server), I believe someone else posted
a URL for a copy of that.

The OSF code supported a few more machines (e.g., J series) and devices
(e.g., EISA stuff) than we did, though we might have had a few bug fixes
they didn't.  Of most interest in the Utah code is the HP-UX compatibility
code (mostly in the Lites server/emulator) which was good enough to run the
X11 server and Netscape.
