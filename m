Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C49148F6
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 05:46:44 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h7QBkg901377
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 12:46:42 +0100
Date: Tue, 26 Aug 2003 12:46:42 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0308261152480.6589-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 and IDE DMA support
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

Hi all,

I win a as experimenting mood so I put in a Seagate ST3120022A (120GB, UDMA)
into my C3000 (no floppy, no CDROM). I use the original cable that came with
the C3k (intended for the CDROM), since I sincerely doubt that the IDE
chipset supports UDMA anyway. I just have one ext3 partition on it (111GB).


I have the following problems:

- the hard disk performs very bad (just 3.13 MB/s instead of expected
  >30 MB/s, tested with similar drive in PC and same hdparm settings)
  In fact it shows typical data rates for unsupported DMA transfers
- excessive harddisk access, ie. copying large files (>1GB) obviously
  blocks any other access to the harddisk, at least it's not (very) responsive
  (caused by the slow transfer rate?)
- can't change from my default kernel setting (DMA) to PIO mode via hdparm,
  it causes a kernel oops (but hey, who needs PIO anyway ;)


Apart from the slowlyness of the drive it works quite well.



my .config contains:

CONFIG_BLK_DEV_IDE=y
CONFIG_BLK_DEV_IDEDISK=y
CONFIG_BLK_DEV_IDEPCI=y
CONFIG_BLK_DEV_IDEDMA_PCI=y
CONFIG_IDEDMA_PCI_AUTO=y
CONFIG_BLK_DEV_IDEDMA=y
CONFIG_BLK_DEV_NS87415=y
CONFIG_IDEDMA_AUTO=y
CONFIG_BLK_DEV_IDE_MODES=y



I enable IDE DMA for hda as follows:

> hdparm -c 1 -d 1 -u 1 /dev/hda


dmesg shows:
============

Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
NS87415: IDE controller at PCI slot 00:0e.0
NS87415: chipset revision 3
NS87415: not 100%% native mode: will probe irqs later
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
hda: ST3120022A, ATA DISK drive
blk: queue 103c1608, I/O limit 4095Mb (mask 0xffffffff)
ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
hda: attached ide-disk driver.
hda: host protected area => 1
hda: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=14593/255/63, (U)DMA
Partition check:
 hda: hda1


Is unmasq_irq supported? What about DMA? Is it obviously not fixed yet
(at least somebody wrote that "ns87415 dma doesn't work reliably on
 suckyio-systems" a couple of weeks back)


Any hints how to speed up the transfer rate?


Thanks,
   Max


PS: I have problems with Samba-2.2.3 and 3.0.0 when transferring
multiple 1GB files from an XP box to the samba share (the IDE harddisk):
samba disconnects after transferring 2x 1GB files, but will copy many
smaller files (several MB) just fine (although combined >>2GB).

It might be the case that the IDE hard disk is too slow (3MB/s) for my
100Mbit FDX ethernet (4-5MB/s) and thus confuses samba ...

Samba-3.0.0 also seems to be a little bit "laggy" when I try to access a
share (or any of it's files); there is always a delay for about 1-2s for
each read access to a file ... but it's a beta version anyway and this
issue should be better discussed on lists.debian.org
