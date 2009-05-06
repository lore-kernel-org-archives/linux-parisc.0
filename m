From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Random memory corruption with 64-bit SMP 2.6.30-rc4
Date: Wed, 6 May 2009 12:23:38 -0400
Message-ID: <20090506162337.GA22416@hiauly1.hia.nrc.ca>
References: <49FFEA3A.4080902@gmx.de> <20090506015136.A36034FAF@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090506015136.A36034FAF@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 05 May 2009, John David Anglin wrote:

> I guess I should test a UP kernel on the rp3440.

It doesn't boot.  hpmc info attached.  I have the sense that cutting the
number of processors down to two reduced the segv rate with the SMP build.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="rp3440-up.txt"

Log Entry 361: 06 May 2009 12:25:11
Alert Level 2: Informational
Keyword: MEM_MULTIPLE_ERRORS_DETECTED
The firmware memory test has detected multiple memory errors.
Logged by: System Firmware  0
Data: Implementation dependent data field
0x5680132900E01FC0 0000000000000080


Log Entry 360: 06 May 2009 12:25:10
Alert Level 2: Informational
Keyword: MEM_CORR_ERR
Correctable (single-bit) ECC error in DIMM
Logged by: System Firmware  0
Data: Location - Memory (SIMM or DIMM): DIMM Slot 0x1B, Extender 0
0x448000A700E01FA0 FFFFFFFF001BFF74

Log Entry 359: 06 May 2009 12:24:22
Alert Level 2: Informational
Keyword: IPMI Type-E0 Event
Logged by: Unknown 0
Data: Implementation dependent data field
0x56801A4A00E01F80 0000000000000002


Log Entry 358: 06 May 2009 12:23:54
Alert Level 2: Informational
Keyword: Type-02 c00301 12583681
Time set
Logged by: Baseboard Management Controller;
Sensor: SEL Time Set
Data1: State Asserted
0x204A01815A021F70 FFFF0103FDC00300

Log Entry 357: 06 May 2009 12:23:51
Alert Level 2: Informational
Keyword: Type-02 127002 1208322
Soft Reset
Logged by: Baseboard Management Controller;
Sensor: System Event
0x204A018157021F60 FFFF027000120300


Log Entry 356: 06 May 2009 12:22:44
Alert Level 2: Informational
Keyword: MC_BR_TO_OS_HPMC_FAILED
MC_BR_TO_OS_HPMC_FAILED
Logged by: System Firmware  0
Data: Implementation dependent data field
0x5680106400E01F40 FFFFFFF0F0435110

Log Entry 355: 06 May 2009 12:22:44
Alert Level 2: Informational
Keyword: MC_OS_HPMC_LEN_ERR
MC_OS_HPMC_LEN_ERR
Logged by: System Firmware  0
Data: Implementation dependent data field
0x5680100B00E01F20 0000000000000194


Log Entry 354: 06 May 2009 12:22:43
Alert Level 7: Fatal
Keyword: MC_HPMC_MONARCH_SELECTED
MC_HPMC_MONARCH_SELECTED
Logged by: System Firmware  0
Data: Implementation dependent data field
0xF680105E00E01F00 FFFFFFF0F0C00000

Log Entry 353: 06 May 2009 12:22:43
Alert Level 2: Informational
Keyword: ERR_CPU_CHECK_SUMMARY
CPU API CpuProcessMachineCheck return value report
Logged by: System Firmware  0
Data: Status return from PDC function call
0x57800F7300E01EE0 8040004000000000


Log Entry 352: 06 May 2009 12:22:43
Alert Level 7: Fatal
Keyword: ERR_CHECK_HPMC
An HPMC has been encountered.
Logged by: System Firmware  0
Data: Code address
0xE880035C00E01EC0 000000004011E768

Log Entry 351: 06 May 2009 12:19:30
Alert Level 2: Informational
Keyword: IPMI Type-E0 Event
Logged by: Unknown 0
Data: Implementation dependent data field
0x56801A4A00E01EA0 0000000000000002


Log Entry 350: 06 May 2009 12:19:02
Alert Level 2: Informational
Keyword: Type-02 c00301 12583681
Time set
Logged by: Baseboard Management Controller;
Sensor: SEL Time Set
Data1: State Asserted
0x204A018036021E90 FFFF0103FDC00300

Log Entry 349: 06 May 2009 12:19:00
Alert Level 2: Informational
Keyword: Type-02 127002 1208322
Soft Reset
Logged by: Baseboard Management Controller;
Sensor: System Event
0x204A018034021E80 FFFF027000120300


