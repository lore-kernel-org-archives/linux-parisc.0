Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA16161
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 11:23:10 -0700
Message-Id: <200101241829.KAA21064@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Wed, 24 Jan 2001 17:06:01 PST."
             <20010124170601.C4836@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 24 Jan 2001 10:29:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] KWDB vs KDB
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Wed, Jan 24, 2001 at 08:50:12AM -0800, Grant Grundler wrote:
> FYI, after my PA-RISC talk at linux.conf.au, Keith Owens expressed
> interest in porting KDB to Linux/PARISC.  He's on holiday just now but
> he'll investigate further after he gets back.
> 
> Grant, do you think it'd be worth removing the KWDB bits?

Should KDB not need something with CONFIG_KWDB around it, Keith
is certainly welcome to remove the CONFIG_KWDB usage/code.
I'm pretty sure the same hooks will be needed for KDB.
Just rename CONFIG_KWDB to CONFIG_KDB.

later,
grant
