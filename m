Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA12161
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 04:13:02 -0700
Date: Thu, 30 Nov 2000 09:15:11 -0200 (BRST)
From: "Jorge L. deLyra" <delyra@latt.if.usp.br>
To: Steve Moret <smoret@uci.edu>
cc: parisc-linux@thepuffingroup.com, assirati@socrates.if.usp.br
Subject: RE: [parisc-linux] HP 9000/735-125 
In-Reply-To: <KNEHLBLKMAMGJHIKCGCIMEMKCAAA.smoret@uci.edu>
Message-ID: <Pine.LNX.3.96.1001130085854.14082C-100000@latt.if.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I have a 735-125 and am able to net-boot it on a custom configured kernel as
> long as I disable the ASP parallel ports. It works quite well using an NFS
> root as I cannot get the SCSI hard drives to mkfs. I was going to try and
> debug it but have yet to find the free time. I can e-mail you my working
> .config for the kernel, or build kernels (tested on my own 735) for people
> if they need them.

Well, looks like the problem is known, good! But we have a queer little
problem with our machines here, we are unable to boot from the network. I
think we did everything right, in fact, we are trying to use a server here
other machines boot from, it has dhcp, boopt, tftp, rarp, the works. We
set it all up, put the kernel on the tftpboot area, tested all that we
could by other means but, when we try to net boot the HPs, we are faced
with complete silence on the network. No logs on the server, nothing.

A little explanation might be needed: these are not really native 735-125
models, they were upgraded from older 720-50 models by card swapping. I am
not sure whether all cards were changed, maybe some aspects of the machine
are still old. The syntax of the net boot procedure in them is strange,
you have to put in the hardware address of the server, which is unusual.

I _suspect_ that this bios does not use tcp/ip for the net boot, but some
HP proprietary protocol relating to that clustering software they have or
used to have for these machines, in which you ran several stations out of
the disks of a single one. In any case, a listing of what happens on the
console on a net-boot trial goes below. We had a tail -f on the system log
of the server, we had tcpdump listening, but nothing at all shows up...

----------------------------------------------------------------
        Jorge L. deLyra,  Associate Professor of Physics
            The University of Sao Paulo,  IFUSP-DFMA
       For more information: finger delyra@latt.if.usp.br
----------------------------------------------------------------

Seyon Copyright (c) 1992-1993 Muhammad M. Saggaf. All rights reserved.
Version 2 rev. 20c i586-Linux steve@hammer 05/23/99 20:19:22.

Locating Modems...
Modem `/dev/ttyS0' is Available.




(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.

PDC ROM rev. 2.7
IODC ROM rev. 1.1
80 MB of memory configured and tested.


Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C3725S
P1                    scsi.4.0                 TOSHIBA CD-ROM XM-3301TA



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: a
BOOT_ADMIN> help boot

Boot from specified device or path:          

  BOOT <boot_selection> IPL     boots Initial Program Loader (interactive mode)
  BOOT <boot_selection>         boots default boot utility

  <boot_selection> may be one of the following:

      pri                 primary path in Stable Storage
      alt                 alternate path in Stable Storage
      Pn                  Device selection from SEARCH
      eisa.<options>      EISA adapter
      fwscsi.<options>    On-board FASTWIDE SCSI interface
      lan.<options>       Slider-card LAN interface
      scsi.<options>      On-board SCSI interface

For more information on boot selection options, type  HELP <device> 
where <device> = eisa, lan, scsi, etc ...

BOOT_ADMIN> help lan


LAN (IEEE 802.3/Ethernet LAN) Path Specification

   lan.<server_address>.<init_retry>.<io_retry>

    <lan_server_address>      12 digit (hex) LAN server address 
    <init_retry>              max number of times to try a boot request
                               (0 = default, 255 = infinite)
    <io_retry>                max number of times to try a read request
                               (0 = default, 255 = infinite)

Example: to specify LAN address 123456-78ABCD with infinite
initialization retries and default I/O retries,

           lan.123456-78ABCD.255.0

If one or more parameters are not specified, the following
defaults will be used:    <lan_server_address> = 000000-000000 
                          <init_retry>   = 3 tries
                          <io_retry>     = 6 tries

BOOT_ADMIN> boot lan.0000f8-01abb1.0.0

Trying lan.0000f8-01abb1.0.0
Failed to initialize lan.0000f8-01abb1.3.0
ENTRY_INIT status = -7

00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000008 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 A000800C F0002898 00000000 0800090B DBEB0000 00000000 


Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C3725S
P1                    scsi.4.0                 TOSHIBA CD-ROM XM-3301TA



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: 
