Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA14615
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 21:44:35 -0600
Received: (from pschwan@localhost)
	by burrow.puffingroup.com (8.8.7/8.8.7) id AAA26481
	for parisc-linux@thepuffingroup.com; Wed, 27 Oct 1999 00:27:57 -0400
Message-ID: <19991027002755.D26012@thepuffingroup.com>
Date: Wed, 27 Oct 1999 00:27:55 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] the state of the shell
List-ID: <linux-parisc.vger.kernel.org>

So, I spent all evening trying to figure out _exactly_ which
differences between Chris Beard's tree and cvs-head were preventing us
from getting to a shell.  Here's what I found:

- The drivers/gecko/lasi.c changes made between 1999/10/19 and
1999/10/25 made the console unbearably slow.  At first glance I
suspect we're not handling interrupts properly, but I haven't looked
at it in any sort of detail.  I'll get to it soon, unless someone else
does first.

- I reverted someone else's one-line change to drivers/char/serial.c
that was causing the console to barf when sash tried to display
something.  This was ultimately the only hard problem to track down.

- We need ``argv_init[1] = NULL;'' in init/main.c, at least for the
moment, so that we don't get sash's usage screen.

- There are problems with the IODC console.  If I set console=tty and
boot with IODC, I get: 

Attempting to execute '/sbin/init'

It's for the PA-RISC!
It's executable!
It has an appropriate version!
The checksum checks out!
Well, it *smells* like a valid SOM executable
(start_brk) 40017000
(end_code) 0003c000
(start_code) 00001000
(end_data) 40008000
(start_stack) 20000028
(brk) 40017000
Kernel panic: Attempted to kill the idle task!
In swapper task - not syncing

I've not even begun to debug this.  If you want to just get to a
prompt, turn off the IODC console and set ``console=ttyS0'' in
arch/parisc/boot/boot_code/ipl_c.c

Aside from that, using the ramdisk that Chris made (on
puffin.external.hp.com), you should be able to boot to a sash prompt,
at least on the A180.  I've not tried it on any other machine; I'll
probably try it first thing tomorrow.

Good luck--

-Phil
