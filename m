Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90827485F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Jun 2003 01:16:50 -0600 (MDT)
Date: Tue, 24 Jun 2003 09:16:47 +0200
Message-ID: <3ED71F6D000089E5@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video card]
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Joel Soete" <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi Grant,

> Joel,
> Could you post a URL or make the eqnx-4.05 linux driver available?
> didn't see it here:
> ftp://guest:guest@www.equinox.com/library/legacy%20drivers/sst/
>
> Last one I found was the 4.01 from last year...
>
Yes I now, they change the way to proceed the download and I also spend a
certain time to find it:
- on the main page (http://www.equinox.com/) you have a "Download Drivers"
pointing to <http://www.equinox.com/Download_Drivers129.html>
- ont he middle of this page "Enter Downloadable Files Database" <http://www.equinox.com/Driver_Search152.cfm>
- at the bottom of this one "SST driver for Linux" driving you to <http://www.equinox.com/Driver_Search_Results153.cfm?uid=309>
- here you are at the top: 
<http://www.equinox.com/DownloadFile.cfm?File=eqnx-4.05.tar.Z>

[Just show you the way because I am not sure that they are fixed references
:)]

btw, I also have a look into aty module and if I well fond pci_enable_device()
in module aty128fb (which load and unload well but useless for my card),
otc I do not find it into atifb. So I will also look this way for this driver.

Finaly here is the toc, dump and corresponding 'analyses'

===== ATYFB ====
===  Dump  ===

Stack Dump:
 1631ca80:  0004ff0e 1
327120 00000001 16a37840
 1631ca70:  163e1ac0 10125d70 1631c7e8 17c73280
 1631ca60:  17cc08e0 16a37840 17c732ec 00000001
 1631ca50:  1631c8d8 16500900 0000001b 00000000
 1631ca40:  ffffffff 103a6b00 00000000 103a6810
 1631ca30:  103a6810 103a6810 
000000f 4017e33c

Kernel addresses on the stack:
 [<10125d70>]  [<10122458>]  [<10122308>]  [<10122050>]
 [<10174650>]  [<10109078>]  [<102b6aa0>]  [<1016d268>]
 [<101684f4>]  [<10132cf0>]  [<1013f7b4>]  [<1013e2e4>]
 [<1014e9c0>]  [<101364c4>]  [<101684f4>]  [<101364c4>]
 [<10133004>]  [<1012006c>]  [<101684f4>]  [<1013ed34>]
 [<10147e2c>]  [<10109f90>]  [<10109084>]  [<10109d4c>]
 [<1013f7b4>]  [<1013e2e4>]  [<1014e9c0>]  [<10121318>]


