Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA23183
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Sep 2000 21:22:48 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 62FF43FB
	for <parisc-linux@thepuffingroup.com>; Sun,  3 Sep 2000 21:22:31 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id VAA10139 for parisc-linux@thepuffingroup.com; Sun, 3 Sep 2000 21:22:42 -0600 (MDT)
Date: Sun, 3 Sep 2000 21:22:42 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200009040322.VAA10139@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: PATCH: memory patch
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan wrote:

>I have a small patch that allows the parsic-linux kernel see all
> the all the memory the PDC recognizes.   This patch works fine
>for me, and if no one has any objections, (ie.  Does this need to
>be present for some models?) ... I'll commit it.

No, a limit was imposed intentionally. Right now, with the kernel
mapping starting at 0xc0000000 we can't support 1 Gb of physical
memory. Machines that have 1 Gb or more will not boot if you
restored the code to what it was before (which is what your patch
would do).

Eventually I plan to move the kernel mapping down a lot closer
to 0. But there are much higher priority things to get done before
that. Right now the kernel is not stable enough to effectively
make good use of even 128 Mb at this point.

I didn't choose the current 128 Mb maximum, and it can almost certainly
be greater than that. If that limit is really bothering you, go ahead
and raise it to 256 Mb or possibly 512 Mb (don't raise it beyond what
you can test).  Don't spend any time trying to figure out what the
absolute maximum can be, since this will almost certainly change in the
future.

John Marvin
jsm@fc.hp.com
