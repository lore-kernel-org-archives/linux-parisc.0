Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA06050
	for <parisc-linux@puffin.external.hp.com>; Fri, 13 Oct 2000 19:36:52 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 64D34705
	for <parisc-linux@thepuffingroup.com>; Fri, 13 Oct 2000 18:38:01 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA10392
	for parisc-linux@thepuffingroup.com; Fri, 13 Oct 2000 18:42:22 -0700 (PDT)
Date: Fri, 13 Oct 2000 18:42:22 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010140142.SAA10392@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] more a500 output
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Here's the latest output from the a500...next step is to
setup the PCI resources before we can go any further.

I've disabled CONFIG_PROC_FS...hangs in proc_misc_init() (iirc).
Anyone interested in looking into that?
(Remember this is a 64-bit kernel)

A500 dies when scsi driver tries to talk to an unconfigured device.
PAT PDC *is* different.

grant


Firmware Version  40.20

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB
      1      440  MHz   Idle                   Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :        111  
  Available Memory            :     262144  KB
  Good Memory Required        :      11468  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/0.0           
   Keyboard path:        0/0/4/0.0           

 WARNING:  The non-destructive test bit was set, so memory was not tested 
            destructively.  Information only, no action required. 


---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo lann
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-03799f
System IP Address 15.8.80.78
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Mon Sep 25 17:09:43 PDT 2000
0/vmlinux 2559444 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
Kernel: partition 0 file /vmlinux
ELF64 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1612264 mediaptr 0x1000
Segment 1 load 0028a000 size 386608 mediaptr 0x18b000
Segment 2 load 002ec000 size 124944 mediaptr 0x1ea000
Segment 3 load 0030c000 size 16384 mediaptr 0x209000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
The 64-bit Kernel has started...
Enabled FP coprocessor
If this is the LAST MESSAGE YOU SEE, you're probably using
32-bit millicode by mistake.
Free memory starts at: 0xc035a000
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
PALO initrd 0-0
model   00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b2 000000b2
vers    00000300
cpuid   0000022a
CPUID vers 17 rev 10
CPU might be a PA8500 (PCX-W)
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000
CELL_GET_NUMBER: 0x0 0x1
PAT_ENTITY_PROC: id_eid 0xa0ff0000
PAT_ENTITY_PROC: id_eid 0xa2ff0000
PAT_ENTITY_MEM: amount 0x10000000 min_gni_base 0x0 min_gni_len 0x0
PAT_ENTITY_SBA: ranges 6 0: 0xc000000000000005 0xfffffffffed18000 0xfffffffffed2ffff
 1: 0x8000000000000000 0x0 0x3f
 2: 0x8000000000000001 0xfffffffff8000000 0xfffffffffbffffff
 3: 0x40000001a1701 0xfffffffff0000000 0xfffffffff7ffffff
 4: 0x40000001a1701 0xfffffffffc000000 0xfffffffffecfffff
 5: 0x8000000000000002 0xfffffff800000000 0xfffffffbffffffff

PAT_ENTITY_LBA: ranges 4 0: 0x8000000000000000 0x0 0x7
 1: 0x8000000000000001 0xfffffffff8000000 0xfffffffff87fffff
 2: 0x8000000000000002 0xfffffff804000000 0xfffffff87fffffff
 3: 0x8000000000000004 0xfffffff800000000 0xfffffff803ffffff

PAT_ENTITY_LBA: ranges 4 0: 0x8000000000000000 0x10 0x17
 1: 0x8000000000000001 0xfffffffff9000000 0xfffffffff97fffff
 2: 0x8000000000000002 0xfffffff904000000 0xfffffff97fffffff
 3: 0x8000000000000004 0xfffffff900000000 0xfffffff903ffffff

PAT_ENTITY_LBA: ranges 4 0: 0x8000000000000000 0x20 0x27
 1: 0x8000000000000001 0xfffffffffa000000 0xfffffffffa7fffff
 2: 0x8000000000000002 0xfffffffa04000000 0xfffffffa7fffffff
 3: 0x8000000000000004 0xfffffffa00000000 0xfffffffa03ffffff

PAT_ENTITY_LBA: ranges 4 0: 0x8000000000000000 0x30 0x37
 1: 0x8000000000000001 0xfffffffffb000000 0xfffffffffb7fffff
 2: 0x8000000000000002 0xfffffffb04000000 0xfffffffb7fffffff
 3: 0x8000000000000004 0xfffffffb00000000 0xfffffffb03ffffff

Found devices:
1. Crescendo 440 (0) at 0xfffffffffffa0000, versions 0x5cb, 0x0, 0x4, 0x0, 0x91
2. Crescendo 440 (0) at 0xfffffffffffa2000, versions 0x5cb, 0x0, 0x4, 0x0, 0x91
3. Crescendo Memory (1) at 0xfffffffffed08000, versions 0x9b, 0x0, 0x9, 0x0, 0x0
4. Astro BC Runway Port (12) at 0xfffffffffed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
5. Elroy PCI Bridge (13) at 0xfffffffffed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfffffffffed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
7. Elroy PCI Bridge (13) at 0xfffffffffed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
8. Elroy PCI Bridge (13) at 0xfffffffffed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
That's a total of 8 devices.
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #53 Fri Oct 13 18:02:03 PDT 2000
free_bootmem(0x35a200, 0xca5e00)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 4096
zone(0): 2048 pages.
zone(1): 2048 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 
trap_init
Calibrating delay loop... 878.18 BogoMIPS
Memory: 12344k available
Dentry-cache hash table entries: 2048 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 512 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 1024 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba_fixup_bus(0x00000000c0fe2180) bus 0 sysdata 0x00000000c0fe71e0
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba_fixup_bus(0x00000000c0fe2280) bus 16 sysdata 0x00000000c0fe73a0
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba_fixup_bus(0x00000000c0fe2380) bus 32 sysdata 0x00000000c0fe7460
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba_fixup_bus(0x00000000c0fe2480) bus 48 sysdata 0x00000000c0fe7560
lba_fixup_bus(0x00000000c0fe2580) bus 49 sysdata 0x00000000c0fe7560
lba_fixup_bus(0x00000000c0fe2680) bus 50 sysdata 0x00000000c0fe7560
SBA found Astro 2.1 at 0xfffffffffed00000
() ibase 0x1 imask 0xff000000
() base_addr fffffffffed3c000
() base_addr fffffffffed38000
() base_addr fffffffffed34000
() base_addr fffffffffed30000
() done
lba: lba_bios_init
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 256 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 512)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: at PCI bus 32, device 0, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.

************* SYSTEM ALERT **************
SYSTEM NAME: uninitialized
DATE: 10/14/2000 TIME: 01:20:38
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     OFF        ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006409 0E011426 - type 11 = Timestamp 10/14/2000 01:20:38
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:X
*****************************************

CAUTION: System Alerts have been disabled. This will re-enable with 
a re-boot or power-on of the system. To re-enable system alerts now, you
may use the AC (Alert Display Configuration) command.

************* SYSTEM ALERT **************
Alert messages are now disabled. Enter Commands Interface AC command to enable them again
*****************************************
