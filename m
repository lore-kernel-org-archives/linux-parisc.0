Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22160
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 12:48:12 -0700
From: willy@thepuffingroup.com
Date: Wed, 15 Mar 2000 13:48:41 -0500
To: Hugo.van.der.Kooij@caiw.nl
Cc: Philipp Rumpf <prumpf@inwestnet.de>, "Brian S. Julin" <bri@mojo.calyx.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
Message-ID: <20000315134841.S27942@thepuffingroup.com>
References: <20000315182657.D673@abacus.local> <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>; from Hugo.van.der.Kooij@caiw.nl on Wed, Mar 15, 2000 at 07:30:40PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 15, 2000 at 07:30:40PM +0100, Hugo.van.der.Kooij@caiw.nl wrote:
> Wouldn't big endian vs little endian be an issue?

unlikely.  parisc is big endian and i386 is little endian.  people compile
parisc kernels on both machines.
