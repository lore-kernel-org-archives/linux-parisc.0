Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA17291
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 17:45:14 -0400
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA24072
	for <parisc-linux@thepuffingroup.com>; Wed, 7 Apr 1999 17:44:42 -0400 (EDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id OAA13915 for parisc-linux@thepuffingroup.com; Wed, 7 Apr 1999 14:43:39 -0700 (PDT)
Message-Id: <199904072143.OAA13915@meow.sr.hp.com>
Subject: Re: [parisc-linux] Qn on Linux/PA-RISC future Console driver
In-Reply-To: <199904071805.LAA22267@gatekeeper.equator.com> from Jason Eckhardt at "Apr 7, 1999 11: 5:39 am"
To: parisc-linux@thepuffingroup.com
Date: Wed, 7 Apr 1999 14:43:39 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> >
> > Hi,
> > 	Has anyone done some work on Linux/PA-RISC Console driver.
> > 	Are we planning to use PDC for console or is it possible
> > 	to directly access Console device. 
> >
> 
>   I believe HP-UX uses the STI ROM interface rather than going
>   through the IODC interface (i.e. like the bootstrap), although an HP person
>   can tell us positively.

That is correct.  The HPUX kernel uses the STI interface which involves
loading a set of routines out of the ROM into memory. (The STI ROM
is not execute in place.  In fact on older SGC based systems, it
is a byte wide ROM attached to a 32 bit bus...  In some later systems
[e.g. 712] the "STI ROM" is an image that is compiled into the main
bootrom).  The kernel uses the standard PS2 or HIL driver for the
console.  (In HP-UX land this is called the ITE or Internal Terminal
Emulator.)


>   It doesn't seem we could get very good performance through IODC console calls
>   due to the setup involved when calling it from an virtually addressed OS 
>   (switching to real mode, etc). Also, I believe that IODC is not re-entrant.
>   I don't know if the STI ROM has the same restrictions.

You just need the ability to allocate code space in the kernel, unpack the
ROM, and then jump to the routines.  When I ported this to another OS 
the challenge was getting the page permissions set to allow execution of
a malloc'd region.  The code is relocatable, and can be run in the 
virtually addressed kernel.

>   
>   It would be nice to have direct access to the console device (although it
>   is more work), but as of
>   yet we have no console device-specific documentation (or even the STI ROM
>   i/f for that matter).

You don't want to have to have code to talk to all the possible devices
(and potential new devices) compiled into the kernel.  That's the beauty 
of STI.  Plop a newly released graphics card in a system, and the card
carries its STI ROM so that the kernel doesn't necessarily need
to be upgraded.  Of course the X server has to know about any new
device.

As for STI documentation, The only docs that exist are ancient, and
about 4 revs of hardware out of date.  The engineer that maintains
this told me he intended to bring the docs up to date for the Linux
project, and then feed them through the  appropriate channels for
release.

	-Bill
