Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw.scieneer.com (gw.scieneer.com [203.44.134.129])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD535482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 09:18:38 -0600 (MDT)
Sender: dtc@scieneer.com
Message-ID: <3B029A26.7323124B@scieneer.com>
Date: Thu, 17 May 2001 01:17:58 +1000
From: "Douglas T. Crosher" <dtc@scieneer.com>
MIME-Version: 1.0
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240?
References: <3AFE1F8B.725C1B8B@scieneer.com> <20010513122336.A25045@beavis.ybsoft.com> <3AFEE176.28EBFC7A@scieneer.com> <20010513141405.A25241@beavis.ybsoft.com> <20010515231519.A32007@beavis.ybsoft.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
...
> I had a chance to chat with Grant, and we have a couple of ideas, but
> we need some more info first.  Grant says the IO_ADDR_EN is supposed
> to be set by the PDC ... but if no devices exist on the PCI bus below
> the dino, it is possible the IO_ADDR_EN could be 0.  If this is the
> case, then we need to move the BUG() to a different spot in code.
...
> I have attached a small patch that will hopefully confirm our thoughts
> about the IO_ADDR_EN BUG() that I hope you will try out and report
> back the results.  And hopefully someone is working on providing
> rs232 port support for the dino/cujo busses.

Here is the relevant output with you patch applied:

...
Dino version 3.1 (bridge mode) found at 0xfc004000
dino_bridge_init() addr: fc004000 hver: 0x680 sver: 0xa io_addr: 0x2000000
Dino version J2240 (bridge mode) found at 0xfc000000
dino_bridge_init() addr: fc000000 hver: 0x5d sver: 0xa io_addr: 0x0
...

Thanks for looking into it.

Regards
Douglas Crosher
