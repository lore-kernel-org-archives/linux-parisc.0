Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09451
	for <parisc-linux@puffin.external.hp.com>; Thu, 20 Apr 2000 16:14:57 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by palrel1.hp.com (Postfix) with ESMTP id C1BE219ED
	for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 15:14:50 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id C28D14FF59
	for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 18:07:52 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id PAA02080 for <parisc-linux@thepuffingroup.com>; Thu, 20 Apr 2000 15:08:05 -0700 (PDT)
Message-Id: <200004202208.PAA02080@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2-way j5000 hangs early 
In-reply-to: Your message of "Tue, 18 Apr 2000 18:01:39 PDT."
             <200004190101.SAA24682@milano.cup.hp.com>
Date: Thu, 20 Apr 2000 15:08:02 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Hi all,
> 
> I was hoping to use a j5000 to debug problems with built-in 100BT
> but couldn't even "get off the ground" (so to speak).

More data.  I've added printk's to two files:

grundler <540>cvs diff -u arch/parisc/mm/init.c
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/mm/init.c,v
retrieving revision 1.12
diff -u -r1.12 init.c
--- init.c      2000/04/14 16:47:14     1.12
+++ init.c      2000/04/20 21:59:06
@@ -149,6 +149,7 @@
        /* Map whole memory from PAGE_OFFSET */
        pg_dir += USER_PGD_PTRS;
 
+printk(__FUNCTION__ " pg_table ");
        while (address < mem_max) {
                /* XXX: BTLB should be done here */
 
@@ -166,6 +167,7 @@
 
                /* now change pg_table to kernel virtual addresses */
                pg_table = (pte_t *) __va(pg_table);
+printk(" 0x%lx ", pg_table);
                for (tmp = 0 ; tmp < PTRS_PER_PTE ; tmp++,pg_table++) {
                        pte_t pte = __mk_pte(address, PAGE_KERNEL);
                        if (address >= mem_max)
@@ -183,8 +185,10 @@
        memset(empty_zero_page, 0, NUM_COLOURS * PAGE_SIZE);
 #endif
 
+printk("\n"__FUNCTION__ " calling alloc_bootmem_pages()\n");
        empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
        memset(empty_zero_page, 0, PAGE_SIZE);
+printk(__FUNCTION__ " done zp 0x%lx\n", empty_zero_page);
 }
 
 unsigned long gateway_pgd_offset;


grundler <541>cvs diff  -u mm/bootmem.c        
Index: mm/bootmem.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/mm/bootmem.c,v
retrieving revision 1.5
diff -u -r1.5 bootmem.c
--- bootmem.c   2000/03/26 22:29:38     1.5
+++ bootmem.c   2000/04/20 22:00:23
@@ -210,6 +210,9 @@
                bdata->last_offset = size & ~PAGE_MASK;
                ret = phys_to_virt(start * PAGE_SIZE + bdata->node_boot_start);
        }
+
+printk(__FUNCTION__ " ret 0x%lx\n", ret);
+
        /*
         * Reserve the area now:
         */


And I've appended the console output.
I'll keep digging but I don't know WTF to look for.

I also noticed that we don't print a message when crippling
the box to 128MB of physical memory. I'm going to add
that back to make sure it's happening *before* this
init stuff happens.

thanks,
grant "my brain is hurting" grundler


Firmware Version 3.5

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1999, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Stopped:Deconfigured   Unknown            512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:             2147483648 bytes
  Good memory required:            9527296 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         PCI7.0.0
  Keyboard path:        USB

CPU 0
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized but not tested because FASTBOOT is
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Searching for device(s) with bootable media...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).


   Path Number        Device Path              Device Type and Utilities
   -----------        -----------------        -------------------------
   P0                 LAN.15.8.80.76.3.254     15.8.80.76   100/Half Dx
                                               IPL
   P1                 FWSCSI.6.0               QUANTUM ATLAS10K-9LVD   
                                               IPL



Enter Path Number or Device Path to continue boot sequence.  Enter NO to go
to main menu.
> bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-7a0f6c

