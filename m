Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D0544829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Dec 2002 06:10:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18NC48-0003RS-00; Sat, 14 Dec 2002 13:10:48 +0000
Date: Sat, 14 Dec 2002 13:10:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joerg Steindlberger <j@steindlberger.de>
Cc: PARISC-LINUX <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] problems with PCI IDE controller
Message-ID: <20021214131048.L10991@parcelfarce.linux.theplanet.co.uk>
References: <courier.3DFB1AEA.0000527C@server01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <courier.3DFB1AEA.0000527C@server01>; from j@steindlberger.de on Sat, Dec 14, 2002 at 12:48:43PM +0100
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

On Sat, Dec 14, 2002 at 12:48:43PM +0100, Joerg Steindlberger wrote:
> Here is what I did: Building the kernel - booting the system - doing a 
> modprobe -k ide-disk (from remote) - pressing Transfer Of Control - 
> interrupting boot sequence and typing ser pim. And here is the output of 
> the console: (thank You for helping - Joerg)

Great.  Now...

http://www.parisc-linux.org/faq/kernelbug-howto.html

I notice you have devfs compiled in.  I can't recommend this course
of action, though I coubt it's the root of the problem.

> hp-c240 login:
> Debian GNU/Linux testing/unstable hp-c240 tts/0
> 
> hp-c240 login: Uniform Multi-Platform E-IDE driver Revision: 6.31
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> PDC20268: IDE controller on PCI bus 00 dev 08
> PDC20268: chipset revision 2
> PDC20268: not 100% native mode: will probe irqs later
> 
> 
> Uniform Multi-Platform E-IDE driver Revision: 6.31
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> PDC20268: IDE controller on PCI bus 00 dev 08
> PDC20268: chipset revision 2
> PDC20268: not 100% native mode: will probe irqs later
> 
> Stack Dump:
>   2f1a0900:  00000002 73747576 6f707172 6b6c6d6e
>   2f1a08f0:  6768696a 1010fdec 00000000 0000000f
>   2f1a08e0:  103dee76 10323810 10323b68 00000036
>   2f1a08d0:  00000061 00000000 00000001 10323810
>   2f1a08c0:  00000000 00000002 103df23f 00000010
>   2f1a08b0:  103dee40 0002423c 00000400 1037da4c
> 
> Kernel addresses on the stack:
>   [<1010fdec>]  [<0002423c>]  [<0002ec19>]  [<1024ba78>]
>   [<00034b44>]  [<000204c8>]  [<00034b44>]  [<0002ebe8>]
>   [<0002e898>]  [<1011cd58>]  [<102d0cec>]  [<00034b44>]
>   [<00036010>]  [<1011ce84>]  [<00034b44>]  [<00036010>]
>   [<000300ea>]  [<0002120c>]  [<00036010>]  [<0002ee98>]
>   [<0002e898>]  [<1011cd58>]  [<00036010>]  [<00036010>]
>   [<0002c180>]  [<0002ba01>]  [<000213e8>]  [<00020003>]
>   [<10135ddc>]  [<0000fe30>]  [<0001eac3>]  [<00017af0>]
>   [<0002b9cc>]  [<0002ba04>]  [<00036010>]  [<00010504>]
>   [<1011de54>]  [<0002d000>]  [<0002c5c0>]  [<10104904>]
>   [<0002c5b4>]  [<0002c5b4>]  [<0000a060>]  [<0002c5d0>]
>   [<10108f90>]  [<10108084>]  [<10107cf4>]  [<1013fd44>]
>   [<1013e638>]  [<1014ed24>]  [<0002c5b4>]  [<0001436b>]
>   [<101205a8>]
> 
> High Priority Machine Check (HPMC): Code=1 regs=10313080 (Addr=00000000)
> 
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000011100001100 Not tainted
> r00-03  00000000 10320010 1010f840 000000ff
> r04-07  0000fd00 0000fd1f 109ab400 0002e898
> r08-11  109ab400 00000061 00000000 00000001
> r12-15  00000000 2fda3ce0 2f1a0550 00000003
> r16-19  00044c08 00045408 00000000 f200006f
> r20-23  0000000e 0000000f 1026bee4 10323810
> r24-27  0000fd1f 00000003 109ac160 10310010
> r28-31  0000006f ffffe003 2f1a0900 1010f840
> sr0-3   00000000 00000265 00000000 00000265
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 1026bf10 1026bf14
>   IIR: 00141860    ISR: 9227ffc8  IOR: 00000064
>   CPU:        0   CR30: 2f1a0000 CR31: 103d0000
>   ORIG_R28: 00000000
> 
> 
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
>        0      236 MHz    Active                 Functional         2 MB/2 MB
> 
>    Central Bus Speed (in MHz) :        118
> 
>    Available memory (bytes)    : 536870912
>    Good memory required (bytes):   44974080
> 
>    Primary boot path:    LAN.0.0.0.0.0.0
>    Alternate boot path:  FWSCSI.6.0
>    Console path:         GRAPHICS(4)
>    Keyboard path:        PS2
> 
> CPU 0
> WARNING:  Self tests have been disabled as a result of FASTBOOT
>            being enabled.  To enable self tests, use the FASTBOOT
>            command in the CONFIGURATION menu and reboot the system.
> 
> 
> Processor is booting from first available device.
> 
> To discontinue, press any key within 10 seconds.
> 
> Boot terminated.
> 
> 
> ------- Main Menu 
> -------------------------------------------------------------
> 
>          Command                         Description
>          -------                         -----------
>          BOot [PRI|ALT|<path>]           Boot from specified path
>          PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
>          SEArch [DIsplay|IPL] [<path>]   Search for boot devices
> 
>          COnfiguration [<command>]       Access Configuration menu/commands
>          INformation [<command>]         Access Information menu/commands
>          SERvice [<command>]             Access Service menu/commands
> 
>          DIsplay                         Redisplay the current menu
>          HElp [<menu>|<command>]         Display help for menu or command
>          RESET                           Restart the system
> -------
> Main Menu: Enter command > ser pim
> 
> PROCESSOR PIM INFORMATION
> 
> -----------------  Processor 0 HPMC Information ------------------
> 
> Timestamp =   Fri Dec  13 23:00:06 GMT 2002    (20:02:12:13:23:00:06)
> 
> HPMC Chassis Codes = 0xcbf0  0x5007  0x5408  0x5508  0xcbfb
> 
> General Registers 0 - 31
> 00-03   0000000000000000  0000000010320010  000000001010f840 
> 00000000000000ff
> 04-07   000000000000fd00  000000000000fd1f  00000000109ab400 
> 000000000002e898
> 08-11   00000000109ab400  0000000000000061  0000000000000000 
> 0000000000000001
> 12-15   0000000000000000  000000002fda3ce0  000000002f1a0550 
> 0000000000000003
> 16-19   0000000000044c08  0000000000045408  0000000000000000 
> 00000000f200006f
> 20-23   000000000000000e  000000000000000f  000000001026bee4 
> 0000000010323810
> 24-27   000000000000fd1f  0000000000000003  00000000109ac160 
> 0000000010310010
> 28-31   000000000000006f  00000000ffffe003  000000002f1a0900 
> 000000001010f840
> 
> <Press any key to continue (q to quit)>
> 
> Control Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 04-07   0000000000000000  0000000000000000  0000000000000000 
> 0000000000000000
> 08-11   00000000000004ca  0000000000000000  00000000000000c0 
> 000000000000001f
> 12-15   0000000000000000  0000000000000000  0000000000107000 
> 00000000f0000000
> 16-19   000000195c1e11d2  0000000000000000  000000001026bf10 
> 0000000000141860
> 20-23   000000009227ffc8  c000000000000064  000000000004070c 
> 0000000080000000
> 24-27   000000000032d000  000000001f208000  00000000ffffffff 
> 00000000ffffffff
> 28-31   00000000ffffffff  00000000ffffffff  000000002f1a0000 
> 00000000103d0000
> 
> Space Registers 0 - 7
> 00-03   00000000          00000265          00000000          00000265
> 04-07   00000000          00000000          00000000          00000000
> 
> <Press any key to continue (q to quit)>
> 
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x000000001026bf14
> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0020000c
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0xfffffffffffa0000
> System Requestor Address     = 0x0000000000000000
> Check Summary                = 0x8002000040004000
> Available Memory             = 0x0000000000000000
> CPU Diagnose Register 2      = 0x0501000000000004
> CPU Status Register 0        = 0x4420c20000000000
> CPU Status Register 1        = 0x8002000000000000
> SADD LOG                     = 0x0800000000000000
> Read Short LOG               = 0xc10010fff200006f
> 
> <Press any key to continue (q to quit)>
> 
> Memory Error Log Information:
> 
> Timestamp =   Fri Dec  13 23:00:07 GMT 2002    (20:02:12:13:23:00:07)
> 
>     No memory errors logged
> 
> 
> I/O Module Error Log Information:
> 
> Timestamp =   Fri Dec  13 23:00:08 GMT 2002    (20:02:12:13:23:00:08)
> 
> Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor 
> Responder
> --- ---------- ---------------- -------- -- -- ---- ----- ---------- 
> ----------
>   0  0xfff88000 I/O Adapter      8         2  0  he   0x0d 0x00000000 
> 0x00000000
>   1  0xf203f000 Bus Converter    8/63     15  3  se   0x07 0xfffa0800 
> 0xf200006f
>   1  0xf2000000 Bus Bridge (PCI)                      0x07 0xf2000000 
> 0x0000fd1f
> 
> PCI Device Failure Information
> 
> Physical Slot   Logical   Path
> -------------  ----------------------------
>     1            0/255/255/255/8/0/1/0
> 
> 
> 
> PCI Error Summary
> 
> A Processer IO error occurred. The GSC-PCI bridge was
> the requestor. Error bit indicates a master timeout
> or master Abort was received during a PCI transaction.
> 
> Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor 
> Responder
> --- ---------- ---------------- -------- -- -- ---- ----- ---------- 
> ----------
>   0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 
> 0x00000000
> 
> <Press any key to continue (q to quit)>
> Main Menu: Enter command >
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
