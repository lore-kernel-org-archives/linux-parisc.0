Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA25288
	for <parisc-linux@puffin.external.hp.com>; Sun, 29 Aug 1999 15:30:16 -0600
Received: (from steve@localhost)
	by osiris.silug.org (8.9.3/8.9.3) id QAA27527
	for parisc-linux@thepuffingroup.com; Sun, 29 Aug 1999 16:32:39 -0500
From: Steven Pritchard <steve@silug.org>
Message-Id: <199908292132.QAA27527@osiris.silug.org>
To: parisc-linux@thepuffingroup.com
Date: Sun, 29 Aug 1999 16:32:39 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] more tools
List-ID: <linux-parisc.vger.kernel.org>

I've put some HP-UX 10.20 binaries of various things on
puffin.external.hp.com to go along with the 11.0 binaries I put there
a couple of months ago.  The 10.20 binaries should work on either
10.20 or 11.0.  Get them at

    ftp://puffin.external.hp.com/pub/parisc/binaries/depot/10.20/

(The 11.0 stuff is still there in depot/11.0/.)

Since I haven't managed to write up anything on how to package up
software for HP-UX yet, I figured I'd do the next best thing and just
script my build process.  There's a script called "build-bash.sh"
there that does more-or-less what rpm --rebuild would do on a Red Hat
box.  Hopefully it'll help somebody out there figure out how to build
HP-UX packages, assuming I'm not the only one who cares.  ;-)

I'll get some more stuff out there, including the latest CVS builds of
egcs and binutils, as soon as I can.

(Oh, BTW, the 10.20 stuff was built on a C240 with egcs.  Everything
*should* work properly on a PA-RISC 1.1 box, but I haven't actually
tested any of it anywhere but the build box.  If somebody could let me
know that the stuff works on a 700-series box, I'd appreciate it.)

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
