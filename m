Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA13475
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Feb 2000 09:38:16 -0700
Date: Wed, 23 Feb 2000 10:38:57 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSO.4.21.0002231025570.18891-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] NFS root on 715/64
List-ID: <linux-parisc.vger.kernel.org>



This almost works... after adjusting the .config that was
given in the instructions to actually include the LASI ethernet
driver :), I get to the IP-Config notice, and if I turn on nfsd's
transfer logging, I can see it mount the root filesystem and transfer
sbin/init, but no output past that and it doesn't transfer sash even
/dev/console.

Now it was mentioned that the serial console was needed to
get a working shell -- has anything actually been hacked up
in the nfsroot images that prevents using the PDC (yes I 
know, it's line-by-line only) because setting up serial 
console will be rather inconvenient for me and plus I'm working
on the HIL stuff anyway so I'll want to have focus on the 
keyboard not ttyS0.

Or, should I be seeing more output as is?

--
Brian S. Julin
