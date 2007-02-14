From: Michael Greene <listsnews@cox.net>
Subject: Re: [parisc-linux] J5600 Video
Date: Wed, 14 Feb 2007 17:12:53 -0500
Message-ID: <45D38965.2070909__23691.2993285388$1416624289$gmane$org@cox.net>
References: <45CA42F4.2070207@cox.net> <e6eae0290702071605x213ec1cdq81dc168a390fb84b@mail.gmail.com> <200702101150.08977.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <listsnews@cox.net>
In-Reply-To: <200702101150.08977.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> On Thursday 08 February 2007, Max Grabert wrote:
>> On 07/02/07, Michael Greene <listsnews@cox.net> wrote:
>>> I have my old J5600 recompiled and running with 2.6.19.1 kernel. I put
>>> an old Voodoo3 2000 rev 1 in the secondary pci slot and it is recognized
>>> by the system (not compiled in the kernel just lspci).  Is there any
>>> trick to getting it to work with linux in the J5600 before I waste time
>>> trying?
>>
>> At one time I was trying to use a Voodoo3 3000 in a C3000, but I was
>> unsuccessful (linux fb wouldn't initialise/turn on the display, and
>> the native XFree86 driver would crash the machine).
>> That was about 2 years ago I think, and some things have changed since
>> then ... you might even be successful today. Just try and find out :-)
> 
> I think you will fail.
> If I remember correctly Vodoo3 needs the on-board i386 Graphics-BIOS to get into a useful state which can be used by vodoo fbdev driver.
> Vodoo1 or Vodoo2 do work as framebuffer devices though.
> 
> Helge

I guess you were correct. I finally got time to change and recompile the 
kernel. I pulled the old HP video card and inserted the Voodo3 2000 and 
here is the quick result:


Firmware Version 5.0


Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------

    (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved

------------------------------------------------------------------------------


   Processor   Speed            State           Coprocessor State  I/D 
Cache

   ---------  --------   ---------------------  ----------------- 
-------------

       0      552 MHz    Active                 Functional         512 
kB/1 MB
       1      552 MHz    Idle                   Functional         512 
kB/1 MB

   Central Bus Speed:                   120 MHz

   Available memory:             1073741824 bytes
   Good memory required:           87908352 bytes

   Primary boot path:    FWSCSI.3.0
   Alternate boot path:  IDE
   Console path:         PCI7.0.0
   Keyboard path:        USB


CPU 0
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
           enabled.  To enable self-tests, disable FASTBOOT with the 
FASTBOOT
           command in the CONFIGURATION menu and reboot the system.
NOTICE :  Memory has been initialized but not tested because FASTBOOT is
           enabled.  To test memory, disable FASTBOOT with the FASTBOOT
           command in the CONFIGURATION menu and reboot the system.


CPU 1
NOTICE :  Processor self-tests have been disabled because FASTBOOT is
           enabled.  To enable self-tests, disable FASTBOOT with the 
FASTBOOT
           command in the CONFIGURATION menu and reboot the system.



Processor is booting from first available device.


To discontinue, press any key within 10 seconds.


10 seconds expired.

Proceeding...


Searching for device(s) with bootable media...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).


Attempting to boot Primary Path...

BOOTABLE DEVICE FOUND:
    Path Number        Device Path              Device Type and Utilities

    -----------        -----------------        -------------------------

    P0                 FWSCSI.3.0               FUJITSU MAJ3182MC
                                                IPL


Booting...

Boot IO Dependent Code (IODC) revision 0

HARD Booted.

palo ipl 1.14 root@edna Mon Aug 14 12:52:46 Local time zone must be 
set--see zic manual page 2006


Partition Start(MB) End(MB) Id Type


1               1     478   f0 Palo


2             479     956   83 ext2


5             957   17366   83 ext2



PALO(F0) partition contains:

     0/vmlinux32 5178464 bytes @ 0x44000


Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently used by firmware (serial).

Command line for kernel: 'root=/dev/sda5 TERM=vt102 acpi=on 
console=ttyS0 palo_kernel=2/linux-2.6.19.1-hppa'

Selected kernel: /linux-2.6.19.1-hppa from partition 2

ELF32 executable

Entry 00100080 first 00100000 n 3

Segment 0 load 00100000 size 3093140 mediaptr 0x1000

Segment 1 load 003f4000 size 581632 mediaptr 0x2f5000

Segment 2 load 004e8000 size 289668 mediaptr 0x383000

Branching to kernel entry point 0x00100080.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org