Log Entry 348: 06 May 2009 12:17:53
Alert Level 2: Informational
Keyword: MC_BR_TO_OS_HPMC_FAILED
MC_BR_TO_OS_HPMC_FAILED
Logged by: System Firmware  0
Data: Implementation dependent data field
0x5680106400E01E60 FFFFFFF0F0435110

Log Entry 347: 06 May 2009 12:17:53
Alert Level 2: Informational
Keyword: MC_OS_HPMC_LEN_ERR
MC_OS_HPMC_LEN_ERR
Logged by: System Firmware  0
Data: Implementation dependent data field
0x5680100B00E01E40 0000000000000194


Log Entry 346: 06 May 2009 12:17:53
Alert Level 7: Fatal
Keyword: MC_HPMC_MONARCH_SELECTED
MC_HPMC_MONARCH_SELECTED
Logged by: System Firmware  0
Data: Implementation dependent data field
0xF680105E00E01E20 FFFFFFF0F0C00000

Log Entry 345: 06 May 2009 12:17:53
Alert Level 2: Informational
Keyword: ERR_CPU_CHECK_SUMMARY
CPU API CpuProcessMachineCheck return value report
Logged by: System Firmware  0
Data: Status return from PDC function call
0x57800F7300E01E00 8040004000000000


Log Entry 344: 06 May 2009 12:17:52
Alert Level 7: Fatal
Keyword: ERR_CHECK_HPMC
An HPMC has been encountered.
Logged by: System Firmware  0
Data: Code address
0xE880035C00E01DE0 000000004011E768

Log Entry 343: 06 May 2009 12:09:40
Alert Level 2: Informational
Keyword: IPMI Type-E0 Event
Logged by: Unknown 0
Data: Implementation dependent data field
0x56801A4A00E01DC0 0000000000000002


Log Entry 342: 06 May 2009 12:09:12
Alert Level 2: Informational
Keyword: Type-02 c00301 12583681
Time set
Logged by: Baseboard Management Controller;
Sensor: SEL Time Set
Data1: State Asserted
0x204A017DE8021DB0 FFFF0103FDC00300

Log Entry 341: 06 May 2009 12:09:08
Alert Level 2: Informational
Keyword: Type-02 127002 1208322
Soft Reset
Logged by: Baseboard Management Controller;
Sensor: System Event
0x204A017DE4021DA0 FFFF027000120300


Log Entry 340: 06 May 2009 12:05:41
Alert Level 2: Informational
Keyword: IPMI Type-E0 Event
Logged by: Unknown 0
Data: Implementation dependent data field
0x56801A4A00E01D80 0000000000000002

Log Entry 339: 06 May 2009 12:05:27
Alert Level 2: Informational
Keyword: Type-02 c00301 12583681
Time set
Logged by: Baseboard Management Controller;
Sensor: SEL Time Set
Data1: State Asserted
0x204A017D07021D70 FFFF0103FDC00300


Log Entry 338: 06 May 2009 12:05:26
Alert Level 2: Informational
Keyword: Type-02 127002 1208322
Soft Reset
Logged by: Baseboard Management Controller;
Sensor: System Event
0x204A017D06021D60 FFFF027000120300

PROCESSOR PIM INFORMATION

Original Product Number:  A7136A
Current Product Number:   A7136A


-----------------  Processor 0 HPMC Information - PDC Version: 45.11  ------

Timestamp =   Wed May  6 12:22:43 GMT 2009    (20:09:05:06:12:22:43)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0xe800035c00e00000 0x000000004011e768
       0x57000f7300e00000 0x8040004000000000
       0xf600105e00e00000 0xfffffff0f0c00000
       0x140003b200e00000 0x000000000000000b
       0x5600100b00e00000 0x0000000000000194
       0x5600106400e00000 0xfffffff0f0435110

General Registers 0 - 31
00-03  0000000000000000  0000000040117044  00000000401171b0  000000007fbb8830
04-07  00000000405614e0  00000000401da9c8  000000000800000f  0000000000000400
08-11  000000007f2fcb48  000000007fbb8800  0000000000000001  0000000000000400
12-15  0000000000000fff  00000000000fff7f  0000000000000000  00000000fb2a7038
16-19  000000007fbb8830  00000000000883b9  0000000000000000  0000000000000038
20-23  00000000401171a4  0000000008000008  0000000000000000  000000000000001c
24-27  0000000000000000  000000000e6010dc  0000000000000000  00000000405614e0
28-31  000000000c001100  000000007fbb8e90  000000007fbb90e0  0000000000000000

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000006  0000000000000000  00000000000000c0  000000000000003d
12-15  0000000000000000  0000000000000000  0000000000103000  ffc0000000000000
16-19  00000029abefa7d0  0000000000000000  000000004011e768  000000000ea050d6
20-23  00000000a634400f  00000000c0000008  000000000804000f  0000000000000000
24-27  00000000004c6000  000000003ecae000  ffffffffffffffff  00000000400017e0
28-31  00000000400017e0  ffffffffffffffff  000000007fbb8000  0000000040554000

