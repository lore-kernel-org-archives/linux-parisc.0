From: Marc Zyngier <maz@misterjones.org>
Subject: [parisc-linux] [2.6.15-rc6-pa1] 2 crashes with GSC Tulip on J210XC
Date: Sun, 25 Dec 2005 20:38:56 +0100
Message-ID: <wrpbqz56k6n.fsf@wild-wind.fr.eu.org>
Reply-To: maz@misterjones.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

People,

I recently managed to grab a dual tulip GSC card, thinking it would
probably add some geek factor to one of my PA boxes (J210XC, dual
PA7200). As I was trying to escape from food and toys on this Xmas
day, I plugged it in. And indeed, it shows a few things:

Linux version 2.6.15-rc6-pa1 (maz@eruption) (gcc version 4.0.2 (Debian 4.0.2-2)) #3 SMP Sun Dec 25 11:25:57 CET 2005

**** Crash #1:

Bringing up an interface sometimes generates an HPMC. This is not
systematic, but I manage to trigger it quite easily. Looks
dino-related.

eruption:~# ifconfig eth1 192.168.71.2 up
eth1: MII status 786b, Link partner report 41e1.


Backtrace:
 [<10117ba8>] inl+0x4c/0x78
 [<10275488>] ioread32+0x48/0x5c
 [<000474d4>] tulip_check_duplex+0x16c/0x364 [tulip]
 [<00045c04>] tulip_interrupt+0xb74/0x110c [tulip]
 [<1015f8d8>] handle_IRQ_event+0x5c/0xa4
 [<1015fa8c>] __do_IRQ+0x16c/0x220
 [<10284140>] dino_isr+0x90/0x114
 [<1015f8d8>] handle_IRQ_event+0x5c/0xa4
 [<1015fa8c>] __do_IRQ+0x16c/0x220
 [<1010942c>] do_cpu_irq_mask+0x108/0x1b4
 [<1010e068>] intr_return+0x0/0x1c
 [<1010483c>] _spin_unlock_irq+0x0/0x18


High Priority Machine Check (HPMC): Code=1 regs=103fc080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111101000001110 Not tainted
r00-03  00000000 10104000 102843d0 3737f2a0
r04-07  40000032 10ca2600 000000b0 10ca26e4
r08-11  36d89ea0 800100b0 000041e1 3737f000
r12-15  00052010 10450810 3737f000 0002fef0
r16-19  80010080 000dd024 00000000 f3fc8064
r20-23  f3fc806c 220e020e 102843a8 3737f000
r24-27  020e2202 0000000f 10ca26f0 103f7010
r28-31  0000000f 00000078 35f48c80 10117ba8
sr0-3   00000000 00000000 00000000 0000070b
sr4-7   00000000 00000000 00000000 00000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr08-11  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr20-23  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr24-27  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr28-31  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 00000000 00000000 IAOQ: 102843e0 102843e4
 IIR: 0c800184    ISR: 00000000  IOR: f3fc806c
 CPU:        0   CR30: 35f48000 CR31: 10458000
 ORIG_R28: 00000000
 IAOQ[0]: dino_in32+0x38/0x74
 IAOQ[1]: dino_in32+0x3c/0x74
 RP(r2): dino_in32+0x28/0x74
Kernel panic - not syncing: High Priority Machine Check (HPMC)
 


Firmware Version  1.9

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1990-1996, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------

      0      120  MHz   Active                 Functional            1 M
      1      120  MHz   Idle                   Functional            1 M

  Central Bus Speed (in MHz)  :        120  
  Available Memory (bytes)    :  671088640  
  Good Memory Required (bytes):   26382336  


   Primary boot path:    core.FWSCSI.6.0
   Alternate boot path:  core.FWSCSI.6.0
   Console path:         core.RS232_A.9600.8.none
   Keyboard path:        core.RS232_A.9600.8.none


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


------- Main Menu -------------------------------------------------------------

        Command                         Description
        -------                         -----------

        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration menu              Displays or sets boot values
        INformation menu                Displays hardware information
        SERvice menu                    Displays service commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command or menu > ser

------- Service Menu ----------------------------------------------------------

        Command                         Description
        -------                         -----------

        MemRead <address> [<len>]       Read memory and I/O locations
        PIM [<proc>] [HPMC|LPMC|TOC]    Display PIM information
        PDT [CLEAR]                     Display or clear the Page Deallocation
                                        Table
        ChassisCodes [<proc>]           Display chassis codes

        BOot [PRI|ALT|<path>]           Boot from specified path
        DIsplay                         Redisplay the current menu
        HElp [<command>]                Display help for specified command
        RESET                           Restart the system
        MAin                            Return to Main Menu
-------
Service Menu: Enter command > pim

PROCESSOR PIM INFORMATION


-----------------  Processor 0 HPMC Information ------------------

Timestamp =    Sun Dec  25 12:44:10 GMT 2005    (20:05:12:25:12:44:10)

HPMC Chassis Codes = 0xcbf0  0x5007  0x5509  0xcbfb  

