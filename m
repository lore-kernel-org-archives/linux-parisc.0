Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18587
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 09:51:39 -0700
Date: Wed, 1 Mar 2000 16:50:37 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __asm__
Message-ID: <20000301165037.U812@abacus.local>
References: <20000301090701.M9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000301090701.M9944@thepuffingroup.com>; from willy@thepuffingroup.com on Wed, Mar 01, 2000 at 09:07:01AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> __asm__ is a gcc extension.  It allows you to write inline assembler in
> your C source file rather than forcing you to write a separate function
> in a .S file and call it.  The original documnetation can be found by
> typing `info gcc' (make sure you have the gcc info files installed
> or you'll just get the manpage).  Follow the menus: `C Extensions',
> ``Extended Asm'.  I find the documentation pretty obscure, and I have
> to think very carefully every time I write an __asm__ statement.

info '(gcc) Extended Asm' if you don't want to search for it.

The documentation definitely isn't very good, so I would propose to write
to the list whenever you need an asm statements and aren't sure how
exactly to do it (most likely you don't even need the asm statement).

	Philipp
