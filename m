Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA08896
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 08:40:01 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id 1DA462DA
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Sep 2000 08:40:53 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id IAA19705 for parisc-linux@thepuffingroup.com; Tue, 26 Sep 2000 08:40:42 -0600 (MDT)
Date: Tue, 26 Sep 2000 08:40:42 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200009261440.IAA19705@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] NFS root fixed (I believe)
List-ID: <linux-parisc.vger.kernel.org>


I just checked in changes that I believe fix nfs root. It turns out
that the in_interrupt() macro was not working, probably due to a
2.4 merge mistake. Anyway, since it wasn't working, schedule() was
being called under interrupt. And since schedule calls in_interrupt()
to check for that possibility, it was not catching it, therefore it
was switching contexts under interrupt, trashing kernel stacks, etc.

John