Kernel Fault: Code=26 regs=1631ca80 (Addr=00000010


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 103a7810 10125d70 103a8010
r04-07  103a8010 103a6810 1631ca08 103a6810
r08-11  103a7810 4017e33c bff016e0 00043230
r12-15  0002d000 103a78
0 103a7010 000e0d08
r16-19  1631c6c0 00000000 00028d90 00000010
r20-23  105b6de0 16a37840 16a37850 00000000
r24-27  00000000 103a7010 00000000 102f2010
r28-31  00001000 00000000 1631ca80 10122458
sr0-3   00000000 000002a4 00000000 000002a4
sr4-7 
 00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10125ee0 10125ee4
 IIR: 0e741280    ISR: 00000000  IOR: 00000010
 CPU:        0   CR30: 1631c000 CR31: 10390000
 ORIG_R28: 102bb0a0
.

===  Analyse  ===
IAOQ = 10125ee0
Func:
timer_bh, Off: 1cc, Addr: 0x10125ee0
10125ee0:	0e 74 12 80 	stw r20,0(sr0,r19)
10125ee4:	0e 93 12 88 	stw r19,4(sr0,r20)
10125ee8:	0e a0 12 80 	stw r0,0(sr0,r21)
10125eec:	0e a0 12 88 	stw r0,4(sr0,r21)

GR0 = 00000000

GR1 = 103a7810
Func: tv
, Off: 1a8, Addr: 0x103a7810

GR2 = 10125d70
Func: timer_bh, Off: 5c, Addr: 0x10125d70
10125d70:	00 01 0d 60 	ssm 1,r0
10125d74:	2b 68 30 00 	addil 11800,dp,%r1
10125d78:	48 33 03 88 	ldw 1c4(r1),r19
10125d7c:	08 73 04 13 	sub r19,r3,r19

GR3 
 103a8010
Func: tv1, Off: 7a4, Addr: 0x103a8010

GR4 = 103a8010
Func: tv1, Off: 7a4, Addr: 0x103a8010

GR5 = 103a6810
Func: log_buf, Off: 3e68, Addr: 0x103a6810

GR6 = 1631ca08

GR7 = 103a6810
Func: log_buf, Off: 3e68, Addr: 0x103a6810

G
8 = 103a7810
Func: tv2, Off: 1a8, Addr: 0x103a7810

GR9 = 4017e33c

GR10 = bff016e0

GR11 = 00043230

GR12 = 0002d000

GR13 = 103a7870
Func: tv1, Off: 4, Addr: 0x103a7870

GR14 = 103a7010
Func: event, Off: 0, Addr: 0x103a7010

GR15 = 0
0e0d08

GR16 = 1631c6c0

GR17 = 00000000

GR18 = 00028d90

GR19 = 00000010

GR20 = 105b6de0

GR21 = 16a37840

GR22 = 16a37850

GR23 = 00000000

GR24 = 00000000

GR25 = 103a7010
Func: event, Off: 0, Addr: 0x103a7010

GR26 = 000000
0

GR27 = 102f2010
Func: $global$, Off: 0, Addr: 0x102f2010

GR28 = 00001000

GR29 = 00000000

GR30 = 1631ca80

GR31 = 10122458
Func: bh_action, Off: 40, Addr: 0x10122458
1012243c:	8e 60 20 18 	cmpib,<> 0,r19,10122450 <bh_action+0x38>
101
2450:	e6 c0 20 00 	be,l 0(sr4,r22),%sr0,%r31
10122454:	08 1f 02 42 	copy r31,rp
10122458:	e8 1f 1f d5 	b,l 10122448 <bh_action+0x30>,r0
1012245c:	4b c2 3f 59 	ldw -54(sp),rp

Kernel symbols on the stack:
[<10125d70>]: Func: timer_bh, Off: 5c, Add
: 0x10125d70
[<10122458>]: Func: bh_action, Off: 40, Addr: 0x10122458
[<10122308>]: Func: tasklet_hi_action, Off: 7c, Addr: 0x10122308
[<10122050>]: Func: do_softirq, Off: ec, Addr: 0x10122050
[<10174650>]: Func: journal_dirty_metadata, Off: 12c, A
dr: 0x10174650
[<10109078>]: Func: intr_check_resched, Off: 0, Addr: 0x10109078
[<102b6aa0>]: Func: number, Off: 3c0, Addr: 0x102b6aa0
[<1016d268>]: Func: ext3_do_update_inode, Off: 238, Addr: 0x1016d268
[<101684f4>]: Func: ext3_file_write, Off: 20
 Addr: 0x101684f4
[<10132cf0>]: Func: generic_file_write, Off: 1cc, Addr: 0x10132cf0
[<1013f7b4>]: Func: chrdev_open, Off: 64, Addr: 0x1013f7b4
[<1013e2e4>]: Func: dentry_open, Off: f4, Addr: 0x1013e2e4
[<1014e9c0>]: Func: locate_fd, Off: 120, Addr
 0x1014e9c0
[<101364c4>]: Func: kfree, Off: 48, Addr: 0x101364c4
[<101684f4>]: Func: ext3_file_write, Off: 20, Addr: 0x101684f4
[<101364c4>]: Func: kfree, Off: 48, Addr: 0x101364c4
[<10133004>]: Func: generic_file_write, Off: 4e0, Addr: 0x10133004

[<1012006c>]: Func: s_show, Off: 60, Addr: 0x1012006c
[<101684f4>]: Func: ext3_file_write, Off: 20, Addr: 0x101684f4
[<1013ed34>]: Func: sys_write, Off: a4, Addr: 0x1013ed34
[<10147e2c>]: Func: sys_fstat64, Off: 5c, Addr: 0x10147e2c
[<10109f90>]: F
nc: syscall_exit, Off: 0, Addr: 0x10109f90
[<10109084>]: Func: intr_check_sig, Off: 0, Addr: 0x10109084
[<10109d4c>]: Func: child_return, Off: 0, Addr: 0x10109d4c
[<1013f7b4>]: Func: chrdev_open, Off: 64, Addr: 0x1013f7b4
[<1013e2e4>]: Func: dentry
open, Off: f4, Addr: 0x1013e2e4
[<1014e9c0>]: Func: locate_fd, Off: 120, Addr: 0x1014e9c0
[<10121318>]: Func: it_real_fn, Off: 0, Addr: 0x10121318

Done.

============ another info about aty test ==================
Here is also the end of a toc 
 got before adding stifb console support
and wich made so simply crash the kernel as soon as insmod atifb:
Timestamp =   Fri Jun  20 09:17:56 GMT 2003    (20:03:06:20:09:17:56)

   No memory errors logged


I/O Module Error Log Information:

T
mestamp =   Fri Jun  20 09:17:57 GMT 2003    (20:03:06:20:09:17:57)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
 1  0xfff80000 Bus Bridge (PCI)                      0x09 0xfffbe000 0x00000000



PCI Error Summary

An error related to the GSC bus occurred. The
processor was the requestor. It could have been
a data parity error, an address parity error or a
GSC timeout. On PA
300 systems, check the MIOC
DIOERR register listed above.

I couldn't get more because addresses didn't matches any System nor vmlinux
addresses

===== Eqnx =====
===  TOC  ===

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC 
nformation ------------------

Timestamp =   Fri Jun  20 10:25:53 GMT 2003    (20:03:06:20:10:25:53)

HPMC Chassis Codes = 0xcbf0  0x505f  0xcbfb

General Registers 0 - 31
 0 -  3  0x00000000  0x1039f010  0x1011093c  0x0000ffff
 4 -  7  0x00000
01  0x00000000  0x0086d000  0x00000004
 8 - 11  0x00000000  0x00842010  0x00000000  0x00000000
12 - 15  0x00000000  0x0000001f  0x0000113f  0x00842010
16 - 19  0x000000ff  0x00842810  0x0004e158  0xfff8006c
20 - 23  0x0000000e  0x0000000f  0x1024fe
8  0x00000001
24 - 27  0x00000cfc  0x00000000  0x10079160  0x102f2010
28 - 31  0x0000fff8  0x00000940  0x15b807c0  0x1011093c

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000
 4 -  7  0x00000000  0x00000000  0x000
0000  0x00000000
 8 - 11  0x0000000c  0x00000000  0x000000c0  0x0000001f
12 - 15  0x00000000  0x00000000  0x00108800  0xe0000000
16 - 19  0x144d0fac  0x00000000  0x1024ff28  0x00141860
20 - 23  0x00000000  0xfff8006c  0x0006000e  0x80000000
24 - 2
  0x0030a000  0x05d2c000  0xffffffff  0xffffffff
28 - 31  0xaaaaaaaa  0x11111111  0x15b80000  0x10390000

Space Registers 0 - 7
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000006
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000

IIA 
pace                    = 0x00000000
IIA Offset                   = 0x1024ff2c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000

Bus Check                    = 0x00310000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
System Responder Address     = 0xfff8006c
System Requestor Address     = 0xfffbe000
Path Info                    = 0x0000
000
Physical Memory              = 0x08000000
Available Memory             = 0x08000000

CPU Diagnose Register 0      = 0x600048fc
MIOC Status Register         = 0x00001802
MIOC Control Register        = 0xb8050000
MIOC MDERRADD Error Address  =
0x00000008
MIOC DMAERR DMA Error Reg    = 0xfffffeff
MIOC DIOERR IO Error Reg     = 0xfff8006c

Memory Error Log Information:

Timestamp =   Fri Jun  20 10:25:53 GMT 2003    (20:03:06:20:10:25:53)

   No memory errors logged


I/O Module Err
r Log Information:

Timestamp =   Fri Jun  20 10:25:53 GMT 2003    (20:03:06:20:10:25:53)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- --------
-
 1  0xfff80000 Bus Bridge (PCI)                      0x0a 0x00000000 0x00000000



PCI Error Summary

The PCI bridge is in fatal mode.
This may be due to an error in a different component.

===  Analyse  ===
IAOQ = 0x1024ff2c
Func: analyz
_sbs, Off: 4cc, Addr: 0x1024ff2c
1024ff20:	0e a8 10 93 	ldw 4(sr0,r21),r19
1024ff24:	82 79 20 4a 	cmpb,=,n r25,r19,1024ff50 <analyze_sbs+0x4f0>
1024ff28:	08 16 02 57 	copy r22,r23
1024ff2c:	08 0a 02 56 	copy r10,r22

GR0 = 0x00000000

GR1 = 0x1
39f010
Func: hp_hardware_list, Off: 17500, Addr: 0x1039f010

GR2 = 0x1011093c
Func: inb, Off: 0, Addr: 0x1011093c
101108d4:	86 60 20 b0 	cmpib,= 0,r19,10110934 <pcxl_proc_info+0x1a4>
10110930:	4f c8 3f 01 	ldw,mb -80(sp),r8
10110934:	e8 57 0d dd
	b,l 10100028 <_text+0x28>,rp
10110938:	34 42 3f 41 	ldo -60(rp),rp
1011093c <inb>:
1011093c:	6b c2 3f d9 	stw rp,-14(sp)

GR3 = 0x0000ffff

GR4 = 0x00000001

GR5 = 0x00000000

GR6 = 0x0086d000

GR7 = 0x00000004

GR8 = 0x00000000

GR9 
 0x00842010

GR10 = 0x00000000

GR11 = 0x00000000

GR12 = 0x00000000

GR13 = 0x0000001f

GR14 = 0x0000113f

GR15 = 0x00842010

GR16 = 0x000000ff

GR17 = 0x00842810

GR18 = 0x0004e158

GR19 = 0xfff8006c

GR20 = 0x0000000e

GR21 =
0x0000000f

GR22 = 0x1024fef8
Func: analyze_sbs, Off: 498, Addr: 0x1024fef8
1024fef0:	49 88 00 28 	ldw 14(r12),r8
1024fef4:	08 08 02 58 	copy r8,r24
1024fef8:	08 08 02 43 	copy r8,r3
1024fefc:	0d 00 10 88 	ldw 0(sr0,r8),r8

GR23 = 0x00000001


GR24 = 0x00000cfc

GR25 = 0x00000000

GR26 = 0x10079160

GR27 = 0x102f2010
Func: __kstrtab_in_group_p, Off: 8, Addr: 0x102f2010

GR28 = 0x0000fff8

GR29 = 0x00000940

GR30 = 0x15b807c0

GR31 = 0x1011093c
Func: inb, Off: 0, Addr: 0x1011
93c
101108d4:	86 60 20 b0 	cmpib,= 0,r19,10110934 <pcxl_proc_info+0x1a4>
10110930:	4f c8 3f 01 	ldw,mb -80(sp),r8
10110934:	e8 57 0d dd 	b,l 10100028 <_text+0x28>,rp
10110938:	34 42 3f 41 	ldo -60(rp),rp
1011093c <inb>:
1011093c:	6b c2 3f d9 	stw
rp,-14(sp)


Done.
=================================================================================

But elsewhere you said other important thing to do, so do not spend to much
time (I just learn it for my own education :) )

Thanks again for
all,
    Joel


PS: I hope that what you will recieve will be still readable (this new webmail
interface has a strange behaviour, sorry)



---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
