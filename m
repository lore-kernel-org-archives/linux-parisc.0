Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 411FB4840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 12:16:03 -0600 (MDT)
Message-ID: <3F75D3EA.3010106@tiscali.be>
Date: Sat, 27 Sep 2003 18:16:10 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
References: <3F704CAF00001DCF@ocpmta2.freegates.net> <20030926165045.GB11759@dsl2.external.hp.com>
In-Reply-To: <20030926165045.GB11759@dsl2.external.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello Grant,

Grant Grundler wrote:

>On Fri, Sep 26, 2003 at 05:46:35PM +0200, Joel Soete wrote:
>  
>
>>>It means either other CPU never got the interrupt (locked up
>>>with I-bit off) or the "unstarted_count" isn't coherent between the CPUs.
>>>      
>>>
>>hmm how could I verify this hypothesis?
>>    
>>
>
>TOC the machine, "ser pim" and look at PSW in TOC Info for each CPU.
>bit 0 is the I-Bit IIRC.
>  
>
Here is such TOC:
PROCESSOR PIM INFORMATION

Original Product Number:  A3639C
Current Product Number:   A3639C


-------  Processor 1 HPMC Information - PDC Version: 41.28^@  ------

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

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
00-03  0000000000000000  00000000104f6380  000000001014acb4  
00000000104f3b80
04-07  000000008f029000  0000000010423688  000000008f0b8000  
0000000010000000
08-11  0000000013484f70  0000000013481e48  000000007f0b8b25  
000000001054ebc0
12-15  00000000000e1984  000000001054ec20  000000008f0a40c0  
000000008f0bf708
16-19  0000000013481e48  0000000000000000  00000000faf005e0  
0000000000000580
20-23  000000001054ebc0  00000000002f7465  00000000003f45a2  
000fe051ffc07eb8
24-27  000000007f029b27  00000000000e1984  000000008f0a40c0  
00000000104f3b80
28-31  000000000007f029  003f81480007f029  000000008f0e4f40  
0000000000008ba3


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000016  0000000000000000  00000000000000c0  
000000000000002b
12-15  0000000000000000  0000000000000000  0000000000107000  
ffe0000000000000
16-19  00000024643cebe8  0000000000000000  000000001014acec  
0000000037dd3f61
20-23  0000000000000600  00000000000e1984  000000ff0804c70f  
c000000000000000
24-27  0000000000427000  000000007f04b000  0000000000041020  
000000ffff95c810
28-31  5555555555555555  5555555555555555  000000008f0e4000  
0000000010560000

Space Registers 0 - 7
00-03  00000580          00000580          00000000          00000580
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000001014acf0
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
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  000000001050eec0  00000000104f3b80  0000000000000002  
000000001049d248
08-11  00000000104f3b80  0000000000000802  00000000104be588  
000000008fac8000
12-15  0000000000000000  0000000000000000  000000001016ace8  
00000000103ad6e0
16-19  00000000000009ca  000000008f7cb000  000000000800000f  
000000001049d250
20-23  000000001050eec0  00000000104f3b80  00000000003f45a2  
000000000000ba2e
24-27  0000999900000000  000099997fac8b70  000000007fac8b78  
000000000bebc200
28-31  0000000000000001  00000000ff915e20  0000000010165bf4  
00000000104f3b80


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301010800802004
CPU Status Register 0        = 0x2640c24000000000
CPU Status Register 1        = 0x8000200000000000
SADD LOG                     = 0xf8efdb00003fd800
Read Short LOG               = 0xc18200ff80000002



-----------------  DEW 1 HPMC Information -  ------

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

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


-------  Processor 1^@ LPMC Information ------------------

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



-------  Processor 1^@ TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  
0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  
0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000



-------  Processor 3 HPMC Information - PDC Version: 41.28^@  ------

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011036322  0xcb81800000000000
       0x0000082000ff6452  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  0000000010502b80  00000000101161cc  
00000000103ef0f8
04-07  000000000800000f  0000000000000002  0000000000000000  
00000000104f3b80
08-11  00000000103ef0f8  00000000103ef0f8  000000001038c43c  
000000001038af08
12-15  0000000000000001  0000000000000001  0000000000000000  
000000001038e004
16-19  000000001038e018  000000008f7cc180  0000000000000002  
0000000000000001
20-23  000000000000702c  0000000010423078  00000000104f4380  
0000000000000001
24-27  0000000000000116  000000001038c43c  00000000103ef130  
00000000104f3b80
28-31  0000000000000000  000000008f0353b0  000000008f0353c0  
0000000000008ba3


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000018  0000000000000000  00000000000000c0  
000000000000003d
12-15  0000000000000000  0000000000000000  0000000000107000  
ffe0000000000000
16-19  000000246412e91b  0000000000000000  00000000101162d0  
000000008e605e8d
20-23  0000000000000600  0000000000000000  000000000806060f  
0000000000000000
24-27  0000000000427000  000000007f03e000  0000000000041020  
000000ffff95c810
28-31  000000ffff95c810  5555555555555555  000000008f034000  
0000000000008020

