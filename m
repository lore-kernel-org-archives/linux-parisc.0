Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA03701
	for <parisc-linux@puffin.external.hp.com>; Mon, 12 Jul 1999 08:22:33 -0600
From: Ulrich.Strelow@schering.de
To: Mike Shaver <shaver@netscape.com>
cc: parisc-linux@thepuffingroup.com
Message-ID: <C12567AC.004F003B.00@BE2314.schering.de>
Date: Mon, 12 Jul 1999 16:22:37 +0200
Subject: Antwort: [parisc-linux] serial console
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Today I have managed to setup my 715/33 to use a serial console so that I
am able to capture the boot messages for future tests. I did the following:

1. Connect the 715/33 to a PC via a null-modem cable.
2. Hold down the ESC key to stop the automatic selection process.
3. Enter "a" to get the BOOT_ADMIN> prompt
4. At this prompt issue the command: PATH console rs232_a

This switches the console path from "graphics_1" to the first serial port
(/dev/tty0p0 in HP-UX language).

I hope this helps. Maybe the syntax is different on other workstation
models (I think the 800 server models use the hardware path instead of
symbolic names).

Ulrich
---------------------------------------------
Ulrich Strelow
<ulrich.strelow@schering.de or
ulrich_strelow@yahoo.com>
Berlin, Germany




Mike Shaver <shaver@netscape.com> am 10.07.99 20:53:39


An:   parisc-linux@thepuffingroup.com
Kopie:     (Blindkopie: Ulrich Strelow/BE/USR/SHG)


Thema:    [parisc-linux] serial console





I have a serial console cable that came with my A180C, but I can't get
the silly box to talk to it.

I've tried with another known-good cable (it works with my Indy), and
still nothing.  What do I need to do to activate it?  I tried unplugging
the web console from the network, and rebooting with the serial cable
connected and minicom running, but still no joy.

Also, is there an equivalent to Sun's L1-A or the Indy's
send-break-over-serial that will get me back to the PROM in the event
that Linux jumps to east nowhere?  Or do I have to power cycle?

Mike

--
275134.15 242554.19

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
