Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA19841
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 12:47:33 -0600
Date: Wed, 27 Oct 1999 14:47:43 -0400 (EDT)
From: Christopher Beard <chris@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9910270038090.31184-100000@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.9910271441580.32651-100000@martini.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Configuration patches
List-ID: <linux-parisc.vger.kernel.org>


Ok, as of this instant, if you checkout a fresh kernel from CVS, and hit
[enter] all the way through the ``make config'' and use
ramdisk.bin-19991019-workingsash from the FTP site, you should get to sash
prompt when you boot the kernel image.

You will also feel the pain of the serial interrupts.

This has been verified to /work/ on an A180C.

Chris
