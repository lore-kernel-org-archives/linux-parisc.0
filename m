Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A409482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 15:56:26 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GP6IDZ00.GJU for
          <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 13:56:23 -0900
Date: Sun, 30 Dec 2001 13:53:21 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Serial console settings? 
In-Reply-To: <20011230214546.C2E0E37E86@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.33.0112301350000.11391-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > Tom writes...
> > Maybe I'm missing somethign here... I set up a serial console on the C180,
> > which works great at 9600. Want to speed it up, so I changed the settings
> > to rs232_1.38400.n.8 (or whatever the exact syntax is - the PDC is happy
> > with it). Power-cycle, reset terminal to 38400 and nothing. Reset terminal
> > to 9600 and there's the screen... Doesn't seem to matter what I set the
> > console speed to in the PDC - it always runs at 9600. Is there some way I
> > have to "push" this, or otherwise save it?
>
> Matt:
> Are you saying that the firmware doesn't display properly or the Linux
> console?
>
> If its the firmware my only advice is to try several different settings and
> see if you can get anything other than 9600 to work. If you can then you
> can try turning it up.
>
> If you're referring to the Linux console, you'll need to edit the serial
> terminal lines(they start with "T") in /etc/inittab and change the speed
> there to match firmware.

Whoops - me bad. Should have been a bit more specific... This is the HP
PDC console settings I'm talking about, not the Linux console. I set it to
serial_1.19200.8.none and it happily stays at 9600. I thought that perhaps
it was auto-detecting the terminal speed and resetting itself, but if I
set it that way, then reset the terminal to 19.2 it won't see any display
until I reset it to 9600...

It's not critical to increase it, but when it's needed 9600 sure is slow
:-)
