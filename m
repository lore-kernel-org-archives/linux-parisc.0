Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA19050
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 13:04:11 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id 62CBE2352E
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Jan 2001 15:07:33 -0500 (EST)
Date: Wed, 10 Jan 2001 15:07:02 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010110150702.A30218@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PALO CD Creation
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've been building the latest kernel stuff, and I see that its getting
close to complketiong for the STI console.  First off I'd have to say
great job so far.  I would like to create a bootable CD with one of the
kernels I have built from cvs.  The kernel boots on a 755 and 735
throught the network, but there are other machines I've been asked to
try this on, and I need a CD.  I've read through the README from the
palo sources and followed the steps to create a CD, but I have a
question about this steps.  Are all the steps executed on an HPUX
machine, a PARISC machine, or a standard linux machine?  If they are
created on a linux machine, where can someone get the palo binary for
i386 linux.  Also, the README needs a little bit of an update too I
think, since we now have to pass console=[tty0|ttyS0] to palo.

Thanks,
-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
