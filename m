Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA01494
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 09:40:52 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting from tape
Date: Tue, 28 Sep 1999 17:39:00 +0200
Content-Type: text/plain
References: <19990928144846.10298.rocketmail@send205.yahoomail.com>
MIME-Version: 1.0
Message-Id: <99092817410500.01336@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Tue, 28 Sep 1999 schrieb Ulrich Strelow:
> I know that this is extremely low priority but...
> 
> I have tried to boot the linux kernel from a SCSI DDS
> tape (copied via dd if=Image of=/dev/rmt/0m bs=512).
> The same kernel (cvs tree from today) boots
> sucessfully via rbootd on my 715/33. Here is the
> console log:
> 
>               (c) Copyright Hewlett-Packard Company,
> 1991, 1992
> Portions of this code are (c) Copyright Samsung
> Electronics Co., Ltd, 91, 92
> 
> PDC ROM rev. 1.4
> IODC ROM rev. 1.2
> 48 MB of memory have been configured.
> 
> 
> Selecting a system to boot.
> To stop selection process, press and hold the ESCAPE
> key.
> 
> Selection process stopped.
> 
> Searching for Potential Boot Devices.
> To terminate search, press and hold the ESCAPE key.
> 
> Device Selection      Device Path              Device
> Type
> ----------------------------------------------------------------------------
> 
> P0                    scsi.6.0                 HP     
> C3324A
> P1                    scsi.3.0                 HP     
> C2490AM
> P2                    scsi.0.0                 HP     
> HP35480A
> 
> 
> 
> b)    Boot from specified device
> s)    Search for bootable devices
> a)    Enter Boot Administration mode
> x)    Exit and continue boot sequence
> ?)    Help
> 
> Select from menu: b p2
> 
> Trying scsi.0.0
> Boot path initialized.
> Attempting to load IPL.
> 
> Failed I/O operation with scsi.0.0
> ENTRY_IO status = -10
> 
> 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> 00004F04 000000FF FF0009BF 00000000 800100DC 00000000
> 0025F000 00000400
> 98080000 00000000 00008C60 00000000 000000FF 00000000
> 00000000 00000000
> 
> 
> Searching for Potential Boot Devices.
> 
> Should this work or is this a current limitation ?

It should work and it did it already in the past. I think the bootloader is
currently not in the best condition since we aren´t able to boot via
hpux-bootloader too anymore.
(This is one of the problems which will be adressed in the very near future...)

Helge.


> 
> Ulrich
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Bid and sell for free at http://auctions.yahoo.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
