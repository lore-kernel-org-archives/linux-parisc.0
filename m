Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA16668
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Nov 1999 16:44:57 -0700
Received: from relay.core.genedata.com (nila-e0.core.genedata.com [157.161.173.44])
	by mail.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA9NkJc28161
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 00:46:19 +0100
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by relay.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA9NkJA29128
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 00:46:19 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id AAA795472
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 00:46:18 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11lKzJ-00028LC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Wed, 10 Nov 1999 00:47:45 +0100 (CET)
Date: Wed, 10 Nov 1999 00:47:45 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991110004745.T25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HIL status
List-ID: <linux-parisc.vger.kernel.org>


I've taken the hp300 HIL driver written by Phil Blundell and it `works'
on my 715/33.  It's producing the wrong keycodes, it's doing work that an
ASP driver ought to be doing and it's producing a fair bit of extraneous
crap on the screen.  But I'm getting interrupts and keycodes so I'm
happy for tonight :-)

The next obvious step is to have an ASP manager, like LASI.  In fact, so
much like LASI, it probably ought to be in the same driver.  This seems to
be how Mach does it, and there's a rumour this is also how HPUX does it.
My question is: how?  Mach hardcodes the address of ASP to 0xf0800000,
but there's nothing even close in the driver list.  I notice in the
bootlogs which have previously been posted, LASI was at the address of
`Core BA', but you can see that's wildly different on this machine.
Should I invent my own and insert it into the structures we have?

Here's the driver list printed at boot on the 715 (is someone collecting
these somewhere?)

1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0x0, 0x0
2. Scorpio Jr Core BA (11) at 0xf082f000, versions 0xb, 0x0, 0x70, 0x0, 0x0
3. Scorpio Jr Core SCSI (10) at 0xf0825000, versions 0xb, 0x0, 0x71, 0x0, 0x0
4. Scorpio Jr Core LAN (802.3) (10) at 0xf0826000, versions 0xb, 0x0, 0x72, 0x0, 0x0
5. Scorpio Jr Core HIL (10) at 0xf0821000, versions 0xb, 0x0, 0x73, 0x0, 0x0
6. Scorpio Jr Core RS-232 (10) at 0xf0823000, versions 0xb, 0x0, 0x75, 0x0, 0x0
7. Scorpio Jr Core RS-232 (10) at 0xf0822000, versions 0xb, 0x0, 0x75, 0x0, 0x0
8. Scorpio Jr Core Centronics (10) at 0xf0824000, versions 0xb, 0x0, 0x74, 0x0, 0x0
9. Scorpio Jr Audio (10) at 0xf1000000, versions 0xb, 0x0, 0x76, 0x0, 0x0
10. Scorpio Jr (715/33) (0) at 0xfffbe000, versions 0x311, 0x0, 0x4, 0x0, 0x81
11. Scorpio Jr (1) at 0xfffbf000, versions 0x16, 0x0, 0x9, 0x0, 0x0

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
