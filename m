Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA09415
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 02:18:58 -0700
From: "Steve Moret" <smoret@uci.edu>
To: "Helge Deller" <deller@gmx.de>
Cc: <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] HP 9000/735-125
Date: Thu, 30 Nov 2000 01:20:28 -0800
Message-ID: <FKEGLIIBOIACJOCCAFIMCEFBCCAA.smoret@uci.edu>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <00113001105103.00309@P100>
List-ID: <linux-parisc.vger.kernel.org>

Helge,

My mistake! I did a full build with todays CVS and parport didn't die. So
somewhere between the 17th and now parport must have been fixed.

Now, maybe you can help me identify my SCSI problem. I don't know if it is
because of driver issues or a bad disk (completly likely). Do other people
have the Fast SCSI2 working on their 735s?

Whenever I do a mke2fs (after partitioning the drive with fdisk ok) it dies.

At bootup I get:

SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c7xx
  Vendor: HP        Model: C2235             Rev: 0B11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: HP        Model: C2235             Rev: 0B11
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
SCSI device sda: 825012 512-byte hdwr sectors (422 MB)
Partition check:
 sda: sda1 sda2
SCSI device sdb: 825012 512-byte hdwr sectors (422 MB)
 sdb: sdb1 sdb2



And then if I try to mke2fs the disk I get:

hp735:~# fdisk -l /dev/sda

Disk /dev/sda: 13 heads, 62 sectors, 1023 cylinders
Units = cylinders of 806 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1       910    366699   83  Linux
/dev/sda2           911      1023     45539   82  Linux swap
hp735:~# mke2fs /dev/sda1
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
91800 inodes, 366699 blocks
18334 blocks (5.00%) reserved for the super user
First data block=1
45 block groups
8192 blocks per group, 8192 fragments per group
2040 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185

Writing inode tables: done
Writing superblocks and filesystem accounting information: scsi0: Unable to
abort command for target 5
scsi0: Unable to send Bus Device Reset for target 5
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 0cf15038 (script[0x140e]), dsps = 0cf15cde, target = 0
scsi0: Failing command for ID5
scsi0: sim700_intr_handle() called with no interrupt
pa11_dma_map_single(PCI_DMA_NONE) called by c01cb6d4
kernel BUG at pci-dma.c:392!
pa11_dma_unmap_single(PCI_DMA_NONE) called by c01ca3bc
kernel BUG at pci-dma.c:403!
SCSI disk error : host 0 channel 0 id 5 lun 0 return code = 2
 I/O error: dev 08:01, sector 268
 I/O error: dev 08:01, sector 270
 I/O error: dev 08:01, sector 396
 I/O error: dev 08:01, sector 16396
 I/O error: dev 08:01, sector 16524
 I/O error: dev 08:01, sector 16652

Of course the I/O errors continue on for a long time. Are these bad drives?
Or is there a problem with the driver that still needs to be worked out?

Thanks for all your help, I hope my spews of debug output are helpful,

--
Steve Moret
smoret@uci.edu

> -----Original Message-----
> From: Helge Deller [mailto:deller@gmx.de]
> Sent: Wednesday, November 29, 2000 4:11 PM
> To: Steve Moret
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] HP 9000/735-125
>
> I really would like to get the parallel-port problems on ASP get fixed as
> soon as possible.
> Could you please mail me your bootlog (with parport enabled), so
> I can try to
> track down the problem.
> Maybe you can also check out CVS again, and test if this version
> works for
> you ?
