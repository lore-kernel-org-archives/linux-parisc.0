Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22497
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 12:55:04 -0700
Date: Wed, 15 Mar 2000 19:55:20 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Hugo.van.der.Kooij@caiw.nl
Cc: "Brian S. Julin" <bri@mojo.calyx.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
Message-ID: <20000315195520.E673@abacus.local>
References: <20000315182657.D673@abacus.local> <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>; from Hugo.van.der.Kooij@caiw.nl on Wed, Mar 15, 2000 at 07:30:40PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > It might.  The only real difference between alpha and i386 to run a
> > cross-compiler on is sizeof(long), and I don't think we rely on that
> > too heavily in gcc.
> 
> Wouldn't big endian vs little endian be an issue?

PA-RISC is (usually) big-endian;  Alpha and i386 are little-endian.  Cross-
compiling from i386 works, so this shouldn't be an issue for cross-compiling
from Alpha.

	Philipp Rumpf