General Registers 0 - 31
 0 -  3  0x00000000  0x10104000  0x102843d0  0x3737f2a0  
 4 -  7  0x40000032  0x10ca2600  0x000000b0  0x10ca26e4  
 8 - 11  0x36d89ea0  0x800100b0  0x000041e1  0x3737f000  
12 - 15  0x00052010  0x10450810  0x3737f000  0x0002fef0  
16 - 19  0x80010080  0x000dd024  0x00000000  0xf3fc8064  
20 - 23  0xf3fc806c  0x220e020e  0x102843a8  0x3737f000  
24 - 27  0x020e2202  0x0000000f  0x10ca26f0  0x103f7010  
28 - 31  0x0000000f  0x00000078  0x35f48c80  0x10117ba8  

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  
 8 - 11  0x00000e16  0x00000000  0x000000c0  0x0000001f  
12 - 15  0x00000000  0x00000000  0x0010d800  0x00000000  
16 - 19  0xbfd20fc4  0x00000000  0x102843e0  0x0c800184  
20 - 23  0x00000000  0xf3fc806c  0x0004fa0e  0x80000000  
24 - 27  0x00447000  0x25e3e000  0x00113040  0x00080000  
28 - 31  0x02000000  0x01280140  0x35f48000  0x10458000  

Space Registers 0 - 7
 0 -  3  0x00000000  0x00000000  0x00000000  0x0000070b  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  


 <Press any key to continue>                                                                  IIA Space                    = 0x00000000
IIA Offset                   = 0x102843e4
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0020000c
Assists Check                = 0x00000000
Assist State                 = 0x00000000
System Responder Address     = 0xfffa0000
System Requestor Address     = 0x00000000
Path Info                    = 0x00000000
Physical Memory              = 0x28000000
Available Memory             = 0x28000000

CPU Diagnose Register 0      = 0x20198300
CPU Status Register 0        = 0x0d008007
CPU Status Register 1        = 0x40000404
Runway Address Cycle [0:31]  = 0x08000000
Runway Address Cycle [32:63] = 0x00000000
Slave Address for trans_id 0 = 0xf3fc8060
Slave Address for trans_id 2 = 0x27220484
Slave Address for trans_id 3 = 0x272204e4
Slave Address for trans_id 4 = 0x0044722d
Slave Address for trans_id 5 = 0x25f48d0e
Slave Address for trans_id 6 = 0x0042194d
Slave Address for trans_id 7 = 0x00c46ecd

 <Press any key to continue>                                                                  
-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
System Responder Address     = 0x00000000
System Requestor Address     = 0x00000000
Path Info                    = 0x00000000

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
 0 -  3  0x00000000  0xfff0bdc0  0x10132eac  0x104bc810  
 4 -  7  0x00294834  0x10450c18  0x00000001  0x000f4000  
 8 - 11  0x00000000  0x800100b0  0x000041e1  0x3737f000  
12 - 15  0x00052010  0x10450810  0x3737f000  0x0002fef0  
16 - 19  0x103fc080  0x000dd024  0x00000000  0x9c5ea8f5  
20 - 23  0x00294833  0x364f41d4  0x10132c1c  0x00000000  
24 - 27  0x104bcf3c  0x000f4240  0x07270e00  0x103f7010  
28 - 31  0x9c5ef6de  0x0001d4c0  0x103fc4c0  0x10132ec0  

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  
 8 - 11  0x00000e16  0x00000000  0x000000c0  0x00000000  
12 - 15  0x00000000  0x00000000  0x0010d800  0x00000000  
16 - 19  0x9c6069e4  0x00000000  0x10132ed8  0x0a7c041c  
20 - 23  0x00000000  0x00004de9  0x0004f90f  0xb0000000  
24 - 27  0x00447000  0x00447000  0x00113040  0x02000000  
28 - 31  0x00080000  0x01280140  0x35f48000  0x10458000  

Space Registers 0 - 7
 0 -  3  0x00000000  0x00000000  0x00000000  0x0000070b  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  

IIA Space                    = 0x00000000
IIA Offset                   = 0x10132edc
CPU State                    = 0x9e000001

 <Press any key to continue>                                                                  
-----------------  Processor 1 HPMC Information ------------------

No valid timestamp

HPMC Chassis Codes = No chassis codes logged

General Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  
 8 - 11  0x00000000  0x00000000  0x00000000  0x00000000  
12 - 15  0x00000000  0x00000000  0x00000000  0x00000000  
16 - 19  0x00000000  0x00000000  0x00000000  0x00000000  
20 - 23  0x00000000  0x00000000  0x00000000  0x00000000  
24 - 27  0x00000000  0x00000000  0x00000000  0x00000000  
28 - 31  0x00000000  0x00000000  0x00000000  0x00000000  

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  
 8 - 11  0x00000000  0x00000000  0x00000000  0x00000000  
12 - 15  0x00000000  0x00000000  0x00000000  0x00000000  
16 - 19  0x00000000  0x00000000  0x00000000  0x00000000  
20 - 23  0x00000000  0x00000000  0x00000000  0x00000000  
24 - 27  0x00000000  0x00000000  0x00000000  0x00000000  
28 - 31  0x00000000  0x00000000  0x00000000  0x00000000  

