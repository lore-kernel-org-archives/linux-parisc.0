Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA25382
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 17:02:28 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 00:06:22 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LZvh-0003UK-00
	for parisc-linux@thepuffingroup.com; Thu, 25 Jan 2001 00:06:21 +0000
Date: Thu, 25 Jan 2001 00:06:21 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010125000621.G4836@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] linux-2.4.0
List-ID: <linux-parisc.vger.kernel.org>


i've merged linus' 2.4.0 release into our tree.  it compiles, with fewer
warnings than before.  but some things have been changed in the vm system
i'm not 100% confident with.  so, since i'm not in a position to boot
the 712 right now (lack of networking), i'm checking it in as a branch
called LINUS_240_FIXUP.

the checkin's going a bit slowly, so don't try it just yet, but it should
be done shortly.  those of you on the cvs list will see when it's done.

-- 
Revolutions do not require corporate support.
