Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA17051
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Oct 1999 00:35:17 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id CAA24374
	for <parisc-linux@thepuffingroup.com>; Sun, 3 Oct 1999 02:54:48 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37F6FDB7.54FEEE9F@thepuffingroup.com>
Date: Sun, 03 Oct 1999 02:54:47 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PCI bus walking!
List-ID: <linux-parisc.vger.kernel.org>


The kernel tree in CVS now has PCI code sort of working, so it can scan
the PCI bus on a Dino and find devices.  It's still broken in several
ways: it 
doesn't support multiple dino's, it can't handle interrupts yet, and is
basically doing things in the wrong order, but does work.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
