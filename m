Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA06918
	for <parisc-linux@puffin.external.hp.com>; Sun, 27 Jun 1999 01:51:40 -0600
Message-ID: <3774EF94.C57237A5@gmx.de>
Date: Sat, 26 Jun 1999 17:19:48 +0200
From: Helge Deller <deller@gmx.de>
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
CC: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc-linux-ld
List-ID: <linux-parisc.vger.kernel.org>

Hi Alex !

Could maybe someone make me a patched "parisc-linux-ld" binary, where I
can do

parisc-linux-ld -R xyz -N        ( or any other letter for -R)

where xyz should be the origin of the ELF-binary, which is currently
0x2000 as seen in the mapfile ? (or is there any other possibility,
because -R at GNU-ld is not used for origin, but for symbol-names...).

If I would have such an patched linker, I maybe could try make the
cross-compiled ELF-binary bootable.....

Helge Deller..

--
---------------------------------------
 Mailto:deller@gmx.de
 ICQ# 2046114
---------------------------------------