Space Registers 0 - 7
00-03  0000000000001800  0000000000000000  0000000000000000  0000000000001800
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000004011e76c
Check Type                   = 0x20000000
Cpu State                    = 0x9e000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00001800
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  00000000405614e0  00000000405969b8  000000000800000f  0000000000000000
08-11  00000000401cad28  000000007f4242e0  000000007f41fcb0  000000007f4243d0
12-15  0000000000000002  000000007f41fcb8  000000007f41fca8  00000000405614e0
16-19  0000000000000002  000000007f40c580  000000007d722e48  000000007f0082f8
20-23  00000000405614e0  000000007f406c78  0000000000000103  0000000000000000
24-27  0000000000000000  000000000080bfc6  0000000000000000  0000000000000802
28-31  00000000405614e0  ffffffffffffff9c  0000000040445520  00000000401bcb98

PIM Revision                 = 0x0000000000000001
CPU ID                       = 0x0000000000000014
CPU Revision                 = 0x0000000000000031
Cpu Serial Number            = 0x46100b89e43f0503
Check Summary                = 0x8040004000000000
SAL Timestamp                = 0x000000004a018113
System Firmware Rev.         = 0x00000b4b0000119f
PDC Relocation Address       = 0xfffffff0f0c00000
Available Memory             = 0x000000027fe00000
CPU Diagnose Register 2      = 0x3112022000002008
MIB_STAT                     = 0x0040000000200000
MIB_LOG1                     = 0x0000000000555500
MIB_LOG2                     = 0x0000800000000000
MIB_ECC_DATA                 = 0x808800007fffbfd8
ICache Info                  = 0x0000000000000000
DCache Info                  = 0x0000000000000000
Sharedcache Info1            = 0x0000000000000000
Sharedcache Info2            = 0x0000000000000040
MIB_RSLOG1                   = 0x0000100000000004
MIB_RSLOG2                   = 0x0020010000000000
MIB_RQLOG                    = 0x021001f8011f1530
MIB_REQLOGa                  = 0x8000080000000300
MIB_REQLOGb                  = 0x01000aa400000000
Reserved                     = 0x0000000000000000
Cache Repair Detail          = 0x0000000000000000

000000004011dc80 <handle_unaligned>:
    4011dc80:   0f c2 12 c1     std rp,-10(sp)
    ...
000000004011e734 <L3^B18>:
    4011e734:   e8 1f 11 65     b,l 4011dfec <L3^B2+0x20>,r0
    4011e738:   db 85 0f e0     extrd,s ret0,63,32,r5
    4011e73c:   9f fc 20 10     cmpb,*= ret0,r31,4011e74c <L3^B18+0x18>
    4011e740:   36 7c 22 00     ldo 1100(r19),ret0
    4011e744:   bf fc 31 45     cmpb,*<> ret0,r31,4011dfec <L3^B2+0x20>
    4011e748:   34 05 3f ff     ldi -1,r5
    4011e74c:   34 16 00 00     ldi 0,r22
    4011e750:   50 75 05 40     ldd 2a0(r3),r21
    4011e754:   50 7f 05 30     ldd 298(r3),r31
    4011e758:   db 37 0b fb     extrd,u r25,63,5,r23
    4011e75c:   f2 75 00 7d     depd,z r21,60,3,r19
    4011e760:   00 1f 58 20     mtsp r31,sr1
    4011e764:   f2 a0 04 1d     depd r0,63,3,r21
    4011e768:   0e a0 50 d6     ldd 0(sr1,r21),r22
    4011e76c:   0e b0 50 d4     ldd 8(sr1,r21),r20
    4011e770:   96 73 00 80     subi 40,r19,r19
    4011e774:   01 73 18 40     mtsar r19
    4011e778:   d2 96 02 16     shrpd r22,r20,sar,r22
    4011e77c:   08 00 02 5c     copy r0,ret0

Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008

Partition Start(MB) End(MB) Id Type
1               1     101   f0 Palo
2             102    1082   82 swap
3            1083   34726   83 ext2

