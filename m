Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA11371
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Jan 2001 08:06:54 -0700
Received: (from andyh@localhost)
	by shell.cyberus.ca (8.9.3/666/Cyberus Online Inc.) id KAA07701
	for parisc-linux@thepuffingroup.com; Fri, 12 Jan 2001 10:09:39 -0500 (EST)
From: Andrew Hollbach <andyh@shell.cyberus.ca>
Message-Id: <200101121509.KAA07701@shell.cyberus.ca>
Subject: Re: netlink ?
To: parisc-linux@thepuffingroup.com
Date: Fri, 12 Jan 2001 10:09:39 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

The missing netlink has been found. The problem was that the
box was booting via BOOTP and used nfs root. Net initialization
seems to have been deferred and a whole bunch of network related
stuff built into the kernel just did not come up right.

Now that I'm booting off the local /dev/sda with the same kernel,
things seem much improved. /proc/net has about twice the entries now
and netlink works.

Thanks for the excellent kernel port, folks !

cheers, Andy
