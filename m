Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA07425
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jan 2000 10:56:53 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id MAA31145
	for parisc-linux@thepuffingroup.com; Mon, 24 Jan 2000 12:58:02 -0500
Date: Mon, 24 Jan 2000 12:58:02 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000124125802.W1538@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] userspace
List-ID: <linux-parisc.vger.kernel.org>


i've decided to start keeping some userspace programs in cvs for your
joy and edification (and so i don't lose the only working sash source
code again.. duh).  set your CVSROOT as described on the parisc webpages
and `cvs co userspace'.  ifconf.c is the only one worth talking about,
and hopefully we'll have an ethernet driver to test it with RSN...
