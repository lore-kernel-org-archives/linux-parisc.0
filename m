Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA23185
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 01:14:12 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id DAA01322
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Jun 1999 03:22:24 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3769F3AD.DF068942@thepuffingroup.com>
Date: Fri, 18 Jun 1999 03:22:21 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] A quick update
List-ID: <linux-parisc.vger.kernel.org>


After an enormous amount of frustration (with fault only to me, I should
have thought that there was a second bootpserver on my network), the
kernel tree in CVS actually builds on HPUX.  This is really just Jason's
work glued into the kernel tree.

Next:

- we need an HPUX ld linker script to resolve the vmlinux building,
what's the format for this?

- we need to figure out why the bootloader gives an error when loading
the kernel into memory

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
