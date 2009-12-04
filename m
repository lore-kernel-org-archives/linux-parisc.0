From: Domenico Andreoli <cavokz@gmail.com>
Subject: my usual problem with 64bit kernel
Date: Fri, 4 Dec 2009 18:28:39 +0100
Message-ID: <20091204172838.GA4551@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hi,

  today i checked the support of 64bit on my j5600. latest kernel
that successfully (and still) run it was 2.6.22, latest one i tried
(and still fails) is a fresh 2.6.32.

i have not any specific knowlwdge of the beast, only a pile of manuals
that i will use to try to understand what's wrong.

only, if anybody has a hint to point me in the right direction i would
save a lot of time.  i attached the kernel boot log and the output of
ser pim firmware command.

best regards,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parisc64-kernel.log"

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).        
Command line for kernel: 'root=/dev/sda3 panic=60 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2                                                              
Selected ramdisk: /initrd.img from partition 2
ELF64 executable                              
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 6139904 mediaptr 0x1000
Segment 1 load 00714660 size 819360 mediaptr 0x5dc660
Loading ramdisk 8720546 bytes @ 3f79d000...          
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is  
a common symptom -- search the FAQ and mailing list at parisc-linux.org
                                                                       
[    0.000000] Linux version 2.6.32 (cavok@ska) (gcc version 4.3.4 (GCC) ) #1 SMP Fri Dec 4 17:33:58 CET 2009
[    0.000000] unwind_init: start = 0x405d8000, end = 0x4060b7c0, entries = 13180
[    0.000000] WARNING: Out of order unwind entry! 00000000405da120 and 00000000405da130
[    0.000000] WARNING: Out of order unwind entry! 00000000405da130 and 00000000405da140
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005d10 00000491 00000000 00000002 77b406fc 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000300
[    0.000000] CPUID vers 17 rev 10 (0x0000022a)
[    0.000000] capabilities 0x3
[    0.000000] model 9000/785/J5600
[    0.000000] Total Memory: 3840 MB
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
[    0.000000] PERCPU: Embedded 10 pages/cpu @0000000044338000 s9984 r8192 d22784 u65536
[    0.000000] pcpu-alloc: s9984 r8192 d22784 u65536 alloc=16*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 969600
[    0.000000] Kernel command line: root=/dev/sda3 panic=60 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Memory: 3856640k/3932160k available (4209k kernel code, 74972k reserved, 1735k data, 276k init)
[    0.000000] virtual kernel memory layout:
[    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.000000]     memory  : 0x0000000040000000 - 0x0000000130000000   (3840 MB)
[    0.000000]       .init : 0x0000000040798000 - 0x00000000407dd000   ( 276 kB)
[    0.000000]       .data : 0x000000004051c470 - 0x00000000406ce2a0   (1735 kB)
[    0.000000]       .text : 0x0000000040100000 - 0x000000004051c470   (4209 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.060000] Calibrating delay loop... 1101.00 BogoMIPS (lpj=5505024)
[    0.390000] Security Framework initialized
[    0.450000] Mount-cache hash table entries: 256
[    0.510000] Brought up 1 CPUs
[    0.550000] NET: Registered protocol family 16
[    0.610000] EISA bus registered
[    0.650000] Searching for devices...
[    0.960000] Found devices:
[    0.990000] 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
[    1.100000] 2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
[    1.210000] 3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
[    1.310000] 4. Elroy PCI Bridge at 0xfffffffffed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
[    1.420000] 5. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
[    1.530000] 6. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
[    1.630000] 7. Forte W+ 2w at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5d1, 0x00004 }
[    1.730000] 8. Forte W+ 2w at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5d1, 0x00004 }
[    1.830000] 9. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09e, 0x00009 }
[    2.040000] Releasing cpu 1 now, hpa=fffffffffffa2000

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parisc64-ser-pim.log"

Service Menu: Enter command > pim hpmc

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp = 
  Fri Dec  4 16:43:56 GMT 2009    (20:09:12:04:16:43:56)

HPMC Chassis Codes = 2cbf0  25008  2cbf4  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  0000000040795e40  00000000401170b4  0000000000000001
04-07   000000004076c640  0000000044349008  00000000406ef6b8  000000012f8a8140
08-11   0000000040675d1c  000000004062ddc0  0000000040675d68  00000000401210dc
12-15   0000000000000000  00000000406bb4b0  0000000000000001  00000000f0400004
16-19   000000004062e100  00000000407dbe80  00000000406bb4a8  0000000f32f63ff3
20-23   00000000000016f9  000000004062ddc0  0000000000000002  0000000000002710
24-27   00000000ffffffff  000000000800000e  0000000040648200  000000004076c640
28-31   0000000000004cd6  000000012f848e20  000000012f848af0  000000000000d7a0

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  000000000000003e
12-15   0000000000000000  0000000000000000  0000000000103000  c000000000000000
16-19   0000000f32ff3d89  0000000000000000  0000000040117158  00000000020008bc
20-23   0000000000000000  0000000000000000  000000ff0804f90f  0000000000000000
24-27   00000000006d1000  00000000006d1000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000012f848000  0000000011111111
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000004011715c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa0000
System Requestor Address     = 0xfffffffffffa2000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000001f00000000  0000001f00000000  0000001f00000000
04-07   0000000000000000  5555555555555555  5555555555555555  5555555555555555
08-11   5555555555555555  5555555555555555  5555555555555555  5555555555555555
12-15   5555555555555555  5555555555555555  5555555555555555  5555555555555555
16-19   5555555555555555  5555555555555555  5555555555555555  5555555555555555
20-23   5555555555555555  5555555555555555  0000000000000000  0000000000000000
24-27   0000000000005000  0000000000000000  5555555555555555  5555555555555555
28-31   5555555555555555  5555555555555555  5555555555555555  5555555555555555

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81841000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0300000000802004
CPU Status Register 0        = 0x3440c20000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4820000000000000
Read Short LOG               = 0xc18040fffee003fd
ERROR_STATUS                 = 0x0000000000000010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x0ce0107fd89705f0
RUN_DATA_LOW                 = 0x73d73e81d2f91bf0
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc13ff0f0f0039530
System Responder Path        = 0x00ffffffffffffff


HPMC PIM Analysis Information:

Timestamp = 
  Fri Dec  4 16:43:56 GMT 2009    (20:09:12:04:16:43:56)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

CPU 0 observed a Broadcast Error on the Runway Bus.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

<Press any key to continue (q to quit)> 

Memory Error Log Information:

Timestamp = 
  Fri Dec  4 16:43:56 GMT 2009    (20:09:12:04:16:43:56)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp = 
  Fri Dec  4 16:43:56 GMT 2009    (20:09:12:04:16:43:56)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    0x00000000   0x2e0cc009   0x00000000fed34048
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
Service Menu: Enter command >
 

--FCuugMFkClbJLl1L--
