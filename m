Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id B31C24842
	for <parisc-linux@parisc-linux.org>; Fri, 28 Feb 2003 10:19:14 -0700 (MST)
Date: Fri, 28 Feb 2003 18:19:02 +0100
Message-ID: <3E5F80120000003F@ocpmta8.freegates.net>
In-Reply-To: <3E5A232800001242@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>Hi all,
>
>
>I test it on gcc-3.2 64bits and I obtain a a kernel (I will try to boot
it
>latter).
>

And as announce it failled to boot :( 

Here is the boot log:

Firmware Version  41.28

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst  
 Data
  ---------  --------   ---------------------  -----------------  ------------
      1      550  MHz   Active                 Functional         512 KB
  1 MB
      3      550  MHz   Idle                   Functional         512 KB
  1 MB

  Central Bus Speed (in MHz)  :        133  
  Available Memory            :    4194304  KB
  Good Memory Required        :      15364  KB

   Primary boot path:    0/0/2/1.6           
   Alternate boot path:  0/0/2/1.6           
   Console path:         0/0/4/1.0           
   Keyboard path:        0/0/4/0.0           


---- Main Menu ---------------------------------------------------------------

----
Main Menu: Enter command or menu > bo extscsi.8
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.2 root@b2000 Tue Jan 14 13:13:07 MST 2003
Information: Boot device can't seek past 2Gb (ignore next error).byteio_read:
seekread() returned -1 expected 2048

Partition Start(MB) End(MB) Id Type
1               1      63   f0 Palo
2              64     188   83 ext2
3             189     313   82 swap
5             314    2000   83 ext2
6            2001    2250   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3687647 bytes @ 0x44000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current
command line:
2/vmlinux root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux
 1: root=/dev/sda5
 2: HOME=/
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? 0
2/vmlinux-2.4.20-pa27-smp64
Current command line:
2/vmlinux-2.4.20-pa27-smp64 root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux-2.4.20-pa27-smp64
 1: root=/dev/sda5
 2: HOME=/
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=2/vmlinux-2.4.20-pa27-smp64'
Selected kernel: /vmlinux-2.4.20-pa27-smp64 from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 2907552 mediaptr 0x1000
Segment 1 load 003c6000 size 1407360 mediaptr 0x2c7000
Segment 2 load 00520000 size 344064 mediaptr 0x41f000
Segment 3 load 00578000 size 32768 mediaptr 0x473000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       OFF           OFF       ON         ON
LED State: System running normally.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-1: rev 0x37 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c895-2: rev 0x1 on pci bus 0 device 1 function 0 irq 129
sym53c895-2: ID 7, Fast-20, Parity Checking
sym53c895-2: SCSI bus mode change from 80 to 80.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
blk: queue 000000008fa50e40, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 000000008fa50c40, I/O limit 4095Mb (mask 0xffffffff)
Attached scsi disk sda at scsi2, channel 0, id 8, lun 0
sym53c895-2-<8,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 sda11 >
STI GSC/PCI graphics driver version 0.9
BUG: Skipping previously registered driver: sti (native)
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2504.400 MB/sec
   8regs_prefetch:  1856.000 MB/sec
   32regs    :  2067.600 MB/sec
   32regs_prefetch:  1946.000 MB/sec
raid5: using function: 8regs (2504.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 80Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 318k freed
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       OFF           OFF       ON         ON
LED State: System running normally.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

************* SYSTEM ALERT **************
SYSTEM NAME: ap8002
DATE: 02/28/2003 TIME: 15:19:37
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

0x0000107000FF6292 000000FF FF800000 - type  0 = Data Field Unused
0x5800187000FF6292 00006701 1C0F1325 - type 11 = Timestamp 02/28/2003 15:19:37
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice: 
*****************************************

...

and the pim info


Service Menu: Enter command > pim


PROCESSOR PIM INFORMATION

Original Product Number:  A3639C
Current Product Number:   A3639C


-------  Processor 1 HPMC Information - PDC Version: 41.28   ------ 

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011016312  0xcb81000000000000
       0x0000087000ff6292  0x000000ffff800000
       0x6000082013016062  0x2002000000080000
       0x6000082013016072  0x0000000000080000
       0x7000082013016082  0x0000000000192200
       0x6000082013036062  0x2001000000082004
       0x6000082013036072  0x0000000000082000
       0x7000082013036082  0x0000000000992600
       0x6000082070006062  0x0000000000080000
       0x6000082070006072  0x0000000000080000
       0x7000082070006082  0x0000000000192200
       0x6000082070016062  0x0000000000000800
       0x6000082070016072  0x0000000000000800
       0x7000082070016082  0x00000000001a4400
       0x0000080080006310  0x0000000000000001
       0x7000082082006333  0x0000000000b92200
       0x7000082082016333  0x0000000000b92200
       0x000008008000631f  0x0000000000000000
       0x0000082000ff6452  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       0x0000080080006300  0x0000000000000001
       0x7000082082006333  0x0000000000b92200
       0x7000082382006343  0x0000000000070200
       0x7000082382016343  0x0000000000070200
       0x7000082382026343  0x0000000000070200
       0x7000082382046343  0x0000000000070200
       0x7000082382056343  0x0000000000070200
       0x7000082382086343  0x0000000000070200
       0x70000823820a6343  0x0000000000070200
       0x70000823820c6343  0x0000000000070200
       0x7000082082016333  0x0000000000b92200
       0x7000082382106343  0x0000000000070200
       0x7000082382126343  0x0000000000070200
       0x7000082382146343  0x0000000000070200
       0x7000082382186343  0x0000000000070200
       0x70000823821a6343  0x0000000000070200
       0x70000823821c6343  0x0000000000070200
       0x0000080089006200  0x0000000000000000
       0x0000082389006200  0x0000000000000000
       0x0000080086006200  0x0000000000000000
       0x000008008000630f  0x0000000000000000
       

General Registers 0 - 31
00-03  0000000000000000  0000000010516300  000000001014d6ec  0000000010507b00
04-07  000000008f0c8000  0000000010431788  000000008f093000  0000000010000000
08-11  000000001349c2b0  000000001349d4e8  000000007f093b25  0000000010565d00
12-15  00000000faf00b2c  0000000010565d60  000000008f677ec0  000000008f675800
16-19  000000001349d4e8  0000000000005000  00000000faf005e0  0000000000000180
20-23  0000000010565d00  00000000002f7465  00000000003f45a2  000fe18fffc079c0
24-27  000000007f0c8b27  000fe18fffc079c0  0000000000575898  0000000010507b00
28-31  000000000007f0c8  003f86400007f0c8  000000008f67cf40  0000000000008ba3


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000006  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000107000  ffe0000000000000
16-19  0000001dcdcb88a5  0000000000000000  000000001014d718  0000000005804200
20-23  0000000000000180  00000000faf00b2c  000000ff0804cf0f  c000000000000000
24-27  0000000000435000  000000007f680000  0000000000041020  5555555555555555
28-31  000000ffff95c810  5555555555555555  000000008f67c000  0000000010578000

Space Registers 0 - 7
00-03  00000180          00000180          00000000          00000180
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000001014d71c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0010c03b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0xfffffffffed25000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000000008f777ec0  0000000010507b00  0000000000000002  00000000104ab298
08-11  0000000010507b00  0000000000000802  00000000104cc768  000000008fab0000
12-15  0000000000000000  0000000000000000  000000001016db38  00000000103b1d10
16-19  00000000000009c8  000000008fa5e000  000000000800000f  00000000104ab2a0
20-23  000000008f777ec0  0000000010507b00  00000000003f45a2  000000000000ba2e
24-27  0000000400000000  000099997fab0b70  000000007fab0b78  000000000bebc200
28-31  0000000000000001  00000000ff915e20  000000001016880c  0000000010507b00


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301010800802004
CPU Status Register 0        = 0x2640c24000000000
CPU Status Register 1        = 0x8000200000000000
SADD LOG                     = 0xf8f0bd000040b800
Read Short LOG               = 0xc18200ff80000002



-----------------  DEW 1 HPMC Information -  ------ 

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

Runway Control Log Reg            = 0x00927b0000000000
Runway Address Data Log Reg Odd   = 0xc0aa1010c4a61010
Runway Address Data Log Reg Even  = 0xc8a61010cca61010
Runway Address Log Reg            = 0x00000000000000f4
Runway Broad Error Log Reg        = 0x000000000000005c

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
                ERR_ERROR       X                X       

Merced Bus Requestor Address      = 0x0000000000000000
Merced Bus Target Address         = 0x0000000000000000
Merced Bus Responder Address      = 0x0000000000000000
Merced Error Status Reg           = 0x2002000000080000
Merced Error Overflow Reg         = 0x0000000000080000
Merced AERR Addr1 Log Reg         = 0x00006000ff86fdc0
Merced AERR Addr2 Log Reg         = 0x00008000078fff08
Merced DERR  Log Reg              = 0x0001000000000000
Merced Error Syndrome Reg         = 0x00000000000000c0


-------  Processor 1  LPMC Information ------------------

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



-------  Processor 1  TOC Information -------------------

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



-------  Processor 3 HPMC Information - PDC Version: 41.28   ------ 

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011036322  0xcb81800000000000
       0x0000082000ff6452  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       

General Registers 0 - 31
00-03  0000000000000000  0000000010516b00  0000000010115eec  00000000103fd0f8
04-07  000000000800000f  0000000000000002  0000000000000000  0000000010507b00
08-11  00000000103fd0f8  00000000103fd0f8  00000000103903c0  000000001038eec0
12-15  0000000000000001  0000000000000001  000000008fabdec8  00000000000dec68
16-19  0000000000000000  0000000000000000  00000000faf005e0  0000000000000001
20-23  0000000000005c10  0000000010431078  0000000010507b00  0000000000000001
24-27  0000000000000116  00000000103903c0  00000000103fd130  0000000010507b00
28-31  0000000000000800  000000008f0e0fb0  000000008f0e0fc0  0000000000008ba3


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  000000000000001e  0000000000000000  00000000000000c0  000000000000002f
12-15  0000000000000000  0000000000000000  0000000000107000  ffe0000000000000
16-19  0000001dcda30375  0000000000000000  0000000010115ff8  000000000ea010d3
20-23  0000000000000000  0000000000000000  000000000804030f  0000000000000000
24-27  0000000000435000  000000007f064000  0000000000041020  5555555555555555
28-31  000000ffff95c810  5555555555555555  000000008f0e0000  0000000000008020

Space Registers 0 - 7
00-03  00000780          00000780          00000000          00000780
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000010115ffc
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffed2d000
System Requestor Address     = 0x000000fffed2c000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000000008f777ec0  0000000010507b00  0000000000000002  00000000104ab298
08-11  0000000010507b00  0000000000000802  00000000104cc768  000000008fab0000
12-15  0000000000000000  0000000000000000  000000001016db38  00000000103b1d10
16-19  00000000000009c8  000000008fa5e000  000000000800000f  00000000104ab2a0
20-23  000000008f777ec0  0000000010507b00  00000000003f45a2  000000000000ba2e
24-27  0000999900000000  000099997fab0b70  000000007fab0b78  000000000bebc200
28-31  0000000000000001  00000000ff915e20  000000001016880c  0000000010507b00


Check Summary                = 0xcb81800000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301030800802004
CPU Status Register 0        = 0x3640c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x48e0000000000002
Read Short LOG               = 0xc18080ff80080014



-----------------  DEW 3 HPMC Information -  ------ 

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

Runway Control Log Reg            = 0x0006720000000000
Runway Address Data Log Reg Odd   = 0xfffffffffffc3f00
Runway Address Data Log Reg Even  = 0xfffffffffffc3f00
Runway Address Log Reg            = 0x0000000000000048
Runway Broad Error Log Reg        = 0x00000000000000dc

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X             ERR_ERROR       X            X   X       

Merced Bus Requestor Address      = 0x0000000000000000
Merced Bus Target Address         = 0x0000000000000000
Merced Bus Responder Address      = 0x0000000000000000
Merced Error Status Reg           = 0x2001000000082004
Merced Error Overflow Reg         = 0x0000000000082000
Merced AERR Addr1 Log Reg         = 0x00c0000000300000
Merced AERR Addr2 Log Reg         = 0x0000000000f00000
Merced DERR  Log Reg              = 0x0001000000000000
Merced Error Syndrome Reg         = 0x0000000000260000


-------  Processor 3  LPMC Information ------------------

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



-------  Processor 3  TOC Information -------------------

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

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
                ERR_ERROR       X                X       

Bus Requestor Address      = 0x0000000000000000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0x0000000000000000

Error Status Reg           = 0x0000000000080000
Error Overflow Reg         = 0x0000000000080000
AERR Address 1 Log Reg     = 0x0000000000000000
AERR Address 2 Log Reg     = 0xf800000000000000
FERR  Log Reg              = 0x0000000000000000
DERR  Log Reg              = 0x000112000a96c580
Error Syndrome Reg         = 0x0000000000000000



 Address/Control Parity Error Registers  

   Address/Control Parity Error Bit (AE) Not Set 



Bus 1 Log Information

Timestamp =    Fri Feb  28 15:19:35 GMT 2003    (20:03:02:28:15:19:35)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_TIMEOUT   X               X           

Bus Requestor Address      = 0xfffffffffed2c000
Bus Target Address         = 0x00000000f000a000
Bus Responder Address      = 0x0000000000000000

Error Status Reg           = 0x0000000000000800
Error Overflow Reg         = 0x0000000000000800
AERR Address 1 Log Reg     = 0x08006000f000a000
AERR Address 2 Log Reg     = 0x6000b0002f700a10
FERR  Log Reg              = 0x0000000000000000
DERR  Log Reg              = 0x0000000000000000
Error Syndrome Reg         = 0x0000000000000000



 Address/Control Parity Error Registers  

   Address/Control Parity Error Bit (AE) Not Set 



------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC FE
 CW
-----------             -----                ------  ------   ----------------
System Bus Adapter SB  0x000000ffffffff82   0x103c  0x1050              X
System Bus Adapter RP  0x000000ffff0dff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff0eff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff06ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff02ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff01ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff04ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff05ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000101ffff03ff83   0x103c  0x1051              X
System Bus Adapter SB  0x000000ffffffff82   0x103c  0x1050              X
System Bus Adapter RP  0x000202ffff0cff83   0x103c  0x1051              X
System Bus Adapter RP  0x000202ffff0aff83   0x103c  0x1051              X
System Bus Adapter RP  0x000202ffff09ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000202ffff0bff83   0x103c  0x1051              X
System Bus Adapter RP  0x000202ffff08ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000202ffff07ff83   0x103c  0x1051              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:37 GMT 2003    (20:03:02:28:15:21:37)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed00000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000007ff0034

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff0dff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff0eff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff06ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff02ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff01ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff04ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff05ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:39 GMT 2003    (20:03:02:28:15:21:39)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000101ffff03ff83

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:40 GMT 2003    (20:03:02:28:15:21:40)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed40000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000007ff0034

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff0cff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff0aff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff09ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff0bff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff08ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  28 15:21:42 GMT 2003    (20:03:02:28:15:21:42)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000202ffff07ff83


What and how should I submit to dump_analyser.sh (if relevant for a 64bits
kernel?)

Thanks in advance,
    Joel






---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
