Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18362
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 09:40:34 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id KAA23067
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Jan 2001 10:44:13 -0600
Date: Mon, 15 Jan 2001 10:44:13 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <200101150003.QAA09520@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101151002470.23020-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Booting C100
List-ID: <linux-parisc.vger.kernel.org>


I seem to be getting close.  I'm using dhcpd (since I already run it on my
network) which receives a BOOTREQUEST and returns a BOOTREPLY.  Then the
C100 pulls an image via TFTP but I get this error:

	IPL error: bad LIF magic.

	Error reading IPL

I was trying vmlinux-20001018 from the FTP site.  Are there any other
precompiled kernels I should try?

- Greg
