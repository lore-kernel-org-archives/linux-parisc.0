Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20607
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 11:26:46 -0700
Date: Wed, 15 Mar 2000 18:26:57 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
Message-ID: <20000315182657.D673@abacus.local>
References: <20000315141354.B673@abacus.local> <Pine.BSO.4.21.0003151112040.7474-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003151112040.7474-100000@mojo.calyx.net>; from bri@mojo.calyx.net on Wed, Mar 15, 2000 at 11:16:21AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> Will the new ELF compiler/binutils work on an Alpha
> Linux box?  (I wouldn't think it would make a difference
> what the host was but then there may be a subtlety there
> I'm unaware of.)  My x86 is out of disk.

It might.  The only real difference between alpha and i386 to run a
cross-compiler on is sizeof(long), and I don't think we rely on that
too heavily in gcc.

	Philipp Rumpf
