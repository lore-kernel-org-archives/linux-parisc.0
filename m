Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA23370
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:49:12 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by atlrel1.hp.com (Postfix) with SMTP id 070002F2E
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 12:10:29 -0400 (EDT)
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of 13 Jul 2000 17:14:55 EDT.
             <87sntd20mo.fsf@linuxcare.com>
Date: Thu, 13 Jul 2000 13:20:35 -0600
Message-ID: <2654.963516035@upchuck>
From: Jeffrey A Law <law@cygnus.com>
Sender: law@upchuck.cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <87sntd20mo.fsf@linuxcare.com>you write:
  > David Huggins-Daines <dhd@linuxcare.com> writes:
  > 
  > > It looks like binutils is incorrectly treating those fields as
  > > unsigned, or has an off by one error, or something similar.  The
  > 
  > No.  My mistake.  binutils is doing the right thing, the problem is
  > that, due to the way the LR' and RR' field selectors work, there is a
  > bad interaction between cases in which the DPREL21L and DPREL14R (or
  > any 21L and 14R relocations actually) are "split" like this, and ld
  > -r, which tends to increase the addends to a point where LR' and RR'
  > have different effects (LR' expects RR' to be positive, but it isn't).
  > Then during final relocation, the wrong thing happens.
How/why is ld -r changing the addends?  That seems wrong at first glance.

You might look at how the HP SOM tools handle addends during ld -r;
I suspect they don't change.

To the best of my knowledge GCC is using LR/RR in the prescribed way.

jeff
