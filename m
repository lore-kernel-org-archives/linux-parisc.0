Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nlntadn.ats.nld.alcatel.nl (unknown [193.173.147.190])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9199482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 02:59:41 -0600 (MDT)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C91E@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: 'Richard Hirst' <rhirst@linuxcare.com>,
	"Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Booting 0.9.2 on C110
Date: Tue, 17 Jul 2001 10:59:38 +0200
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Thanks Richard,

Tried it straight away, but no luck!
Neither keyboard or mouse unplug/replug, nor space, return, escape, ctrl-c,
ctrl-d or any function key seems to be noticed.
I'll try to find an other idle-hp-machine to see if i see the identical
behaviour....

Hans

> -----Original Message-----
> From:	Richard Hirst [SMTP:rhirst@linuxcare.com]
> Sent:	Tuesday, July 17, 2001 10:47 AM
> To:	Witvliet, Hans
> Cc:	parisc-linux@lists.parisc-linux.org
> Subject:	Re: [parisc-linux] Booting 0.9.2 on C110
> 
> On Fri, Jul 13, 2001 at 02:40:19PM +0200, Witvliet, Hans wrote:
> > High all,
> > 
> > Just downloaded 0.9.2 image, burned it, and gave it a try on my C110.
> > (should work afaik)
> > For  the broad picture:
> > C110, 256MB mem PS/2 keyboard & mouse, two lan interface, neither
> connected
> > (yet) and no serial console)
> > 
> > Booting went well, switched to STI-console (nice tux  in upperleft
> corner)
> > In a blink boot (cpu, mem, disks, lan) info flashed across the screen,
> and
> > then, instead of login, a graphic screen with a general debian message
> that
> > it is experimental software.
> 
> That is correct, you are about to install linux from CD, so you are seeing
> the first screen of the installer output.
> 
> > After that the system seems to be frozen...
> 
> There are problems with the keyboard driver; for some people unplugging
> the keyboard and this point and then plugging it in again clears the
> problem.  I found that an old Compaq keyboard did not lock up at all.
> You should be able to press <space> or <return> on that screen and get
> the main menu of the installer displayed.
> 
> Richard
