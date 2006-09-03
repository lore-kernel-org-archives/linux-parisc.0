From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Latest palinux crash -- VM problem?
Date: Sat, 2 Sep 2006 23:00:52 -0600
Message-ID: <20060903050051.GA2558@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


We hit an HPMC earlier this evening running 2.6.18-rc5-pa1 on palinux.
Here's my analysis (I'll attach the raw data to the end).

The MCA dump fingers this culprit:

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000010198ba4

The offset lands in sys_mprotect().  Specifically, it's the call to
flush_tlb_range() in the (inlined) change_protection() function:

    10198ba4:   04 e0 52 00     pdtlb r0(sr1,r7)
    10198ba8:   37 9c 00 02     ldo 1(ret0),ret0
    10198bac:   bf 85 3f e5     cmpb,*<> r5,ret0,10198ba4 <sys_mprotect+0x7fc>
    10198bb0:   34 e7 20 00     ldo 1000(r7),r7

At this point, there are two reasonable hypotheses:

1. Bad hardware
2. Bad software

The memory error log indicates an uncorrectable error, unfortuantely I
don't understand it enough to decode what it's saying.

Could it be a different manifestation of the same problem that bites
PA8800?  That is, do we have the same address mapped twice and we're
upsetting Astro by writing back cachelines that are supposed to be on
the other CPU?

I should probably try to find Astro docs at some point so I can find out
how much it cares about this kind of thing.


The HPMC log:

Service Menu: Enter command > pim 0 hpmc

FIRMWARE INFORMATION

   Firmware Version:          41.10


PROCESSOR PIM INFORMATION


-----------------  Processor 0 HPMC Information - PDC Version: 41.10  ------ 

Timestamp =    Sun Sep  3 03:06:18 GMT 2006    (20:06:09:03:03:06:18)

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
       0x0000082000ff6452  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       0x0000080080006300  0x0000000000000001
       0x7000082382006343  0x0000000000070200
       0x7000082382026343  0x0000000000070200
       0x7000082382046343  0x0000000000070200
       0x7000082382066343  0x0000000000070200
       0x0000080089006200  0x0000000000000000
       0x0000080086006200  0x0000000000000000
       0x000008008000630f  0x0000000000000000
       

General Registers 0 - 31
00-03  0000000000000000  00000000105b60c0  0000000010198af0  000000009fe7ce58
04-07  00000000105a78c0  00000000000000d3  0000000040c00000  0000000040bd7000
08-11  0000000040caa000  0000000040caa000  0000000040caa000  00000000d0c9881c
12-15  0000000000000070  0000000040ca9fff  0000000040ca9fff  0000000000000b00
16-19  00000000000e1e00  00000000d0c9a004  00000000a096c3c0  0000000010000000
20-23  00000000facc8b40  0000000000000000  0000000000000000  0000000000000040
24-27  000000009fe7ce98  0000000040caa000  0000000010478000  00000000105a78c0
28-31  0000000000000001  0000000015fa0270  0000000015fa02b0  0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  000000000000db78  0000000000000000  00000000000000c0  0000000000000038
12-15  0000000000000000  0000000000000000  0000000000103000  ffc0000000000000
16-19  000011f2605064fd  0000000000000000  0000000010198bb0  0000000034e72000
20-23  0000000010240001  000000001e078000  000000ff080cef0f  8000000000000000
24-27  0000000000511000  00000000c0c9a000  0000000000041020  5555555555555555
28-31  000000f0f015e700  5555555555555555  0000000015fa0000  0000000010568000

Space Registers 0 - 7
00-03  036de000          036de000          00000000          036de000
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000010198ba4
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0010c03b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000010d48098  0000000010000000  0000080300000000  000000004fae8ac0
08-11  0000000000000000  00000000105a78c0  ffffffffffffff9c  0000000000000000
12-15  c06f020000000802  403cf49114843c00  40000e7014843c10  00000000105a78c0
16-19  0000000000000000  0000000000000001  00000000105b48c0  0000000010603000
20-23  0000000010453d80  00000000105487f0  0000000000000244  00000244a8b90fc5
24-27  0000000100000000  00000000105b70c0  00000000105a78c0  0000000000000802
28-31  0000000010143a08  00000000104f32c0  0000000017c841c0  0000000014844108


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301000000802004
CPU Status Register 0        = 0x2440c20000000000
CPU Status Register 1        = 0x8000200000000000
SADD LOG                     = 0x141ffcffffffffff
Read Short LOG               = 0xc10080fff800a014


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Sun Sep  3 03:06:18 GMT 2006    (20:06:09:03:03:06:18)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
          X     ERR_ERROR       X            X           

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000000010
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
-----------             -----                ------  ------   ----------------
System Bus Adapter RP  0x000000ffff04ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff01ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff02ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff03ff83   0x103c  0x1051              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Sun Sep  3 03:06:19 GMT 2006    (20:06:09:03:03:06:19)

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

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Sun Sep  3 03:06:19 GMT 2006    (20:06:09:03:03:06:19)

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

Timestamp =    Sun Sep  3 03:06:19 GMT 2006    (20:06:09:03:03:06:19)

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

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Sun Sep  3 03:06:19 GMT 2006    (20:06:09:03:03:06:19)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff03ff83


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
