Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEB594829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 09:14:53 -0700 (MST)
Date: Wed, 15 Jan 2003 17:14:47 +0100
Message-ID: <3E1AA52C0000167E@ocpmta1.freegates.net>
In-Reply-To: <3DED9A6600005A12@ocpmta3.freegates.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
To: grundler@dsl2.external.hp.com,
	"Randolph Chung" <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
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

Hi Grant and Randolph,

>-- Original Message --
>From: jsoe0708@tiscali.be
>Subject: Re: [parisc-linux] new gcc-default for hppa
>To: grundler@dsl2.external.hp.com
>Cc: "Randolph Chung" <tausq@debian.org>,
>	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>Date: Tue, 14 Jan 2003 18:49:46 +0100
>
>
>>-- Original Message --
>>Date: Tue, 14 Jan 2003 09:52:03 -0700
>>To: jsoe0708@tiscali.be
>>Cc: Randolph Chung <tausq@debian.org>,
>>	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>>Subject: Re: [parisc-linux] new gcc-default for hppa
>>From: grundler@dsl2.external.hp.com (Grant Grundler)
>>
>>
>>On Tue, Jan 14, 2003 at 07:57:01AM +0100, jsoe0708@tiscali.be wrote:
>>> Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
>>> tulip0: no phy info, aborting mtable build
>>> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.=

>>> eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ
66.
>>> tulip1:  EEPROM default media type Autosense.
>>> tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3)
>block.
>>> tulip_mii_recover: 100 ms
>>> tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.=

>>> tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
>>> eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ=

>130.
>>> Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
>>> ide: Assuming 33MHz system bus speed for PIO modes; override with ide=
bus=3Dxx
>>> ....
>>>
>>> No chance, as you can see, the two interfaces are of the same time.
>>
>>I'll assume you meant same "type".
>
>Yes, Sorry:
>
>b2000:/var/logs# lspci
>00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip 21142=
/43
>(rev 41)
>00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
>00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 ID=
E
>(rev 03)
>00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev=

>01)
>00:0e.2 USB Controller: National Semiconductor Corporation USB Controlle=
r
>(rev 02)
>00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a (rev
>01)
>01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
>01:02.0 Ethernet controller: Digital Equipment Corporation DECchip 21142=
/43
>(rev 41)
>01:03.0 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev
26)
>01:04.0 Network controller: Eicon Technology Corporation EiconCard P92
>
>
>b180:/var/logs# lspci
>00:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR=
)
>53c875 (rev 04)
>00:14.0 Ethernet controller: Digital Equipment Corporation DECchip 21142=
/43
>(rev 41)
>
>> They only happen to be the same rev
>>of the same device - mounted on different boards and wired
>>up to the PHY differently. ie they excercise slighly different code
>>paths in the tulip media init code path. This sounds more like a
>>bug in tulip driver than a compiler bug.
>>
>>I've not tried add-on tulip's in my c3k (only minor differences to b2k)=
.
>>I believe (but am not 100% sure right now) that gcc-3.2 built kernels
>>worked on that box.  I am sure gcc-3.2 built 2.4 kernels worked on a500=
.
>>
>>Also, can you compare your .config with the one in 2.4.20-pa14.tgz
>>(ftp.p-l.o/kernels/c3000)
>
>There are a lot of differences (do you want it I do not think it will be=

>usefull)
>
>> or a default .config if that's closer?
>
>It will have to wait tommorrow (sorry)
>
>>
>>BTW, one can safely enable MMIO on the b2k and perhaps either
>
>I assume you speek about:# CONFIG_TULIP_MMIO is not set (on my config?)

I now add CONFIG_TULIP_MMIO=3Dyes

and I got this time actual stack dump:
 for buildin NIC:
Stack Dump:
 1ebd4780:  0004ff0f 54203230 38204345 35343a30 
 1ebd4770:  2031343a 101e0e7c 64204a61 31205765 
 1ebd4760:  2e0a2023 6d61696c 61766520 6f752068 
 1ebd4750:  75780a59 2f4c696e 20474e55 00075f10 
 1ebd4740:  0000001b 00069e0c 00069e0c 00000008 
 1ebd4730:  1ebd4588 101e27e4 1fe3ac80 00000000 

Kernel addresses on the stack:
 [<101e0e7c>]  [<101e27e4>]  [<101e25f8>]  [<101e0bec>] 
 [<1014b828>]  [<101de398>]  [<10104a6c>]  [<1013f4ac>] 
 [<10109f90>]  [<10109084>]  [<10109d4c>]  [<1013ff24>] 
 [<1013e3e4>]  [<1014ec28>]  [<101213f0>] 

Kernel Fault: Code=3D26 regs=3D1ebd4780 (Addr=3D00000082)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1039d010 101e27e4 0000000a
r04-07  0000001b 0000000a 1ed034e0 00010004
r08-11  00000000 0000006e 00000000 00075ec0
r12-15  1ebea96c 00069e0c 00069e0c 00069e0c
r16-19  00000004 00069e0c 00000004 0000006e
r20-23  00000001 00000000 101e11c8 0000000a
r24-27  1ebd4748 0000000a 0000000a 10330010
r28-31  00000000 00000031 1ebd4780 101e1098
sr0-3   00000000 000002d8 00000000 000002d8
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101e0dcc 101e0dd0
 IIR: 4b3600f0    ISR: 00000000  IOR: 00000082
 CPU:        0   CR30: 1ebd4000 CR31: 103e8000
 ORIG_R28: 78110466

  AND FOR External Nic:


Stack Dump:
 1ec3e080:  0004ff0f 00000000 00000000 00000000 
 1ec3e070:  00000000 701e49c4 70707070 70707070 
 1ec3e060:  70707070 70707070 70707070 70707070 
 1ec3e050:  70707070 70707070 70707070 70707070 
 1ec3e040:  70707070 70707070 70707070 70707070 
 1ec3e030:  70707070 70707070 70707070 70707070 

Kernel addresses on the stack:
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>]  [<101e49c4>]  [<101e07d8>]  [<101e0e7c>] 
 [<101e11c8>]  [<101e2b28>]  [<101e1710>]  [<101e49c4>] 
 [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]  [<101e2b28>] 
 [<101e1710>] 

Kernel Fault: Code=3D6 regs=3D1ec3e080 (Addr=3D701e49c4)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1039d010 701e49c4 1ec60000
r04-07  1ec61000 00000001 1ec3dfc8 1ec60000
r08-11  00000001 00000000 00000000 00039750
r12-15  1ec6096c 00000000 0000b71b 00035054
r16-19  00029054 faf00208 000020a8 0000007f
r20-23  00000f92 00000001 00000000 00000001
r24-27  1fea9a60 00000000 1ec61000 10330010
r28-31  00001000 00000031 1ec3e080 101e07d8
sr0-3   00000000 000002c2 00000000 000002c2
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 701e49c4 701e49c8
 IIR: 43ffff80    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 1ebf0000 CR31: 103e8000
 ORIG_R28: 00000000

Completly deferent as you predict.

(Randolph: Do you want I send you those new material: kernel, system.map,=

...?)

I also forget to recall: this only occurs for incoming ethernet trafic(ie=

ssh, telnet, ftp, coming from an external server). The outgoing traffic
works fine (I just do a telnet and a ftp from this server to an external
one without crash).

HTH,
    Joel



*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
