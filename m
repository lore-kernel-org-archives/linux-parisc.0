Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440AF4834
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Mar 2002 16:56:25 -0700 (MST)
Message-ID: <3C9D1669.8A98AAA3@gmx.at>
Date: Sun, 24 Mar 2002 00:57:29 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Dark Fiber <dfiber@mega-tokyo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] netbooting kernel
References: <5.1.0.14.2.20020323231259.02e2cd68@mail.mega-tokyo.com>
Content-Type: text/plain; charset=us-ascii
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

Hello !

I cannot say you directly your problem, but check following ...

Decide for one boot method, not all things in mixture as BOOTP and RARP
and DHCP and .....

Your box seems to speak BOOTP/DHCP, is this correct ?
Otherwise you need to use RBOOT (a HP proprietary boot protocol).

Decide for BOOTP or DHCP!

For BOOTP only ONE file is needed, the `/etc/bootptab'.
For DHCP only ONE file is needed, the `/etc/dhcpd.conf'.

(No need for `ethers' etc....).

Now check, if the boot file (LIF image) is correctly defined in the
`bootptab' or `dhcpd.conf', perhaps your machine does not get the valid
boot image. BTW, the image is created with `make palo' on the linux
kernel
source tree base.

I hope, you will find a thing, which is not correct here ... !

With friendly regards
Christoph Plattner


Dark Fiber wrote:
> 
> when trying to netboot my c200 to install the 0.9 cd,
> it doesnt get very far...
> 
> i did a sea lan and get a p0 reference;
> P0     LAN.192.168.1.1.3.254    192.168.1.1   100/Full Dx
> 
> (192.168.1.1 being my router, .1.10 is my freebsd box).
> 
> so when I  boot p0 i get
> 
> Cannot find ENTRY_TEST.
> 
> Failed to initialize.
> 
> ENTRY_INIT
> Status = -7
> 
> checking the arp cache on my router doesnt even give a reference
> to my c200 (i dont even know the c200's booting default ip)
> 
> BUT! checking my dhcp ip assignment table in the router i get
> 3       192.168.1.11    00-60-B0-B2-89-18       11:49:02.600
> 
> so I know its created an entry for the machine...
> i also know the cable is good (i netboot my sparcstation 5 just peachy).
> 
> doing a direct connect from my c200 to my pc (freebsd 4.5) and doing a sea lan
> gets no result.
> 
> i have my /etc/ethers set with the c200 MAC
> i have tftpboot setup, bootpd, rarpd, etc.
> 
> if it helps here is some of the techo info from the c200;
> (mebbe a known bug in some firmware I have? problem is, since I cant boot
> the c200, I cant update the firmware....)
> 
> Firmware Version  5.8
> 
> Duplex Console IO Dependent Code (IODC) revision 1
> 
> ------------------------------------------------------------------------------
>     (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
> ------------------------------------------------------------------------------
> 
>    Processor   Speed            State           Coprocessor State  I/D Cache
>    ---------  --------   ---------------------  -----------------
> -------------
>        0      200 MHz    Active                 Functional         512 KB/1 MB
> 
>    Central Bus Speed (in MHz) :        120
> 
>    Available memory (bytes)    : 268406784
>    Good memory required (bytes):   21610496
> 
>    Primary boot path:    FWSCSI.6.0
>    Alternate boot path:  SESCSI.6.0
>    Console path:         GRAPHICS(4)
>    Keyboard path:        PS2
> 
>    LAN Station Address:  0060b0-b28918
> 
> CHIP REVISIONS
> 
>          Module              Revision
>          ------              --------
>          Backplane Board     1
>          I/O Board           3
>          Processor Board     0
>          PA 8200-8200 CPU    4.0
>          PDC                 5.8
>          Memory Controller   9
>          I/O Bus Adapter 0   15
>          GSC to PCI Bridge   0x6803
>          Multi I/O Chip      0
>          I/O Bus Adapter 1   15
>          GSC to PCI Bridge   0x6822
>          GSC 1               40MHz
>          GSC 2               40MHz
> 
>          GRAPHICS(4)         8.09/100 2fc1066b.09a02587
> 
> I/O MODULE INFORMATION
>                                                                       IODC IODC
> Path         Decimal Type                      Location   HVER SVER  Vers Dep
> ------------ ------- ------------------------- ---------- ---- ----  ---- ----
> 8/0          8/0     Bus Bridge                built-in   6803 0a00  0x00 0x00
> SERIAL_2     8/0/63  RS232 port                built-in   0060 8c00  0x01 0x00
> 8/16         8/16    Bus Adapter               built-in   0560 8100  0x00 0x00
> 8/16/0       8/16/0  Parallel                  built-in   0560 7400  0x00 0x00
> 8/16/1       8/16/1  Audio                     built-in   0564 7b00  0x00 0x00
> SERIAL_1     8/16/4  RS232                     built-in   0560 8c00  0x01 0x00
> SESCSI       8/16/5  SE SCSI                   built-in   0560 8200  0x99 0x00
> PS2          8/16/7  Keyboard                  built-in   0560 8400  0x00 0x00
> 8/16/8       8/16/8  Mouse                     built-in   0560 8400  0x00 0x00
> 8/63         8/63    Bus Converter             built-in   5011 0c00  0x00 0x00
> 10/0         10/0    Bus Bridge                built-in   6821 0a00  0x00 0x00
> 10/63        10/63   Bus Converter             built-in   5011 0c00  0x00 0x00
> 
> -Dark Fiber <dfiber@mega-tokyo.com>
> 
> [FAQ] Write Your Own Operating System
>          http://www.mega-tokyo.com/os
> Sarien Sierra AGI Emulator
>          http://www.mega-tokyo.com/sarien
> 3x3 Eyes Fanfiction Archive
>          http://www.mega-tokyo.com/pai
> AD&D UnderDark Roguelike
>          http://www.mega-tokyo.com/underdark
> Roguelike News II
>          http://www.mega-tokyo.com/rlnews
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
