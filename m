Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA11912
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 19:48:05 -0700
Date: Thu, 2 Dec 1999 03:51:30 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
        Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        dave@hiauly1.hia.nrc.ca, mklein@dis.com, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991202035130.B6599@mathe.stud.uni-erlangen.de>
References: <E11tE6d-0008Lk-00@the-village.bc.nu> <38456905.BF53929B@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38456905.BF53929B@thepuffingroup.com>
List-ID: <linux-parisc.vger.kernel.org>

> So when do people think we should do that merge?

I actually just got 2.3.29 to build (not work, but I'm sure it shouldn't take too
long to do that) with the parisc changes hacked in.

I think within the next few days I should have a kernel tree that works as much
as our current tree does, but is based on 2.3.

The other issue is when we want the CVS tree to be moved to 2.3.  This mainly
depends on whether people have large uncommitted patch sets that they would
like to finish / commit as long as they at least have an idea how the kernel
behaves without the patch.

So, anyone ?

	Philipp Rumpf
