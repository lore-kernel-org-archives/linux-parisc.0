Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1 (unknown [217.116.164.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 930014829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Sep 2002 00:17:16 -0600 (MDT)
Received: from www1 (www.conexus.fi [217.116.164.99])
	by mail1 (Postfix) with ESMTP id 3FADE7FBC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Sep 2002 09:16:06 +0300 (EEST)
Date: Fri, 27 Sep 2002 09:18:18 +0300
From: Arto Jantunen <viiru@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020927061818.GA16225@www1.dt-link.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Subject: [parisc-linux] SMP crash with 64-bit kernel and 32-bit PDC
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

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The kernel was built with additional PDC debuging and the options listed
in the subject. If someone needs the .config for something, I can send
it, too. Attached is the log of what happens. If anyone could use any
additional info, I can get it and mail it.

--
Arto Jantunen

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minicom.cap"




Firmware Version  38.39

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0       240 MHz   Active                 Functional            2 MB
      1       240 MHz   Idle                   Functional            2 MB

  Central Bus Speed (in MHz)  :        120 

  Model: R390/2

  Available memory (bytes)    : 1073733632 
  Good memory required (bytes):   86876160 

  Primary boot path:    8/4.1   (dec)   
  Alternate boot path:  8/4.6   (dec)   
  Console path:         8/16/4.0   (dec)   
  Keyboard path:        8/16/7.0   (dec)   

CPU 0
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting... 
Boot IO Dependent Code (IODC) revision 152


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              49    1002   82 swap
3            1003    4094   83 ext2
4              17      48   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3687647 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=4/vmlinux'
Selected kernel: /vmlinux from partition 4
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2412040 mediaptr 0x1000
Segment 1 load 0034e000 size 1520640 mediaptr 0x24e000
Segment 2 load 004c4000 size 49152 mediaptr 0x3c2000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.19-pa20 (root@elli) (gcc version 3.0) #4 SMP Thu Sep 26 17:04:45 EEST 2002
FP[0] enabled: Rev 0 Model 14
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Kernel is using PDC in 32-bit mode.
Determining PDC firmware type: System Map.
model 00005ba0 00000491 00000000 00000002 7777173a 100000f0 00000008 000000b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x3
model 9000/800/R390
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=4/vmlinux
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 478.41 BogoMIPS
Memory: 1019632k available
Dentry cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode cache hash table entries: 65536 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 16384 (order: 6, 262144 bytes)
Buffer-cache hash table entries: 65536 (order: 7, 524288 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfffffffffff88000 [8], versions 0x580, 0xf, 0xb
2. Bluefish Add-on FW-SCSI (4) at 0xfffffffff1004000 [8/4], versions 0x13, 0x1, 0x89
3. HP HSC-PCI Cards (4) at 0xfffffffff1008000 [8/8], versions 0x4, 0x0, 0x9d
4. UL 550 Lasi Core BA (11) at 0xffffffffffd00000 [8/16], versions 0x2f, 0x0, 0x81,  additional addresses: 0xffffffffffd0c000 0xffffffffffc00000 
5. UL 550 Core Centronics (10) at 0xffffffffffd02000 [8/16/0], versions 0x2f, 0x0, 0x74,  additional addresses: 0xffffffffffd01000 0xffffffffffd03000 
6. UL 550 Lasi Core RS-232 (10) at 0xffffffffffd05000 [8/16/4], versions 0x2f, 0x0, 0x8c
7. UL 550 Core SCSI (10) at 0xffffffffffd06000 [8/16/5], versions 0x2f, 0x0, 0x82
8. UL 350 Core LAN (802.3) (10) at 0xffffffffffd07000 [8/16/6], versions 0x2f, 0x0, 0x8a
9. UL 550 Core PS/2 Port (10) at 0xffffffffffd08000 [8/16/7], versions 0x2f, 0x0, 0x84
10. UL 550 Core PS/2 Port (10) at 0xffffffffffd08100 [8/16/8], versions 0x2f, 0x0, 0x84
11. UL 550 Core Wax BA (11) at 0xffffffffffe00000 [8/20], versions 0x31, 0x0, 0x8e
12. UL 550 Wax Core RS-232 (10) at 0xffffffffffe02000 [8/20/2], versions 0x31, 0x0, 0x8c
13. UL 550 Wax EISA BA (11) at 0xfffffffffc000000 [8/20/5], versions 0x31, 0x0, 0x90,  additional addresses: 0xffffffffffc88000 
14. U2-IOA BC GSC+ Port (7) at 0xfffffffff103f000 [8/63], versions 0x501, 0x1, 0xc
15. U2-IOA BC Runway Port (12) at 0xfffffffffff8a000 [10], versions 0x580, 0xf, 0xb
16. Bluefish Add-on FW-SCSI (4) at 0xfffffffff180c000 [10/12], versions 0x13, 0x1, 0x89
17. U2-IOA BC GSC+ Port (7) at 0xfffffffff183f000 [10/63], versions 0x501, 0x1, 0xc
18. UL 2w U+/240 (350/550) (0) at 0xfffffffffffa0000 [32], versions 0x5ba, 0x0, 0x4
19. UL 2w U+/240 (350/550) (0) at 0xfffffffffffa2000 [34], versions 0x5ba, 0x0, 0x4
20. Memory (1) at 0xfffffffffffb1000 [49], versions 0x7e, 0x0, 0x9
CPU(s): 2 x PA8200 (PCX-U+) at 240.000000 MHz
Found U2 at 0xfffffffffff88000
Found U2 at 0xfffffffffff8a000
ccio-dma.c: failed to claim CCIO bus address space (ffffffff00000000,ffffffffffffffff)
Lasi version 0 at 0xffffffffffd00000 found.
LED display at ffffffffffd0c000 registered
Wax at 0xffffffffffe00000 found.
Wax EISA Adapter found at 0xfffffffffc000000
EISA EEPROM at 0xffffffffffc88000
Enumerating EISA bus

--G4iJoqBmSsgzjUCe--
