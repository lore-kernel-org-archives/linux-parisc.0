Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rwcrmhc53.attbi.com (rwcrmhc53.attbi.com [204.127.198.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE2D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 15:06:16 -0700 (MST)
From: "Steve Cornett" <stevec@bullseye.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 3 Jan 2003 14:06:02 -0800
Message-ID: <001b01c2b374$4f810930$a87ba8c0@steve>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_001C_01C2B331.415DC930"
Subject: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
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

This is a multi-part message in MIME format.

------=_NextPart_000_001C_01C2B331.415DC930
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I booted the Debian 3.0r1 CD 1 on my generic B1000 and it crashed.  The
problem does not occur when booting with serial console, only when using
the graphics console (A4977A Visualize EG).

The last two lines of output:

	init started:  BusyBox v0.60.3-pre (2002.01.21-23:29+0000)
multi-call binary
	High-Priority Machine Check (HPMC): Code=1 regs=102f3080
(Addr=00000000)

The front panel LCD says: FLT CBFB4.17-32

I've attached a boot log from using the serial console, and the "ser
pim" info.

------=_NextPart_000_001C_01C2B331.415DC930
Content-Type: text/plain;
	name="serPim.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="serPim.txt"

Firmware Version 5.0=0A=
=0A=
Duplex Console IO Dependent Code (IODC) revision 1=0A=
=0A=
-------------------------------------------------------------------------=
-----=0A=
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved=0A=
-------------------------------------------------------------------------=
-----=0A=
=0A=
  Processor   Speed            State           Coprocessor State  I/D =
Cache =0A=
  ---------  --------   ---------------------  -----------------  =
-------------=0A=
      0      300 MHz    Active                 Functional         512 =
kB/1 MB=0A=
=0A=
  Central Bus Speed:                   120 MHz=0A=
=0A=
  Available memory:              536870912 bytes=0A=
  Good memory required:           44978176 bytes=0A=
=0A=
  Primary boot path:    FWSCSI.6.0=0A=
  Alternate boot path:  SCSI.6.0=0A=
  Console path:         GRAPHICS(2)=0A=
  Keyboard path:        USB=0A=
=0A=
CPU 0=0A=
NOTICE :  Processor self-tests have been disabled because FASTBOOT is=0A=
          enabled.  To enable self-tests, disable FASTBOOT with the =
FASTBOOT=0A=
          command in the CONFIGURATION menu and reboot the system.=0A=
NOTICE :  Memory has been initialized but not tested because FASTBOOT is=0A=
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT=0A=
          command in the CONFIGURATION menu and reboot the system.=0A=
=0A=
=0A=
Processor is booting from first available device.=0A=
=0A=
To discontinue, press any key within 10 seconds.=0A=
=0A=
=07Boot terminated.=0A=
=0A=
=0A=
----- Main Menu =
-------------------------------------------------------------=0A=
=0A=
      Command                           Description=0A=
      -------                           -----------=0A=
      BOot [PRI|ALT|<path>]             Boot from specified path=0A=
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path=0A=
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices=0A=
=0A=
      COnfiguration [<command>]         Access Configuration =
menu/commands=0A=
      INformation [<command>]           Access Information menu/commands=0A=
      SERvice [<command>]               Access Service menu/commands=0A=
=0A=
      DIsplay                           Redisplay the current menu=0A=
      HElp [<menu>|<command>]           Display help for menu or command=0A=
      RESET                             Restart the system=0A=
-----=0A=
Main Menu: Enter command > ser=0A=
=0A=
----- Service Menu =
----------------------------------------------------------=0A=
=0A=
      Command                           Description=0A=
      -------                           -----------=0A=
      ChassisCodes [<proc>|ON|OFF]      Display/enable/disable chassis =
codes=0A=
      CLEARPIM                          Clear (zero) the contents of PIM=0A=
      EepromRead [<addr> [<len>]]       Read EEPROM locations=0A=
      MemRead <addr> [<len>] [<type>]   Read memory locations=0A=
      PciDelay [<value>]                Display or set PCI delay value=0A=
      PDT [CLEAR]                       Display or clear=0A=
                                        the Page Deallocation Table=0A=
      PIM [<proc>] [HPMC|LPMC|TOC]      Display PIM information=0A=
      RemotePower [ON|OFF]              Display/enable/disable remote =
power=0A=
      ScRoll [ON|OFF]                   Display or change scrolling =
ability=0A=
=0A=
      BOot [PRI|ALT|<path>]             Boot from specified path=0A=
      DIsplay                           Redisplay the current menu=0A=
      HElp [<menu>|<command>]           Display help for menu or command=0A=
      RESET                             Restart the system=0A=
      MAin                              Return to Main menu=0A=
-----=0A=
Service Menu: Enter command > pim=0A=
=0A=
PROCESSOR PIM INFORMATION=0A=
=0A=
-----------------  Processor 0 HPMC Information ------------------=0A=
=0A=
Timestamp =3D =0A=
  Fri Jan  3 21:45:13 GMT 2003    (20:03:01:03:21:45:13)=0A=
=0A=
HPMC Chassis Codes =3D 2cbf0  2500b  2cbfb  =0A=
=0A=
General Registers 0 - 31=0A=
00-03   0000000000000000  0000000000029a90  0000000000000008  =
00000000401d3000=0A=
04-07   0000000000000000  0000000000000000  0000000000000007  =
0000000000000001=0A=
08-11   0000000000000010  0000000000000001  00000000faf005d0  =
0000000000000010=0A=
12-15   0000000000029a90  0000000000000000  0000000000029a90  =
0000000000000000=0A=
16-19   000000000002b010  0000000000029a90  0000000000029a90  =
00000000401d3000=0A=
20-23   0000000000000000  0000000000000000  000000000000001c  =
0000000000000000=0A=
24-27   0000000000000000  0000000000000000  0000000000000000  =
0000000000029a90=0A=
28-31   0000000000000008  0000000000000000  00000000faf00700  =
0000000000000000=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
Control Registers 0 - 31=0A=
00-03   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
04-07   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
08-11   0000000000000222  0000000000000000  00000000000000c0  =
000000000000001e=0A=
12-15   0000000000000000  0000000000000000  0000000000105000  =
00000000ffffffff=0A=
16-19   0000000599cc5e0b  0000000000000111  000000000001555f  =
000000000e661200=0A=
20-23   00000000100403ec  40000000001d3000  00000000000cff0f  =
0000000000000000=0A=
24-27   000000000030b000  000000001f117000  00000000ffffffff  =
00000000ffffffff=0A=
28-31   00000000ffffffff  00000000ffffffff  000000002f118000  =
00000000103a0000=0A=
Space Registers 0 - 7=0A=
=0A=
00-03   00000111          00000111          00000000          00000111=0A=
04-07   00000111          00000111          00000111          00000111=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
IIA Space                    =3D 0x0000000000000111=0A=
IIA Offset                   =3D 0x00000000000151b3=0A=
Check Type                   =3D 0x20000000=0A=
CPU State                    =3D 0x9e000004=0A=
Cache Check                  =3D 0x00000000=0A=
TLB Check                    =3D 0x00000000=0A=
Bus Check                    =3D 0x003010bb=0A=
Assists Check                =3D 0x00000000=0A=
Assist State                 =3D 0x00000000=0A=
Path Info                    =3D 0x00031800=0A=
System Responder Address     =3D 0xfffffffffed10200=0A=
System Requestor Address     =3D 0xfffffffffffa0000=0A=
=0A=
Floating-Point Registers 0 - 31=0A=
00-03   0000001f00000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
04-07   1030381000000001  0000000110149d78  000000020028a286  =
0000000000000000=0A=
08-11   1030a02000000002  ffffffff0000000a  0000000000000000  =
103aed9f00000000=0A=
12-15   0000000000000000  0000000010139d8c  0000000010303810  =
1030081010300810=0A=
16-19   2f38e0001039c000  0000000000000002  0000000010300810  =
1039b8102f38e000=0A=
20-23   1039c00000000000  0000000200000000  0000000000000000  =
0000000000000000=0A=
24-27   0000080000000000  0000003000000000  103b4d64102b9364  =
2f38e005102b9474=0A=
28-31   3031323334353637  3839616210139f94  6768696a6b6c6d6e  =
6f70717273747576=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
=0A=
'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:=0A=
=0A=
Check Summary                =3D 0xcb81041000000000=0A=
Available Memory             =3D 0x0000000020000000=0A=
CPU Diagnose Register 2      =3D 0x0201000000000004=0A=
CPU Status Register 0        =3D 0x2420c20000000000=0A=
CPU Status Register 1        =3D 0x8080000000000000=0A=
SADD LOG                     =3D 0x010008a100000001=0A=
Read Short LOG               =3D 0xc1a0f0f0f0400804=0A=
ERROR_STATUS                 =3D 0x0000000000000010=0A=
MEM_ADDR                     =3D 0x000001ff3fffffff=0A=
MEM_SYND                     =3D 0x0000000000000000=0A=
MEM_ADDR_CORR                =3D 0x000001ff3fffffff=0A=
MEM_SYND_CORR                =3D 0x0000000000000000=0A=
RUN_DATA_HIGH                =3D 0xc1bff0fffed08040=0A=
RUN_DATA_LOW                 =3D 0xc1bff0fffed08040=0A=
RUN_CTRL                     =3D 0x0000021c00001418=0A=
RUN_ADDR                     =3D 0xc1bff0fffed08040=0A=
System Responder Path        =3D 0x00ffffffffffffff=0A=
=0A=
=0A=
HPMC PIM Analysis Information:=0A=
=0A=
Timestamp =3D =0A=
  Fri Jan  3 21:45:13 GMT 2003    (20:03:01:03:21:45:13)=0A=
=0A=
=0A=
'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 =
bytes:=0A=
=0A=
A Data Miss Timeout occurred while CPU 0 was=0A=
requesting information.=0A=
=0A=
=0A=
Memory/IO Controller Error Analysis Information:=0A=
=0A=
The Memory/IO Controller only observed the Broadcast Error.  It did not =
log=0A=
any additional information about the HPMC.=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
-----------------  Processor 0 LPMC Information ------------------=0A=
=0A=
Check Type                   =3D 0x00000000=0A=
I/D Cache Parity Info        =3D 0x00000000=0A=
Cache Check                  =3D 0x00000000=0A=
TLB Check                    =3D 0x00000000=0A=
Bus Check                    =3D 0x00000000=0A=
Assists Check                =3D 0x00000000=0A=
Assist State                 =3D 0x00000000=0A=
Path Info                    =3D 0x00000000=0A=
System Responder Address     =3D 0x0000000000000000=0A=
System Requestor Address     =3D 0x0000000000000000=0A=
=0A=
=0A=
-----------------  Processor 0 TOC Information -------------------=0A=
=0A=
General Registers 0 - 31=0A=
00-03   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
04-07   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
08-11   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
12-15   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
16-19   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
20-23   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
24-27   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
28-31   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
Control Registers 0 - 31=0A=
00-03   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
04-07   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
08-11   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
12-15   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
16-19   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
20-23   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
24-27   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
28-31   0000000000000000  0000000000000000  0000000000000000  =
0000000000000000=0A=
Space Registers 0 - 7=0A=
=0A=
00-03   00000000          00000000          00000000          00000000=0A=
04-07   00000000          00000000          00000000          00000000=0A=
=0A=
IIA Space                    =3D 0x0000000000000000=0A=
IIA Offset                   =3D 0x0000000000000000=0A=
CPU State                    =3D 0x00000000=0A=
=0A=
=0A=
<Press any key to continue (q to quit)> =0A=
=0A=
Memory Error Log Information:=0A=
=0A=
Timestamp =3D =0A=
  Fri Jan  3 21:45:13 GMT 2003    (20:03:01:03:21:45:13)=0A=
=0A=
=0A=
'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:=0A=
=0A=
   No memory errors logged=0A=
=0A=
=0A=
I/O Module Error Log Information:=0A=
=0A=
Timestamp =3D =0A=
  Fri Jan  3 21:45:13 GMT 2003    (20:03:01:03:21:45:13)=0A=
=0A=
=0A=
'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:=0A=
=0A=
 Rope     Word1        Word2            Word3=0A=
------ ------------ ------------=0A=
   0    0x00000000   0x0e0cc009   0x00000000fed30048=0A=
   1    0x00000000   0x1e0cc009   0x00000000fed32048=0A=
   2    ----------   0x2e0cc009   ------------------=0A=
   3    ----------   0x3e0cc009   ------------------=0A=
   4    0x00000000   0x4e0cc009   0x00000000fed38048=0A=
   5    ----------   0x5e0cc009   ------------------=0A=
   6    0x00000000   0x6e0cc009   0x00000000fed3c048=0A=
   7    ----------   0x7e0cc009   ------------------=0A=
Service Menu: Enter command > =0A=

------=_NextPart_000_001C_01C2B331.415DC930
Content-Type: text/plain;
	name="bootLog.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bootLog.txt"

bo ide=0A=
Interact with IPL (Y, N, Q)?> n=0A=
=0A=
Booting... =0A=
Boot IO Dependent Code (IODC) revision 0=0A=
=0A=
=0A=
HARD Booted.=0A=
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002=0A=
=0A=
Boot image contains:=0A=
    0/vmlinux32 3687647 bytes @ 0x608000=0A=
    0/vmlinux64 4719374 bytes @ 0x98c800=0A=
    0/ramdisk 2663046 bytes @ 0xe0d000=0A=
=0A=
Information: No console specified on kernel command line. This is normal.=0A=
PALO will choose the console currently used by firmware (serial).=0A=
Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram =
console=3DttyS0 TERM=3Dvt102 palo_kernel=3D0/vmlinux'=0A=
Selected kernel: /vmlinux from partition 0=0A=
Selected ramdisk: /ramdisk from partition 0=0A=
Warning: kernel name doesn't end with 32 or 64 -- Guessing... =0A=
This box can boot either 32 or 64-bit kernels...Both kernels available, =
choosing 32-bit kernelELF32 executable=0A=
Entry 00100000 first 00100000 n 5=0A=
Segment 0 load 00100000 size 2024492 mediaptr 0x1000=0A=
Segment 1 load 002f0000 size 299320 mediaptr 0x1f0000=0A=
Segment 2 load 0033c000 size 401408 mediaptr 0x23a000=0A=
Segment 3 load 003a0000 size 32768 mediaptr 0x29c000=0A=
Segment 4 load 003c90f8 size 102032 mediaptr 0x2a40f8=0A=
Loading ramdisk 2663046 bytes @ 1fd65000...=0A=
Branching to kernel entry point 0x00100000.  If this is the last=0A=
message you see, you may need to switch your console.  This is=0A=
a common symptom -- search the FAQ and mailing list at parisc-linux.org=0A=
=0A=
Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16 =
17:09:00 MST 2002=0A=
FP[0] enabled: Rev 1 Model 16=0A=
The 32-bit Kernel has started...=0A=
Determining PDC firmware type: System Map.=0A=
model 00005bc0 00000481 00000000 00000002 77d1dd40 100000f0 00000008 =
000000b2 000000b2=0A=
vers  00000201=0A=
CPUID vers 17 rev 5 (0x00000225)=0A=
model 9000/785/B1000=0A=
Total Memory: 512 Mb=0A=
initrd: 2fd65000-2ffef286=0A=
initrd: reserving 1fd65000-1ffef286 (mem_max 20000000)=0A=
pagetable_init=0A=
On node 0 totalpages: 131072=0A=
zone(0): 131072 pages.=0A=
zone(1): 0 pages.=0A=
zone(2): 0 pages.=0A=
LCD display at f05d0008,f05d0000 registered=0A=
Kernel command line: ramdisk_size=3D8192 root=3D/dev/ram console=3DttyS0 =
TERM=3Dvt102 palo_kernel=3D0/vmlinux=0A=
Console: colour dummy device 160x64=0A=
Calibrating delay loop... 599.65 BogoMIPS=0A=
Memory: 510408k available=0A=
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)=0A=
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)=0A=
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)=0A=
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)=0A=
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)=0A=
Searching for devices...=0A=
Found devices:=0A=
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb=0A=
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa=0A=
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa=0A=
4. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa=0A=
5. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa=0A=
6. AllegroLow W (0) at 0xfffa0000 [32], versions 0x5bc, 0x0, 0x4=0A=
7. Memory (1) at 0xfed10200 [49], versions 0x87, 0x0, 0x9=0A=
CPU(s): 1 x PA8500 (PCX-W) at 300.000000 MHz=0A=
SBA found Astro 2.1 at 0xfed00000=0A=
lba version TR2.1 (0x2) found at 0xfed30000=0A=
lba version TR2.1 (0x2) found at 0xfed32000=0A=
lba version TR2.1 (0x2) found at 0xfed38000=0A=
lba version TR2.1 (0x2) found at 0xfed3c000=0A=
iosapic: hpa not registered for Hewlett-Packard Company A4977A Visualize =
EG=0A=
POSIX conformance testing by UNIFIX=0A=
Linux NET4.0 for Linux 2.4=0A=
Based upon Swansea University Computer Society NET3.039=0A=
Initializing RT netlink socket=0A=
Enabled soft power switch (polling mode, io=3D0xf0400804).=0A=
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64) =0A=
SuperIO: Serial port 1 at 0x3f8=0A=
SuperIO: Serial port 2 at 0x2f8=0A=
SuperIO: Parallel port at 0x378=0A=
SuperIO: Floppy controller at 0x3f0=0A=
SuperIO: ACPI at 0x7e0=0A=
SuperIO: USB regulator enabled=0A=
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]=0A=
Starting kswapd=0A=
Journalled Block Device driver loaded=0A=
PCI graphic ROM found at f7000000 (64 kB), fb @ fa000000 (32 MB)=0A=
STI word mode ROM at f7000044, hpa=3Dfa000000=0A=
STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.0a=0A=
STI device: PCI_GRAFFITIX1024=0A=
Console: switching to colour frame buffer device 128x48=0A=
fb0: stifb 1024x768-8 frame buffer device, id: 2d08c0a7, mmio: 0xfa100000=0A=
pty: 256 Unix98 ptys configured=0A=
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI enabled=0A=
ttyS00 at port 0x03f8 (irq =3D 99) is a 16550A=0A=
ttyS01 at port 0x02f8 (irq =3D 100) is a 16550A=0A=
lp0: using parport0 (interrupt-driven).=0A=
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)=0A=
block: 128 slots per queue, batch=3D32=0A=
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize=0A=
Uniform Multi-Platform E-IDE driver Revision: 6.31=0A=
ide: Assuming 33MHz system bus speed for PIO modes; override with =
idebus=3Dxx=0A=
NS87415: IDE controller on PCI bus 00 dev 70=0A=
NS87415: chipset revision 3=0A=
NS87415: 100% native mode on irq 103=0A=
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio=0A=
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio=0A=
hda: TOSHIBA DVD-ROM SD-M1612, ATAPI CD/DVD-ROM drive=0A=
ide0 at 0xf00-0xf07,0xe02 on irq 103=0A=
hda: ATAPI 48X DVD-ROM drive, 512kB Cache=0A=
Uniform CD-ROM driver Revision: 3.12=0A=
loop: loaded (max 8 devices)=0A=
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)=0A=
tulip0: no phy info, aborting mtable build=0A=
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.=0A=
eth0: Digital DS21143 Tulip rev 65 at 0x1000, 00:10:83:04:94:C9, IRQ 66.=0A=
SCSI subsystem driver Revision: 1.00=0A=
sym53c8xx: at PCI bus 0, device 15, function 0=0A=
sym53c8xx: 53c896 detected =0A=
sym53c8xx: at PCI bus 0, device 15, function 1=0A=
sym53c8xx: 53c896 detected =0A=
sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 65=0A=
sym53c896-0: ID 7, Fast-20, Parity Checking=0A=
sym53c896-0: handling phase mismatch from SCRIPTS.=0A=
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 65=0A=
sym53c896-1: ID 7, Fast-40, Parity Checking=0A=
sym53c896-1: handling phase mismatch from SCRIPTS.=0A=
scsi0 : sym53c8xx-1.7.3c-20010512=0A=
scsi1 : sym53c8xx-1.7.3c-20010512=0A=
  Vendor: IBM       Model: DNES-309170Y      Rev: SAA0=0A=
  Type:   Direct-Access                      ANSI SCSI revision: 03=0A=
