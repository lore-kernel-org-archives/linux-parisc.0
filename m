Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4065C4856
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Aug 2003 04:03:26 -0600 (MDT)
Date: Mon, 25 Aug 2003 12:03:20 +0200
Message-ID: <3F2E2C7700004E38@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Joel Soete" <joel.soete@tiscali.be>
Cc: "Grant Grundler" <grundler@parisc-linux.org>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
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

>> btw: I countinue investigations but I still have to learn a lot about

>> how [id]tlb's cach are managed during cpu's startup...
>
>I thought this was a runtime problem (ie userspace <-> kernel
>interaction)
>
I still have to make some additional test and grab much more info.
In a previous mail (N4000 running SMP), I just report an interesting experience
(well for me, I would just like to reproduce it but now by collecting info
until crash and piminfo). After more thought, I figure out that printk()
just slow down the moment of panic. Never the less, where I am waiting a
panic (if I well understand Willy's idea), I got much 'itlb miss fault' followed
by 'dtlb miss fault'? So I would like to study now the early boot process
(specialy for the second cpu) to try to understand how caches (for shared
insn and data) are replicated into other CPU's [id]tlb.

> Ha yes, question: can I find PSW for each cpu in a piminfo?

yes

Can you tell me more: in a previous piminfo collected I got for CPU#3 (3
is the "address" of the second cpu)
[...]
-------  Processor 3 HPMC Information - PDC Version: 41.28   ------ 

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011036322  0xcb81800000000000
       

General Registers 0 - 31
00-03  0000000000000000  0000000010536c70  0000000010115e58  00000000103aaf64
04-07  0000000000000002  00000000103ac494  0000000000000001  0000000010527470
08-11  0000000000000001  000000008f1f45b8  000000008f3cebc0  000000001057dcb0
12-15  00000000faf005f0  0000000000028280  0000000000020000  00000000faf00548
16-19  00000000faf005d0  0000000000004000  0000000000016000  0000000000000001
20-23  0000000000006061  000000001044ec08  0000000010539c70  000000001041b130
24-27  0000000000000000  000000000800000f  0000000010527c70  0000000010527470
28-31  0000000000000480  000000008f1f4e30  000000008f1f4e40  000000001052a470


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000010  0000000000000000  00000000000000c0  0000000000000036
12-15  0000000000000000  0000000000000000  0000000000107000  ffe0000000000000
16-19  0000001f0fd05cbd  0000000000000000  0000000010116050  0000000008000240
20-23  0000000000000000  0000000000000000  000000000806070f  0000000000000000
24-27  0000000000453000  000000007f1f2000  0000000000041020  000000ffff95c810
28-31  000000ffff95c810  5555555555555555  000000008f1f4000  0000000000008020

Space Registers 0 - 7
00-03  00000400          00000400          00000000          00000400
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000010116054
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
04-07  0000000010586ec0  0000000000000002  00000000104c7b68  0000000000000420
08-11  0000000000000000  0000000000000802  0000000010527470  000000001058a000
12-15  00000000135a0000  0000000000000000  000000001017dc84  00000000103ceb94
16-19  00000000000009f0  000000008facf000  0000000010527470  00000000135a0000
20-23  00000000103aa184  fffffffffffffff4  00000000003f45a2  000000000000ba2e
24-27  0000999900000000  00009999035a0b70  00000000035a0b78  000000001040d980
28-31  000000001040d980  00000000ff915e20  0000000010185248  0000000000000016


Check Summary                = 0xcb81800000000000
Available Memory             = 0x0000000100000000
CPU Diagnose Register 2      = 0x0301030800802004
CPU Status Register 0        = 0x3640c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x48e0000000000002
Read Short LOG               = 0xc18080ff80080014


-----------------  DEW 3 HPMC Information -  ------ 

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

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


-------  Processor 3  LPMC Information ------------------

[...] (all 0)


-------  Processor 3  TOC Information -------------------

[...] (all 0)

--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

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
DERR  Log Reg              = 0x000112800051cdc0
Error Syndrome Reg         = 0x0000000000000000



 Address/Control Parity Error Registers  

   Address/Control Parity Error Bit (AE) Not Set 



Bus 1 Log Information

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

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
System Bus Adapter SB  0x000000ffffffff82   0x103c  0x1050              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed00000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000007ff0034

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Mon Aug  11 12:56:02 GMT 2003    (20:03:08:11:12:56:02)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed40000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000007ff0034

[...]

Under which field name is it hiden?

Thanks again,
    Joel



btw: a preliminary pim analyse of above mentioned piminfo reports me:
[...]
Parse IAOQ = 0x000000001010b8cc for CPU[1]

Func: update_mmu_cache, Off: 0x4, Addr: 0x1010b8cc

    1010b8c0:	37 de 3f 01 	ldo -80(sp),sp
    1010b8c4:	00 00 00 00 	break 0,0
	...
000000001010b8c8 <update_mmu_cache>:

	...
    1010b8c8:	0f c2 12 c1 	std rp,-10(,sp)
    1010b8cc:	2b 6a 20 00 	addil 15000,dp,%r1
[...]

hmm very interesting (A yes I was much trying to debug my script then actualy
reading outputs: my bad :( )

[...]
Parse IAOQ = 0x0000000010116054 for CPU[3]

Func: smp_call_function, Off: 0x274, Addr: 0x10116054

    10116050:	08 00 02 40 	nop
    10116054:	0e a0 10 d3 	ldd 0(,r21),r19
    10116058:	0a 93 04 33 	sub r19,r20,r19
    1011605c:	ee 60 ff c5 	cmpib,*> 0,r19,10116044 <smp_call_function+0x264>



-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
