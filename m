Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA20194
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Mar 2000 18:50:20 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id TAA14409
	for parisc-linux@thepuffingroup.com; Sun, 12 Mar 2000 19:51:36 -0500
Date: Sun, 12 Mar 2000 19:51:36 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000312195136.V27942@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] USB
List-ID: <linux-parisc.vger.kernel.org>


Someone was asking about the USB interfaces on the C3k/J5k/etc.  I just
took one of their keyboards and attached it to my laptop's USB port and
it worked fine (running Linux 2.3.51).  So as long as the UHCI controller
in the C3k is supported, the rest of the Linux USB layer is fine.  The
USB layer is used quite intensively by the Linux/PPC port (iMacs only have
USB keyboards) so there can't be any endian issues to take care of.
