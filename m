From: "Kai Holthaus" <kmh@sonic.net>
Subject: [parisc-linux] A500: 2.4.18 64bit SMP Kernel Crash
Date: Mon, 18 Apr 2005 19:19:05 -0700 (PDT)
Message-ID: <19310.64.142.78.25.1113877145.squirrel@webmail.sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

I recently got a 2-way A500, model 9000/800/A500-5X, and I installed
Debian Woody on it. The plain vanilla 2.4.17-64 kernel seems to work fine,
but I think it's somewhat of a waste to have two CPUs and not use both.

So, I installed the 2.4.18-hppa kernel sources, and built my own kernel.
However, the box wouldn't boot that kernel; instead it'd crash right after
the IPL part of PALO would try to load the kernel image.

- I used the gcc-hppa64-3.0.4ds9-3-hppa.deb gcc compiler, along with the
binutils-2.11.90.0.18-o.deb package off
ftp.parisc-linux.org/unofficial-debs to compile
- The kernel was compiled using Debian's kernel-package tools
- Palo's kernel command line is as follows:
  2/vmlinux root=/dev/sda4 HOME=/
  with vmlinux being a symlink to vmlinux-2.4.18.
- The System.map and .config are placed on my webserver at:
  http://www.holthausworld.us/System.map-2.4.18
  http://www.holthausworld.us/2.4.18.config

Console output is this:

Trying Primary Boot Path
------------------------
Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32     126   83 ext2
3           15460   17366   82 swap
4             127   15459   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 4719374 bytes @ 0x44000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
palo_ke'
Selected kernel: /vmlinux from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2075328 mediaptr 0x1000
Segment 1 load 002fc000 size 852864 mediaptr 0x1fc000
Segment 2 load 003d0000 size 458752 mediaptr 0x2cd000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


************* SYSTEM ALERT **************
SYSTEM NAME: uninitialized
DATE: 04/18/2005 TIME: 19:10:21
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         OFF       OFF        ON
LED State: Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006903 12130A15 - type 11 = Timestamp 04/18/2005
19:10:21
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:a
*****************************************



Console reset done.

Boot device reset done.

------------------------------------------------------

After a reset, ser pim shows this:

Main Menu: Enter command or menu > ser pim


PROCESSOR PIM INFORMATION

Original Product Number:   A5570B
Current Product Number:    A5570B


-----------------  Processor 0 HPMC Information - PDC Version: 43.50  ------

Timestamp =    Mon Apr  18 19:10:21 GMT 2005    (20:05:04:18:19:10:21)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006312  0xcb81000000000000
       0x0000087000ff6292  0x000000f0f0000000
       0x6000082070006062  0x0000000000100010
       0x7000082070006082  0x0000000000b92400
       0x7000082379006133  0xc1bff0fffed08040
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000
       0x0000082000ff6452  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       0x0000080080006300  0x0000000000000001
       0x7000082382006343  0x0000000000070200
       0x7000082483ff6353  0x00000000005a0200
       0x2000082483ff6353  0x000000ffff04ff83
       0x7000082382026343  0x0000000000070200
       0x7000082382046343  0x0000000000070200
       0x0000080089006200  0x0000000000000000
       0x0000080086006200  0x0000000000000000
       0x000008008000630f  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  000000000000d580  000000000000c2b0  0000000000450248
04-07  fffffffff8000000  0000000000000000  0000000000450300  0000000000000000
08-11  0000000000000001  0000000000000060  0000000000450248  0000000000000000
12-15  0000000000450300  0000000000000001  0000000000454808  00000000000000ff
16-19  0000000000000000  00000000f000024c  0000000010454700  fffffffff8000005
20-23  0000000000450300  0000000000000003  0000000000000190  0000000000000001
24-27  0000000000450300  0000000000450248  fffffffff8000000  000000000000d730
28-31  00000000103be6b0  0000000000454908  00000000004549e8  0000000000000020


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0  0000000000000004
12-15  0000000000000000  0000000000000000  0000000000105000  0000000000000000
16-19  00000010db47fee8  0000000000000000  000000000000c3dc  000000000e601027
20-23  00000000ae07ffe0  c000000000000005  0000000008000008  8000000000000000
24-27  0000000000353000  0000000000353000  ff7fffffffffffff  ff7fffffffffffff
28-31  ff7fffffffffffff  ff7fffffffffffff  0000000010434000  0000000010438000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000000000c3e0
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff8000005
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0010080000000000  0000000000000000  0000000000000000  0000000000000000
04-07  00000000103aa038  0000000000000001  0000000000000000  0000000017c86000
08-11  000000000800000f  00000000104e36a8  000000001040f1e0  0000000017cc26c0
12-15  0000000000004000  0000000000000000  000000001016b2c8  000000000804000e
16-19  00000000103aa038  0000000000000002  0000000000000002  000000001040f1e0
20-23  000000001040f1e0  0000000000000802  0000000000000000  0000000000000000
24-27  834e0b5f17c86000  0000000000000000  000000001040f1e0  000000001040f1e0
28-31  0000000000000802  00000000103dd2c0  0000000010157288  0000000000000002


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301000100002004
CPU Status Register 0        = 0x2440c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0x002000010301f900
Read Short LOG               = 0xc18040fff8000005



