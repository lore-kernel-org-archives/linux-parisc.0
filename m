Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id E81CE4A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 16:26:59 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id E88D4D30
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 15:26:58 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id PAA29880
	for parisc-linux@lists.parisc-linux.org; Wed, 31 Jan 2001 15:29:15 -0800 (PST)
Date: Wed, 31 Jan 2001 15:29:15 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200101312329.PAA29880@milano.cup.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] j6000 HPMC
List-ID: <linux-parisc.vger.kernel.org>

FYI.

I wanted to test CONFIG_SMP stuff on a 32-bit capable box and was
given access to a J6000 (thanks rick!). The box has PDC rev 4.9 and
consistently HPMC's on the first PCI configuration space access.
C3k and J5k don't HPMC with kernels built from the same source.
I know c3k works and I'm sure jsm would let me know if j5k didn't.
I built the vanilla 32-bit kernel from source from today's CVS.

I'm not going to pursue this right now.
If anyone from TCD is concerned about this, I need ideas on why j5k
and A500 (PAT PDC) would work and j6k would not. I already know
parisc-linux does not touch the DMA hint registers. But that
shouldn't be relevant at this point.

Full console output is appended.

later,
grant



Firmware Version 4.9

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache
  ---------  --------   ---------------------  -----------------  -------------
      0      552 MHz    Active                 Functional         512 kB/1 MB
      1      552 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:            12884901888 bytes
  Good memory required:                  0 bytes (Not Set by OS)

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         PCI1.0.0
  Keyboard path:        USB

CPU 0
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
NOTICE :  Memory has been initialized but not tested because FASTBOOT is
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT
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
Network Station Address 001083-ff274f

