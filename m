Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA24290
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 00:22:10 -0700
Message-Id: <200010300728.XAA25855@milano.cup.hp.com>
To: xam@sgate.charlysworld.de
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Installation problems 
In-reply-to: Your message of "Mon, 30 Oct 2000 07:56:36 PST."
             <Pine.LNX.4.10.10010300731500.16155-100000@sgate.charlysworld.de>
Date: Sun, 29 Oct 2000 23:28:37 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

xam@sgate.charlysworld.de wrote:
 
> and tried to install palo on a ibm0664 scsi hd (2gb,
> 1. partition 10mb /boot, 2.partition 128mb swap, rest /).
...
> I found some documents in the internet which said that
> this harddisk is compatible with hpux and/or hp9000/7xx.

[ Digression: HPUX is pretty tolerant/robust on dealing with SCSI disks.
HP doesn't want to deal with issues which arise from disk firmware bugs.
So while the bare mechanism might be supported, you need to have
HP qualified firmware to complain to HP about problems...]


> unfortunately i can't boot the harddisk (i also tried
> some other harddisks, so i think it is some problem
> which is not related to the hardware, because i have/had
> a hd with preinstalled hpux10.10 which doesn't make any
> troubles ...).
> 
> The boot sequence stops with
> 
> ENTRY_INIT status=-13
> 
> i don't have any clue what this means ...

I don't either but I would guess the disk isn't spinning up because
the PDC/IODC didn't tell it to. Check for option jumpers on the disk
to (en-) disable two features:
o auto-start
o delayed start

Your SCSI disk might be configured to *NOT* spinup (ie auto-start
disabled) until it gets a "start unit" SCSI command from the host
(aka "initiator").

"delay start" usually implies auto-start is enabled but the mech
won't spinup until prescribed amount of time has passed.
Often the delay is something like "3+ID*6" seconds.

...
> so can someone give me a hint what ENTRY_INIT status = -13 means ?
> what did i do wrong ?

This might be documented in "iodc.pdf" or "pdc32.pdf" found on:
	http://www.thepuffingroup.com/parisc/documentation.html

Search for ENTRY_INIT.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
