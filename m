Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA01933
	for <parisc-linux@puffin.external.hp.com>; Sun, 23 Jan 2000 18:21:39 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id UAA28824
	for parisc-linux@thepuffingroup.com; Sun, 23 Jan 2000 20:22:40 -0500
Date: Sun, 23 Jan 2000 20:22:40 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000123202240.Q1538@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Shell!
List-ID: <linux-parisc.vger.kernel.org>


Ladies & Gentlemen, we have a shell on Linux-2.3.

In the end, it was a two line change to the ioctl definitions as Linux and
HPUX disagreed on _whose perspective_ input and output were from.  Argh.

"Guns aren't lawful
 Nooses give
 Gas smells awful
 You might as well live"
