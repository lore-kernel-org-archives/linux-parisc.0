Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA28558
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 01:14:59 -0700
Date: Thu, 2 Nov 2000 00:21:36 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011020821.AAA28301@milano.cup.hp.com>
To: rhirst@linuxcare.com
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] a500.out16
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard (et al),
I finally think I understand how pcibios_align_resource() is used...
that definitely was the problem. Everything on A500 but PCI-PCI bridge
seems to be assigned I/O port and MMIO addresses correctly.

I'll look at tulip code tomorrow to see why it's not happy.
6 Tulips are behind PCI-PCI Bridges and that's part of
the problem. But the complaints about "MMIO resource"
list I/O Port addresses instead...and those look fine to me
if they are treated like I/O port addresses...

I'd also like to connect some more SCSI disks....but any clue
what the "CACHE TEST FAILED" is about?

But instead of putting out another tar ball, I'm committing my code.
I haven't tested on c3k/j5k yet and it might be broken.
32-bit still builds and any fix should be simple - either
cvs update back to an older date or put "if (pdc_pat) { }"
around anything that I added that shouldn't be.
Tell me to test/fix any brokeness you might find and I'll
make time to do it.

aplogies for the long delay,
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
Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-03799f
System IP Address 15.8.80.78
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Tue Oct 31 16:45:27 PST 2000
0/vmlinux 2708507 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
Kernel: partition 0 file /vmlinux
ELF64 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1705408 mediaptr 0x1000
Segment 1 load 002a2000 size 407616 mediaptr 0x1a2000
Segment 2 load 00308000 size 131960 mediaptr 0x206000
Segment 3 load 0032c000 size 16384 mediaptr 0x227000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
The 64-bit Kernel has started...
Enabled FP coprocessor
If this is the LAST MESSAGE YOU SEE, you're probably using
32-bit millicode by mistake.
Free memory starts at: 0xc0371000
start_parisc(0x504d40,0x504d40,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
PALO initrd 0-0
model   00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b2 000000b2
vers    00000300
cpuid   0000022a
CPUID vers 17 rev 10
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000
CELL_GET_NUMBER: 0x0 0x1
PAT_ENTITY_PROC: id_eid 0xa0ff0000
PAT_ENTITY_PROC: id_eid 0xa2ff0000
PAT_ENTITY_MEM: amount 0x10000000 min_gni_base 0x0 min_gni_len 0x0
PAT_ENTITY_SBA: ranges 6
        0: 0xc000000000000005 0xfffffffffed18000 0xfffffffffed2ffff
        1: 0x8000000000000000 0x0000000000000000 0x000000000000003f
        2: 0x8000000000000001 0xfffffffff8000000 0xfffffffffbffffff
        3: 0x00040000001a1701 0xfffffffff0000000 0xfffffffff7ffffff
        4: 0x00040000001a1701 0xfffffffffc000000 0xfffffffffecfffff
        5: 0x8000000000000002 0xfffffff800000000 0xfffffffbffffffff

PAT_ENTITY_LBA: ranges 4
        0: 0x8000000000000000 0x0000000000000000 0x0000000000000007
        1: 0x8000000000000001 0xfffffffff8000000 0xfffffffff87fffff
        2: 0x8000000000000002 0xfffffff804000000 0xfffffff87fffffff
        3: 0x8000000000000004 0xfffffff800000000 0xfffffff803ffffff

PAT_ENTITY_LBA: ranges 4
        0: 0x8000000000000000 0x0000000000000010 0x0000000000000017
        1: 0x8000000000000001 0xfffffffff9000000 0xfffffffff97fffff
        2: 0x8000000000000002 0xfffffff904000000 0xfffffff97fffffff
        3: 0x8000000000000004 0xfffffff900000000 0xfffffff903ffffff

PAT_ENTITY_LBA: ranges 4
        0: 0x8000000000000000 0x0000000000000020 0x0000000000000027
        1: 0x8000000000000001 0xfffffffffa000000 0xfffffffffa7fffff
        2: 0x8000000000000002 0xfffffffa04000000 0xfffffffa7fffffff
        3: 0x8000000000000004 0xfffffffa00000000 0xfffffffa03ffffff

PAT_ENTITY_LBA: ranges 4
        0: 0x8000000000000000 0x0000000000000030 0x0000000000000037
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
CONFIG_SMP disabled - not claiming addional CPUs
Warning : device (0, 0x5cb, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #73 Wed Nov 1 23:58:51 PST 2000
free_bootmem(0x373000, 0xfc8d000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 65536
zone(0): 32768 pages.
zone(1): 32768 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 
trap_init
Calibrating delay loop... 878.18 BogoMIPS
kernel BUG at page_alloc.c:106!
Memory: 248868k available
Dentry-cache hash table entries: 32768 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 16384 (order: 5, 131072 bytes)
Page-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 16384 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR4.0 (0x5) found at 0xfffffffffed30000
     0: 0x8000000000000000      PA 0x0000000000000000,0x0000000000000007
                                IO 0x0000000000000000,0x0000000000000007
     1: 0x8000000000000001      PA 0xfffffffff8000000,0xfffffffff87fffff
                                IO 0x00000000f8000000,0x00000000f87fffff
     2: 0x8000000000000002      PA 0xfffffff804000000,0xfffffff87fffffff
                                IO 0x000000f804000000,0x000000f87fffffff
lba range[2] : ignoring GMMIO (0xfffffff804000000)
     3: 0x8000000000000004      PA 0xfffffff800000000,0xfffffff803ffffff
                                IO 0x000000f800000000,0x000000f803ffffff
lba_fixup_bus(0x00000000cffe60c0) bus 0 sysdata 0x00000000cffe9e80
   cons 0x00002000 boot 0x00000000 kbd 0x00002000
   claimed 00:00 0 [0,7f]/101
   claimed 00:00 1 [fffffffff8020000,fffffffff80203ff]/200
   claimed 00:20 0 [fffffffff8000000,fffffffff8000fff]/200

LBA PIOP resource tree
  00000000cffe9ed0 [0,7ffff]/100
    00000000cffe5080 [0,7f]/101
LBA pcibios_size_bridges()
LBA pci_assign_unassigned_resources()
pcibios_update_resource(00:08, ..., 0) [100,1ff]/101
pcibios_update_resource(00:08, ..., 1) [fffffffff8001000,fffffffff80013ff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(00:08, ..., 3) [fffffffff8002000,fffffffff8003fff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(00:09, ..., 0) [200,2ff]/101
pcibios_update_resource(00:09, ..., 1) [fffffffff8001400,fffffffff80017ff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(00:09, ..., 3) [fffffffff8004000,fffffffff8005fff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(00:10, ..., 0) [300,3ff]/101
pcibios_update_resource(00:10, ..., 1) [fffffffff8001800,fffffffff80018ff]/200
pcibios_update_resource(00:10, ..., 2) [fffffffff8006000,fffffffff8006fff]/200
pcibios_update_resource(00:11, ..., 0) [400,4ff]/101
pcibios_update_resource(00:11, ..., 1) [fffffffff8001900,fffffffff80019ff]/200
pcibios_update_resource(00:11, ..., 2) [fffffffff8007000,fffffffff8007fff]/200
pcibios_update_resource(00:20, ..., 1) [80,bf]/101
pcibios_update_resource(00:28, ..., 0) [fffffffff8008000,fffffffff8008fff]/200
pcibios_update_resource(00:28, ..., 1) [c0,ff]/101
LBA pci_set_bus_ranges()
pcibios_fixup_pbus_ranges(0, [0,1000 fffffffff8000000,fffffffff8100000])
lba version TR4.0 (0x5) found at 0xfffffffffed34000
     0: 0x8000000000000000      PA 0x0000000000000010,0x0000000000000017
                                IO 0x0000000000000010,0x0000000000000017
     1: 0x8000000000000001      PA 0xfffffffff9000000,0xfffffffff97fffff
                                IO 0x00000000f9000000,0x00000000f97fffff
     2: 0x8000000000000002      PA 0xfffffff904000000,0xfffffff97fffffff
                                IO 0x000000f904000000,0x000000f97fffffff
lba range[2] : ignoring GMMIO (0xfffffff904000000)
     3: 0x8000000000000004      PA 0xfffffff900000000,0xfffffff903ffffff
                                IO 0x000000f900000000,0x000000f903ffffff
lba_fixup_bus(0x00000000cffe62c0) bus 16 sysdata 0x00000000cffe61c0
   cons 0x00002000 boot 0x00000000 kbd 0x00002000

LBA PIOP resource tree
  00000000cffe6210 [100000,17ffff]/100
LBA pcibios_size_bridges()
LBA pci_assign_unassigned_resources()
pcibios_update_resource(10:00, ..., 1) [100000,1000ff]/101
pcibios_update_resource(10:00, ..., 2) [100100,1001ff]/101
pcibios_update_resource(10:00, ..., 3) [fffffffff9000000,fffffffff90001ff]/200
pcibios_update_resource(10:00, ..., 5) [fffffffff9020000,fffffffff903ffff]/200
LBA pci_set_bus_ranges()
pcibios_fixup_pbus_ranges(0, [0,1000 fffffffff8000000,fffffffff8100000])
pcibios_fixup_pbus_ranges(16, [100000,101000 fffffffff9000000,fffffffff9100000])
lba version TR4.0 (0x5) found at 0xfffffffffed38000
     0: 0x8000000000000000      PA 0x0000000000000020,0x0000000000000027
                                IO 0x0000000000000020,0x0000000000000027
     1: 0x8000000000000001      PA 0xfffffffffa000000,0xfffffffffa7fffff
                                IO 0x00000000fa000000,0x00000000fa7fffff
     2: 0x8000000000000002      PA 0xfffffffa04000000,0xfffffffa7fffffff
                                IO 0x000000fa04000000,0x000000fa7fffffff
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
     3: 0x8000000000000004      PA 0xfffffffa00000000,0xfffffffa03ffffff
                                IO 0x000000fa00000000,0x000000fa03ffffff
lba_fixup_bus(0x00000000cffe64c0) bus 32 sysdata 0x00000000cffe63c0
   cons 0x00002000 boot 0x00000000 kbd 0x00002000

LBA PIOP resource tree
  00000000cffe6410 [200000,27ffff]/100
LBA pcibios_size_bridges()
LBA pci_assign_unassigned_resources()
pcibios_update_resource(20:00, ..., 0) [200000,2000ff]/101
pcibios_update_resource(20:00, ..., 1) [fffffffffa000000,fffffffffa0003ff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(20:00, ..., 3) [fffffffffa002000,fffffffffa003fff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(20:01, ..., 0) [200100,2001ff]/101
pcibios_update_resource(20:01, ..., 1) [fffffffffa000400,fffffffffa0007ff]/204
PCI: dev PCI device 1000:000b type 64-bit
pcibios_update_resource(20:01, ..., 3) [fffffffffa004000,fffffffffa005fff]/204
PCI: dev PCI device 1000:000b type 64-bit
LBA pci_set_bus_ranges()
pcibios_fixup_pbus_ranges(0, [0,1000 fffffffff8000000,fffffffff8100000])
pcibios_fixup_pbus_ranges(16, [100000,101000 fffffffff9000000,fffffffff9100000])
pcibios_fixup_pbus_ranges(32, [200000,201000 fffffffffa000000,fffffffffa100000])
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
     0: 0x8000000000000000      PA 0x0000000000000030,0x0000000000000037
                                IO 0x0000000000000030,0x0000000000000037
     1: 0x8000000000000001      PA 0xfffffffffb000000,0xfffffffffb7fffff
                                IO 0x00000000fb000000,0x00000000fb7fffff
     2: 0x8000000000000002      PA 0xfffffffb04000000,0xfffffffb7fffffff
                                IO 0x000000fb04000000,0x000000fb7fffffff
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
     3: 0x8000000000000004      PA 0xfffffffb00000000,0xfffffffb03ffffff
                                IO 0x000000fb00000000,0x000000fb03ffffff
lba_fixup_bus(0x00000000cffe66c0) bus 48 sysdata 0x00000000cffe65c0
   cons 0x00002000 boot 0x00000000 kbd 0x00002000
lba_fixup_bus(0x00000000cffe67c0) bus 49 sysdata 0x00000000cffe65c0
   cons 0x00002000 boot 0x00000000 kbd 0x00002000
lba_fixup_bus(0x00000000cffe68c0) bus 50 sysdata 0x00000000cffe65c0
   cons 0x00002000 boot 0x00000000 kbd 0x00002000

LBA PIOP resource tree
  00000000cffe6610 [300000,37ffff]/100
LBA pcibios_size_bridges()
LBA pci_assign_unassigned_resources()
PCI: Failed to allocate resource 0 for PCI device 1000:000b
PCI: Failed to allocate resource 1 for PCI device 1000:000b
PCI: Failed to allocate resource 3 for PCI device 1000:000b
PCI: Failed to allocate resource 0 for PCI device 1000:000b
PCI: Failed to allocate resource 1 for PCI device 1000:000b
PCI: Failed to allocate resource 3 for PCI device 1000:000b
PCI: Failed to allocate resource 0 for PCI device 1011:0019
PCI: Failed to allocate resource 1 for PCI device 1011:0019
PCI: Failed to allocate resource 0 for PCI device 1011:0019
PCI: Failed to allocate resource 1 for PCI device 1011:0019
PCI: Failed to allocate resource 0 for PCI device 1011:0009
PCI: Failed to allocate resource 1 for PCI device 1011:0009
PCI: Failed to allocate resource 0 for PCI device 1011:0009
PCI: Failed to allocate resource 1 for PCI device 1011:0009
PCI: Failed to allocate resource 0 for PCI device 1011:0009
PCI: Failed to allocate resource 1 for PCI device 1011:0009
PCI: Failed to allocate resource 0 for PCI device 1011:0009
PCI: Failed to allocate resource 1 for PCI device 1011:0009
LBA pci_set_bus_ranges()
pcibios_fixup_pbus_ranges(0, [0,1000 fffffffff8000000,fffffffff8100000])
pcibios_fixup_pbus_ranges(16, [100000,101000 fffffffff9000000,fffffffff9100000])
pcibios_fixup_pbus_ranges(32, [200000,201000 fffffffffa000000,fffffffffa100000])
pcibios_fixup_pbus_ranges(49, [310000,311000 fffffffffb000000,fffffffffb100000])
pcibios_fixup_pbus_ranges(50, [320000,321000 fffffffffb000000,fffffffffb100000])
pcibios_fixup_pbus_ranges(48, [0,1000 fb000000,fb100000])
SBA found Astro 2.1 at 0xfffffffffed00000
lba_init_iregs() ibase 0x1 imask 0xf0000000
lba_init_iregs() base_addr fffffffffed3c000
lba_init_iregs() base_addr fffffffffed38000
lba_init_iregs() base_addr fffffffffed34000
lba_init_iregs() base_addr fffffffffed30000
lba_init_iregs() done
lba: lba_bios_init
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 16Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 32, device 0, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 32, device 0, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 49, device 4, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 49, device 4, function 1
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
kernel BUG at sym53c8xx.c:725!
sym53c8xx: 53c896 detected 
kernel BUG at sym53c8xx.c:725!
sym53c876-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c876-0: NCR clock is 40218KHz
sym53c876-0: ID 7, Fast-20, Parity Checking
sym53c876-0: on-chip RAM at 0xfffffffff8006000
sym53c876-0: restart (scsi reset).
sym53c876-0: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c876-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c876-1: NCR clock is 40218KHz
sym53c876-1: ID 7, Fast-20, Parity Checking
sym53c876-1: on-chip RAM at 0xfffffffff8007000
sym53c876-1: restart (scsi reset).
sym53c876-1: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c896-2: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-2: NCR clock is 40218KHz
sym53c896-2: ID 7, Fast-40, Parity Checking
sym53c896-2: on-chip RAM at 0xfffffffff8002000
sym53c896-2: restart (scsi reset).
sym53c896-2: handling phase mismatch from SCRIPTS.
sym53c896-2: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c896-3: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-3: NCR clock is 40218KHz
sym53c896-3: ID 7, Fast-40, Parity Checking
sym53c896-3: on-chip RAM at 0xfffffffff8004000
sym53c896-3: restart (scsi reset).
sym53c896-3: handling phase mismatch from SCRIPTS.
sym53c896-3: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c896-4: rev 0x1 on pci bus 32 device 0 function 0 irq 256
sym53c896-4: NCR clock is 40218KHz
sym53c896-4: ID 7, Fast-40, Parity Checking
sym53c896-4: on-chip RAM at 0xfffffffffa002000
sym53c896-4: restart (scsi reset).
sym53c896-4: handling phase mismatch from SCRIPTS.
sym53c896-4: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c896-5: rev 0x1 on pci bus 32 device 0 function 1 irq 257
sym53c896-5: NCR clock is 40218KHz
sym53c896-5: ID 7, Fast-40, Parity Checking
sym53c896-5: on-chip RAM at 0xfffffffffa004000
sym53c896-5: restart (scsi reset).
sym53c896-5: handling phase mismatch from SCRIPTS.
sym53c896-5: Downloading SCSI SCRIPTS.
kernel BUG at sym53c8xx.c:725!
sym53c896-6: rev 0x5 on pci bus 49 device 4 function 0 irq 323
sym53c896-6: ID 7, Fast-40, Parity Checking
sym53c896-6: on-chip RAM at 0xfffffffffb000000
CACHE TEST FAILED: reg dstat-sstat2 readback ffffffff.
CACHE INCORRECTLY CONFIGURED.
sym53c896-6: giving up ...
kernel BUG at sym53c8xx.c:725!
kernel BUG at sym53c8xx.c:725!
kernel BUG at sym53c8xx.c:725!
sym53c896-6: rev 0x5 on pci bus 49 device 4 function 1 irq 320
sym53c896-6: ID 7, Fast-40, Parity Checking
sym53c896-6: on-chip RAM at 0xfffffffffb000000
CACHE TEST FAILED: reg dstat-sstat2 readback ffffffff.
CACHE INCORRECTLY CONFIGURED.
sym53c896-6: giving up ...
kernel BUG at sym53c8xx.c:725!
kernel BUG at sym53c8xx.c:725!
scsi0 : sym53c8xx - version 1.6b
scsi1 : sym53c8xx - version 1.6b
scsi2 : sym53c8xx - version 1.6b
scsi3 : sym53c8xx - version 1.6b
scsi4 : sym53c8xx - version 1.6b
scsi5 : sym53c8xx - version 1.6b
scsi : 6 hosts.
  Vendor: SEAGATE   Model: ST318404LC        Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 03
Detected scsi disk sda at scsi3, channel 0, id 15, lun 0
sym53c896-3-<15,0>: tagged command queue depth set to 8
scsi : detected 1 SCSI disk total.
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
SCSI device sda: hdwr sector= 512 bytes. Sectors= 35566480 [17366 MB] [17.4 GB]
Partition check:
 sda: unknown partition table
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Linux Tulip driver version 0.9.8 (July 13, 2000)
tulip: MMIO resource (0x80@0x0) unavailable, aborting
tulip: MMIO resource (0x80@0x310200) unavailable, aborting
tulip: MMIO resource (0x80@0x310280) unavailable, aborting
tulip: MMIO resource (0x80@0x320300) unavailable, aborting
tulip: MMIO resource (0x80@0x320380) unavailable, aborting
tulip: MMIO resource (0x80@0x320400) unavailable, aborting
tulip: MMIO resource (0x80@0x320480) unavailable, aborting
IP-Config: No network devices available.
Switching from PDC console
