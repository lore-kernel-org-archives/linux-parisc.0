Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nlntadn.ats.nld.alcatel.nl (unknown [193.173.147.190])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF206482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 06:10:35 -0600 (MDT)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C920@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>,
	'Richard Hirst' <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Booting 0.9.2 on C110
Date: Tue, 17 Jul 2001 13:24:57 +0200
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

Update to previous message, tried 0.9.2 on following other machines:

B180: identiacl behaviour to C110; system freezes after the "debian/gnu"
messages

B2000 system decided to load 32-bit kernel instead of 64-bit kernel: did not
boot at all.

712/100: system boots, and switches nicely to sti console, continues after
the "debian/gnu" screen

735/125: system fails to see the cdrom during the "search" (probably
scsi/hardware problem)

I tried to reboot the K-server and the R-server, but somehow people were not
all that pleased with me any more ;-)))
So i have to postpone that attempt, but as they are also 64-bit machines, i
expect same results as with the B2000.

Two other C110 systems also freezes after the  "debian/gnu" screen



Kind regards, Hans

> -----Original Message-----
> From:	Witvliet, Hans [SMTP:Hans.Witvliet@alcatel.nl]
> Sent:	Tuesday, July 17, 2001 11:00 AM
> To:	'Richard Hirst'; Witvliet, Hans
> Cc:	parisc-linux@lists.parisc-linux.org
> Subject:	RE: [parisc-linux] Booting 0.9.2 on C110
> 
> Thanks Richard,
> 
> Tried it straight away, but no luck!
> Neither keyboard or mouse unplug/replug, nor space, return, escape,
> ctrl-c,
> ctrl-d or any function key seems to be noticed.
> I'll try to find an other idle-hp-machine to see if i see the identical
> behaviour....
> 
> Hans
> 
> > -----Original Message-----
> > From:	Richard Hirst [SMTP:rhirst@linuxcare.com]
> > Sent:	Tuesday, July 17, 2001 10:47 AM
> > To:	Witvliet, Hans
> > Cc:	parisc-linux@lists.parisc-linux.org
> > Subject:	Re: [parisc-linux] Booting 0.9.2 on C110
> > 
> > On Fri, Jul 13, 2001 at 02:40:19PM +0200, Witvliet, Hans wrote:
> > > High all,
> > > 
> > > Just downloaded 0.9.2 image, burned it, and gave it a try on my C110.
> > > (should work afaik)
> > > For  the broad picture:
> > > C110, 256MB mem PS/2 keyboard & mouse, two lan interface, neither
> > connected
> > > (yet) and no serial console)
> > > 
> > > Booting went well, switched to STI-console (nice tux  in upperleft
> > corner)
> > > In a blink boot (cpu, mem, disks, lan) info flashed across the screen,
> > and
> > > then, instead of login, a graphic screen with a general debian message
> > that
> > > it is experimental software.
> > 
> > That is correct, you are about to install linux from CD, so you are
> seeing
> > the first screen of the installer output.
> > 
> > > After that the system seems to be frozen...
> > 
> > There are problems with the keyboard driver; for some people unplugging
> > the keyboard and this point and then plugging it in again clears the
> > problem.  I found that an old Compaq keyboard did not lock up at all.
> > You should be able to press <space> or <return> on that screen and get
> > the main menu of the installer displayed.
> > 
> > Richard
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
