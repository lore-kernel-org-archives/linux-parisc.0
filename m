Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (unknown [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id E0B5B6629
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Mar 2001 10:26:48 -0700 (MST)
Date: Mon, 5 Mar 2001 12:26:46 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Alex deVries <alex@linuxcare.com>
Cc: <grundler@cup.hp.com>, <parisc-linux@lists.parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] TODO-list entry of "HIL keyboard driver needs
 updating"
In-Reply-To: <3AA3C40A.C3D320FC@linuxcare.com>
Message-ID: <Pine.BSO.4.33.0103051156260.16598-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

The main sticking point I have with the HIL hardware which
has an effect on the way I write the linux-input driver,
concerns whether or not there is a safe way for me to
leave the auto-polling enabled always, or whether it will have
to be turned off when a hil packet starts, and the driver
must go register a timer task to go poll the chip until
the packet is over.  It centers around a comment in the
BSD driver:

/*
 * Send a command to a device on the loop.
 * Since only one command can be active on the loop at any time,
 * we must ensure that we are not interrupted during this process.
 * Hence we mask interrupts to prevent potential access from most
 * interrupt routines and turn off auto-polling to disable the
 * internally generated poll commands.
 */

Amazingly, all the drivers I find seem to be happy to
tie up the CPU and busy wait on the HIL bus in some
places, which is "just not good"(tm).

Basically I need to know if there really is the chance
that during a packet send operation I will be interrupted
by an internally generated poll command, or if they were
just being paranoid.

BTW, writing drivers with nothing but other people's source
code to look at really is not my favorite activity.  I am always
left with the impression that there could be a hardware feature
that the other authors ignored that would make the code better
or simpler.  I am guessing that HP has managed to put
mountains of paperwork in the way of getting hardware docs,
and that my saying this won't help, but I am willing to sign
an NDA for the HIL docs.

Thanks,

P.S. I haven't been keeping tabs on things lately -- do we now have
loadable kernel modules and modutils working well?  Is the
kernel timer support up to par?  How in sync are the .debs
with the bi-monthly trashing of libc compatibility?

--
Brian S. Julin
