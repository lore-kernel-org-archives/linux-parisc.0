Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta02.mail.mel.aone.net.au (mta02.mail.au.uu.net [203.2.192.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17740482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 May 2001 23:09:04 -0600 (MDT)
Received: from piglet.sspl.net.au ([210.84.112.52])
          by mta02.mail.mel.aone.net.au with ESMTP
          id <20010506050856.SWWW346.mta02.mail.mel.aone.net.au@piglet.sspl.net.au>
          for <parisc-linux@lists.parisc-linux.org>;
          Sun, 6 May 2001 15:08:56 +1000
Received: from winnie.sspl.net.au (winnie. [192.168.10.9])
	by piglet.sspl.net.au (8.9.3/8.9.3) with ESMTP id PAA24730
	for <parisc-linux@lists.parisc-linux.org>; Sun, 6 May 2001 15:07:09 +1000
From: "Pete" <plaven@ozemail.com.au>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 6 May 2001 15:07:12 +1000
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Reply-To: plaven@ozemail.com.au
Message-ID: <3AF568A0.28096.143DEB3@localhost>
Subject: [parisc-linux] getting there!
List-ID: <linux-parisc.vger.kernel.org>

Hey everyone,

Thanks to Grants lifimage I've finally started getting somewhere.

I'm using a linux box as a NFSboot server.  The kernel is booting, 
but when it gets to the point of reading the root file system, I'm 
getting an error on the nfsservers messages saying: tftp: read: 
connection refused.

I'm very new to booting like this, and if it wasn't for the lifimage 
Grant put up for ftp I doubt I'd be this far.

I have setup nfs, I have exported the file system for the base fs 
from external etc... but this error of tftp refusing the connection I 
can't seem to find anything to say what needs to be configured, to 
get it further.

TIA,



Pete.