Space Registers 0 - 7
00-03  00000600          00000000          00000000          00000600
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000101162d4
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
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  000000001050eec0  00000000104f3b80  0000000000000002  
000000001049d248
08-11  00000000104f3b80  0000000000000802  00000000104be588  
000000008fac8000
12-15  0000000000000000  0000000000000000  000000001016ace8  
00000000103ad6e0
16-19  00000000000009ca  000000008f7cb000  000000000800000f  
000000001049d250
20-23  000000001050eec0  00000000104f3b80  0000000000000000  
000000000000ba2e
24-27  0000999900000000  000099997fac8b70  000000007fac8b78  
000000000bebc200
28-31  0000000000000001  00000000ff915e20  0000000010165bf4  
00000000104f3b80


Check Summary                = 0xcb81800000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301030800802004
CPU Status Register 0        = 0x3640c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x48e0000000000002
Read Short LOG               = 0xc18080ff80080014



-----------------  DEW 3 HPMC Information -  ------

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

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
Merced DERR  Log Reg              = 0x00c1100000000000
Merced Error Syndrome Reg         = 0x0000000052000000


-------  Processor 3^@ LPMC Information ------------------

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



-------  Processor 3^@ TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  
0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  
0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

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
DERR  Log Reg              = 0x000133000051cdc0
Error Syndrome Reg         = 0x0000000000000000



 Address/Control Parity Error Registers

   Address/Control Parity Error Bit (AE) Not Set



Bus 1 Log Information

Timestamp =    Tue Mar  11 18:07:11 GMT 2003    (20:03:03:11:18:07:11)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_TIMEOUT   X               X

Bus Requestor Address      = 0xfffffffffed2c000
Bus Target Address         = 0x00000000f000a000
Bus Responder Address      = 0x0000000000000000

Error Status Reg           = 0x0000000000000800
Error Overflow Reg         = 0x0000000000000800 
AERR Address 1 Log Reg     = 0x08006000f000a000 
AERR Address 2 Log Reg     = 0x6000b0003f700a10
FERR  Log Reg              = 0x0000000000000000
DERR  Log Reg              = 0x0000000000000000
Error Syndrome Reg         = 0x0000000000000000



 Address/Control Parity Error Registers 

   Address/Control Parity Error Bit (AE) Not Set



------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC 
FE  CW
-----------             -----                ------  ------   
----------------
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

Timestamp =    Tue Mar  11 18:09:10 GMT 2003    (20:03:03:11:18:09:10)

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

Timestamp =    Tue Mar  11 18:09:12 GMT 2003    (20:03:03:11:18:09:12)

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

Timestamp =    Tue Mar  11 18:09:12 GMT 2003    (20:03:03:11:18:09:12)

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
Timestamp =    Tue Mar  11 18:09:12 GMT 2003    (20:03:03:11:18:09:12)

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

Timestamp =    Tue Mar  11 18:09:12 GMT 2003    (20:03:03:11:18:09:12)

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

Timestamp =    Tue Mar  11 18:09:12 GMT 2003    (20:03:03:11:18:09:12)
[...]

Well that for an older test but I don't know yet what could be the PSW 
(sorry I haven't found more doc about TOC output)?

>On second thought, I'm skeptical unstarted_count isn't coherent
>since it's a kernel global as well (like jiffies).
>
>  
>
>>>You need to find out who is using smp_call_function() and which function
>>>they are trying to invoke. I suspect it's coming from mm/slab.c but
>>>would know which of the three it might be.
>>>      
>>>
>>Effectively I don't find another place where it is called. And so add a
>>printk in each function calling smp_call_function_all_cpus() finaly.
>>
>>That is allowing me to notice severall call to kmem_tune_cpucache() (7 exactly)
>>(and not other) but don't get any more 'SMP CALL FUNCTION TIMED OUT (CPU=1)'
>>:(
>>(i presume that, as previously, the system crash before having the opportunity
>>to flush its buffer?)
>>
>>What do you think?
>>    
>>
>
>Could be.
>Add mdelay(100) (or higher) after the lines of output you've added.
>The works if it's a functional problem that's not timing dependent.
>  
>
Because during another test I reach to boot this N (well only during 
half an hour) in SMP, I am quite sure that is such a problem  somewhere 
(the problem is to find where).

>Otherwise setup kernel crash dump and use tools from bruno/phi to view
>contents of the kernel message buffer.
>
I already thought to this (because I test severall bruno's patch), but I 
have two pb to implement it:
a) my system has 2Gb (4* 512Mb iirc) of ram and I don't see how to 
reconfigure the disk with at least 2Gb of swap(== dump area iirc)?
The disk slicing being:
    Name        Flags      Part Type  FS Type          [Label]        
Size (MB)
 ------------------------------------------------------------------------------
    sda1        Boot        Primary   Linux/PA-RISC 
boot                  67.56
    sda2                    Primary   Linux swap                         
135.11
    sda3                    Primary   Linux ext3                         
130.89
    sda5                    Logical   Linux ext3                        
1760.56
    sda6                    Logical   Linux ext3                         
261.77
    sda7                    Logical   Linux ext3                         
130.89
    sda8                    Logical   Linux ext3                         
130.89
    sda9                    Logical   Linux ext3                        
1574.79

sda5 being the root fs must be into the 2Gb limits iirc but I am not 
quiet sure that swap also has have to be in those limits (in fact it is 
just like this because of the very first puffin :) (now obsolete) 
install instruction?

b) afaik p4 is not yet publicaly realesed?

Thanks in advance for your additional help,
    Joel
