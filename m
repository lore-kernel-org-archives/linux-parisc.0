Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2598C48D4
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 10:48:31 -0600 (MDT)
Date: Wed, 3 Oct 2001 18:44:10 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] PCXS fixes
In-Reply-To: <200110030832.CAA10917@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.33.0110031840090.4477-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi John,

> However, ls still hangs randomly (actually it is not random, it depends on
> which directory the ls is done in).  It gets stuck in a ldcw loop due to
> the lock word not being 16 byte aligned.

I have the same hangs here on my 720.

And a few more random problems i noticed:

- IPv6 doesn't work yet (this is a ping from 3ffe:400:470:4::1 Linux/alpha 
to 3ffe:400:470:4::3 Linux/parisc):

kernel BUG at /usr/src/linux/include/asm/checksum.h:153!
ICMPv6 checksum failed [3ffe:0400:0470:0004:0000:0000:0000:0001 > 
ff02:0000:0000:0000:0000:0001:ff00:0003]

- zebra complains about netlink problems and loops:

2001/10/03 17:17:51 ZEBRA: netlink-cmd recvmsg overrun

Cheers,
Jochen
