From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Tue, 14 Jan 2003 18:49:46 +0100
Message-ID: <3DED9A6600005A12__11524.2457286969$1416622112$gmane$org@ocpmta3.freegates.net>
References: <20030114165202.GA32537@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: "Randolph Chung" <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: grundler@dsl2.external.hp.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030114165202.GA32537@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>-- Original Message --
>Date: Tue, 14 Jan 2003 09:52:03 -0700
>To: jsoe0708@tiscali.be
>Cc: Randolph Chung <tausq@debian.org>,
>	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>Subject: Re: [parisc-linux] new gcc-default for hppa
>From: grundler@dsl2.external.hp.com (Grant Grundler)
>
>
>On Tue, Jan 14, 2003 at 07:57:01AM +0100, jsoe0708@tiscali.be wrote:
>> Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
>> tulip0: no phy info, aborting mtable build
>> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
>> eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ 66=
.
>> tulip1:  EEPROM default media type Autosense.
>> tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3)
block.
>> tulip_mii_recover: 100 ms
>> tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
>> tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
>> eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ
130.
>> Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
>> ide: Assuming 33MHz system bus speed for PIO modes; override with ideb=
us=3Dxx
>> ....
>> 
>> No chance, as you can see, the two interfaces are of the same time.
>
>I'll assume you meant same "type".

Yes, Sorry:

b2000:/var/logs# lspci
00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/=
43
(rev 41)
00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 IDE=

(rev 03)
00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev
01)
00:0e.2 USB Controller: National Semiconductor Corporation USB Controller=

(rev 02)
00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a (rev
01)
01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
01:02.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/=
43
(rev 41)
01:03.0 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev 26=
)
01:04.0 Network controller: Eicon Technology Corporation EiconCard P92


b180:/var/logs# lspci
00:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR)=

53c875 (rev 04)
00:14.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/=
43
(rev 41)

> They only happen to be the same rev
>of the same device - mounted on different boards and wired
>up to the PHY differently. ie they excercise slighly different code
>paths in the tulip media init code path. This sounds more like a
>bug in tulip driver than a compiler bug.
>
>I've not tried add-on tulip's in my c3k (only minor differences to b2k).=

>I believe (but am not 100% sure right now) that gcc-3.2 built kernels
>worked on that box.  I am sure gcc-3.2 built 2.4 kernels worked on a500.=

>
>Also, can you compare your .config with the one in 2.4.20-pa14.tgz
>(ftp.p-l.o/kernels/c3000)

There are a lot of differences (do you want it I do not think it will be
usefull)

> or a default .config if that's closer?

It will have to wait tommorrow (sorry)

>
>BTW, one can safely enable MMIO on the b2k and perhaps either

I assume you speek about:# CONFIG_TULIP_MMIO is not set (on my config?)

>(a) avoid the crash or (b) get an accurate IP on where in the code
>it's crashing. "inb" has too many levels of indirection to see
>exactly where in tulip it's crashing.
>
>> (I also have a b180 but the buildin NIC is also "Digital DS21143 Tulip=

>rev
>> 65" :( )
>
>Interesting. My b180 has:
>grundler@debian:~$ lspci
>00:01.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
>NCR) 53c875 (rev 14)
>00:01.1 SCSI storage controller: LSI Logic / Symbios Logic (formerly
>NCR) 53c875 (rev 14)
>00:02.0 Ethernet controller: Intel Corp. 82557/8/9 [Ethernet Pro 100]
>(rev 01)
>00:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
>NCR) 53c875 (rev 04)
>00:14.0 Ethernet controller: Digital Equipment Corporation DECchip
>21142/43 (rev 30)
>
>For the record, 21143 is the eth0. I use the eepro100 card for
>local private subnet.
>
Thanks for advises,
    Joel

PS: Sorry to be short but I have to leave, I inform you of progress

*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