-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000



-----------------  Processor 1 HPMC Information - PDC Version: 43.50  ------

Timestamp =    Mon Apr  18 19:10:21 GMT 2005    (20:05:04:18:19:10:21)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011016322  0xc381800000000000
       0x0000082000ff6412  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  00000010db409f38  0000000000000000  00000000000000f7
04-07  000000000000174f  fffffff0f040a000  000000000000003e  00000000000000f7
08-11  0000000000000000  fffffff0f0400000  00000000000000f6  00000000000000fe
12-15  00000000000000f2  0000000000000001  00000000000000f0  00000000000000ff
16-19  000000f0f00000a4  fffffff0f040c000  0000000000000000  0000000000000000
20-23  0000000000000001  00000000000000fa  fffffff0f0400000  0000000000000000
24-27  00000000000000f9  0000000000000000  000018001001c400  000000f0f0167a30
28-31  0000000000000000  000000f0f040a938  000000f0f040a738  3031323334353637


Control Registers 0 - 31
00-03  000000007fffffff  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0007ffff0007ffff  1217ffff480fffff  0000000000000000  0000000000000017
12-15  0007ffff0007ffff  4407ffff08efffff  000000f0f0006800  0000000000000000
16-19  00000010db47f492  00000000ffffffff  00000000000006f8  00000000c402ff2d
20-23  000000009207c3c1  000000000280a8c0  000000ff0800fe08  0000000000000000
24-27  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
28-31  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff

Space Registers 0 - 7
00-03  ffffffff          ffffffff          ffffffff          ffffffff
04-07  ffffffff          ffffffff          ffffffff          ffffffff


IIA Space (back entry)       = 0x00000000ffffffff
IIA Offset (back entry)      = 0x00000000000006fc
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa2000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  fff60ff7e0fdf61f  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
04-07  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
08-11  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
12-15  ffffffffffffffff  fbfffcf87b1ef697  fffffffaffffffff  ffffffffffffffff
16-19  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffe88c4a82
20-23  ffffffff779ab695  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
24-27  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
28-31  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff


Check Summary                = 0xc381800000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301010180002000
CPU Status Register 0        = 0x3040000000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000000
Read Short LOG               = 0xc1bff0f0f0400000



-----------------  Processor 1 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Mon Apr  18 19:10:22 GMT 2005    (20:05:04:18:19:10:22)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X            X

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000100010
Runway Control Reg         = 0x0000021c00001418
Runway Address Reg         = 0xc1bff0fffed08040
Runway Data High Reg       = 0xe840c000083c025c
Runway Data Low Reg        = 0xe840c000083c025c
Memory Address Reg         = 0x000001ff3fffffff
Memory Address Corr Reg    = 0x000001ff3fffffff
Memory Syndrome Reg        = 0x0000000000000000
Memory Syndrome Corr Reg   = 0x0000000000000000



 Address/Control Parity Error Registers

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set



------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC FE  CW
-----------             -----                ------  ------  
----------------
System Bus Adapter RP  0x000000ffff04ff83   0x103c  0x1051              X
Local Bus Adapter  P   0x000000ffff04ff83   0x103c  0x1054              X
System Bus Adapter RP  0x000000ffff01ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff02ff83   0x103c  0x1051              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Apr  18 19:10:22 GMT 2005    (20:05:04:18:19:10:22)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff04ff83

Local Bus Adapter  --        PCI Interface
------------------------------------------

Timestamp =    Mon Apr  18 19:10:22 GMT 2005    (20:05:04:18:19:10:22)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
      X        ERR_TIMEOUT                       X

IO Requestor Address    = 0xfffffffffed30000
IO Target Address       = 0x00000000f8000004
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffff04ff83
IO Hardware Path        = 0x00ffffffffff0000

Module Error Register   = 0x000000000000001c

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Apr  18 19:10:22 GMT 2005    (20:05:04:18:19:10:22)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff01ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Apr  18 19:10:22 GMT 2005    (20:05:04:18:19:10:22)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff02ff83

--------------------------------------------------------------

Not being a developer, all these numbers don't mean anything to me. Does
anybody have an idea what the problem might be?

I experienced similar behavior just using the standard Debian
kernel-image-2.4.18-64-smp (although I didn't do the ser pim stuff yet -
might be better to attack one problem at a time, no?)

Thanks so much,

   Kai Holthaus
   kmh.AT.sonic.net


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
