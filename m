Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA09316
	for <parisc-linux@puffin.external.hp.com>; Sun, 27 Jun 1999 23:17:14 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id BAA06360
	for <parisc-linux@thepuffingroup.com>; Mon, 28 Jun 1999 01:26:51 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <37770796.C70E0C65@thepuffingroup.com>
Date: Mon, 28 Jun 1999 01:26:46 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Dino and Lasi
List-ID: <linux-parisc.vger.kernel.org>



Okay, I've committed some small changes to dino and lasi that can easily
be backed out.

some questions:

- what IRQ are we going to run LASI on?  Is that something we just pick
and hard code?

- I changed lasi.c and dino.c to only use readl() and writel(), and not
readb and writew, etc.  Was this a mistake?

- We really really need the IRQ bottom halfs setup.  Any takers?

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