System IP Address 15.8.80.78
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
model   00005d40 00000491 00000000 00000002 782a06ff 100000f0 00000008 000000b2 000000b2
vers    00000301
cpuid   0000022b
CPUID   vers 17 rev 11
model   9000/785/J6000
led_init: chassis info: model=0 (LCD), lcd_width=16, cmd_delay=40, ret0=32, ret1=32
led_init: min_cmd_delay = 40 uS
LCD display at f05d0008,f05d0000 registered
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Duet W+ (0) at 0xfffa0000, versions 0x5d4, 0x0, 0x4, 0x0, 0x91
7. Duet W+ (0) at 0xfffa2000, versions 0x5d4, 0x0, 0x4, 0x0, 0x91
8. Unknown device (1) at 0xfed10200, versions 0xa, 0x0, 0x9, 0x0, 0x0
That's a total of 8 devices.
CONFIG_SMP disabled - not claiming addional CPUs
Warning : device (0, 0x5d4, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8600 (PCX-W+) at 552.000000 MHz
Linux version 2.4.1 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #1 Wed Jan 31 09:46:40 PST 2001
free_bootmem(0x2ee000, 0x1fd12000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa console=ttyS0
Calibrating delay loop... 1101.00 BogoMIPS
Memory: 512048k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR4.0 (0x5) found at 0xfed30000



Dumping Stack from dfff4000 to dfff4b80:
4000 00000000 00000040 00000000 00000000 c02754a0 00000000 00000000 ffffffff
4020 00000002 00000000 00000000 00000000 00000000 00000000 ffffffff c0275364
4040 c0275364 00000000 c02ac000 c02ac000 c027a60c 00000000 00000000 00000000
4060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
4080 00000000 c02ac000 c02ac000 00000000 00000000 00000000 c02ac098 c02ac098
40a0 00000000 c02c819c 00000000 dfff40ac dfff40ac 00000000 00000000 00000000
40c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
40e0 dfff4000 c0119d98 00000000 00000003 00000000 00000000 0000002d 00000000
4100 00000030 00000000 00000000 00000000 00000000 00000000 00000000 80000000
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
4300 002b3540 c0260000 00000000 9f206d5b c02ac8c0 00000060 0010081f 00000000
4320 9cffffff fdffffff ffffffff ffffffff ffffffff ffffffff 00001e84 fffffbff
4340 00000078 ffffffff 00000000 000e4de0 00000000 ffffffff ffffffff ffffffff
4360 ffbffff7 fdffffff ffffffff ffffffff ffffffb7 ffefffff ffffffff fbfffeff
4380 7fffffff fffbffff ffffffff ffffffff ffffffbf f7bfffff dfffffff 00004010
43a0 ffefffff ffbfffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
43c0 7dffff7f fffdffff bf7fffff ffffffff fff5efff f7ffdfff ffffffff ffffffff
43e0 ffffffbe ff7fbfff ffffffff ffffffff bfffffff ffefffff 00000000 ffffffff
4400 3f7fff7f ffff7fff ffffffff ffffffff 7eebff7f ffffffef 00000000 00000000
4420 dfff4500 c0105c38 00000000 00000000 00000000 00000000 00000000 00000000
4440 c0118168 c011816c bf7fffff ffffffff 0027b000 00000000 c027a040 c027a064
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
45a0 00000000 00000000 00000000 c028d104 00000000 00000000 00000000 00000000
45c0 c02ac640 00000000 00000000 00000000 00000000 00000000 dfffd140 00000000
45e0 00000000 00000000 00000000 c029fa34 00000000 00000000 00000000 00000000
4600 00000000 c0286234 c0252f9c c0260000 c02c7000 00000000 c0286234 00000000
4620 00000000 00000000 00000000 c028e3f8 00000000 00000000 00000000 00000000
4640 c02ca800 c0260000 c02c7000 00000000 c0286234 c0260000 c02756f0 00000000
4660 00000000 c0260000 dfff2760 00000000 00000000 0000416d 000081a4 00000000
4680 00000000 00000000 c02b3000 dfff2760 00000000 00000000 c0157ce0 00000000
46a0 00000000 0000416d 00000004 c0109d90 00000000 00000000 c028e5e8 00000000
46c0 c02b0000 00000002 c0275040 c02b06bc c02b3694 dfff2760 00000000 00000000
46e0 00000000 00000000 00000000 c0157ce0 00000000 00000000 00000000 00000000
4700 dfff2fac 0000416d c023427c fed30000 00000005 c0230f7c c0230eec c0230f8c
4720 00000000 00000000 00000000 c028e53c 00000000 00000000 00000000 00000000
4740 dfffb1a0 00000005 dfff11a0 dfff11a0 c0275040 f0400004 00000001 ffffffff
4760 00000000 c028d930 0004000a c029ef7c c02c8000 c02b0000 c02b06bc 00000002
4780 dfff11a0 dfff11a0 00000000 00000000 00000000 00000000 dfff1220 00000000
47a0 dfff11a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
47c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
47e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4800 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4820 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4840 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4860 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4880 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
48a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
48c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
48e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4900 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4920 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4940 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4960 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4980 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
49a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
49c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
49e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
4a00 00000000 00000000 00000000 c02b3baf c02b0000 c02b06bc c0275088 dfff11a0
4a20 dfff1220 00000000 00000000 c01064c4 00000000 00000000 00000000 00000000
4a40 c028d930 0004000a 00000003 c02c8000 c02ca800 c0260000 c02b3690 0000000b
4a60 dfff1120 00000000 00000000 c029edcc 00000000 00000000 00000000 00000000
4a80 80000000 00000000 00000001 00000020 00000003 c02c8000 dfff1220 c02b06bc
4aa0 000000ff 00000000 00000008 c0103670 00000000 00000000 00000000 00000000
4ac0 80000000 c02c8000 dfff47c0 00000020 00000000 00000000 00000000 00000000
4ae0 00000000 00000000 00000000 c029ecb4 00000000 00000000 00000000 00000000
4b00 dfff4788 00000020 c02620ec 00000020 00000000 00000000 00000000 00000000
4b20 00000000 00000000 00000000 c01ddb60 00000000 00000000 00000000 00000000
4b40 dfff1234 00000000 0000000b 00000008 00000000 00000000 00000000 00000000
4b60 00000000 00000000 00000000 c011ad30 00000000 00000000 00000000 00000000

High Priority Machine Check (HPMC): Code=1 regs=c0268080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001000
r0-3     00000000 c01df800 c010d3c8 dfff11a0
r4-7     00000000 0000000e dfff4a88 c02861c0
r8-11    00000000 00000000 0004000a c028d930
r12-15   00000000 ffffffff 00000001 f0400004
r16-19   f00008c4 f000017c f0000174 0000000a
r20-23   00000000 00000005 dfff1220 c0275518
r24-27   dfff11a0 fed30040 fed3004a c0260000
r28-31   dfff4788 00000180 dfff4b80 c01ddb60
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c01df908 c01df90c
 IIR: 0f40001c    ISR: a607fffb  IOR: 4c13004a
ORIG_R28: 00000000



GR02 0xc010d3c8 lba_cfg_read8+ac
IAOQ 0xc01df908 _gsc_readb+4

I think the calling stack looks something:
_gsc_readb+4
lba_cfg_read8+ac
pci_read_config_byte+24
pci_scan_slot+60
pci_do_scan_bus+58
lba_driver_callback+138
...
