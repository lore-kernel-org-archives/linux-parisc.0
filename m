From: John David Anglin <dave.anglin@bell.net>
Subject: scsi: Wrong diagnostic page; asked for 1 got 8
Date: Sun, 15 Oct 2017 18:33:09 -0400
Message-ID: <B53C874B-D705-498B-8677-CBA2A5842010@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I noticed the following scsi boot issues with v4.13.7:

[    8.961944] scsi 3:0:0:0: Direct-Access     WD       My Passport 0748 1022 PQ: 0 ANSI: 
6
[    8.964334] scsi 3:0:0:1: Enclosure         WD       SES Device       1022 PQ: 0 ANSI: 
6
[    9.062546] sd 3:0:0:0: [sda] Spinning up disk...
[   10.080033] .[   10.436010] scsi 2:0:0:0: Direct-Access     SEAGATE  ST3300007LC      D705 PQ
: 0 ANSI: 3
[   10.436010] scsi target2:0:0: tagged command queuing enabled, command queue depth 16.
[   10.436010] scsi target2:0:0: Beginning Domain Validation
[   10.443210] scsi target2:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[   10.451755] scsi target2:0:0: Ending Domain Validation
[   10.453274] sd 2:0:0:0: [sdb] 585937500 512-byte logical blocks: (300 GB/279 GiB)
[   10.458212] sd 2:0:0:0: [sdb] Write Protect is off
[   10.458212] sd 2:0:0:0: [sdb] Mode Sense: ab 00 10 08
[   10.460232] sd 2:0:0:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO 
and FUA
[   10.493071]  sdb: sdb1
[   10.528764] sd 2:0:0:0: [sdb] Attached SCSI disk
[   12.053526] scsi 3:0:0:1: Wrong diagnostic page; asked for 1 got 8
[   12.053707] scsi 3:0:0:1: Failed to get diagnostic page 0xffffffea
[   12.053696] ready
[   12.054129] scsi 3:0:0:1: Failed to bind enclosure -19
[   12.054363] ses 3:0:0:1: Attached Enclosure device
[   12.054495] sd 3:0:0:0: [sda] 3906963456 512-byte logical blocks: (2.00 TB/1.82 TiB)
[   12.062494] sd 3:0:0:0: [sda] Write Protect is off
[   12.062494] sd 3:0:0:0: [sda] Mode Sense: 47 00 10 08[   12.063619] sd 3:0:0:0: [sda] No Caching mode page found
[   12.066860] sd 3:0:0:0: [sda] Assuming drive cache: write through
[   12.104257]  sda: sda1 sda2
[   12.151862] sd 3:0:0:0: [sda] Attached SCSI disk

Haven't seen this before.

Dave
--
John David Anglin	dave.anglin@bell.net



