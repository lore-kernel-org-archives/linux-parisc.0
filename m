Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fast.cs.utah.edu (fast.cs.utah.edu [155.99.212.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67F884A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Mar 2001 11:30:46 -0700 (MST)
Date: Mon, 5 Mar 2001 11:27:36 -0700 (MST)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <200103051827.LAA04397@fast.cs.utah.edu>
To: alex@linuxcare.com, bri@mojo.calyx.net
Subject: Re: [parisc-linux] TODO-list entry of "HIL keyboard driver needs updating"
Cc: deller@gmx.de, grundler@cup.hp.com,
	parisc-linux@lists.parisc-linux.org
List-ID: <linux-parisc.vger.kernel.org>

> Date: Mon, 5 Mar 2001 12:26:46 -0500 (EST)
> From: "Brian S. Julin" <bri@mojo.calyx.net>
> To: Alex deVries <alex@linuxcare.com>
> Subject: Re: [parisc-linux] TODO-list entry of "HIL keyboard driver needs updating"
> 
> 
> The main sticking point I have with the HIL hardware which
> has an effect on the way I write the linux-input driver,
> concerns whether or not there is a safe way for me to
> leave the auto-polling enabled always, or whether it will have
> to be turned off when a hil packet starts, and the driver
> must go register a timer task to go poll the chip until
> the packet is over.  It centers around a comment in the
> BSD driver:
> 
> /*
>  * Send a command to a device on the loop.
>  * Since only one command can be active on the loop at any time,
>  * we must ensure that we are not interrupted during this process.
>  * Hence we mask interrupts to prevent potential access from most
>  * interrupt routines and turn off auto-polling to disable the
>  * internally generated poll commands.
>  */
> 
> Amazingly, all the drivers I find seem to be happy to
> tie up the CPU and busy wait on the HIL bus in some
> places, which is "just not good"(tm).
> 

The doc clearly states that auto-polling must be disabled or you must be
certain that the timing of your data transfer does not interfere with the
polling.  The recommended way was to disable auto polling.

As for disabling interrupts, its been a long time and I'm not sure what the
hell we meant by "Hence we mask interrupts to prevent potential access
from most interrupt routines".  You may want to disable interrupts to get
on and off the loop as quick as possible to avoid dropping input chars.

> Basically I need to know if there really is the chance
> that during a packet send operation I will be interrupted
> by an internally generated poll command, or if they were
> just being paranoid.
> 

Just following directions! :-)  Don't think we ever tried it without
disabling auto polling, so I don't know what the consequences of
interfering with a poll would be, probably not good.

> BTW, writing drivers with nothing but other people's source
> code to look at really is not my favorite activity.  I am always
> left with the impression that there could be a hardware feature
> that the other authors ignored that would make the code better
> or simpler.  I am guessing that HP has managed to put
> mountains of paperwork in the way of getting hardware docs,
> and that my saying this won't help, but I am willing to sign
> an NDA for the HIL docs.
> 

Understandable.  Yes, we went for simple and straight-forward when writing
the drivers and didn't always exploit "special features" of the hardware.
My experience with such special HW features is that they make drivers more
complicated with little added benefit.

Anyway, I have been using the BSD HIL driver daily for 14 years or so now,
and haven't had any significant problems.

Mike
