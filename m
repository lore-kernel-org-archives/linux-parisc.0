Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (server01.steindlberger.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id A56BD482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 14:09:07 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Joerg Steindlberger <j@steindlberger.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] still problems with PCI IDE controller
Date: Wed, 18 Dec 2002 22:08:34 +0100
References: <200212160609.XAA18500@udlkern.fc.hp.com> <1040050989.13786.23.camel@irongate.swansea.linux.org.uk> <courier.3E005801.0000711F@server01>
In-Reply-To: <courier.3E005801.0000711F@server01>
MIME-Version: 1.0
Message-ID: <courier.3E00E3ED.000010DA@server01>
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

Hi all!

I still do have problems with using my IDE controller with parisc-linux. =
I=20
get the following message onto my console when generation large traffic t=
o /=20
from my IDE disks:
hp-c240:~# dd if=3D/dev/ide/host0/bus0/target0/lun0/disc of=3D/dev/null
Dino f2000000: IRQ base 96, stuck IRQ lines? 0x2
Dino f2000000: IRQ base 96, stuck IRQ lines? 0x2
Dino f2000000: IRQ base 96, stuck IRQ lines? 0x2
[...]
The device using the IRQ 96 is the internal ethernet controller (not the =
IDE=20
controller!):
hp-c240:~# cat /proc/interrupts | grep 96
 96:      17424            Dino  eth0

Seems that there is still nobody else who tried to use cheap IDE disks wi=
th a=20
parisc machine :-(

For those who are interrested anyway: The reason that causes the kernel c=
rash=20
is the multimode option. You can either select it for native IDE support=20
(CONFIG_IDEDISK_MULTI_MODE=3Dy) or it is automatically selected with the=20
special drivers for i.e. Promise controllers.

Regards
Joerg

> hp-c240:~# modprobe -k ide-mod
> Uniform Multi-Platform E-IDE driver Revision: 6.31
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebu=
s=3Dxx
> PDC20268: IDE controller on PCI bus 00 dev 08
> PDC20268: chipset revision 2
> PDC20268: not 100% native mode: will probe irqs later
>     ide0: BM-DMA at 0xfd00-0xfd07, BIOS settings: hda:pio, hdb:pio
>     ide1: BM-DMA at 0xfd08-0xfd0f, BIOS settings: hdc:pio, hdd:pio
> hp-c240:~# modprobe -k ide-probe-mod
> hdd: IBM-DTTA-351680, ATA DISK drive
> ide1 at 0xfb00-0xfb07,0xfc02 on irq 97
> hp-c240:~# modprobe -k ide-disk
> hdd: 33022080 sectors (16907 MB) w/462KiB Cache, CHS=3D32760/16/63
>  /dev/ide/host0/bus1/target1/lun0: [PTBL] [2055/255/63] p1
> hp-c240:~# mount /dev/ide/host0/bus1/target1/lun0/part1 /mnt/tmp
> (works with and without devfs)
