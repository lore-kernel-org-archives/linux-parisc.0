Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA29982
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 23:32:59 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel2.hp.com (Postfix) with ESMTP id D4441663
	for <parisc-linux@puffin.external.hp.com>; Wed,  6 Dec 2000 23:35:36 -0700 (MST)
Date: Wed, 6 Dec 2000 22:34:55 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012070634.WAA07459@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Cc: debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] A500 status update
List-ID: <linux-parisc.vger.kernel.org>

Good News!

*** A500 is starting to come alive! ***

Kudos to (in alpha order): amodra, danglin dhd, ggg (myself), jsm, pb, rhirst
and others names I just can't think of right now.
Kudos for long hours on the 64-bit specific issues: Toolchain, VM,
Boot loader, PDC wrappers, PAT PDC inventory, 32->64-bit syscall translators,
device drivers, kernel module support, etc....Output log is below.

TODO:
o sym53c896 driver is quite verbose at boot...do we still need this?
o kernel message buffer gets dumped again when "Switching from PDC console"
o mke2fs will sometimes crash the system.  Typical symptom of I/O MMU
  support (SBA driver) not handling Scatter-Gather mappings correctly.
  That's my problem. However I was not able to reproduce it yet.
o dd to raw disk isn't working right. "No space left on device".
  See the output below.
o don't see Acenic driver output. I've got CONFIG_ACENIC=y and the device
  is definitely seen by PCI.

good night!
grant


Firmware Version  40.32

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
Main Menu: Enter command or menu > in io

I/O MODULE INFORMATION

                        Path   Slot                          IODC  
Type                    (dec)  Number    HVERSION  SVERSION  Vers  
----                    -----  ------    --------  --------  ----  
System bus adapter      0                0x5820    0xb10     0x0   
Local bus adapter       0/0    4         0x7820    0xa00     0x0     
Local bus adapter       0/2    1         0x7820    0xa00     0x0     
Local bus adapter       0/4    2         0x7820    0xa00     0x0     
Local bus adapter       0/6    3         0x7820    0xa00     0x0     

PCI DEVICE INFORMATION
                                Path              Vendor  Device  Bus  Slot
Description                     (dec)               Id      Id     #    #
-----------                     -----              ----    ----   ---  ---
Ethernet cntlr                  0/0/0/0           0x1011  0x19    0    Built_In
SCSI bus cntlr                  0/0/1/0           0x1000  0xb     0    Built_In
SCSI bus cntlr                  0/0/1/1           0x1000  0xb     0    Built_In
SCSI bus cntlr                  0/0/2/0           0x1000  0xf     0    Built_In
SCSI bus cntlr                  0/0/2/1           0x1000  0xf     0    Built_In
Comp. ser cntlr                 0/0/4/0           0x103c  0x1048  0    Built_In
Comp. ser cntlr                 0/0/5/0           0x103c  0x1048  0    Built_In
Ethernet cntlr                  0/2/0/0           0x12ae  0x1     16   1
SCSI bus cntlr                  0/4/0/0           0x1000  0xb     32   2
SCSI bus cntlr                  0/4/0/1           0x1000  0xb     32   2
PCI-to-PCI bridge               0/6/0/0           0x1011  0x26    48   4
  SCSI bus cntlr                0/6/0/0/4/0       0x1000  0xb     49   4
  SCSI bus cntlr                0/6/0/0/4/1       0x1000  0xb     49   4
  Ethernet cntlr                0/6/0/0/6/0       0x1011  0x19    49   4
  Ethernet cntlr                0/6/0/0/7/0       0x1011  0x19    49   4
PCI-to-PCI bridge               0/6/0/0           0x1011  0x26    48   4
PCI-to-PCI bridge               0/6/2/0           0x1011  0x24    48   3
  Ethernet cntlr                0/6/2/0/4/0       0x1011  0x9     50   3
  Ethernet cntlr                0/6/2/0/5/0       0x1011  0x9     50   3
  Ethernet cntlr                0/6/2/0/6/0       0x1011  0x9     50   3
  Ethernet cntlr                0/6/2/0/7/0       0x1011  0x9     50   3
