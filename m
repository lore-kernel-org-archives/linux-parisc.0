Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA21326
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Dec 1999 10:53:33 -0700
Date: Thu, 9 Dec 1999 12:55:32 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSO.4.20.9912091249560.274-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] More 9.05 notes and recipe.html
List-ID: <linux-parisc.vger.kernel.org>



Had another go at compiling kernel under HPUX 9.05;
here are some more notes.

First off, recipe.html is outdated apparently as
it still tells you to build a hpux/linux cross compiler,
which I'm told is not the way things are now done.

Had to rm -rf ld from binutils or it wouldn't configure
the other directories.

Had to add struct timespec by hand.

Had to remove the +vnocompatwarnings ld flag from
parisc/real/Makefile.

recipe.html's sample bootpd line has semicolons in it which 
fail at least in my /etc/bootptab; should be colons.

Finally got the build working, but no luck booting
(this is a 715/64) with either that or the images
on the web site.  IPL encounters an error of some sort,
but provides no specifics.  I've only tried booting over 
LAN so far.

FWIW,

--
Brian S. Julin
