Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA06636
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 00:46:32 -0700
Date: Wed, 1 Nov 2000 02:48:02 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Helge Deller <deller@gmx.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] The new PS/2 Keyboard Driver
In-Reply-To: <00110101455208.00343@P100>
Message-ID: <Pine.BSO.4.21.0011010229470.27528-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


Probably best not to worry about cleaning keyboard drivers up too much.
The current USB code will be followed by linux-input style drivers at
some point.  In fact I started a HIL linux-input style driver, which
would abstract the PS2 port/HIL ports and allow a standard keyboard module
to be hooked into the abstracted serio port.  I will work on it more when
time permits.

--
Brian S. Julin
