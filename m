Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B8764845
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Sep 2003 10:31:20 -0600 (MDT)
Date: Tue, 30 Sep 2003 18:31:17 +0200
Message-ID: <3F5CB6FB0000AD75@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
To: "Grant Grundler" <grundler@parisc-linux.org>
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

Here is the very last test I did yesterday with the additional mdelay(100):

>TOC the machine, "ser pim" and look at PSW in TOC Info for each CPU.
>bit 0 is the I-Bit IIRC.

In summary:
-------  Processor 1 HPMC Information - PDC Ver
ion: 41.28  ------
[...]
CPU State                    = 0x9e000004
[...]
CPU Diagnose Register 2      = 0x0301010800802004
CPU Status Register 0        = 0x2640c24000000000
CPU Status Register 1        = 0x8000200000000000
[...]
-------  Proces
or 3 HPMC Information - PDC Version: 41.28  ------
[...]
CPU State                    = 0x9e000004
[...]
CPU Diagnose Register 2      = 0x0301030800802004
CPU Status Register 0        = 0x3640c24000000000
CPU Status Register 1        = 0x80000000
0000000
[...]

all I bits (well the lowest weight PSW bit :) ) are well 0


>Could be.
>Add mdelay(100) (or higher) after the lines of output you've added.
>The works if it's a functional problem that's not timing dependent.

Well after a ver
 long time of boot the system finaly crash without any
reason of panic??? (all interruption should be manage by handle_interruption?)

Just in case here is a short Pim-analyse:
-------  Processor 1 HPMC Information - PDC Version: 41.28  ------ 

GR of CPU[1]
00-03  0000000000000000  000000001041b018  000000001014dbf0  0000000000000000
04-07  0000000000008000  000000008d113c00  0000000040200000  0000000000008000
08-11  0000000000000000  000000008d2cd008  0000000080000000  00000000103fa2c8
12-15  0000000040180000  000000008d9a6280  00000000105389c0  0000000000000000
16-19  000000001045cf88  00000000103b6338  000000008d147010  ffffffffffffffff
20-23  00000000000001ff  0000000040178000  000000008d9a6280  0000000000088000
24-27  0000000040180000  0000000000000006  0000000040180000  00000000105389c0
28-31  0000000000000000  000000008d7ccef0  000000008d7ccf40  0000000000008000

GR[02] == rp = 000000001014dbf0

Func: zap_page_range, Off: 0xe0, Addr: 0x1014dbf0

    1014dbf0:	08 0e 02 5b 	copy r14,dp
    1014dbf4:	03 c0 08 b4 	mfctl tr6,r20
    1014dbf8:	4a 93 00 b0 	ldw 58(r20),r19
    1014dbfc:	29 c5 20 00 	addil b000,r14,%r1

GR[22] == t1(32bits) == arg4(64bits) = 000000008d9a6280

GR[21] == t2(32bits) == arg5(64bits) = 0000000040178000

GR[20] == t3(32bits) == arg6(64bits) = 00000000000001ff

GR[19] == t4(32bits) == arg7(64bits) = ffffffffffffffff

GR[26] == arg0 = 0000000040180000

GR[25] == arg1 = 0000000000000006

GR[24] == arg2 = 0000000040180000

GR[23] == arg3 = 0000000000088000

GR[27] == dp = 00000000105389c0

Func: __gp, Off: 0x0, Addr: 0x105389c0


GR[28] == ret0 = 0000000000000000

GR[29] == ret1 or sl = 000000008d7ccef0

GR[30] == sp = 000000008d7ccf40

GR[31] == ble rp = 0000000000008000
	Not parsable address!

CR of CPU[1]
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  00000000000002b2  0000000000000000  00000000000000c0  0000000000000003
12-15  0000000000000000  0000000000000000  0000000000107000  ffe0000000000000
16-19  000003182e3e3f89  0000000000000000  000000001014deac  0000000036b52000
20-23  00000000103401f5  00000000f33ccdd8  000000ff080ef70f  8000000000000000
24-27  0000000000461000  000000007d147000  0000000000041020  000000ffff95c810
28-31  5555555555555555  5555555555555555  000000008d7cc000  00000000105a0000

CR[00] == rctr = 0000000000000000

