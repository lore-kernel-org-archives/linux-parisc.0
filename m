Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA08210
	for <parisc-linux@puffin.external.hp.com>; Sun, 16 Jan 2000 22:33:24 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id XAA01905
	for parisc-linux@thepuffingroup.com; Sun, 16 Jan 2000 23:34:03 -0500
Date: Sun, 16 Jan 2000 23:34:03 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000116233403.H11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] wq bug forcing oops
List-ID: <linux-parisc.vger.kernel.org>


if you've had this error message on recent kernels, it actually meant
`null pointer exception'.  the current cvs tree should report these
correctly.
