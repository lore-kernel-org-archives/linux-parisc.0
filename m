Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00723
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Mar 2000 16:19:30 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id TAA29793
	for parisc-linux@thepuffingroup.com; Sun, 26 Mar 2000 19:19:28 -0500
Date: Sun, 26 Mar 2000 19:19:28 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000326191928.B29700@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] volunteer wanted
List-ID: <linux-parisc.vger.kernel.org>


currently, we have a copy of 82596.c as lasi_82596.c that has the
modifications required to make it work with the lasi chip.  it would
be good if someone could rework this to put the common functions in
82596.c, the lasi-specific ones in lasi_eth.c and the pc-specific ones
in apricot.c.  Possibly it would be tidiest to put this into a directory,
as was done with tulip, but people may prefer not to.

Any volunteers?
