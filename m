Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99E2B482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Dec 2002 01:22:51 -0700 (MST)
Date: Tue, 17 Dec 2002 09:22:19 +0100
Message-ID: <3DED9BBD0000215E@ocpmta7.freegates.net>
In-Reply-To: <20021216172906.B9994@parcelfarce.linux.theplanet.co.uk>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Re: YA pb with PCI IDE (my merge 2.4.21-pre1)
To: "Matthew Wilcox" <willy@debian.org>,
	"Alan Cox" <alan@lxorguk.ukuu.org.uk>
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

Hi Willy,
>
>You mean the "IDE but no disks" patch:
>http://www.uwsg.iu.edu/hypermail/linux/kernel/0212.2/0105.html ?

I apply it (by hand) and it works:
"...
Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
NS87415: IDE controller at PCI slot 00:0e.0
NS87415: chipset revision 3
NS87415: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x0900-0x0907, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0908-0x090f, BIOS settings: hdc:pio, hdd:pio
hda: LTN485S, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
hda: ATAPI 48X CD-ROM drive, 120kB Cache
Uniform CD-ROM driver Revision: 3.12
...

palx2000:~# uname -a
Linux palx2000 2.4.21-pre1-pa14 #2 Tue Dec 17 08:44:14 CET 2002 parisc un=
known
unknown GNU/Linux"

Thanks all,
    Joel



*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
