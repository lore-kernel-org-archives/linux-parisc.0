Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA19016
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Sep 1999 20:28:32 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id WAA04941
	for <parisc-linux@thepuffingroup.com>; Mon, 6 Sep 1999 22:47:11 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37D47CAF.C8FEEEE7@thepuffingroup.com>
Date: Mon, 06 Sep 1999 22:47:11 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Shifting to kernel 2.2.12
List-ID: <linux-parisc.vger.kernel.org>


There's a few reasons to go to a newer kernel version, so I spent the
last day working on shifting the kernel to 2.2.12, which was a very
large pain.

To ease the overall load on developers, I'm going to do merge up all the
patches as of Wednesday, Sept. 8 at midnight GMT.

Right now my kernel builds properly, boots and dies in ipl_c.c, but I'll
figure out why exactly.

Please, keep your changes to non-architecture specific portions to the
kernel to a minimum.  It makes merging difficult.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
