Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA18525
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Mar 2000 14:51:37 -0700
Date: Sun, 12 Mar 2000 15:52:52 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux <parisc-linux@thepuffingroup.com>
In-Reply-To: <MDAEMON80008200003111913.AA1339046@xanaxis.dyndns.org>
Message-ID: <Pine.BSO.4.21.0003121544180.20661-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HIL_BASE ("finding" devices)
List-ID: <linux-parisc.vger.kernel.org>



Hi,

I've only just really started to hack at the HIL driver, but
one thing I noticed off the bat is that the HIL_BASE defined
in hil.h is 0xf0821000 while the device base listed when 
I boot for the HIL is 0xf0201000.  This probably means it 
varies across different models.

Optimally I suppose the best thing would be to somehow 
find the device -- the code that prints out the hardware 
found seems to get strings from the "pdc" which I glean is
the "BIOS".  I suppose the only thing the HIL will have that
is unique is this string, or are there model invariant 
numbers like the PCI fn?  (I haven't been through every 
entry in the hardware database to see.)  Basically I'm
asking is there a better way than a strcmp on the pdc string?

Alternatively I suppose we could do what the alpha folk
have done and have a compile-time selection of the system type
(e.g. "avanti") which sets the values for various things like that.

--
Brian S. Julin
