Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAF41482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 10:29:39 -0600 (MDT)
Message-Id: <200107161629.SAA14087@hprtdt13.grc.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: Holger Zessel <hzessel@grc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problem activating the optional lan card on 712/80 with 0.9-32serial 
In-reply-to: Your message of "Fri, 13 Jul 2001 21:02:28 METDST."
             <20010713190310.95C7A482A@dsl2.external.hp.com>
Date: Mon, 16 Jul 2001 18:29:34 +0200
From: Holger Zessel <hzessel@grc.hp.com>
Sender: hzessel@hprtdt13.grc.hp.com
List-ID: <linux-parisc.vger.kernel.org>

In message <20010713190310.95C7A482A@dsl2.external.hp.com>Helge Deller writes

> Hi Holger,
> 
> I think the main problem why the second lan card didn't worked was, that
> both - the first and the second card - tried to register the "eth0" device 
> name.

Hi Helge,

thanks.  Actually it makes me angry somewhat that I did not yet have
the time to look into the kernel sources myself so far.
Even I would have found the constant 'eth0' string. :-))
Though I definitely would not have been able to create a solution so far.

What makes me confused is that the card is 'supported' according to
the hw list but apparently this part of the code was not even designed
to support more than one card at all. How can this be if the code
PALINUX-2.4 started with was official 2.4 code which of course 
supported more than one lancard ?? 
Perhaps I just miss pieces of the picture here...

Since I have no time to setup a devel. environment
can you please sent me a kernel to test it ?? Regrettably you don't seem to 
be with HP otherwise I could give you access to my gecko for testing.
Do you have a system to test this on ??

regards,
Holger