PCI-to-PCI bridge               0/6/2/0           0x1011  0x24    48   3

Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-03799f
System IP Address 15.8.80.78
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Wed Nov  8 21:40:37 PST 2000
0/vmlinux 3170434 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa '
Kernel: partition 0 file /vmlinux
ELF64 executable

Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 1804864 mediaptr 0x1000
Segment 1 load 002ba000 size 428968 mediaptr 0x1ba000
Segment 2 load 00324000 size 376832 mediaptr 0x223000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
The 64-bit Kernel has started...
Enabled FP coprocessor
If this is the LAST MESSAGE YOU SEE, you're probably using
32-bit millicode by mistake.
Free memory starts at: 0xc03c3000
start_parisc(0x504ce8,0x504ce8,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa '
PALO initrd 0-0
model   00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b2 000000b2
vers    00000300
cpuid   0000022a
CPUID   vers 17 rev 10
model   9000/800/A500-44
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000
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
CONFIG_SMP disabled - not claiming addional CPUs
Warning : device (0, 0x5cb, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
Linux version 2.4.0-test10 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #6 Wed Dec 6 17:14:11 PST 2000
free_bootmem(0x3c5000, 0xfc3b000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 65536
zone(0): 32768 pages.
zone(1): 32768 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa 
trap_init
Calibrating delay loop... 878.18 BogoMIPS
Memory: 249052k available
Dentry-cache hash table entries: 32768 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 16384 (order: 5, 131072 bytes)
Page-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 16384 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
PCI Found 00:00 [1011/0019] 000200 00
PCI Found 00:08 [1000/000b] 000100 00
PCI Found 00:09 [1000/000b] 000100 00
PCI Found 00:10 [1000/000f] 000100 00
PCI Found 00:11 [1000/000f] 000100 00
PCI Found 00:20 [103c/1048] 000700 00
PCI Found 00:28 [103c/1048] 000700 00
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
PCI Found 10:00 [12ae/0001] 000200 00
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
PCI Found 20:00 [1000/000b] 000100 00
PCI Found 20:01 [1000/000b] 000100 00
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
PCI Found 30:00 [1011/0026] 000604 01
PCI Found 30:10 [1011/0024] 000604 01
PCI Found 31:20 [1000/000b] 000100 00
PCI Found 31:21 [1000/000b] 000100 00
PCI Found 31:30 [1011/0019] 000200 00
PCI Found 31:38 [1011/0019] 000200 00
PCI : ignoring 30:00.0 PCI-PCI bridge - I/O BASE not configured
PCI Found 32:20 [1011/0009] 000200 00
PCI Found 32:28 [1011/0009] 000200 00
PCI Found 32:30 [1011/0009] 000200 00
PCI Found 32:38 [1011/0009] 000200 00
PCI : ignoring 30:02.0 PCI-PCI bridge - I/O BASE not configured
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
PCI: dev PCI device 1000:000b type 64-bit
SBA found Astro 2.1 at 0xfffffffffed00000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at port 0x0080 (irq = 132) is a 16550A
PCIBIOS: Enabling device 00:05.0 (0007 -> 0147)
ttyS01 at port 0x00c0 (irq = 133) is a 16550A
Linux Tulip driver version 0.9.10 (September 6, 2000)
PCIBIOS: Setting latency timer of 00:00.0 to 128
eth0: Digital DS21143 Tulip rev 65 at 0x0, 00:30:6E:03:79:9F, IRQ 128.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
PCIBIOS: Enabling device 31:06.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 31:06.0 to 128
eth1: Digital DS21143 Tulip rev 65 at 0x30200, 00:10:83:7B:0A:3E, IRQ 322.
eth1:  EEPROM default media type Autosense.
eth1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
eth1:  MII transceiver #0 config 1000 status 7809 advertising 01e1.
PCIBIOS: Enabling device 31:07.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 31:07.0 to 128
eth2: Digital DS21143 Tulip rev 65 at 0x30280, 00:10:83:7B:0A:3F, IRQ 323.
eth2:  EEPROM default media type Autosense.
eth2:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
eth2:  MII transceiver #0 config 1000 status 7809 advertising 01e1.
PCIBIOS: Enabling device 32:04.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 32:04.0 to 128
eth3: Digital DS21140 Tulip rev 34 at 0x31000, 00:00:D1:1A:31:BF, IRQ 322.
eth3:  EEPROM default media type Autosense.
eth3:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth3:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth3:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth3:  Advertising 01e1 (to advertise is 01e1).
PCIBIOS: Enabling device 32:05.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 32:05.0 to 128
eth4: Digital DS21140 Tulip rev 34 at 0x31080, 00:00:D1:1A:32:22, IRQ 323.
eth4:  EEPROM default media type Autosense.
eth4:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth4:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth4:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth4:  Advertising 01e1 (to advertise is 01e1).
PCIBIOS: Enabling device 32:06.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 32:06.0 to 128
eth5: Digital DS21140 Tulip rev 34 at 0x31100, 00:00:D1:1A:31:B9, IRQ 324.
eth5:  EEPROM default media type Autosense.
eth5:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth5:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth5:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth5:  Advertising 01e1 (to advertise is 01e1).
PCIBIOS: Enabling device 32:07.0 (0007 -> 0147)
PCIBIOS: Setting latency timer of 32:07.0 to 128
eth6: Digital DS21140 Tulip rev 34 at 0x31180, 00:00:D1:1A:31:C4, IRQ 325.
eth6:  EEPROM default media type Autosense.
eth6:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
eth6:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth6:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth6:  Advertising 01e1 (to advertise is 01e1).
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 32, device 0, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 32, device 0, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 49, device 4, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 49, device 4, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c876-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c876-0: NCR clock is 40218KHz
sym53c876-0: ID 7, Fast-20, Parity Checking
sym53c876-0: on-chip RAM at 0xfffffffff8008000
sym53c876-0: restart (scsi reset).
sym53c876-0: Downloading SCSI SCRIPTS.
sym53c876-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c876-1: NCR clock is 40218KHz
sym53c876-1: ID 7, Fast-20, Parity Checking
sym53c876-1: on-chip RAM at 0xfffffffff800a000
sym53c876-1: restart (scsi reset).
sym53c876-1: Downloading SCSI SCRIPTS.
sym53c896-2: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-2: NCR clock is 40218KHz
sym53c896-2: ID 7, Fast-40, Parity Checking
sym53c896-2: on-chip RAM at 0xfffffffff8002000
sym53c896-2: restart (scsi reset).
sym53c896-2: handling phase mismatch from SCRIPTS.
sym53c896-2: Downloading SCSI SCRIPTS.
sym53c896-3: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-3: NCR clock is 40218KHz
sym53c896-3: ID 7, Fast-40, Parity Checking
sym53c896-3: on-chip RAM at 0xfffffffff8006000
sym53c896-3: restart (scsi reset).
sym53c896-3: handling phase mismatch from SCRIPTS.
sym53c896-3: Downloading SCSI SCRIPTS.
sym53c896-4: rev 0x1 on pci bus 32 device 0 function 0 irq 256
sym53c896-4: NCR clock is 40218KHz
sym53c896-4: ID 7, Fast-40, Parity Checking
sym53c896-4: on-chip RAM at 0xfffffffffa002000
sym53c896-4: restart (scsi reset).
sym53c896-4: handling phase mismatch from SCRIPTS.
sym53c896-4: Downloading SCSI SCRIPTS.
sym53c896-5: rev 0x1 on pci bus 32 device 0 function 1 irq 257
sym53c896-5: NCR clock is 40218KHz
sym53c896-5: ID 7, Fast-40, Parity Checking
sym53c896-5: on-chip RAM at 0xfffffffffa004000
sym53c896-5: restart (scsi reset).
sym53c896-5: handling phase mismatch from SCRIPTS.
sym53c896-5: Downloading SCSI SCRIPTS.
sym53c896-6: rev 0x5 on pci bus 49 device 4 function 0 irq 320
sym53c896-6: NCR clock is 40218KHz
sym53c896-6: ID 7, Fast-40, Parity Checking
sym53c896-6: on-chip RAM at 0xfffffffffb002000
sym53c896-6: restart (scsi reset).
sym53c896-6: handling phase mismatch from SCRIPTS.
sym53c896-6: Downloading SCSI SCRIPTS.
sym53c896-7: rev 0x5 on pci bus 49 device 4 function 1 irq 321
sym53c896-7: NCR clock is 40218KHz
sym53c896-7: ID 7, Fast-40, Parity Checking
sym53c896-7: on-chip RAM at 0xfffffffffb004000
sym53c896-7: restart (scsi reset).
sym53c896-7: handling phase mismatch from SCRIPTS.
sym53c896-7: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.6b
scsi1 : sym53c8xx - version 1.6b
scsi2 : sym53c8xx - version 1.6b
scsi3 : sym53c8xx - version 1.6b
scsi4 : sym53c8xx - version 1.6b
scsi5 : sym53c8xx - version 1.6b
scsi6 : sym53c8xx - version 1.6b
scsi7 : sym53c8xx - version 1.6b
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c876-1-<15,0>: tagged command queue depth set to 8
  Vendor: HP        Model: D5989B            Rev: 1.02
  Type:   Processor                          ANSI SCSI revision: 02
sym53c896-2-<13,0>: wide msgin: 1-2-3-1.
sym53c896-2-<13,0>: wide: wide=1 chg=0.
sym53c896-2-<13,0>: wide msgout: 1-2-3-1.
sym53c896-2-<13,0>: sync msg in: 1-3-1-a-f.
sym53c896-2-<13,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=1.
sym53c896-2-<13,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
sym53c896-2-<13,0>: sync msgout: 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c896-2-<14,0>: wide msgin: 1-2-3-1.
sym53c896-2-<14,0>: wide: wide=1 chg=0.
sym53c896-2-<14,0>: wide msgout: 1-2-3-1.
sym53c896-2-<14,0>: sync msg in: 1-3-1-a-f.
sym53c896-2-<14,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=1.
sym53c896-2-<14,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
sym53c896-2-<14,0>: sync msgout: 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c896-2-<15,0>: wide msgin: 1-2-3-1.
sym53c896-2-<15,0>: wide: wide=1 chg=0.
sym53c896-2-<15,0>: wide msgout: 1-2-3-1.
sym53c896-2-<15,0>: sync msg in: 1-3-1-a-f.
sym53c896-2-<15,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=1.
sym53c896-2-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
sym53c896-2-<15,0>: sync msgout: 1-3-1-c-f.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c896-2-<13,0>: tagged command queue depth set to 8
sym53c896-2-<14,0>: tagged command queue depth set to 8
sym53c896-2-<15,0>: tagged command queue depth set to 8
  Vendor: SEAGATE   Model: ST318404LC        Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym53c896-3-<15,0>: tagged command queue depth set to 8
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: HP        Model: A5272A            Rev: HP04
  Type:   Enclosure                          ANSI SCSI revision: 02
sym53c896-4-<0,0>: tagged command queue depth set to 8
sym53c896-4-<2,0>: tagged command queue depth set to 8
sym53c896-4-<3,0>: tagged command queue depth set to 8
sym53c896-4-<13,0>: tagged command queue depth set to 8
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: IBM       Model: DMVS18D           Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: HP        Model: A5272A            Rev: HP04
  Type:   Enclosure                          ANSI SCSI revision: 02
sym53c896-6-<0,0>: tagged command queue depth set to 8
sym53c896-6-<1,0>: tagged command queue depth set to 8
sym53c896-6-<2,0>: tagged command queue depth set to 8
sym53c896-6-<3,0>: tagged command queue depth set to 8
sym53c896-6-<13,0>: tagged command queue depth set to 8
Detected scsi disk sda at scsi1, channel 0, id 15, lun 0
Detected scsi disk sdb at scsi2, channel 0, id 13, lun 0
Detected scsi disk sdc at scsi2, channel 0, id 14, lun 0
Detected scsi disk sdd at scsi2, channel 0, id 15, lun 0
Detected scsi disk sde at scsi3, channel 0, id 15, lun 0
Detected scsi disk sdf at scsi4, channel 0, id 0, lun 0
Detected scsi disk sdg at scsi4, channel 0, id 2, lun 0
Detected scsi disk sdh at scsi4, channel 0, id 3, lun 0
Detected scsi disk sdi at scsi4, channel 0, id 13, lun 0
Detected scsi disk sdj at scsi6, channel 0, id 0, lun 0
Detected scsi disk sdk at scsi6, channel 0, id 1, lun 0
Detected scsi disk sdl at scsi6, channel 0, id 2, lun 0
Detected scsi disk sdm at scsi6, channel 0, id 3, lun 0
Detected scsi disk sdn at scsi6, channel 0, id 13, lun 0
sym53c876-1-<15,0>: wide msgout: 1-2-3-1.
sym53c876-1-<15,0>: wide msgin: 1-2-3-1.
sym53c876-1-<15,0>: wide: wide=1 chg=0.
sym53c876-1-<15,0>: wide msgout: 1-2-3-1.
sym53c876-1-<15,0>: wide msgin: 1-2-3-1.
sym53c876-1-<15,0>: wide: wide=1 chg=0.
sym53c876-1-<15,0>: sync msgout: 1-3-1-c-10.
sym53c876-1-<15,0>: sync msg in: 1-3-1-c-f.
sym53c876-1-<15,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c876-1-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sda: 17781521 512-byte hdwr sectors (9104 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
sym53c896-2-<13,0>: wide msgout: 1-2-3-1.
sym53c896-2-<13,0>: wide msgin: 1-2-3-1.
sym53c896-2-<13,0>: wide: wide=1 chg=0.
sym53c896-2-<13,0>: sync msgout: 1-3-1-c-1f.
sym53c896-2-<13,0>: sync msg in: 1-3-1-c-f.
sym53c896-2-<13,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c896-2-<13,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
 sdb:
sym53c896-2-<14,0>: wide msgout: 1-2-3-1.
sym53c896-2-<14,0>: wide msgin: 1-2-3-1.
sym53c896-2-<14,0>: wide: wide=1 chg=0.
sym53c896-2-<14,0>: sync msgout: 1-3-1-c-1f.
sym53c896-2-<14,0>: sync msg in: 1-3-1-c-f.
sym53c896-2-<14,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c896-2-<14,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdc: 17773524 512-byte hdwr sectors (9100 MB)
 sdc:
sym53c896-2-<15,0>: wide msgout: 1-2-3-1.
sym53c896-2-<15,0>: wide msgin: 1-2-3-1.
sym53c896-2-<15,0>: wide: wide=1 chg=0.
sym53c896-2-<15,0>: sync msgout: 1-3-1-c-1f.
sym53c896-2-<15,0>: sync msg in: 1-3-1-c-f.
sym53c896-2-<15,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c896-2-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sdd: 17773524 512-byte hdwr sectors (9100 MB)
 sdd:
sym53c896-3-<15,0>: wide msgout: 1-2-3-1.
sym53c896-3-<15,0>: wide msgin: 1-2-3-1.
sym53c896-3-<15,0>: wide: wide=1 chg=0.
sym53c896-3-<15,0>: wide msgout: 1-2-3-1.
sym53c896-3-<15,0>: wide msgin: 1-2-3-1.
sym53c896-3-<15,0>: wide: wide=1 chg=0.
sym53c896-3-<15,0>: sync msgout: 1-3-1-c-1f.
sym53c896-3-<15,0>: sync msg in: 1-3-1-c-1f.
sym53c896-3-<15,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-3-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sde: 35566480 512-byte hdwr sectors (18210 MB)
 sde: unknown partition table
sym53c896-4-<0,0>: wide msgout: 1-2-3-1.
sym53c896-4-<0,0>: wide msgin: 1-2-3-1.
sym53c896-4-<0,0>: wide: wide=1 chg=0.
sym53c896-4-<0,0>: wide msgout: 1-2-3-1.
sym53c896-4-<0,0>: wide msgin: 1-2-3-1.
sym53c896-4-<0,0>: wide: wide=1 chg=0.
sym53c896-4-<0,0>: sync msgout: 1-3-1-c-1f.
sym53c896-4-<0,0>: sync msg in: 1-3-1-c-1f.
sym53c896-4-<0,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-4-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdf: 35566480 512-byte hdwr sectors (18210 MB)
 sdf: unknown partition table
sym53c896-4-<2,0>: wide msgout: 1-2-3-1.
sym53c896-4-<2,0>: wide msgin: 1-2-3-1.
sym53c896-4-<2,0>: wide: wide=1 chg=0.
sym53c896-4-<2,0>: wide msgout: 1-2-3-1.
sym53c896-4-<2,0>: wide msgin: 1-2-3-1.
sym53c896-4-<2,0>: wide: wide=1 chg=0.
sym53c896-4-<2,0>: sync msgout: 1-3-1-c-1f.
sym53c896-4-<2,0>: sync msg in: 1-3-1-c-1f.
sym53c896-4-<2,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-4-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdg: 35566480 512-byte hdwr sectors (18210 MB)
 sdg: unknown partition table
sym53c896-4-<3,0>: wide msgout: 1-2-3-1.
sym53c896-4-<3,0>: wide msgin: 1-2-3-1.
sym53c896-4-<3,0>: wide: wide=1 chg=0.
sym53c896-4-<3,0>: wide msgout: 1-2-3-1.
sym53c896-4-<3,0>: wide msgin: 1-2-3-1.
sym53c896-4-<3,0>: wide: wide=1 chg=0.
sym53c896-4-<3,0>: sync msgout: 1-3-1-c-1f.
sym53c896-4-<3,0>: sync msg in: 1-3-1-c-1f.
sym53c896-4-<3,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-4-<3,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdh: 35566480 512-byte hdwr sectors (18210 MB)
 sdh: unknown partition table
sym53c896-4-<13,0>: wide msgout: 1-2-3-1.
sym53c896-4-<13,0>: wide msgin: 1-2-3-1.
sym53c896-4-<13,0>: wide: wide=1 chg=0.
sym53c896-4-<13,0>: wide msgout: 1-2-3-1.
sym53c896-4-<13,0>: wide msgin: 1-2-3-1.
sym53c896-4-<13,0>: wide: wide=1 chg=0.
sym53c896-4-<13,0>: sync msgout: 1-3-1-c-1f.
sym53c896-4-<13,0>: sync msg in: 1-3-1-c-1f.
sym53c896-4-<13,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-4-<13,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdi: 35566480 512-byte hdwr sectors (18210 MB)
 sdi: unknown partition table
sym53c896-6-<0,0>: wide msgout: 1-2-3-1.
sym53c896-6-<0,0>: wide msgin: 1-2-3-1.
sym53c896-6-<0,0>: wide: wide=1 chg=0.
sym53c896-6-<0,0>: wide msgout: 1-2-3-1.
sym53c896-6-<0,0>: wide msgin: 1-2-3-1.
sym53c896-6-<0,0>: wide: wide=1 chg=0.
sym53c896-6-<0,0>: sync msgout: 1-3-1-c-1f.
sym53c896-6-<0,0>: sync msg in: 1-3-1-c-1f.
sym53c896-6-<0,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-6-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdj: 35566480 512-byte hdwr sectors (18210 MB)
 sdj: unknown partition table
sym53c896-6-<1,0>: wide msgout: 1-2-3-1.
sym53c896-6-<1,0>: wide msgin: 1-2-3-1.
sym53c896-6-<1,0>: wide: wide=1 chg=0.
sym53c896-6-<1,0>: wide msgout: 1-2-3-1.
sym53c896-6-<1,0>: wide msgin: 1-2-3-1.
sym53c896-6-<1,0>: wide: wide=1 chg=0.
sym53c896-6-<1,0>: sync msgout: 1-3-1-c-1f.
sym53c896-6-<1,0>: sync msg in: 1-3-1-c-1f.
sym53c896-6-<1,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-6-<1,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdk: 35566480 512-byte hdwr sectors (18210 MB)
 sdk: unknown partition table
sym53c896-6-<2,0>: wide msgout: 1-2-3-1.
sym53c896-6-<2,0>: wide msgin: 1-2-3-1.
sym53c896-6-<2,0>: wide: wide=1 chg=0.
sym53c896-6-<2,0>: wide msgout: 1-2-3-1.
sym53c896-6-<2,0>: wide msgin: 1-2-3-1.
sym53c896-6-<2,0>: wide: wide=1 chg=0.
sym53c896-6-<2,0>: sync msgout: 1-3-1-c-1f.
sym53c896-6-<2,0>: sync msg in: 1-3-1-c-1f.
sym53c896-6-<2,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-6-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdl: 35566480 512-byte hdwr sectors (18210 MB)
 sdl: unknown partition table
sym53c896-6-<3,0>: wide msgout: 1-2-3-1.
sym53c896-6-<3,0>: wide msgin: 1-2-3-1.
sym53c896-6-<3,0>: wide: wide=1 chg=0.
sym53c896-6-<3,0>: wide msgout: 1-2-3-1.
sym53c896-6-<3,0>: wide msgin: 1-2-3-1.
sym53c896-6-<3,0>: wide: wide=1 chg=0.
sym53c896-6-<3,0>: sync msgout: 1-3-1-c-1f.
sym53c896-6-<3,0>: sync msg in: 1-3-1-c-1f.
sym53c896-6-<3,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-6-<3,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdm: 35566480 512-byte hdwr sectors (18210 MB)
 sdm: unknown partition table
sym53c896-6-<13,0>: wide msgout: 1-2-3-1.
sym53c896-6-<13,0>: wide msgin: 1-2-3-1.
sym53c896-6-<13,0>: wide: wide=1 chg=0.
sym53c896-6-<13,0>: wide msgout: 1-2-3-1.
sym53c896-6-<13,0>: wide msgin: 1-2-3-1.
sym53c896-6-<13,0>: wide: wide=1 chg=0.
sym53c896-6-<13,0>: sync msgout: 1-3-1-c-1f.
sym53c896-6-<13,0>: sync msg in: 1-3-1-c-1f.
sym53c896-6-<13,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-6-<13,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdn: 35566480 512-byte hdwr sectors (18210 MB)
 sdn: unknown partition table
Detected scsi generic sg1 at scsi2, channel 0, id 5, lun 0, type 3
Detected scsi generic sg10 at scsi4, channel 0, id 15, lun 0, type 13
Detected scsi generic sg16 at scsi6, channel 0, id 15, lun 0, type 13
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 16Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 15.8.81.247, my address is 15.8.80.78
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Switching from PDC console

[ delete repeated text - A500 dumps kernel msg buffer here. ]

kmem_create: Forcing size word alignment - nfs_fh
Looking up port of RPC 100003/2 on 15.8.81.247
Looking up port of RPC 100005/2 on 15.8.81.247
VFS: Mounted root (nfs filesystem) readonly.
INIT: version 2.78 booting
Activating swap...
Checking all file systems...
Parallelizing fsck version 1.19 (13-Jul-2000)
Setting kernel variables.
Mounting local filesystems...
not mounted anything
hostname: can't open `(null)'
Configuring network interfaces: done.
Starting portmap daemon: portmap.
Starting portmapper... 
do_page_fault() pid=51 command='sleep'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3	 0000000000000000 00000000000039f8 0000000040122197 0000000000002000
r4-7	 000000004017a938 000000000005a550 0000000000002000 000000002001fddc
r8-11	 0000000000000000 000000000008a810 000000002001fddc 0000000000000001
r12-15	 0000000000000000 0000000000002564 000000000005a550 0000000000000000
r16-19	 0000000000000000 0000000000002358 0000000000000000 000000004017a938
r20-23	 0000000000000000 00000000000039f8 0000000000000031 000000000000002d
r24-27	 000000000000000d 000000004016fc72 000000002001ffe2 0000000000003838
r28-31	 0000000000002564 0000000000004040 0000000020020280 0000000000000004
sr0-4	 0000000000000380 0000000000000380 0000000000000000 0000000000000380
sr4-8	 0000000000000380 0000000000000380 0000000000000380 0000000000000380

IASQ: 0000000000000380 0000000000000380 IAOQ: 000000004012231f 0000000040122323
 IIR: 0e801014    ISR: 0000000000000380  IOR: 0000000000000000
ORIG_R28: 0000000000004000
/etc/init.d/rcS: line 80:    51 Segmentation fault      sleep 2
Mounting remote filesystems...

Setting the System Clock using the Hardware Clock as reference...
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
System Clock set. Local time: Wed Dec  6 22:52:37 MST 2000

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd
do_page_fault() pid=95 command='syslogd'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011101111111000001011
r0-3	 0000000000000000 00000000000da490 000000004010188f 00000000000096c0
r4-7	 00000000000d9490 000000004013d67c 00000000000096c0 0000000000000003
r8-11	 0000000000009738 0000000000006800 000000004013e9dc 000000000008d2f0
r12-15	 00000000200207cc 0000000000000000 000000000008d570 0000000000000000
r16-19	 0000000000000000 0000000000000000 0000000000078440 00000000000d9490
r20-23	 000000004013e9e8 000000004013e9e0 0000000000000a79 0000000040136a6c
r24-27	 000000000000973f 0000000000000000 0000000020022a88 0000000000008ec0
r28-31	 00000000000025f3 000000000000a180 0000000020022a80 000000004004271b
sr0-4	 0000000000000280 0000000000000280 0000000000000000 0000000000000280
sr4-8	 0000000000000280 0000000000000280 0000000000000280 0000000000000280

IASQ: 0000000000000280 0000000000000280 IAOQ: 000000004010188b 00000000400e8bcb
 IIR: 483a05d8    ISR: 0000000000000280  IOR: 00000000000da77c
ORIG_R28: 0000000000000000



 klogd.
Starting Name Service Cache Daemon: nscd.
Starting internet superserver: inetd.

Debian GNU/Linux 2.2 gggA500 ttyS0

gggA500 login: root
PAM_unix[115]: (login) session opened for user root by LOGIN(uid=0)
PAM-lastlog[115]: /var/log/lastlog file is locked/read
Last login: Wed Dec  6 19:22:50 2000 on ttyS0
Linux gggA500 2.4.0-test10 #6 Wed Dec 6 17:14:11 PST 2000 parisc64 unknown

Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
login[115]: ROOT LOGIN on `ttyS0'

gggA500:~# cat /proc/cpuinfo 
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8500 (PCX-W)
cpu MHz		: 440.000000
model		: 9000/800/A500-44
model name	: Crescendo 440
hversion	: 0x00005cb0
sversion	: 0x00000491
I-cache		: 512 KB
D-cache		: 1024 KB (WB)
ITLB entries	: 160
DTLB entries	: 160 - shared with ITLB
bogomips	: 878.18
gggA500:~# cat /proc/scsi/scsi
Attached devices: 
Host: scsi1 Channel: 00 Id: 15 Lun: 00
  Vendor: SEAGATE  Model: ST39102LC        Rev: 7C03
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi2 Channel: 00 Id: 05 Lun: 00
  Vendor: HP       Model: D5989B           Rev: 1.02
  Type:   Processor                        ANSI SCSI revision: 02
Host: scsi2 Channel: 00 Id: 13 Lun: 00
  Vendor: HP       Model: 9.10GB B 80-1205 Rev:     
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi2 Channel: 00 Id: 14 Lun: 00
  Vendor: HP       Model: 9.10GB B 80-1205 Rev:     
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi2 Channel: 00 Id: 15 Lun: 00
  Vendor: HP       Model: 9.10GB B 80-1205 Rev:     
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi3 Channel: 00 Id: 15 Lun: 00
  Vendor: SEAGATE  Model: ST318404LC       Rev: HP01
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi4 Channel: 00 Id: 00 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi4 Channel: 00 Id: 02 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi4 Channel: 00 Id: 03 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi4 Channel: 00 Id: 13 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi4 Channel: 00 Id: 15 Lun: 00
  Vendor: HP       Model: A5272A           Rev: HP04
  Type:   Enclosure                        ANSI SCSI revision: 02
Host: scsi6 Channel: 00 Id: 00 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi6 Channel: 00 Id: 01 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi6 Channel: 00 Id: 02 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi6 Channel: 00 Id: 03 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi6 Channel: 00 Id: 13 Lun: 00
  Vendor: IBM      Model: DMVS18D          Rev: HP05
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi6 Channel: 00 Id: 15 Lun: 00
  Vendor: HP       Model: A5272A           Rev: HP04
  Type:   Enclosure                        ANSI SCSI revision: 02
gggA500:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:30:6E:03:79:9F  
          inet addr:15.8.80.78  Bcast:15.8.87.255  Mask:255.255.248.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:5236 errors:0 dropped:3 overruns:0 frame:0
          TX packets:2238 errors:0 dropped:0 overruns:0 carrier:0
          collisions:43 txqueuelen:100 
          Interrupt:128 

gggA500:~# fdisk /dev/sda

The number of cylinders for this disk is set to 8682.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sda: 64 heads, 32 sectors, 8682 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1      1025   1049584   82  Linux swap
/dev/sda2          1026      1046     21504   f0  Unknown
/dev/sda3          1047      5143   4195328   83  Linux
/dev/sda4          5144      8682   3623936   83  Linux

Command (m for help): q

gggA500:~# mke2fs /dev/sda
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
/dev/sda is entire device, not just one partition!
Proceed anyway? (y,n) n
gggA500:~# set -o vi
gggA500:~# mke2fs /dev/sda3
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
warning: 256 blocks unused.

Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
525312 inodes, 1048576 blocks
52441 blocks (5.00%) reserved for the super user
First data block=0
32 block groups
32768 blocks per group, 32768 fragments per group
16416 inodes per group
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736

Writing inode tables:  0/32 1/32 2/32 3/32 4/32 5/32 6/32 7/32 8/32 9/3210/3211/3212/3213/3214/3215/3216/3217/3218/3219/3220/3221/3222/3223/3224/3225/3226/3227/3228/3229/3230/3231/32done                            
Writing superblocks and filesystem accounting information: done
gggA500:~# mount /dev/sda3 /mnt
gggA500:~# cd /mnt
gggA500:/mnt# ls
lost+found
gggA500:/mnt# dd if=/palinux-0.5.iso of=/dev/sdc
dd: writing to `/dev/sdc': No space left on device
7193+0 records in
7192+0 records out
gggA500:/mnt# df
Filesystem           1k-blocks      Used Available Use% Mounted on
15.8.81.247:/tftpboot/hppa
                       7558400   5736960   1437488  80% /
/dev/sda3              4128320        20   3918536   1% /mnt
gggA500:/mnt# ls -l /dev/sdc
brw-rw----    1 root     disk       8,  32 Aug  1 14:43 /dev/sdc
gggA500:/mnt# fdisk /dev/sdc
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.


The number of cylinders for this disk is set to 8678.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sdc: 64 heads, 32 sectors, 8678 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-8678, default 1): 
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-8678, default 8678): 2100

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 2
First cylinder (2101-8678, default 2101): 
Using default value 2101
Last cylinder or +size or +sizeM or +sizeK (2101-8678, default 8678): 4200

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 3
First cylinder (4201-8678, default 4201): 
Using default value 4201
Last cylinder or +size or +sizeM or +sizeK (4201-8678, default 8678): 
Using default value 8678

Command (m for help): p

Disk /dev/sdc: 64 heads, 32 sectors, 8678 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdc1             1      2100   2150384   83  Linux
/dev/sdc2          2101      4200   2150400   83  Linux
/dev/sdc3          4201      8678   4585472   83  Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
SCSI device sdc: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdc: 17773524 512-byte hdwr sectors (9100 MB)

WARNING: If you have created or modified any DOS 6.x
partitions, please see the fdisk manual page for additional
information.
Syncing disks.
gggA500:/mnt# cd/
gggA500:/# dd if=/palinux-0.5.iso of=/dev/sdc1 bs=8k
dd: writing `/dev/sdc1': No space left on device
3550+0 records in
3549+0 records out
gggA500:/# sync
gggA500:/# ls -l palinux-0.5.iso
-rw-r--r--    1 769      users    184612864 Nov 22 17:33 palinux-0.5.iso
gggA500:/# du -s palinux-0.5.iso 
180472	palinux-0.5.iso
gggA500:/# 
