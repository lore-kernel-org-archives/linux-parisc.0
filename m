Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA02547
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 18:17:56 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id C0736726
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 18:20:25 -0700 (MST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id RAA19517
	for parisc-linux@puffin.external.hp.com; Mon, 20 Nov 2000 17:19:03 -0800 (PST)
Date: Mon, 20 Nov 2000 17:19:03 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011210119.RAA19517@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 712 ISL and palo
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul (Bame),

I tried booting 712 with "bo scsi.4.0 isl" with the
palinux-0.5.iso image on a regular hard disk.
I wanted to edit the "root" parameter so it would
be /dev/sdb (also had a disk at scsi.0.0) instead of
/dev/scd0.

palo wouldn't accept any ps/2 keyboard input.
Don't know if this is a palo or PDC bug.
Any ideas?

thanks,
grant