System IP Address 15.8.80.77
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@rock Thu Apr 20 14:40:28 PDT 2000
0/vmlinux 1961104 bytes @ 0x7000
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
0/ramdisk 614400 bytes @ 0x1e5c90
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 0010177c first 00100000 n 4
Segment 0 load 00100000 size 1105044 mediaptr 0x1000
Segment 1 load 0020e000 size 95400 mediaptr 0x10f000
Segment 2 load 00228000 size 56116 mediaptr 0x127000
Segment 3 load 00238000 size 8192 mediaptr 0x135000
branching to kernel entry point 0x0010177c
The Kernel has started...
Free memory starts at: 0xc02a4000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005bd0 00000491 00000000 00000002 77fc84a7 100000f0 00000008 000000b2 000000b2
vers    00000201
cpuid   00000225
CPUID vers 17 rev 5
CPU(s): 1 x PA8500 at 440.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
7. Forte W 2-way (0) at 0xfffa0000, versions 0x5bd, 0x0, 0x4, 0x0, 0x91
8. Forte 2w Memory (1) at 0xfed10200, versions 0x88, 0x0, 0x9, 0x0, 0x0
That's a total of 8 devices.
Linux version 2.3.99-pre1 (grundler@rock) (gcc version 2.9-hppa-991112) #17 Thu Apr 20 14:40:22 PDT 2000
initrd: 00000000-00000000
pagetable_init
pagetable_init pg_table  0xc021d000  0xc021e000 __alloc_bootmem_core ret 0xc02b4000
 0xc02b4000 __alloc_bootmem_core ret 0xc02b5000
 0xc02b5000 __alloc_bootmem_core ret 0xc02b6000
 0xc02b6000 __alloc_bootmem_core ret 0xc02b7000
 0xc02b7000 __alloc_bootmem_core ret 0xc02b8000
 0xc02b8000 __alloc_bootmem_core ret 0xc02b9000
 0xc02b9000 __alloc_bootmem_core ret 0xc02ba000
 0xc02ba000 __alloc_bootmem_core ret 0xc02bb000
 0xc02bb000 __alloc_bootmem_core ret 0xc02bc000
 0xc02bc000 __alloc_bootmem_core ret 0xc02bd000
 0xc02bd000 __alloc_bootmem_core ret 0xc02be000
 0xc02be000 __alloc_bootmem_core ret 0xc02bf000
 0xc02bf000 __alloc_bootmem_core ret 0xc02c0000
 0xc02c0000 __alloc_bootmem_core ret 0xc02c1000
 0xc02c1000 __alloc_bootmem_core ret 0xc02c2000
 0xc02c2000 __alloc_bootmem_core ret 0xc02c3000
 0xc02c3000 __alloc_bootmem_core ret 0xc02c4000
 0xc02c4000 __alloc_bootmem_core ret 0xc02c5000
 0xc02c5000 __alloc_bootmem_core ret 0xc02c6000
 0xc02c6000 __alloc_bootmem_core ret 0xc02c7000
 0xc02c7000 __alloc_bootmem_core ret 0xc02c8000
 0xc02c8000 __alloc_bootmem_core ret 0xc02c9000
 0xc02c9000 __alloc_bootmem_core ret 0xc02ca000
 0xc02ca000 __alloc_bootmem_core ret 0xc02cb000
 0xc02cb000 __alloc_bootmem_core ret 0xc02cc000
 0xc02cc000 __alloc_bootmem_core ret 0xc02cd000
 0xc02cd000 __alloc_bootmem_core ret 0xc02ce000
 0xc02ce000 __alloc_bootmem_core ret 0xc02cf000
 0xc02cf000 __alloc_bootmem_core ret 0xc02d0000
 0xc02d0000 __alloc_bootmem_core ret 0xc02d1000
 0xc02d1000 __alloc_bootmem_core ret 0xc02d2000
 0xc02d2000 __alloc_bootmem_core ret 0xc02d3000
 0xc02d3000 __alloc_bootmem_core ret 0xc02d4000
 0xc02d4000 __alloc_bootmem_core ret 0xc02d5000
 0xc02d5000 __alloc_bootmem_core ret 0xc02d6000
 0xc02d6000 __alloc_bootmem_core ret 0xc02d7000
 0xc02d7000 __alloc_bootmem_core ret 0xc02d8000
 0xc02d8000 __alloc_bootmem_core ret 0xc02d9000
 0xc02d9000 __alloc_bootmem_core ret 0xc02da000
 0xc02da000 __alloc_bootmem_core ret 0xc02db000
 0xc02db000 __alloc_bootmem_core ret 0xc02dc000
 0xc02dc000 __alloc_bootmem_core ret 0xc02dd000
 0xc02dd000 __alloc_bootmem_core ret 0xc02de000
 0xc02de000 __alloc_bootmem_core ret 0xc02df000
 0xc02df000 __alloc_bootmem_core ret 0xc02e0000
 0xc02e0000 __alloc_bootmem_core ret 0xc02e1000
 0xc02e1000 __alloc_bootmem_core ret 0xc02e2000
 0xc02e2000 __alloc_bootmem_core ret 0xc02e3000
 0xc02e3000 __alloc_bootmem_core ret 0xc02e4000
 0xc02e4000 __alloc_bootmem_core ret 0xc02e5000
 0xc02e5000 __alloc_bootmem_core ret 0xc02e6000
 0xc02e6000 __alloc_bootmem_core ret 0xc02e7000
 0xc02e7000 __alloc_bootmem_core ret 0xc02e8000
 0xc02e8000 __alloc_bootmem_core ret 0xc02e9000
 0xc02e9000 __alloc_bootmem_core ret 0xc02ea000
 0xc02ea000 __alloc_bootmem_core ret 0xc02eb000
 0xc02eb000 __alloc_bootmem_core ret 0xc02ec000
 0xc02ec000 __alloc_bootmem_core ret 0xc02ed000
 0xc02ed000 __alloc_bootmem_core ret 0xc02ee000
 0xc02ee000 __alloc_bootmem_core ret 0xc02ef000
 0xc02ef000 __alloc_bootmem_core ret 0xc02f0000
 0xc02f0000 __alloc_bootmem_core ret 0xc02f1000
 0xc02f1000 __alloc_bootmem_core ret 0xc02f2000
 0xc02f2000 __alloc_bootmem_core ret 0xc02f3000
 0xc02f3000 __alloc_bootmem_core ret 0xc02f4000
 0xc02f4000 __alloc_bootmem_core ret 0xc02f5000
 0xc02f5000 __alloc_bootmem_core ret 0xc02f6000
 0xc02f6000 __alloc_bootmem_core ret 0xc02f7000
 0xc02f7000 __alloc_bootmem_core ret 0xc02f8000
 0xc02f8000 __alloc_bootmem_core ret 0xc02f9000
 0xc02f9000 __alloc_bootmem_core ret 0xc02fa000
 0xc02fa000 __alloc_bootmem_core ret 0xc02fb000
 0xc02fb000 __alloc_bootmem_core ret 0xc02fc000
 0xc02fc000 __alloc_bootmem_core ret 0xc02fd000
 0xc02fd000 __alloc_bootmem_core ret 0xc02fe000
 0xc02fe000 __alloc_bootmem_core ret 0xc02ff000
 0xc02ff000 __alloc_bootmem_core ret 0xc0300000
 0xc0300000 __alloc_bootmem_core ret 0xc0301000
 0xc0301000 __alloc_bootmem_core ret 0xc0302000
 0xc0302000 __alloc_bootmem_core ret 0xc0303000
 0xc0303000 __alloc_bootmem_core ret 0xc0304000
 0xc0304000 __alloc_bootmem_core ret 0xc0305000
 0xc0305000 __alloc_bootmem_core ret 0xc0306000
 0xc0306000 __alloc_bootmem_core ret 0xc0307000
 0xc0307000 __alloc_bootmem_core ret 0xc0308000
 0xc0308000 __alloc_bootmem_core ret 0xc0309000
 0xc0309000 __alloc_bootmem_core ret 0xc030a000
 0xc030a000 __alloc_bootmem_core ret 0xc030b000
 0xc030b000 __alloc_bootmem_core ret 0xc030c000
 0xc030c000 __alloc_bootmem_core ret 0xc030d000
 0xc030d000 __alloc_bootmem_core ret 0xc030e000
 0xc030e000 __alloc_bootmem_core ret 0xc030f000
 0xc030f000 __alloc_bootmem_core ret 0xc0310000
 0xc0310000 __alloc_bootmem_core ret 0xc0311000
 0xc0311000 __alloc_bootmem_core ret 0xc0312000
 0xc0312000 __alloc_bootmem_core ret 0xc0313000
 0xc0313000 __alloc_bootmem_core ret 0xc0314000
 0xc0314000 __alloc_bootmem_core ret 0xc0315000
 0xc0315000 __alloc_bootmem_core ret 0xc0316000
 0xc0316000 __alloc_bootmem_core ret 0xc0317000
 0xc0317000 __alloc_bootmem_core ret 0xc0318000
 0xc0318000 __alloc_bootmem_core ret 0xc0319000
 0xc0319000 __alloc_bootmem_core ret 0xc031a000
 0xc031a000 __alloc_bootmem_core ret 0xc031b000
 0xc031b000 __alloc_bootmem_core ret 0xc031c000
 0xc031c000 __alloc_bootmem_core ret 0xc031d000
 0xc031d000 __alloc_bootmem_core ret 0xc031e000
 0xc031e000 __alloc_bootmem_core ret 0xc031f000
 0xc031f000 __alloc_bootmem_core ret 0xc0320000
 0xc0320000 __alloc_bootmem_core ret 0xc0321000
 0xc0321000 __alloc_bootmem_core ret 0xc0322000
 0xc0322000 __alloc_bootmem_core ret 0xc0323000
 0xc0323000 __alloc_bootmem_core ret 0xc0324000
 0xc0324000 __alloc_bootmem_core ret 0xc0325000
 0xc0325000 __alloc_bootmem_core ret 0xc0326000
 0xc0326000 __alloc_bootmem_core ret 0xc0327000
 0xc0327000 __alloc_bootmem_core ret 0xc0328000
 0xc0328000 __alloc_bootmem_core ret 0xc0329000
 0xc0329000 __alloc_bootmem_core ret 0xc032a000
 0xc032a000 __alloc_bootmem_core ret 0xc032b000
 0xc032b000 __alloc_bootmem_core ret 0xc032c000
 0xc032c000 __alloc_bootmem_core ret 0xc032d000
 0xc032d000 __alloc_bootmem_core ret 0xc032e000
 0xc032e000 __alloc_bootmem_core ret 0xc032f000
 0xc032f000 __alloc_bootmem_core ret 0xc0330000
 0xc0330000 __alloc_bootmem_core ret 0xc0331000
 0xc0331000 __alloc_bootmem_core ret 0xc0332000
 0xc0332000 __alloc_bootmem_core ret 0xc0333000
 0xc0333000 __alloc_bootmem_core ret 0xc0334000
 0xc0334000 __alloc_bootmem_core ret 0xc0335000
 0xc0335000 __alloc_bootmem_core ret 0xc0336000
 0xc0336000 __alloc_bootmem_core ret 0xc0337000
 0xc0337000 __alloc_bootmem_core ret 0xc0338000
 0xc0338000 __alloc_bootmem_core ret 0xc0339000
 0xc0339000 __alloc_bootmem_core ret 0xc033a000
 0xc033a000 __alloc_bootmem_core ret 0xc033b000
 0xc033b000 __alloc_bootmem_core ret 0xc033c000
 0xc033c000 __alloc_bootmem_core ret 0xc033d000
 0xc033d000 __alloc_bootmem_core ret 0xc033e000
 0xc033e000 __alloc_bootmem_core ret 0xc033f000
 0xc033f000 __alloc_bootmem_core ret 0xc0340000
 0xc0340000 __alloc_bootmem_core ret 0xc0341000
 0xc0341000 __alloc_bootmem_core ret 0xc0342000
 0xc0342000 __alloc_bootmem_core ret 0xc0343000
 0xc0343000 __alloc_bootmem_core ret 0xc0344000
 0xc0344000 __alloc_bootmem_core ret 0xc0345000
 0xc0345000 __alloc_bootmem_core ret 0xc0346000
 0xc0346000 __alloc_bootmem_core ret 0xc0347000
 0xc0347000 __alloc_bootmem_core ret 0xc0348000
 0xc0348000 __alloc_bootmem_core ret 0xc0349000
 0xc0349000 __alloc_bootmem_core ret 0xc034a000
 0xc034a000 __alloc_bootmem_core ret 0xc034b000
 0xc034b000 __alloc_bootmem_core ret 0xc034c000
 0xc034c000 __alloc_bootmem_core ret 0xc034d000
 0xc034d000 __alloc_bootmem_core ret 0xc034e000
 0xc034e000 __alloc_bootmem_core ret 0xc034f000
 0xc034f000 __alloc_bootmem_core ret 0xc0350000
 0xc0350000 __alloc_bootmem_core ret 0xc0351000
 0xc0351000 __alloc_bootmem_core ret 0xc0352000
 0xc0352000 __alloc_bootmem_core ret 0xc0353000
 0xc0353000 __alloc_bootmem_core ret 0xc0354000
 0xc0354000 __alloc_bootmem_core ret 0xc0355000
 0xc0355000 __alloc_bootmem_core ret 0xc0356000
 0xc0356000 __alloc_bootmem_core ret 0xc0357000
 0xc0357000 __alloc_bootmem_core ret 0xc0358000
 0xc0358000 __alloc_bootmem_core ret 0xc0359000
 0xc0359000 __alloc_bootmem_core ret 0xc035a000
 0xc035a000 __alloc_bootmem_core ret 0xc035b000
 0xc035b000 __alloc_bootmem_core ret 0xc035c000
 0xc035c000 __alloc_bootmem_core ret 0xc035d000
 0xc035d000 __alloc_bootmem_core ret 0xc035e000
 0xc035e000 __alloc_bootmem_core ret 0xc035f000
 0xc035f000 __alloc_bootmem_core ret 0xc0360000
 0xc0360000 __alloc_bootmem_core ret 0xc0361000
 0xc0361000 __alloc_bootmem_core ret 0xc0362000
 0xc0362000 __alloc_bootmem_core ret 0xc0363000
 0xc0363000 __alloc_bootmem_core ret 0xc0364000
 0xc0364000 __alloc_bootmem_core ret 0xc0365000
 0xc0365000 __alloc_bootmem_core ret 0xc0366000
 0xc0366000 __alloc_bootmem_core ret 0xc0367000
 0xc0367000 __alloc_bootmem_core ret 0xc0368000
 0xc0368000 __alloc_bootmem_core ret 0xc0369000
 0xc0369000 __alloc_bootmem_core ret 0xc036a000
 0xc036a000 __alloc_bootmem_core ret 0xc036b000
 0xc036b000 __alloc_bootmem_core ret 0xc036c000
 0xc036c000 __alloc_bootmem_core ret 0xc036d000
 0xc036d000 __alloc_bootmem_core ret 0xc036e000
 0xc036e000 __alloc_bootmem_core ret 0xc036f000
 0xc036f000 __alloc_bootmem_core ret 0xc0370000
 0xc0370000 __alloc_bootmem_core ret 0xc0371000
 0xc0371000 __alloc_bootmem_core ret 0xc0372000
 0xc0372000 __alloc_bootmem_core ret 0xc0373000
 0xc0373000 __alloc_bootmem_core ret 0xc0374000
 0xc0374000 __alloc_bootmem_core ret 0xc0375000
 0xc0375000 __alloc_bootmem_core ret 0xc0376000
 0xc0376000 __alloc_bootmem_core ret 0xc0377000
 0xc0377000 __alloc_bootmem_core ret 0xc0378000
 0xc0378000 __alloc_bootmem_core ret 0xc0379000
 0xc0379000 __alloc_bootmem_core ret 0xc037a000
 0xc037a000 __alloc_bootmem_core ret 0xc037b000
 0xc037b000 __alloc_bootmem_core ret 0xc037c000
 0xc037c000 __alloc_bootmem_core ret 0xc037d000
 0xc037d000 __alloc_bootmem_core ret 0xc037e000
 0xc037e000 __alloc_bootmem_core ret 0xc037f000
 0xc037f000 __alloc_bootmem_core ret 0xc0380000
 0xc0380000 __alloc_bootmem_core ret 0xc0381000
 0xc0381000 __alloc_bootmem_core ret 0xc0382000
 0xc0382000 __alloc_bootmem_core ret 0xc0383000
 0xc0383000 __alloc_bootmem_core ret 0xc0384000
 0xc0384000 __alloc_bootmem_core ret 0xc0385000
 0xc0385000 __alloc_bootmem_core ret 0xc0386000
 0xc0386000 __alloc_bootmem_core ret 0xc0387000
 0xc0387000 __alloc_bootmem_core ret 0xc0388000
 0xc0388000 __alloc_bootmem_core ret 0xc0389000
 0xc0389000 __alloc_bootmem_core ret 0xc038a000
 0xc038a000 __alloc_bootmem_core ret 0xc038b000
 0xc038b000 __alloc_bootmem_core ret 0xc038c000
 0xc038c000 __alloc_bootmem_core ret 0xc038d000
 0xc038d000 __alloc_bootmem_core ret 0xc038e000
 0xc038e000 __alloc_bootmem_core ret 0xc038f000
 0xc038f000 __alloc_bootmem_core ret 0xc0390000
 0xc0390000 __alloc_bootmem_core ret 0xc0391000
 0xc0391000 __alloc_bootmem_core ret 0xc0392000
 0xc0392000 __alloc_bootmem_core ret 0xc0393000
 0xc0393000 __alloc_bootmem_core ret 0xc0394000
 0xc0394000 __alloc_bootmem_core ret 0xc0395000
 0xc0395000 __alloc_bootmem_core ret 0xc0396000
 0xc0396000 __alloc_bootmem_core ret 0xc0397000
 0xc0397000 __alloc_bootmem_core ret 0xc0398000
 0xc0398000 __alloc_bootmem_core ret 0xc0399000
 0xc0399000 __alloc_bootmem_core ret 0xc039a000
 0xc039a000 __alloc_bootmem_core ret 0xc039b000
 0xc039b000 __alloc_bootmem_core ret 0xc039c000
 0xc039c000 __alloc_bootmem_core ret 0xc039d000
 0xc039d000 __alloc_bootmem_core ret 0xc039e000
 0xc039e000 __alloc_bootmem_core ret 0xc039f000
 0xc039f000 __alloc_bootmem_core ret 0xc03a0000
 0xc03a0000 __alloc_bootmem_core ret 0xc03a1000
 0xc03a1000 __alloc_bootmem_core ret 0xc03a2000
 0xc03a2000 __alloc_bootmem_core ret 0xc03a3000
 0xc03a3000 __alloc_bootmem_core ret 0xc03a4000
 0xc03a4000 __alloc_bootmem_core ret 0xc03a5000
 0xc03a5000 __alloc_bootmem_core ret 0xc03a6000
 0xc03a6000 __alloc_bootmem_core ret 0xc03a7000
 0xc03a7000 __alloc_bootmem_core ret 0xc03a8000
 0xc03a8000 __alloc_bootmem_core ret 0xc03a9000
 0xc03a9000 __alloc_bootmem_core ret 0xc03aa000
 0xc03aa000 __alloc_bootmem_core ret 0xc03ab000
 0xc03ab000 __alloc_bootmem_core ret 0xc03ac000
 0xc03ac000 __alloc_bootmem_core ret 0xc03ad000
 0xc03ad000 __alloc_bootmem_core ret 0xc03ae000
 0xc03ae000 __alloc_bootmem_core ret 0xc03af000
 0xc03af000 __alloc_bootmem_core ret 0xc03b0000
 0xc03b0000 __alloc_bootmem_core ret 0xc03b1000
 0xc03b1000 __alloc_bootmem_core ret 0xc03b2000
c6000  0xc00c7000  0xc00c8000  0xc00c9000  0xc00ca000  0xc00cb000  0xc00cc000  0xc00cd000  0xc00ce000  0xc00cf000  0xc00d0000  0xc00d1000  0xc00d2000  0xc00d3000  0xc00d4000  0xc00d5000  0xc00d6000  0xc00d7000  0xc00d8000  0xc00d9000  0xc00da000  0xc00db000  0xc00dc000  0xc00dd000  0xc00de000  0xc00df000  0xc00e0000  0xc00e1000  0xc00e2000  0xc00e3000  0xc00e4000  0xc00e5000  0xc00e6000  0xc00e7000  0xc00e8000  0xc00e9000  0xc00ea000  0xc00eb000  0xc00ec000  0xc00ed000  0xc00ee000  0xc00ef000  0xc00f0000  0xc00f1000  0xc00f2000  0xc00f3000  0xc00f4000  0xc00f5000  0xc00f6000  0xc00f7000  0xc00f8000  0xc00f9000  0xc00fa000  0xc00fb000  0xc00fc000  0xc00fd000  0xc00fe000  0xc00ff000 
pagetable_init calling alloc_bootmem_pages()
__alloc_bootmem_core ret 0x0
