Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from E-MAIL.COM (e-mail.com [204.146.168.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F779482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 May 2002 06:43:01 -0600 (MDT)
Received: from emgl0104.NU (prodmailsweeper.app.norwich-union.com.tag.norwich-union.co.uk [172.26.62.246])
        by gagps1.tag.norwich-union.co.uk (8.8.6 (PHNE_17190)/8.8.6) with ESMTP id NAA21772
        for <parisc-linux@lists.parisc-linux.org>; Fri, 31 May 2002 13:32:38 +0100 (BST)
Date: Fri, 31 May 2002 13:42:09 +0100 (BST)
From: Jonathan Pulfer <pulferj.phobos@midrange.norwich-union.co.uk>
Message-Id: <200205311242.g4VCg9Z02397@phobos.norwich-union.com>
To: grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] install on A180c
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

> Jonathan Pulfer wrote:
> > Could anyone give me some pointers as to kernel parameters that need to
> > be passed to PALO or whether I need to use a serial console please.
>=20
> I suggest trying serial console if you can.
> I'm not intimately familiar with web console on A180's but have
> heard it's not the same as remote consoles on other parisc servers.
>=20
> grant

I have tried using a serial console and here is the output on the console: -


=DE=DE=DE

Firmware Version  39.32

Duplex Console IO Dependent Code (IODC) revision 4

---------------------------------------------------------------------------=
---
   (c) Copyright 1996-1999, Hewlett-Packard Company, All rights reserved
---------------------------------------------------------------------------=
---

   Processor Speed   Coprocessor State  Cache Size
   ---------------   -----------------  ----------
   180 MHz           Functional         64 KB
                                         1 MB additional

  Model: A180c/1

  Available memory (bytes)    :  268435456=20

  Primary boot path:    8/16/5.6   (dec)
  Alternate boot path:  8/16/5.0   (dec)
  Console path:         8/16/4.0   (dec)

------- Main Menu ---------------------------------------------------------=
----

        Command                         Description
        -------                         -----------
        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON] [<path>]     Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration [<command>]       Access Configuration menu/commands
        INformation [<command>]         Access Information menu/commands
        SERvice [<command>]             Access Service menu/commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command > boot 8/16/5.1
Interact with IPL (Y, N, or Cancel)?> y

Booting...=20
Boot IO Dependent Code (IODC) revision 144


HARD Booted.
palo ipl 0.96 root@palinux Fri Nov  2 16:31:18 MST 2001

Boot image contains:
    0/vmlinux32 3122078 bytes @ 0x4cf000
    0/vmlinux64 3990942 bytes @ 0x7c9800
    0/ramdisk 1946807 bytes @ 0xb98000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently  used by firmware (serial).
Current command line:
0/vmlinux root=3D/dev/ram initrd=3D0/ramdisk console=3DttyS0 TERM=3Dvt102
 0: 0/vmlinux
 1: root=3D/dev/ram
 2: initrd=3D0/ramdisk
 3: console=3DttyS0
 4: TERM=3Dvt102

Edit which field?
(or 'b' to boot with this command line)? 0
0/vmlinux32
Current command line:
0/vmlinux32 root=3D/dev/ram initrd=3D0/ramdisk console=3DttyS0 TERM=3Dvt102
 0: 0/vmlinux32
 1: root=3D/dev/ram
 2: initrd=3D0/ramdisk
 3: console=3DttyS0
 4: TERM=3Dvt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=3D/dev/ram console=3DttyS0 TERM=3Dvt102'
Selected kernel: /vmlinux32 from partition 0
Selected ramdisk: /ramdisk from partition 0
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1618208 mediaptr 0x1000
Segment 1 load 0028c000 size 287728 mediaptr 0x18d000
Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000
Segment 3 load 00334000 size 8192 mediaptr 0x231000
Segment 4 load 00338000 size 32768 mediaptr 0x233000
Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8
Loading ramdisk 1946807 bytes @ 0fe14000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

FLT  CBFB


And this is where it hangs.

Thanks
Jonathan Pulfer


**********************************************************************
This email and any files sent with it are intended only for the named=20
recipient. If you are not the named recipient please telephone/email =20
the sender immediately. You should not disclose the content or       =20
take/retain/distribute any copies.                                   =20
**********************************************************************