Attached scsi disk sda at scsi1, channel 0, id 6, lun 0=0A=
sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)=0A=
SCSI device sda: 17916240 512-byte hdwr sectors (9173 MB)=0A=
Partition check:=0A=
 sda: sda1=0A=
sticonsole_init: searching for STI ROMs=0A=
md: linear personality registered as nr 1=0A=
md: raid0 personality registered as nr 2=0A=
md: raid1 personality registered as nr 3=0A=
md: raid5 personality registered as nr 4=0A=
raid5: measuring checksumming speed=0A=
   8regs     :   722.400 MB/sec=0A=
   8regs_prefetch:   722.800 MB/sec=0A=
   32regs    :   513.600 MB/sec=0A=
   32regs_prefetch:   513.200 MB/sec=0A=
raid5: using function: 8regs_prefetch (722.800 MB/sec)=0A=
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27=0A=
md: Autodetecting RAID arrays.=0A=
md: autorun ...=0A=
md: ... autorun DONE.=0A=
NET4: Linux TCP/IP 1.0 for NET4.0=0A=
IP Protocols: ICMP, UDP, TCP, IGMP=0A=
IP: routing cache hash table of 4096 buckets, 32Kbytes=0A=
TCP: Hash tables configured (established 32768 bind 65536)=0A=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.=0A=
RAMDISK: Compressed image found at block 0=0A=
EXT2-fs warning: checktime reached, running e2fsck is recommended=0A=
VFS: Mounted root (ext2 filesystem).=0A=
NOT FREEING INITMEM (383k)=0A=
serial console detected.  Disabling virtual terminals.=0A=
init started:  BusyBox v0.60.3-pre (2002.01.21-23:29+0000) multi-call =
binary=0A=

------=_NextPart_000_001C_01C2B331.415DC930--
