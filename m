Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA03805
	for <parisc-linux@puffin.external.hp.com>; Fri, 13 Oct 2000 14:49:16 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id CCC32F84
	for <parisc-linux@thepuffingroup.com>; Fri, 13 Oct 2000 13:50:15 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id NAA09857
	for parisc-linux@thepuffingroup.com; Fri, 13 Oct 2000 13:54:37 -0700 (PDT)
Date: Fri, 13 Oct 2000 13:54:37 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010132054.NAA09857@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PDC PAT support committed
List-ID: <linux-parisc.vger.kernel.org>

FYI

I committed the first cut of the PDC PAT support.
L1000/L2000/A500 are short term targets of this support.

Short Term TODO kernel items:

o reduce amount of debug output from do_pat_discovery().
o debug why output stops at "Memory: 12248k available"
  (64-bit kernel is hardcoded to only see 16MB RAM)
o write code to setup PCI resources in lba_pci.c.
o 64-bit VM work

enjoy!
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
Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-03799f
System IP Address 15.8.80.78
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Mon Sep 25 17:09:43 PDT 2000
0/vmlinux 2684576 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
Kernel: partition 0 file /vmlinux
ELF64 executable

Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 1695920 mediaptr 0x1000
Segment 1 load 002a0000 size 402520 mediaptr 0x1a0000
Segment 2 load 00304000 size 147456 mediaptr 0x203000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
The 64-bit Kernel has started...
Enabled FP coprocessor
If this is the LAST MESSAGE YOU SEE, you're probably using
32-bit millicode by mistake.
Free memory starts at: 0xc0372000
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
NUM_TO_LOC status: -2
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x0
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xff00ff11 mod_path 0xffffffffffffa0
PAT_ENTITY_PROC: id_eid 0xa0ff0000
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x1
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xff01ff11 mod_path 0xffffffffffffa2
PAT_ENTITY_PROC: id_eid 0xa2ff0000
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x2
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffffff71 mod_path 0xffffffffffff08
PAT_ENTITY_MEM: amount 0x10000000 min_gni_base 0x0 min_gni_len 0x0
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x3
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffffff82 mod_path 0xffffffffffff00
PAT_ENTITY_SBA: ranges 6 -4611686018427387899/0xfffffffffed18000/0xfffffffffed2ffff -19824640/0xfffffffffed2ffff/0x8000000000000000 -19726337/0x8000000000000000/0x0 -9223372036854775808/0x0/0x3f 0/0x3f/0x8000000000000001 63/0x8000000000000001/0xfffffffff8000000
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x4
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffff04ff83 mod_path 0xffffffffff0000
PAT_ENTITY_LBA: ranges 4 -9223372036854775808/0x0/0x7 0/0x7/0x8000000000000001 7/0x8000000000000001/0xfffffffff8000000 -9223372036854775807/0xfffffffff8000000/0xfffffffff87fffff
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x5
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffff01ff83 mod_path 0xffffffffff0002
PAT_ENTITY_LBA: ranges 4 -9223372036854775808/0x10/0x17 16/0x17/0x8000000000000001 23/0x8000000000000001/0xfffffffff9000000 -9223372036854775807/0xfffffffff9000000/0xfffffffff97fffff
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x6
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffff02ff83 mod_path 0xffffffffff0004
PAT_ENTITY_LBA: ranges 4 -9223372036854775808/0x20/0x27 32/0x27/0x8000000000000001 39/0x8000000000000001/0xfffffffffa000000 -9223372036854775807/0xfffffffffa000000/0xfffffffffa7fffff
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x7
  status 0
PDC_PAT_CELL_MODULE: pmod_loc 0xffff03ff83 mod_path 0xffffffffff0006
PAT_ENTITY_LBA: ranges 4 -9223372036854775808/0x30/0x37 48/0x37/0x8000000000000001 55/0x8000000000000001/0xfffffffffb000000 -9223372036854775807/0xfffffffffb000000/0xfffffffffb7fffff
PDC_PAT_CELL_MODULE: pcell_loc 0x1 mod_index 0x8
  status -7
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
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #29 Fri Oct 13 12:24:46 PDT 2000
free_bootmem(0x372200, 0xc8de00)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 4096
zone(0): 2048 pages.
zone(1): 2048 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 
trap_init
Calibrating delay loop... 878.18 BogoMIPS
Memory: 12248k available

[ and then it hangs... ] 
