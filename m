Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id E92FE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 02:49:24 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9DE7FB00C; Tue, 17 Jul 2001 09:47:28 +0100 (BST)
Date: Tue, 17 Jul 2001 09:47:28 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting 0.9.2 on C110
Message-ID: <20010717094728.L30356@linuxcare.com>
References: <1A8904C3797ED411AC2E0008C7E6F88117C915@nlntmail2b.ats.nld.alcatel.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1A8904C3797ED411AC2E0008C7E6F88117C915@nlntmail2b.ats.nld.alcatel.nl>; from Hans.Witvliet@Alcatel.nl on Fri, Jul 13, 2001 at 02:40:19PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 13, 2001 at 02:40:19PM +0200, Witvliet, Hans wrote:
> High all,
> 
> Just downloaded 0.9.2 image, burned it, and gave it a try on my C110.
> (should work afaik)
> For  the broad picture:
> C110, 256MB mem PS/2 keyboard & mouse, two lan interface, neither connected
> (yet) and no serial console)
> 
> Booting went well, switched to STI-console (nice tux  in upperleft corner)
> In a blink boot (cpu, mem, disks, lan) info flashed across the screen, and
> then, instead of login, a graphic screen with a general debian message that
> it is experimental software.

That is correct, you are about to install linux from CD, so you are seeing
the first screen of the installer output.

> After that the system seems to be frozen...

There are problems with the keyboard driver; for some people unplugging
the keyboard and this point and then plugging it in again clears the
problem.  I found that an old Compaq keyboard did not lock up at all.
You should be able to press <space> or <return> on that screen and get
the main menu of the installer displayed.

Richard
