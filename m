Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA30969
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 01:03:28 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id DAA18524
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Jun 1999 03:10:56 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3760B67A.8D9F3B1F@thepuffingroup.com>
Date: Fri, 11 Jun 1999 03:10:50 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] a question about HPUX's linker
List-ID: <linux-parisc.vger.kernel.org>


To help us get ahead, I'm trying to get the kernel to build properly
with HPUX, using HPUX's linker, and gcc.

Why does the final kernel link use --start-group ... --end-group?

What's the equivalent syntax for HPUX's ld?

I'm a bit short on docs in this area...

- Alex