CR[08] == (Protection ID) pidr1 = 00000000000002b2

CR[10] == ccr = 00000000000000c0

CR[11] == sar = 0000000000000003

CR[14] == iva = 0000000000107000

CR[15] == eiem = ffe0000000000000

CR[16] == itmr = 000003182e3e3f89

CR[17] == pcsq = 0000000000000000

CR[18] == pcoq = 000000001014deac

CR[19] == iir = 0000000036b52000

CR[20] == isr = 00000000103401f5

CR[21] == ior = 00000000f33ccdd8

CR[22] == ipsw = 000000ff080ef70f

CR[23] == eirw = 8000000000000000

CR[24] == tr0 (ptov) = 0000000000461000

CR[25] == tr1 (vtop) = 000000007d147000

CR[26] == tr2 = 0000000000041020

CR[27] == tr3 = 000000ffff95c810

CR[28] == tr4 = 5555555555555555

CR[29] == tr5 = 5555555555555555

CR[30] == tr6 = 000000008d7cc000

CR[31] == tr7 = 00000000105a0000

SR of CPU[1]
00-03  0000ac80          0000ac80          00000000          0000ac80
04-07  00000000          00000000          00000000          00000000
Need much more work !!!

SR[00] == ts0 = 0000ac80

SR[01] == ts1 = 0000ac80

SR[03] == cpp = 0000ac80
	Not parsable address!
...
IIA Offset (back entry)      = 0x000000001014dea0
...

e.g. IAOQ = 0x000000001014dea0

FPR of CPU[1]
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000000008f760ec0  0000000000000002  000000001359d740  0000000000000420
08-11  0000000000000000  0000000000000802  00000000105389c0  000000001059a000
12-15  0000000013590000  0000000000000000  0000000010180574  00000000103dc6b8
16-19  00000000000009ee  000000008fa7e000  00000000105389c0  0000000013590000
20-23  00000000103b7b0c  fffffffffffffff4  000000000000021e  0000002f66666667
24-27  000007b100000000  0000999903590b70  0000000003590b78  000000001041b980
28-31  000000001041b980  00000000ff915e20  0000000010187b38  0000000000000004

Parse IAOQ = 0x000000001014dea0 for CPU[1]

Func: zap_page_range, Off: 0x390, Addr: 0x1014dea0

    1014dea0:	06 a0 52 00 	pdtlb r0(sr1,r21)
    1014dea4:	37 39 3f ff 	ldo -1(r25),r25
    1014dea8:	bf 33 3f e5 	cmpb,*<> r19,r25,1014dea0 <zap_page_range+0x390>
    1014deac:	36 b5 20 00 	ldo 1000(r21),r21
-------  Processor 3 HPMC Information - PDC Version: 41.28  ------ 

GR of CPU[3]
00-03  0000000000000000  0000000010429028  000000001010cdd0  0000000000000021
04-07  000000008d0c05b8  00000000105389c0  000000000000000f  0000000000000000
08-11  0000000000000000  0000000040026ee2  0000000040039141  0000000040026fb4
12-15  0000000040028380  00000000faf00950  00000000400342f4  0000000000000000
16-19  000000008d0c05b8  00000000faf00910  00000000faf00910  0000000000058706
20-23  000003182e080065  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  00000000000003e8  00000000105389c0
28-31  0000000000086470  0000000000086470  000000008d0c0b40  0000000000000226

GR[02] == rp = 000000001010cdd0

Func: handle_interruption, Off: 0xb0, Addr: 0x1010cdd0

    1010cdd0:	08 05 02 5b 	copy r5,dp
    1010cdd4:	02 00 08 b4 	mfctl itmr,r20
    1010cdd8:	02 00 08 b3 	mfctl itmr,r19
    1010cddc:	0a 93 04 33 	sub r19,r20,r19
	...
    1010cde0:	be 7c bf e5 	cmpb,*>> ret0,r19,1010cdd8 <handle_interruption+0xb8>

	...
	...
    1010cdec:	ec 7f bf c5 	cmpib,*<> -1,r3,1010cdd4 <handle_interruption+0xb4>

	...

GR[22] == t1(32bits) == arg4(64bits) = 0000000000000000

GR[21] == t2(32bits) == arg5(64bits) = 0000000000000000

