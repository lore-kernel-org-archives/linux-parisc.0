Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA25502
	for <parisc-linux@puffin.external.hp.com>; Mon, 23 Oct 2000 06:55:09 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 14921D21
	for <parisc-linux@thepuffingroup.com>; Mon, 23 Oct 2000 08:56:35 -0400 (EDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id GAA09854 for parisc-linux@thepuffingroup.com; Mon, 23 Oct 2000 06:56:34 -0600 (MDT)
Date: Mon, 23 Oct 2000 06:56:34 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010231256.GAA09854@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Paging now works
List-ID: <linux-parisc.vger.kernel.org>

FYI,

My latest checkin fixes a variety of VM bugs, so you should probably
cvs update. In addition, paging now works reliably, so you can go
ahead and enable swap if you want to.

John
