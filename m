Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18309
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 09:37:26 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id JAA26186
	for parisc-linux@thepuffingroup.com; Wed, 1 Mar 2000 09:07:01 -0500
Date: Wed, 1 Mar 2000 09:07:01 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000301090701.M9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] __asm__
List-ID: <linux-parisc.vger.kernel.org>


Grant was asking where to find documentation on __asm__, and I think
this is useful to enough people that it's worth posting here.

__asm__ is a gcc extension.  It allows you to write inline assembler in
your C source file rather than forcing you to write a separate function
in a .S file and call it.  The original documnetation can be found by
typing `info gcc' (make sure you have the gcc info files installed
or you'll just get the manpage).  Follow the menus: `C Extensions',
``Extended Asm'.  I find the documentation pretty obscure, and I have
to think very carefully every time I write an __asm__ statement.
