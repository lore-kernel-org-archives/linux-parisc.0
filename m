Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA21509
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 14:05:13 -0600
Date: Mon, 24 Jul 2000 16:06:57 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <397C7472.98FA73C7@home.com>
Message-ID: <Pine.BSO.4.21.0007241534010.18094-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HIL hardware Qs
List-ID: <linux-parisc.vger.kernel.org>


OK, well this weekend I finally started working on a linux-input 
style driver for the HIL.  Unfortunately, I'm working with nothing
but other people's source and bare metal... I asked earlier
and noone came up with any substantial docs on the HIL.

So far the OpenBSD HIL driver has been the most helpful source.
While the linux driver does the wiser thing and does all the
key cooking in software, it's really just a basic bootstrap 
driver.  The BSD driver is prepared to deal with other devices 
on the HIL bus.

I'm trying to get a good abstraction of the HIL from the devices
on it as per the linux-input model (HIL ports -> struct serio and HIL
devices- > struct input)

My questions revolve around a comment at the polloff/pollon
functions in the BSD driver and the true nature of the relationship
between the 8042 and the HIL.  

/*
 * Send a command to a device on the loop.
 * Since only one command can be active on the loop at any time,
 * we must ensure that we are not interrupted during this process.
 * Hence we mask interrupts to prevent potential access from most
 * interrupt routines and turn off auto-polling to disable the
 * internally generated poll commands.
 */

The code then proceeds to tell the 8042 to stop polling.  I thought
the 8042 was basically just an adaptor to accomodate the PS/2-style
keyboards and mice.  But when I turn off the 8042 polling, I no 
longer get any interrupts even from my HIL keyboard.  So I guess the
8042 here is an integral part of the HIL.

Turning off/on polling as they suggest would cause a tangle as far
as clean abstraction between the HIL and the devices on it.  Not
insurmountable, but not something to be writing if I don't absolutley
have to.

So the first question is... were the BSD guys being completely
paranoid, or do we really have to worry about internally generated
commands on the loop?  If so, is there a better way to safeguard this.
Third, if I have to abandon using the IRQ and just poll from a timer,
do we have all the timer_list guts yet, or is that area incomplete?

Finally, can anyone explain the HIL_68K intricacy and what's going on
there? 

Anyone with better docs or source on hand than what I have, please
do send them.

BTW, I won't even really be able to compile this code until we do another
merge with the mainstream source, because the linux-input/linux-console
project keeps their CVS pretty bleeding edge, so don't expect anything 
functional too very soon.

--
Brian S. Julin
