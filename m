Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA10166
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 06:13:01 -0600
Date: 5 Oct 2000 12:13:46 -0000
Message-ID: <20001005121346.23782.qmail@mailserv2.iuinc.com>
Received: from y18626 ([10.108.21.26]) by smtp.huawei.com
          (Netscape Messaging Server 4.15) with SMTP id G1YHI902.E10 for
          <parisc-linux@thepuffingroup.com>; Thu, 5 Oct 2000 20:03:45 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: parisc-linux@thepuffingroup.com
From: yuqian <yuqian@huawei.com>
Subject: [parisc-linux] bug report on Sym53C895a or config error?
List-ID: <linux-parisc.vger.kernel.org>

Hi.
For xc not available yet, I download Image-testcpu(2000-10-02) 
as my net-boot kernel, my HP box is HP B2000 (9000/785) with 
NCR53C8x SCSI card. At first all is OK, but the follow message is 
reported during mouting root fs, is it a bug or just that kernel's 
config not match my box?
Thanks.
BTW: Is xc not available for HP-UX 10.20 yet?
(When I type 'configure --target hppa-linux' for glibc, it told me this
is not supported yet.)
And: How can I get more information (like instruction, registers value ...)
for bug report?
--------------------------------------------------------------------
sym53c895a-0-<6,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c895a-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdb: hdwr sector= 512 bytes. Sectors= 17773524 [8678 MB] [8.7 GB]
 sdb: unknown partition table
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI
endLinux Tulip driver version 0.9.8 (July 13, 2000)
pcibios_enable_device: Enabling device 00:0c.0 (0057 -> 0157)
eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:10:83:FD:CF:86, IRQ 514.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
request_irq(514, c01afb04, 0x4000000, eth0, c7f2d000)
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 10.108.21.26, my address is 10.108.21.3
kmem_create: Forcing size word alignment - nfs_fh
VFS: Mounted root (ext2 filesystem) readonly.
Warning: unable to open an initial console.
execve /sbin/init c0274008 c0274030
Kernel panic: sba_iommu.c:sba_alloc_range() I/O MMU is out of mapping resources

Kernel panic: sba_iommu.c:sba_alloc_range() I/O MMU is out of mapping resources

Kernel panic: sba_iommu.c:sba_alloc_range() I/O MMU is out of mapping resources

Kernel panic: sba_iommu.c:sba_alloc_range() I/O MMU is out of mapping resources

scsi : aborting command due to timeout : pid 0, scsi0, channel 0, id 5, lun 0 0
sym53c8xx_abort: pid=0 serial_number=54 serial_number_at_timeout=54
