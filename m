Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA13236
	for <parisc-linux@puffin.external.hp.com>; Sun, 29 Oct 2000 23:55:08 -0700
From: xam@sgate.charlysworld.de
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.9.3/8.8.7) with ESMTP id HAA16819
	for <parisc-linux@thepuffingroup.com>; Mon, 30 Oct 2000 07:56:39 +0100
Date: Mon, 30 Oct 2000 07:56:36 +0100 (CET)
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10010300731500.16155-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Installation problems
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

i have some problems while installing Linux/hppa on my
hp9000/730. since i don't have any hp manuals i ask
here (i didn't find any information on hp.com or elsewhere)

I installed the latest nfsroot on my linux/x86, also
the latest cross-compiler package, got the latest palo
and tried to install palo on a ibm0664 scsi hd (2gb,
1. partition 10mb /boot, 2.partition 128mb swap, rest /).

I found some documents in the internet which said that
this harddisk is compatible with hpux and/or hp9000/7xx.

well, i adopted some files of the nfsroot and installed
the contents of the nfsroot also on the harddisk (the
only one on the hp, scsi id 6).

unfortunately i can't boot the harddisk (i also tried
some other harddisks, so i think it is some problem
which is not related to the hardware, because i have/had
a hd with preinstalled hpux10.10 which doesn't make any
troubles ...).

The boot sequence stops with

ENTRY_INIT status=-13

i don't have any clue what this means ...

the internal scsi-floppy (id 0) give the following
error:

ENTRY_INIT status=-4 (since i don't have a bootable disk)

all the other (n/a) ids produce a

ENTRY_INIT status=-7 (i think this means "no hardware connected")


i also connected a zip drive (id 3), a cdrom (id 4) and a cdwriter (id 5)
drive, they report

can't boot IPL!

but the initialition of these scsi devices is okay (produces no errors)

so i'm a little bit confused, because the zip/cdrom/cdwriter
can be initialized, but not the harddisk.
i expected that the hd would be initialized correctly, but^it would
also give a "can't boot IPL!" error or no error at all ....


so can someone give me a hint what ENTRY_INIT status = -13 means ?
what did i do wrong ?

thanks in advance,
max
.
