Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CD824A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 19:16:42 -0700 (MST)
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA20037
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 19:12:34 -0700
Message-Id: <200102010218.SAA00333@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.1 Bits Won't Drive C100 
In-reply-to: Your message of "Wed, 31 Jan 2001 10:37:14 PST."
             <Pine.LNX.4.21.0101311009300.28557-100000@maestro.symsys.com>
Date: Wed, 31 Jan 2001 18:18:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> Just tried the lastest 2.4.1 bits from CVS and it barfs on my C100.  
> Output follows.

Same here. But mine dies sooner in serial card initialization
or somewhere soon after that. Had enough for today.

grant

ps. I was amused to see "Linux 2.4.1" on the LED display though. :^)
    Good work Helge!


Firmware Version 4.9

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:             2147483648 bytes
  Good memory required:                  0 bytes (Not Set by OS)

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         PCI7.0.0
  Keyboard path:        USB

CPU 0
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.

CPU 1
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
-----
Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n


Booting...
Network Station Address 001083-7a1f0c

System IP Address 15.8.81.61
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Wed Jan 10 17:21:51 PST 2001
0/vmlinux 2222350 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100160 first 00100000 n 5
Segment 0 load 00100000 size 1433988 mediaptr 0x1000
Segment 1 load 00260000 size 173432 mediaptr 0x160000
Segment 2 load 0028c000 size 119640 mediaptr 0x18b000
Segment 3 load 002ac000 size 8192 mediaptr 0x1a9000
Segment 4 load 002d85c8 size 71104 mediaptr 0x1ab5c8
branching to kernel entry point 0x00100160
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
FP[0] enabled: Rev 1 Model 16
Free memory starts at: 0xc02ea000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa console=ttyS0'
PALO initrd 0-0
model   00005bd0 00000491 00000000 00000002 77f685a7 100000f0 00000008 000000b2 000000b2
vers    00000201
cpuid   00000225
CPUID   vers 17 rev 5
model   9000/785/J5000
led_init: chassis info: model=0 (LCD), lcd_width=16, cmd_delay=40, ret0=32, ret1=32
led_init: min_cmd_delay = 40 uS
LCD display at f05d0008,f05d0000 registered
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
7. Forte W 2-way (0) at 0xfffa0000, versions 0x5bd, 0x0, 0x4, 0x0, 0x91
8. Forte W 2-way (0) at 0xfffa2000, versions 0x5bd, 0x0, 0x4, 0x0, 0x91
9. Forte 2w Memory (1) at 0xfed10200, versions 0x88, 0x0, 0x9, 0x0, 0x0
That's a total of 9 devices.
CONFIG_SMP disabled - not claiming addional CPUs
Warning : device (0, 0x5bd, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
Linux version 2.4.1 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #1 Wed Jan 31 15:25:58 PST 2001
free_bootmem(0x2ee000, 0x1fd12000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa console=ttyS0
Calibrating delay loop... 878.18 BogoMIPS
Memory: 512048k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
lba version TR2.1 (0x2) found at 0xfed32000
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
lba version TR2.1 (0x2) found at 0xfed34000
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
lba version TR2.1 (0x2) found at 0xfed38000
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
lba version TR2.1 (0x2) found at 0xfed3c000
kernel BUG at lba_pci.c:750!
(00000000)  c0275534 [0,ffffffff]/200
(c0275534)    dfff11ec [f0000001,f8000000]/200
SBA found Astro 2.1 at 0xfed00000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
block: queued sectors max/low 340133kB/209061kB, 1024 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled

Dumping Stack from dfff4000 to dfff4ac0:
4000 00000000 00000040 00000000 00000000 c02754a0 00000001 00000000 ffffffff
4020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c0275364
4040 c0275364 00000042 dffe4000 c02ac000 c027a60c 00000000 00000000 00000000
4060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
4080 00000000 c02ac000 c02ac000 dfe30000 00000000 00000000 dfe30098 c02ac098
40a0 00000000 c02c819c 00000000 dfff40ac dfff40ac dfff4908 00000000 00000000
40c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
40e0 dfff4000 c0119d98 00000000 00000017 00000000 00000000 00000030 00000000
4100 00000047 00000000 00000000 00000000 00000000 00000000 00000000 80000000
4120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
41a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
41c0 00000000 fffffeff 00000000 ffffffff 00000000 c02760b8 ffffffff ffffffff
41e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff
4200 ffffffff ffffffff 00002000 00002000 00000400 00000400 ffffffff ffffffff
4220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000
4240 00000000 00000000 00000000 00000000 00000000 00000000 00020000 00000004
4260 00000000 c01416ec 00040000 dfffeba0 c0227770 c02382cc 00000003 00504d70
4280 00000000 c011817c c02c7000 00020000 00000004 c02c7000 00000000 0004000a
42a0 0000003c 0000003e c0275000 00000001 c02b3ba7 00000004 c02b3b83 00000000
42c0 c01002cc 0000003e 00000000 00000024 0000000b c02754d4 c0275000 f000017c
42e0 f0000174 000000ff 002ae080 fee003f8 fee003fd 002b163c 00000060 fee003f8
4300 002b3540 c0260000 00000000 175d4749 c02ac8c0 00000060 0010081f 00000000
4320 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 00003d09 ffffffff
4340 00000078 ffffffff 00000000 001c9c38 ffffffff ffffffff ffffffff ffffffff
4360 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4380 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
43a0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
43c0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
43e0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4400 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 00000000 00000000
4420 dfff4800 c0105cf4 00000000 00000000 00000000 00000000 00000000 00000000
4440 c0118168 c011816c ffffffff ffffffff 0027b000 00000000 c027a040 c027a064
4460 00000000 c027a204 00000000 00000000 00000000 dfff4470 00000000 00000000
4480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
44a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
44c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
44e0 00000000 00000000 00000000 c0105c48 00000000 00000000 00000000 00000000
4500 c02ac000 00000000 c02ac640 00000000 00000000 00000000 00000000 00000000
4520 00000000 00000000 00000000 c01002e0 00000000 00000000 00000000 00000000
4540 00000000 00000000 00000000 00000000 dfff4000 c027a60c c02ac000 00000000
4560 c02ac640 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4580 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
45a0 00000000 00000000 00000000 c028d15c 00000000 00000000 00000000 00000000
45c0 00000001 c027e000 00000000 00000000 002b163c 00000001 00000001 c0253d84
45e0 00000000 00000000 00000000 c028d090 00000000 00000000 00000000 00000000
4600 f0000174 f000017c f00008c4 f0400004 00000001 ffffffff 00000000 c028d930
4620 0004000a 00000003 c02c8000 c02ca800 c0260000 c02c7000 c02a9358 c02a9318
4640 c02a9358 c02a9314 00000000 00000000 ffffffff 00000000 c028d930 0004000a
4660 00000003 c02c8000 c02ca800 c0294e18 c02c7000 c02a9358 c02a92f8 c02c7000
4680 c02c4d80 c02c4e3c c0282300 00000040 c0243c6c c024386c c0243914 c0243c70
46a0 00000000 00000000 c02ca800 c0295174 c02c7000 00010800 dfff4608 c02754d4
46c0 10000080 c02c4d80 c02c4e3c c0282300 00000040 dfffeea0 c0243800 c0243800
46e0 fffffffc c02c4e3c c0199db4 c0198858 c027f44c 10000080 c02c4d80 c02c4e3c
4700 c0282300 00000040 c02439cc c0283de0 c0243800 00000000 c02c4d80 c02c4d80
4720 c02c7000 c02c3fb0 c01e5e40 c0118604 c0283de0 c0283c80 dfff4900 00000060
4740 c02c8064 00000000 c02823d0 c02c8060 00000000 00000001 c02b3bdb 00000004
4760 c02b3b86 00000054 c02b3bdb c0158574 0000003c 00000058 0000000b c02754d4
4780 dfff1bec 00008124 f0000174 000000ff 002ae080 fee003f8 fee003fd 002b163c
47a0 00000060 fee003f8 002b3540 c0295084 00000000 362f5862 dfff4980 00000060
47c0 0010081f 00000000 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
47e0 00003d09 ffffffff 00000078 c0196a98 00000000 001c9c38 ffffffff ffffffff
4800 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4820 ffffffff ffffffff ffffffff c010cc88 ffffffff ffffffff ffffffff ffffffff
4840 c02c4d7c ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4860 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4880 0006000b c01df800 c010de30 00000000 00000013 0000002f c02c5b60 c02823d0
48a0 ffffffff c0275000 c0199db4 c02c4e3c fffffffc c0243800 c0243800 c02d5e04
48c0 c0243800 c0243800 c02c4dc0 0000000b c02c5b60 c02c7800 c010de10 00000040
48e0 0000002f fee0ffff 0000002f c0260000 3c105410 0000002f dfff4ac0 c010cc88
4900 0010081f 00000000 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4920 00003d09 ffffffff 00000078 ffffffff 00000000 001c9c38 ffffffff ffffffff
4940 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4960 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4980 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
49a0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
49c0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
49e0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
4a00 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4a20 00000000 00000000 c010de30 c010de34 c0276468 00000000 00000000 00000000
4a40 00000000 c02c8000 dfff4740 00000020 00000000 487300f0 00000000 00000078
4a60 dfff4000 00000002 c0276318 c0103058 c0276468 00000000 00000000 00000000
4a80 dfff4740 00000020 c02620ec 00000020 00000004 c02b3b83 0000001f c02b3ba3
4aa0 00000000 00000002 c0276318 c0106704 c0276468 00000000 00000000 00000000

Data access rights fault in kernel: Code=26 regs=dfff4880 (Addr=00000078)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001011
r0-3     00000000 c01df800 c010de30 00000000
r4-7     00000013 0000002f c02c5b60 c02823d0
r8-11    ffffffff c0275000 c0199db4 c02c4e3c
r12-15   fffffffc c0243800 c0243800 c02d5e04
r16-19   c0243800 c0243800 c02c4dc0 0000000b
r20-23   c02c5b60 c02c7800 c010de10 00000040
r24-27   0000002f fee0ffff 0000002f c0260000
r28-31   3c105410 0000002f dfff4ac0 c010cc88
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c010de30 c010de34
 IIR: 487300f0    ISR: 00000000  IOR: 00000078
ORIG_R28: c02c8000

GR02 == IAOQ?
0xc010de30 lba_astro_out8+20