GR[20] == t3(32bits) == arg6(64bits) = 000003182e080065

GR[19] == t4(32bits) == arg7(64bits) = 0000000000058706

GR[26] == arg0 = 00000000000003e8

GR[25] == arg1 = 0000000000000000

GR[24] == arg2 = 0000000000000000

GR[23] == arg3 = 0000000000000000

GR[27] == dp = 00000000105389c0

Func: __gp, Off: 0x0, Addr: 0x105389c0


GR[28] == ret0 = 0000000000086470

GR[29] == ret1 or sl = 0000000000086470

GR[30] == sp = 000000008d0c0b40

GR[31] == ble rp = 0000000000000226
	Not parsable address!

CR of CPU[3]
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  00000000000002b8  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000107000  ffe0000000000000
16-19  000003182e158ca8  0000000000000000  000000001010cde0  00000000be7cbfe5
20-23  00000000103401f4  00000000300c0b50  000000ff0804ff0e  8000000000000000
24-27  0000000000461000  000000007d0c4000  0000000000041020  000000ffff95c810
28-31  000000ffff95c810  5555555555555555  000000008d0c0000  0000000000008020

CR[00] == rctr = 0000000000000000

CR[08] == (Protection ID) pidr1 = 00000000000002b8

CR[10] == ccr = 00000000000000c0

CR[11] == sar = 000000000000003f

CR[14] == iva = 0000000000107000

CR[15] == eiem = ffe0000000000000

CR[16] == itmr = 000003182e158ca8

CR[17] == pcsq = 0000000000000000

CR[18] == pcoq = 000000001010cde0

CR[19] == iir = 00000000be7cbfe5

CR[20] == isr = 00000000103401f4

CR[21] == ior = 00000000300c0b50

CR[22] == ipsw = 000000ff0804ff0e

CR[23] == eirw = 8000000000000000

CR[24] == tr0 (ptov) = 0000000000461000

CR[25] == tr1 (vtop) = 000000007d0c4000

CR[26] == tr2 = 0000000000041020

CR[27] == tr3 = 000000ffff95c810

CR[28] == tr4 = 000000ffff95c810

CR[29] == tr5 = 5555555555555555

CR[30] == tr6 = 000000008d0c0000

CR[31] == tr7 = 0000000000008020

SR of CPU[3]
00-03  0000ae00          00006e00          00000000          0000ae00
04-07  00000000          00000000          00000000          00000000
Need much more work !!!

SR[00] == ts0 = 0000ae00

SR[01] == ts1 = 00006e00

SR[03] == cpp = 0000ae00
	Not parsable address!
...
IIA Offset (back entry)      = 0x000000001010cde4
...

e.g. IAOQ = 0x000000001010cde4

FPR of CPU[3]
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000000008f760ec0  0000000000000002  000000001359d740  0000000000000420
08-11  0000000000000000  0000000000000802  00000000105389c0  000000001059a000
12-15  0000000013590000  0000000000000000  0000000010180574  00000000103dc6b8
16-19  00000000000009ee  000000008fa7e000  00000000105389c0  0000000013590000
20-23  00000000103b7b0c  fffffffffffffff4  0000000000000000  0000000000000000
24-27  0000999900000000  0000999903590b70  0000000003590b78  000000001041b980
28-31  000000001041b980  00000000ff915e20  0000000010187b38  0000000000000000

Parse IAOQ = 0x000000001010cde4 for CPU[3]

Func: handle_interruption, Off: 0xc4, Addr: 0x1010cde4

    1010cde0:	be 7c bf e5 	cmpb,*>> ret0,r19,1010cdd8 <handle_interruption+0xb8>
    1010cde4:	08 00 02 40 	nop
    1010cde8:	34 63 3f ff 	ldo -1(r3),r3
    1010cdec:	ec 7f bf c5 	cmpib,*<> -1,r3,1010cdd4 <handle_interruption+0xb4>

Any idea?

>Otherwise setup kernel crash dump and use tools from bruno/phi to view
>contents of the kernel message buffer.

Well, that seems to be the ultimate solution (I don't remember if it also
works on smp kernel?) but I will need to discuss a bit with them to see if
I reach to get a dump how could it be analysed?

Thanks again for your attention,
    Joel




-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
