Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA00998
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Jun 1999 13:58:56 -0600
Date: Thu, 24 Jun 1999 13:58:57 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199906241958.NAA20810@fast.cs.utah.edu>
To: mkp@socsci.auc.dk, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] Getting back to the pdc prompt from Never Never Land
List-ID: <linux-parisc.vger.kernel.org>

> To: parisc-linux@thepuffingroup.com
> From: Martin Kasper Petersen <mkp@socsci.auc.dk>
> Date: 24 Jun 1999 19:42:00 +0200
> Subject: [parisc-linux] Getting back to the pdc prompt from Never Never Land
> 
> This is mostly for the HP guys, I guess...
> 
> When experimenting with booting and such I often end up with a hanging
> kernel and have to reset the box manually to get back to the pdc
> prompt.
> 

What is your goal here?  You want to be able to reboot the machine remotely?
Or just reboot more gracefully than by cycling power?  Or reboot with some
debug info?  Or ...?

We have a couple of techniques to help debug or recover from hangs:

We catch the TOC trap and force a crash dump and reboot.  This way you can
push the little TOC button on the front/back of the machine and have the
machine take a dump and reboot.  This approach should work very early in
the kernel boot process provided you use the PDC to do the crash dump.
This is *not* what TOC was intended for and isn't what HP-UX does, so HP
people may not approve :-)

If you have an HIL, there is a "non-maskable" interrupt you can generate
via the keyboard (shift-reset? I don't remember any more...) and then do
a similar thing.  On the 68k boxes this was a real NMI, but on the PAs its
just a plain ole interrupt so it will not work if you hang with interrupts
masked.  It also only works if the keyboard is in "cooked" mode (i.e., you
don't have X running).

You can build or buy remote power-cycling boxes which are effectively just
a switch on the power cord that you control over an rs232 line.  APC (the
UPS people) makes one of these or you can build them from components.
This is what we use for our PC test boxes.

We have also used the "packet of death" approach, sending a magic packet
over the LAN to force a reboot.  Requires that the interface be up and
running and interrupts not masked of course.
