Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA02758
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Mar 2000 17:51:11 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id UAA30038
	for parisc-linux@thepuffingroup.com; Sun, 26 Mar 2000 20:51:09 -0500
Date: Sun, 26 Mar 2000 20:51:09 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000326205109.F29700@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Announce] 2.3.99pre1 merge complete
List-ID: <linux-parisc.vger.kernel.org>


As those of you who are on the CVS commit list may already be aware,
we've merged the parisc tree up to Linus' 2.3.99pre1 release.  We've also
merged changes which use a modified assembler syntax.  If you cvs update
your kernel, you must also build new gcc and binutils.  It doesn't boot
yet, but it does link.