PALO(F0) partition contains:
PALO is formatted EXT2/3
Command line for kernel: 'root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux'
Selected kernel: /vmlinux from partition 1
Selected ramdisk: /initrd.img from partition 1
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 3997696 mediaptr 0x1000
Segment 1 load 0051c000 size 508416 mediaptr 0x3d1000
Loading ramdisk 6052334 bytes @ 3fa29000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.30-rc4 (root@mx3210) (gcc version 4.3.3 (GCC) ) #2 Wed May 6 07:58:24 EDT 2009
unwind_init: start = 0x40410004, end = 0x40434f64, entries = 9462
WARNING: Out of order unwind entry! 0000000040411a24 and 0000000040411a34
WARNING: Out of order unwind entry! 0000000040411a34 and 0000000040411a44
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000000100000000 End 0x000000027fdfffff Size   6142 MB
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 10238 MB
initrd: 7fa29000-7ffee9ee
initrd: reserving 3fa29000-3ffee9ee (mem_max 27fe00000)
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2585095
Kernel command line: root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux
NR_IRQS:128
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
		    | spin |wlock |rlock |mutex | wsem | rsem |

  --------------------------------------------------------------------------
	      A-A deadlock:failed|failed|  ok  |failed|failed|failed|
	  A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
      A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
      A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
	 A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
	 A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
	 A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
	            double unlock:failed|failed|failed|  ok  |failed|failed|
		  initialize held:failed|failed|failed|failed|failed|failed|
		 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
	      recursive read-lock:             |  ok  |             |failed|
	   recursive read-lock #2:             |  ok  |             |failed|
	    mixed read-write-lock:             |failed|             |failed|
	    mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
144 out of 218 testcases failed, as expected. |
----------------------------------------------------
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Memory: 10282876k/10483712k available (2531k kernel code, 199328k reserved, 1324k data, 164k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x0000000040570000 - 0x0000000040599000   ( 164 kB)
      .data : 0x0000000040378d20 - 0x00000000404c4000   (1324 kB)
      .text : 0x0000000040100000 - 0x0000000040378d20   (2531 kB)
Calibrating delay loop... 1597.44 BogoMIPS (lpj=3194880)
Mount-cache hash table entries: 256
net_namespace: 1304 bytes
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 129 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 152 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 153 failed with error 1
CPU(s): 1 x PA8800 (Mako) at 800.007300 MHz
Setting cache flush threshold to 14e6240 (1 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.0: PME# disabled
pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.1: PME# disabled
pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.2: PME# disabled
Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
pci 0000:20:02.0: PME# supported from D3hot D3cold
pci 0000:20:02.0: PME# disabled
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
NET: Registered protocol family 2
IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
NET: Registered protocol family 1
checking if image is initramfs...
rootfs image is initramfs; unpacking...
Freeing initrd memory: 5910k freed
Performance monitoring counters enabled for Storm Peak Slow
Initializing RT-Tester: OK
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 20098
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Linux agpgart interface v0.103
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 72) is a 16550A
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 72) is a 16550A
console handover: boot [ttyB0] -> real [ttyS1]
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 72) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 72) is a 16550A
brd: module loaded
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
mice: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
TCP cubic registered
rtc-generic rtc-generic: setting system clock to 2009-05-06 12:22:08 UTC (1241612528)
Freeing unused kernel memory: 164k freed
Loading, please wait...
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... SCSI subsystem initialized
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 69
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
scsi 0:0:0:0: Direct-Access     HP 36.4G ST336753LC       HPC3 PQ: 0 ANSI: 3
 target0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
 target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
 target0:0:0: Ending Domain Validation
tg3.c:v3.98 (February 25, 2009)
tg3 0000:20:02.0: PME# disabled
eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1])
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 70
sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
scsi 1:0:2:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0 ANSI: 2
 target1:0:2: tagged command queuing enabled, command queue depth 16.
 target1:0:2: Beginning Domain Validation
 target1:0:2: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
 target1:0:2: Ending Domain Validation
Driver 'sd' needs updating - please use bus_type methods
sd 0:0:0:0: [sda] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 1:0:2:0: [sdb] Write Protect is off
sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 1:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sda:<6> sdb: sda1 sda2 sda3
sd 0:0:0:0: [sda] Attached SCSI disk
 unknown partition table
sd 1:0:2:0: [sdb] Attached SCSI disk
done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.



Firmware Version  45.11

Duplex Console IO Dependent Code (IODC) revision 1


--X1bOJ3K7DJ5YkBrT--
