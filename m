Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C614482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 07:01:45 -0600 (MDT)
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Subject: Re: [parisc-linux] Booting 0.9.2 on C110
Message-ID: <995029303.3b4ef1372afa0@epost.start.no>
Date: Fri, 13 Jul 2001 15:01:43 +0200test
From: Andy Walker <squawker@start.no>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <1A8904C3797ED411AC2E0008C7E6F88117C915@nlntmail2b.ats.nld.alcatel.nl>
In-Reply-To: <1A8904C3797ED411AC2E0008C7E6F88117C915@nlntmail2b.ats.nld.alcatel.nl>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Quoting "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>:

> High all,
> 
> Just downloaded 0.9.2 image, burned it, and gave it
> a try on my C110.
> (should work afaik)
> For  the broad picture:
> C110, 256MB mem PS/2 keyboard & mouse, two lan
> interface, neither connected
> (yet) and no serial console)
> 
> Booting went well, switched to STI-console (nice tux
>  in upperleft corner)
> In a blink boot (cpu, mem, disks, lan) info flashed
> across the screen, and
> then, instead of login, a graphic screen with a
> general debian message that
> it is experimental software.
> 
> After that the system seems to be frozen...
> 
> Am i missing something?
> 
> Hans.

Not really - its the PS/2 keyboard hang that currently
affects B-class and apparently C-class machine. Possibly
others too. My B132 does the same. Some people have had
success unplugging and replugging the keyboard at this
point - trying to provoke a reset. This hasn't worked for
me though :-(

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
