Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (server01.steindlberger.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38950482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 04:12:08 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Joerg Steindlberger <j@steindlberger.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with PCI IDE controller
Date: Tue, 17 Dec 2002 22:04:50 +0100
References: <200212160609.XAA18500@udlkern.fc.hp.com> <1040050989.13786.23.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1040050989.13786.23.camel@irongate.swansea.linux.org.uk>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Message-ID: <courier.3E005801.0000711F@server01>
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

Hi Alan! Great things happened!

I could sweare, that a few weeks ago nothing worked, neither with the nat=
ive=20
IDE drivers nor with PDC20268 options. (That kernel was 2.4.19-pa14). Now=
 it=20
only doesn't work with the special IDE options for this card. Is there a=20
roadmap to fix that prolem? ;-)

Thanks to all who helped me!
Joerg

hp-c240:~# modprobe -k ide-mod
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
PDC20268: IDE controller on PCI bus 00 dev 08
PDC20268: chipset revision 2
PDC20268: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xfd00-0xfd07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0xfd08-0xfd0f, BIOS settings: hdc:pio, hdd:pio
hp-c240:~# modprobe -k ide-probe-mod
hdd: IBM-DTTA-351680, ATA DISK drive
ide1 at 0xfb00-0xfb07,0xfc02 on irq 97
hp-c240:~# modprobe -k ide-disk
hdd: 33022080 sectors (16907 MB) w/462KiB Cache, CHS=3D32760/16/63
 /dev/ide/host0/bus1/target1/lun0: [PTBL] [2055/255/63] p1
hp-c240:~# mount /dev/ide/host0/bus1/target1/lun0/part1 /mnt/tmp
(works with and without devfs)

On Monday 16 December 2002 16:03, you wrote:
> In legacy mode the PCI BAR registers are ignored, the I/O decode is at
> 0x170 etc and interrupts are flagged by the ISA legacy not by the PCI
> bus.
> That isnt going to work very well on your average PA-RISC box. Most
> probably you want to force the chip into native mode on pa-risc
> hardware.