Space Registers 0 - 7
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  


 <Press any key to continue>                                                                  IIA Space                    = 0x00000000
IIA Offset                   = 0x00000000
Check Type                   = 0x00000000
CPU State                    = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
System Responder Address     = 0x00000000
System Requestor Address     = 0x00000000
Path Info                    = 0x00000000
Physical Memory              = 0x00000000
Available Memory             = 0x00000000

CPU Diagnose Register 0      = 0x00000000
CPU Status Register 0        = 0x00000000
CPU Status Register 1        = 0x00000000
Runway Address Cycle [0:31]  = 0x00000000
Runway Address Cycle [32:63] = 0x00000000
Slave Address for trans_id 0 = 0x00000000
Slave Address for trans_id 2 = 0x00000000
Slave Address for trans_id 3 = 0x00000000
Slave Address for trans_id 4 = 0x00000000
Slave Address for trans_id 5 = 0x00000000
Slave Address for trans_id 6 = 0x00000000
Slave Address for trans_id 7 = 0x00000000

 <Press any key to continue>                                                                  
-----------------  Processor 1 LPMC Information ------------------

Check Type                   = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
System Responder Address     = 0x00000000
System Requestor Address     = 0x00000000
Path Info                    = 0x00000000

-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
 0 -  3  0x00000000  0x1044fb80  0x101160bc  0x00000000  
 4 -  7  0x00000000  0x104501ec  0x10cc0100  0x00000001  
 8 - 11  0x10cc0100  0x10450208  0x0004000e  0x10466ba4  
12 - 15  0x000000f2  0x00000001  0x000000fd  0x000000f3  
16 - 19  0x10cc0100  0x00000002  0xf000009c  0x1044fbb0  
20 - 23  0x1044fbb0  0x10451568  0x0000000e  0x00000080  
24 - 27  0x00000004  0x0000000e  0x103a0800  0x103f7010  
28 - 31  0x00000001  0x10cc0100  0x10cc0540  0x1044fbbf  

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  
 8 - 11  0x00000e16  0x00000000  0x000000c0  0x0000001e  
12 - 15  0x00000000  0x00000000  0x0010d800  0x00000000  
16 - 19  0x2d4ba81c  0x00000000  0x10116338  0xcf829ddd  
20 - 23  0x00000000  0xffffffff  0x002cff0e  0x80000000  
24 - 27  0x00447000  0x25e3e000  0x00000000  0x00080000  
28 - 31  0x00000400  0x00040100  0x10cc0000  0x00400400  

Space Registers 0 - 7
 0 -  3  0x00000000  0x0000070b  0x00000000  0x0000070b  
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  

IIA Space                    = 0x00000000
IIA Offset                   = 0x10116334
CPU State                    = 0x9e000001

 <Press any key to continue>                                                                  
Memory Error Log Information

Timestamp =    Sun Dec  25 12:44:10 GMT 2005    (20:05:12:25:12:44:10)


   No memory errors logged

I/O Module Error Log Information

Timestamp =    Sun Dec  25 12:44:12 GMT 2005    (20:05:12:25:12:44:12)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
 0  0xfff8a000 I/O Adapter      10        2  2  he   0x3e 0xf3fc8000 0xfbfffffc
 2  0xf3fff000 Bus Converter    10/63    15  3  se   0x07 0xfffa0800 0xf3fc806c
 2  0xf3fc8000 A DMA I/O        10/8      2  0  fe   0x03 0x00000000 0x00000000


Service Menu: Enter command > 

**** Crash #2

Bringing an interface down sometimes triggers a
BUG(). ccio_unmap_single() is passed a NULL dev pointer... May be
tulip related, though my B2000 doesn't exhibit this problem.

eruption:~# ifconfig eth1 down
kernel BUG at drivers/parisc/ccio-dma.c:454!
Backtrace:
 [<10282b1c>] ccio_unmap_single+0x160/0x2f0
 [<00045bb8>] tulip_interrupt+0xb28/0x110c [tulip]
 [<1015f8d8>] handle_IRQ_event+0x5c/0xa4
 [<1015fa8c>] __do_IRQ+0x16c/0x220
 [<10284140>] dino_isr+0x90/0x114
 [<1015f8d8>] handle_IRQ_event+0x5c/0xa4
 [<1015fa8c>] __do_IRQ+0x16c/0x220
 [<1010942c>] do_cpu_irq_mask+0x108/0x1b4
 [<1010e068>] intr_return+0x0/0x1c
 [<1018a668>] nameidata_to_filp+0x44/0x58
 [<10115288>] cpu_idle+0x78/0x90
 [<101a5cf8>] open_namei+0x94/0x980
 [<1018a6c8>] filp_open+0x4c/0x5c
 [<10115278>] cpu_idle+0x68/0x90
 [<1046149c>] start_kernel+0x278/0x2bc

Kernel panic - not syncing: BUG!


I'll try to put the card in another box (B180 or C200) tomorrow to see
if these problems are J-specific or not.

Let me know if I can help in any way.

Regards,

	M.

PS: Happy Xmas to you all.
-- 
And if you don't know where you're going, any road will take you there...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