Linux version 2.6.19.1-pa0 (root@j5600) (gcc version 4.1.1 (Gentoo 
4.1.1-r3)) #10 SMP Wed Feb 14 13:16:10 EST 2007
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005d10 00000491 00000000 00000002 781d75ff 100000f0 00000008 
000000b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/J5600
Total Memory: 1024 MB
LCD display at f05d0008,f05d0000 registered
SMP: bootstrap CPU ID is 0
Built 1 zonelists.  Total pages: 260096
Kernel command line: root=/dev/sda5 TERM=vt102 acpi=on console=ttyS0 
palo_kernel=2/linux-2.6.19.1-hppa
PID hash table entries: 4096 (order: 12, 16384 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1032960k/1048576k available (2645k kernel code, 15488k reserved, 
922k data, 236k init)
virtual kernel memory layout:
     vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
     memory  : 0x10000000 - 0x50000000   (1024 MB)
       .init : 0x104f4000 - 0x1052f000   ( 236 kB)
       .data : 0x10395704 - 0x1047c000   ( 922 kB)
       .text : 0x10100000 - 0x10395704   (2645 kB)
Mount-cache hash table entries: 512
Brought up 1 CPUs
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
7. Forte W+ 2w at 0xfffa0000 [32] { 0, 0x0, 0x5d1, 0x00004 }
8. Forte W+ 2w at 0xfffa2000 [34] { 0, 0x0, 0x5d1, 0x00004 }
9. Memory at 0xfed10200 [49] { 1, 0x0, 0x09e, 0x00009 }
Enabling regular chassis codes support v0.05
Releasing cpu 1 now, hpa=fffa2000
FP[1] enabled: Rev 1 Model 16
migration_cost=4000
CPU(s): 2 x PA8600 (PCX-W+) at 552.000000 MHz
Setting cache flush threshold to 800 (2 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfed32000
Elroy version TR4.0 (0x5) found at 0xfed34000
Elroy version TR4.0 (0x5) found at 0xfed38000
Elroy version TR4.0 (0x5) found at 0xfed3c000
Generic PHY: Registered new driver
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 8, 1572864 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x103f6580, end = 0x1041d970, entries = 10047
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 20)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.30
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
fb: 3Dfx Voodoo3 memory = 16384K
Console: switching to colour frame buffer device 80x30
Generic RTC Driver v1.07
ipmi message handler version 39.0
ipmi device interface
IPMI System Interface driver.


Backtrace:
  [<104f987c>] smp_callin+0x178/0x18c
  [<1010024c>] smp_callin_rtn+0x0/0xc
  [<10238ed0>] memcpy+0x20/0x30
  [<10194e24>] d_rehash+0x34/0x50
  [<10104088>] __mutex_unlock_slowpath+0xc8/0x14c
  [<10195fb4>] dput+0x2c/0x1c4
  [<1019b664>] mntput_no_expire+0x2c/0xe4
  [<1018c8c4>] __link_path_walk+0x142c/0x1474
  [<1018cb38>] link_path_walk+0x22c/0x250
  [<1018d2d4>] do_path_lookup+0x4fc/0x540
  [<1018df24>] __path_lookup_intent_open+0x94/0xb0
  [<1018dfd8>] path_lookup_open+0x18/0x24
  [<10185e88>] open_exec+0x30/0xec
  [<10187b2c>] do_execve+0x270/0x298
  [<10127244>] try_to_wake_up+0x33c/0x3dc
  [<101029cc>] schedule+0x894/0xa14


High Priority Machine Check (HPMC): Code=1 regs=1042b080 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 1047b500 10113c98 00000001
r04-07  0047c000 f0400008 000000fa f0002f68
r08-11  00000004 00000000 0004000e 104f9708
r12-15  000000f2 00000001 00000001 000000f3
r16-19  02020202 00000002 f000016c 10fa2930
r20-23  1047b508 0000000f 00000000 00000002
r24-27  00000000 10fb8000 10438080 1041f010
r28-31  00000010 0000011c 10fb8100 101028ac
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10113c80 10113c84
  IIR: 03c008bc    ISR: 00000000  IOR: 00000000
  CPU:        1   CR30: 10fb8000 CR31: ffffffff
  ORIG_R28: 00000000
  IAOQ[0]: cpu_idle+0x5c/0x78
  IAOQ[1]: cpu_idle+0x60/0x78
  RP(r2): cpu_idle+0x74/0x78
Kernel panic - not syncing: High Priority Machine Check (HPMC)
