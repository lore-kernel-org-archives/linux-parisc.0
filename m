Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F63C484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  8 Feb 2004 21:34:44 -0700 (MST)
Date: Sun, 8 Feb 2004 21:34:41 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: willy@debian.org
Subject: Re: [parisc-linux] 2.6.3-rc1 sym2 hangs on a500-65
Message-ID: <20040209043441.GE21692@colo.lackof.org>
References: <20040209035621.GD21692@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040209035621.GD21692@colo.lackof.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 08, 2004 at 08:56:21PM -0700, Grant Grundler wrote:
> Matthew,
> a500 (ion) hangs with /boot/vmlinux-2.6.3-rc1-pa2.
> Having problems with bus reset code path.
> I'll collect TOC info and make that available.

Here is the TOC dump. I've decoded the obvious registers.

BTW, this does not appear to be a "new" problem.
The default kernel won't boot either and hangs at about the same place:
Linux version 2.6.0-test9-4-parisc64 (jejb@raven) (gcc version 3.0.4) #2 Wed Nov 5 22:30:59 CST 2003

I say "about" becuase it hangs on the *second* time it tries to reset
the bus/host when probing SCSI ID3 on the same bus.

thanks,
grant


TOC:
	GR02: 0x10118d30 cpu_idle+48
	IOAQ: 0x10118d28 cpu_idle+40

*sigh* - not very helpful.

Main Menu: Enter command or menu > ser pim


PROCESSOR PIM INFORMATION

Original Product Number:   A6889A
Current Product Number:    A6889A


-----------------  Processor 0 HPMC Information - PDC Version: 42.19  ------ 

Timestamp =    Sun Aug  31 22:06:07 GMT 2003    (20:03:08:31:22:06:07)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006312  0xcb81000000000000
       0x0000087000ff6292  0x000000f0f0000000
       0x6000082070006062  0x0000000000000010
       0x7000082070006082  0x0000000000392400
       0x7000082379006133  0xc1bff0fffed08040
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000
       

General Registers 0 - 31
00-03  0000000000000000  00000000000000d4  000000001013fc8c  2d2d2d2d2d2d2d2d
04-07  202020202d2d2d2d  616821203e0a2020  5350415243212047  6d20617465206120
08-11  000000202d2d448d  0000000000000100  5f5f5f5f5f200a20  5f5f5f5f5f5f5f5f
12-15  5f5f5f5f5f5f5f5f  00000000000000fa  00000000000000f0  00000000000000ff
16-19  00000000104faa80  00000000f000022c  00000000f0002a7c  0000000000000000
20-23  000000001038ae61  000000000000000a  00000000103f8458  00000000104fb078
24-27  0000000020202000  aedef02b906416a0  00000000104fb140  202020202d2d2d2d
28-31  0000000000000109  00000000104fb130  00000000104fb140  000000001046e400


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000013e92  0000000000000000  00000000000000c0  000000000000001c
12-15  0000000000000000  0000000000000000  0000000000109000  8000000000000000
16-19  0000000b8210fabc  0000000000000000  000000001013fc94  0000000050230ec0
20-23  0000000020202020  000000002d2d448d  0000000008000000  8000000000000000
24-27  00000000003ef000  00000000004fa3c0  0000000000041020  5555555555555555
28-31  000000f0f0165670  5555555555555555  00000000104fa300  0000000010427000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          104fa490
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000001013fc98
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffed00000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0413080024850e06  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  5555555555555555  5555555555555555  5555555555555555
08-11  5555555555555555  5555555555555555  5555555555555555  5555555555555555
12-15  5555555555555555  5555555555555555  5555555555555555  5555555555555555
16-19  5555555555555555  5555555555555555  5555555555555555  5555555555555555
20-23  5555555555555555  5555555555555555  0000000000000000  0000000000000000
24-27  5555555555555555  5555555555555555  5555555555555555  5555555555555555
28-31  5555555555555555  5555555555555555  5555555555555555  0000000000000002


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000040000000
CPU Diagnose Register 2      = 0x0203000200802004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8080000000000000
SADD LOG                     = 0x500a00a0502b00b0
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
00-03  0000000000000000  00000000104b6a98  0000000010118d30  0000000000000008
04-07  00000000104576a0  00000000003ba000  00000000000000f0  0000000000000000
08-11  0000000000000000  0000000000000001  000000000804000e  000000001046c5c4
12-15  00000000000000f2  00000000000000fa  00000000000000f0  00000000000000ff
16-19  00000000f0000390  00000000f000022c  00000000f0002a7c  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000073  000000004f9ec980
24-27  00000000104b73c8  0000000010424000  00000000103b89b8  00000000104576a0
28-31  000000004f9ec948  000000004f6f43f0  0000000010424280  000000000000a000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0  000000000000000c
12-15  0000000000000000  0000000000000000  000000000010b000  ff80000000000000
16-19  000002afe7374118  0000000000000000  0000000010118d24  0000000086a0201a
20-23  0000000000000000  0000000000000000  000000ff0804ff0f  8000000000000000
24-27  00000000003b9000  00000000003b9000  0000000000041020  5555555555555555
28-31  000000f0f0165670  5555555555555555  0000000010424000  0000000010428000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000010118d28
CPU State                    = 0x9e000001


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Sun Aug  31 22:06:07 GMT 2003    (20:03:08:31:22:06:07)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
          X     ERR_ERROR       X            X           

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000000010
Runway Control Reg         = 0x0000021c00002818
Runway Address Reg         = 0xc1bff0fffed08040
Runway Data High Reg       = 0xf8018a1ff820ca01
Runway Data Low Reg        = 0xf8018a1ff820ca01
Memory Address Reg         = 0x000001ff3fffffff
Memory Address Corr Reg    = 0x000001ff3fffffff
Memory Syndrome Reg        = 0x0000000000000000
Memory Syndrome Corr Reg   = 0x0000000000000000



 Address/Control Parity Error Registers  

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set 



------------  I/O Module Error Log Information  ------------


   No I/O module errors logged


Main Menu: Enter command or menu > 
