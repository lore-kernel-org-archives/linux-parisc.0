Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA05840
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 23:11:08 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id E4AF0933
	for <parisc-linux@thepuffingroup.com>; Mon,  6 Nov 2000 01:12:56 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id XAA06120 for parisc-linux@thepuffingroup.com; Sun, 5 Nov 2000 23:12:56 -0700 (MST)
Date: Sun, 5 Nov 2000 23:12:56 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011060612.XAA06120@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP 9000/730 boot problem
List-ID: <linux-parisc.vger.kernel.org>


"xam@deathsdoor.com" wrote:
> 
> the kernel boots actually, but i dumps the stack register and the
> processor registers (not included in this mail) after
> 
> ASP version 1 at ..... found

Grant Grundler wrote:
> Sounds like ASP support may be broken.
> The way to find out where IOAQ and GR2 registers are pointing.
> They should point to functions in System.map.
> Who is maintaining ASP support?

No, the parallel port support for ASP is broken.  If you disable the
LASI/ASP builtin parallel-port support (CONFIG_PARPORT_GSC) you will get
further.  I can't guarantee you will succeed, but others have reported
some success on boxes almost that old.

This is at least the second time this question has come up, so I guess
I'll add it to the FAQ and todo lists.

John Marvin
jsm@fc.hp.com
