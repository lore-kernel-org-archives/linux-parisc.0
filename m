Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA01392
	for <parisc-linux@puffin.external.hp.com>; Sun, 24 Oct 1999 20:54:39 -0600
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.1])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id XAA22190
	for <parisc-linux@thepuffingroup.com>; Sun, 24 Oct 1999 23:01:57 -0400
Date: Sun, 24 Oct 1999 23:01:57 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9910242258310.22118-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] keyboards and such.
List-ID: <linux-parisc.vger.kernel.org>


So, I've spent some time looking at the keyboard device driver in the
Linux kernel, and it really wants there to be an 8042 PS/2 controller,
which just doesn't exist on the Lasi.

This means that I can speak directly to the keyboard, which shouldn't be
too difficult to whip up a driver if I had the docs on how to speak to the
keyboard.

Does anyone have docs on how to speak to a standard AT or PS/2 keyboard?
The Black Puffin of Death will haunt you if you point me to 8042
controller docs.

- Alex

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group
