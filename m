Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA14483
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 11:09:54 -0700
Received: from dot.at (IDENT:plattner@dot-tc01-015.dot.at [212.9.128.55])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id TAA18666
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Jan 2001 19:21:17 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A6C7856.BD460E1F@dot.at>
Date: Mon, 22 Jan 2001 19:13:42 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net> <20010122151515.N3571@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in palo/palo/error.c
List-ID: <linux-parisc.vger.kernel.org>

In the file `palo/palo/error.c' a bug is in the char array
`*errormessages[]'. After `#include "usage.h"' there must be
a comma (or at the end of `usage.h', but this is a bad solution,
as I cannot use this long text on another position).

I got the error "10" but the message of error "11" as message "0"
(usage) and message "1" are concanated together !!

By the way: The PALO documentation should include a hint, that
I have to produce a PC-(intel)-compatible disk partition table.
My SCSI disk, I prepared was connected to a SUN and I have forgotten,
that there are differences in the layout, although it is no
problem to build the code on a x86 machine and run plao on 
a sun. 

So, if palo (or HP itself) has the restriction, only to handle 
X86 (DOS) Partition table format, then please mention it....

With friendly regards

	Christoph


-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
