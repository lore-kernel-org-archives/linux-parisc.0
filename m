Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA27762
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Feb 2000 18:06:55 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id TAA05677
	for parisc-linux@thepuffingroup.com; Thu, 10 Feb 2000 19:00:38 -0500
Date: Thu, 10 Feb 2000 19:00:38 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000210190038.B7236@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] some stats
List-ID: <linux-parisc.vger.kernel.org>


Someone may find this interesting.  I just did a
`diff -ur linux-2.3.42 cvs/linux-2.3' to find out how much of the mainline
kernel tree we've changed.  After judicious trimming of changes we
haven't actually made (CVS artifacts, etc), the diff is 5367 lines long.
There are basically five categories of changes:

 * Extra debug code that we won't merge in with Linus
 * The page colouring code.
 * Workarounds for compiling as SOM, not ELF.
 * Build system changes.
 * Driver changes.  Some for IO coherency, some for `and parisc too'.

The page colouring code is probably the only thing which will prevent us
merging into Linux 2.4.x.  Page colouring seems to be on the agenda for
Linux 2.5, and nothing stops us from producing our own kernel `based on
Linux 2.4', just like Red Hat.  Of course, we ought to get a little more
developed before we try to merge :-)
