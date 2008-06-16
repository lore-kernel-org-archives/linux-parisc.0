From: rubisher <rubisher@scarlet.be>
Subject: Re: in =?utf-8?b?Y2Npb19pb19wZGlyX2VudHJ5KCks?= =?utf-8?b?QlVHX09OKCk=?= seems to break gcc-4.2 optimization?
Date: Mon, 16 Jun 2008 11:37:39 +0000 (UTC)
Message-ID: <loom.20080616T100421-360@post.gmane.org>
References: <48550D05.2060501@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

wierd, though.

rubisher <rubisher <at> scarlet.be> writes:

> 
> Hello all,
> 
> looking at this hunk:
> void CCIO_INLINE
> ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
>                     unsigned long hints)
> {
>          register unsigned long pa;
>          register unsigned long ci; /* coherent index */
> 
>          /* We currently only support kernel addresses */
>          BUG_ON(sid != KERNEL_SPACE);
> 
no pb to get rid of this BUG_ON(): each place I see it called sid == KERNEL_SPACE
the optimized produced code looks so Ok

[snip]
> 
> But this time, it seems not consider assembly:
>          asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r" (vba));
>          asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
>          asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
> 
> as a 'volatile' block and insert line 1c:
> This could may be solved by re-write as an one 'volatile' asm block like:
> 	asm volatile (
> 	"lci %%r0(%%sr1, %1), %1"
> 	"\textru        %1,19,12,%1\n"
> 	"\tdepw         %1,15,12,%0\n"
> 	: "=r" (pa)
> 	: "r" (vba));
> 
> and even add a clobber 'memory'
> 	asm volatile (
> 	"lci %%r0(%%sr1, %1), %1"
> 	"\textru        %1,19,12,%1\n"
> 	"\tdepw         %1,15,12,%0\n"
> 	: "=r" (pa)
> 	: "r" (vba)
> 	: "memory");
> 
> But I have no clue how to restore BUG_ON() and avoid wrong optimization?
> 
But here is what is very wierd, I tested severall re-writen on this code amoung
latest:
	asm volatile (
	"lci %%r0(%%sr1, %1), %%r19"
	"\textru        %%r19,19,12,%%r19\n"
	"\tdepw         %%r19,15,12,%0\n"
	: "=r" (pa)
	: "r" (vba)
	: "r19" );

but this system failed to boot on ncr_attach: pim info seems to point out to
this place:
PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =   Mon Jun  16 09:50:32 GMT 2008    (20:08:06:16:09:50:32)

HPMC Chassis Codes = 0xcbf0  0x5002  0x7d03  0x5402  0x5508  0xcbf2  
                     0xcbfc  

General Registers 0 - 31
00-03  0000000000000000  18711a0000001194  0000000010514bf8  000000001fd48000
04-07  0000000000000003  0000000010520308  000000001fdf2400  000000001fc20414
08-11  000000001049f3d8  000000001fc20088  000000001051ce20  00000000104e03cc
12-15  000000001fd4802c  000000001fdf2704  0000000010425000  0000000010425000
16-19  0000000010403b78  0000000010403ba8  0000000010403bb8  0000000000024800
20-23  00000000000a142c  00000000000f4240  000000001fd48000  0000000000001458
24-27  0000000000024800  0000000000000000  000000001fd48000  000000001047de20
28-31  0000000000000001  61c4680000004650  000000001fc20540  000000001029bfdc

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0  000000000000001d
12-15  0000000000000000  0000000000000000  0000000000110000  00000000e1000000
16-19  000000248ca1a027  0000000000000000  0000000010514c6c  00000000d39c1bfd
20-23  000000009227ffc4  000000000102482c  000000ff0004f90f  0000000080000000
24-27  00000000004c2000  00000000004c2000  00000000aaaaaaaa  00000000aaaaaaaa
28-31  00000000000003d0  0000000011111111  000000001fc20000  0000000011111111

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000010514c70
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00305004
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff1004817
System Requestor Address     = 0xfffffffffffa0000
Check Summary                = 0x8000000810284000
Available Memory             = 0x0000000010000000
CPU Diagnose Register 2      = 0x0301000004000004
CPU Status Register 0        = 0x1440020000000000
CPU Status Register 1        = 0x8000000800000000
SADD LOG                     = 0x0000000100000001
Read Short LOG               = 0xc10010fff1004817

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
00-03  0000000000000000  000000000aba9500  00000000f005d12c  0000002d110b5065
04-07  0000000000000000  fffffffff0101120  00000000000f4240  0000000000000005
08-11  00000000f0102cd4  000000001fc20088  000000001051ce20  00000000104e03cc
12-15  000000001fd4802c  000000001fdf2704  0000000010425000  0000000010425000
16-19  0000000010403b78  0000000010403ba8  0000000010403bb8  fffffffff0160007
20-23  0000000000000001  00000000000f4240  000000001fd48000  0000000000000000
24-27  0000000000000000  0000000000000000  0000002d13066c03  fffffffff0102400
28-31  0000002d1bc5e565  0301000004000004  fffffffff0102e30  0301000004000004

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0  000000000000001d
12-15  0000000000000000  0000000000000000  000000fff0010000  0000000000000000
16-19  0000002d130a7a0d  0000000000000000  00000000f005d154  000000000804025c
20-23  000000009227c3c0  c000000040902e44  0000000000291008  0000000080000000
24-27  00000000004c2000  00000000004c2000  00000000aaaaaaaa  00000000aaaaaaaa
28-31  00000000000003d0  0000000011111111  000000001fc20000  0000000011111111

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000f005d134
CPU State                    = 0x9e000001


Memory Error Log Information:

Timestamp =   Mon Jun  16 09:50:32 GMT 2008    (20:08:06:16:09:50:32)

                    Trans  Addr                   Central Bus
Status  Requestor     id    par  CP  AD  DV       Address/Data
------  ----------  -----  ----  --  --  --  ---------------------

 0x14   0xfffa0000   0x00   0x0   0   0   0  0x00000000 0x00000000

                                                    Memory
                                  ECC Reg     Address      Data
                                 ----------  ---------- ----------

                                 0x00000000  0x00000000 0x00000000
                                                        0x00000000
                                                        0x00000000
                                                        0x00000000
                                                        0x00000000

I/O Module Error Log Information:

Timestamp =   Mon Jun  16 09:50:32 GMT 2008    (20:08:06:16:09:50:32)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
 0  0xfff88000 I/O Adapter      8         2  0  he   0x04 0xf1004000 0x000a1420
 0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 0x00000000

IO Bus Converter Log
--------------------

IOA0 HPA            = 0xfff88000
IOA0 UBC_IO_CONTROL = 0x00020080
GSC1 HPA            = 0xf1000001
IOA0 IO_IO_LO       = 0xf0800000
IOA0 IO_IO_HI       = 0xf17f0000
IOA0 IO_IO_LO_HV    = 0xfc000000
IOA0 IO_IO_HI_HV    = 0xfff80000

IOA1 HPA            = 0xfff8a000
IOA1 UBC_IO_CONTROL = 0x00020080
GSC2 HPA            = 0xf1800001
IOA1 IO_IO_LO       = 0xf1800000
IOA1 IO_IO_HI       = 0xf2000000
IOA1 IO_IO_LO_HV    = 0x00000000
IOA1 IO_IO_HI_HV    = 0x00000000

while IAOQ point to
IIA Offset                   = 0x0000000010514c70
...

e.g. IAOQ = 0x0000000010514c70

Parse IAOQ = 0x0000000010514c70 for CPU[0]

Func: ncr_attach, Off: 0xc4c, Addr: 0x10514c70

	...
10514c60:	80 95 20 28 	cmpb,= r21,r4,10514c7c <.L1517+0x660>

	...
10514c70:	87 80 3f d7 	cmpib,=,n 0,ret0,10514c60 <.L1517+0x644>
10514c74:	34 84 00 02 	ldo 1(r4),r4
10514c78:	08 03 02 5a 	copy r3,r26
10514c7c:	34 19 00 c8 	ldi 64,r25

Any idea what I missed in this chg?

Tia,
r.

