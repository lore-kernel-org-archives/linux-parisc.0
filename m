Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA26279
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jan 2000 23:55:59 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id AAA06867
	for parisc-linux@thepuffingroup.com; Wed, 19 Jan 2000 00:56:41 -0500
Date: Wed, 19 Jan 2000 00:56:41 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000119005641.D11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] NCR driver
List-ID: <linux-parisc.vger.kernel.org>


Several people have emailed me and asked if there are any small jobs they
can do to get themselves started.  Here's one that needs doing.  There
is an NCR 53c710 driver in linux/drivers/scsi/ncr53c7xx.c.  This is the
SCSI controller found in the:

	712, 715/{64,80,100}, 725/100, A180

and possibly others.

If anyone is feeling really enterprising (or perhaps just frustrated),
they could try getting this driver to work with the following machines:

	705, 710, 715/{33,50,75}, 720, 725/{50,75}, 730, 735, 750, 755

which contain the NCR 53c700.  The _comments_ in the driver suggest that
it's almost supported, but I don't know how up to date they are.

If you do decide to work on it, please ensure you're working from the
linux-2.3 tree and let everyone know you're working on it.
