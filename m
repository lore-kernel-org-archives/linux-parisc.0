Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BAE0482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Jan 2003 13:39:35 -0700 (MST)
Received: from gfrw1044.bocc.de (pD9E27708.dip.t-dialin.net [217.226.119.8])
	(authenticated)
	by mail.scram.de (8.11.6+3.4W/8.11.0) with ESMTP id h0VKdW928271
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Jan 2003 21:39:33 +0100 (CET)
Date: Fri, 31 Jan 2003 21:38:59 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0301312101170.10291-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SCSI problem on 9000/720
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

Hi,

today, i noticed the following message in my dmesg (boot info retained):

Linux version 2.4.20-pa18 (root@ebru) (gcc version 3.0.4) #7 Wed Jan 1
18:09:15
CET 2003
FP[0] enabled: Rev 3 Model 0
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00002000 00000481 00000000 00000000 052e3468 000011f4 00000004
0000000d 00
000000
vers  00000003
model 9000/720
[...]
53c700: consistent memory allocation failed
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: TEAC      Model: FC-1     HF   07  Rev: RV A
  Type:   Direct-Access                      ANSI SCSI revision: 01 CCS
  Vendor: IBM       Model: DCAS-34330        Rev: S61A
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi removable disk sda at scsi0, channel 0, id 3, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
sda : READ CAPACITY failed.
sda : status = 1, message = 00, host = 0, driver = 08
Current sd00:00: sns = 70  2
ASC= 4 ASCQ= 0
Raw sense data:0x70 0x00 0x02 0x00 0x00 0x00 0x00 0x08 0x00 0x00 0x00 0x00
0x04
0x00 0x00 0x00
sda : block size assumed to be 512 bytes, disk size 1GB.
Partition check:
 sda: I/O error: dev 08:00, sector 0
 I/O error: dev 08:00, sector 0
 unable to read partition table
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sdb: 8467200 512-byte hdwr sectors (4335 MB)
 sdb: sdb1 sdb2 sdb3 sdb4
[...] [sda is floppy, sdb is hard disk]
scsi0 (6:0) Target is suffering from tag starvation.
scsi0: (6:0) phase mismatch at 0228, phase IO BSY REQ DATA_IN
scsi0: Bus Reset detected, executing command 1034c800, slot 10361390, dsp
003602
28[0228]
 failing command because of reset, slot 10360520, cmnd 1034b600
 failing command because of reset, slot 10360654, cmnd 1034bc00
 failing command because of reset, slot 10360788, cmnd 1034a400
 failing command because of reset, slot 103608bc, cmnd 1034ca00
 failing command because of reset, slot 10360b24, cmnd 1034ce00
 failing command because of reset, slot 10360c58, cmnd 1034b000
 failing command because of reset, slot 10360d8c, cmnd 1034be00
 failing command because of reset, slot 10360ec0, cmnd 1034cc00
 failing command because of reset, slot 10360ff4, cmnd 1034ba00
 failing command because of reset, slot 10361128, cmnd 1034a000
 failing command because of reset, slot 1036125c, cmnd 1034b800
 failing command because of reset, slot 10361390, cmnd 1034c800
 failing command because of reset, slot 103614c4, cmnd 1034a200
 failing command because of reset, slot 103615f8, cmnd 1034b400
 failing command because of reset, slot 1036172c, cmnd 1034c600
scsi0 (6:0) broken device is looping in contingent allegiance: ignoring
scsi0 (6:0) New error handler wants to abort command
        0x2a 00 00 41 7b e7 00 00 08 00
scsi0 (6:0) New error handler wants to abort command
        0x28 00 00 6e 89 4f 00 00 08 00
scsi0 (6:0) New error handler wants to abort command
        0x2a 00 00 15 7e 1f 00 00 08 00
scsi0 (6:0) New error handler wants to abort command
        0x2a 00 00 3d 7c 4f 00 00 08 00
scsi0 (6:0) New error handler wants to abort command
        0x2a 00 00 0d 7c a7 00 00 08 00
scsi0 (6:0) New error handler wants to abort command
        0x2a 00 00 1d 7b cf 00 00 08 00
scsi0 (6:0) New error handler wants device reset
        0x2a 00 00 41 7b e7 00 00 08 00
scsi0 (6:0) New error handler wants BUS reset, cmd 1034a400
        0x2a 00 00 41 7b e7 00 00 08 00
scsi0: Bus Reset detected, executing command 00000000, slot 00000000, dsp
003604
a8[04a8]
 failing command because of reset, slot 10360ff4, cmnd 1034be00
 failing command because of reset, slot 10361128, cmnd 1034b000
 failing command because of reset, slot 1036125c, cmnd 1034ce00
 failing command because of reset, slot 10361390, cmnd 1034ca00
 failing command because of reset, slot 103614c4, cmnd 1034a400
 failing command because of reset, slot 103615f8, cmnd 1034bc00
SCSI disk error : host 0 channel 0 id 6 lun 0 return code = 8000002
Current sd08:13: sns = 70  0
Raw sense data:0x70 0x00 0x00 0x00 0x00 0x00 0x00 0x18 0x00 0x00 0x00 0x00
0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff
0x00
0x00 0x00 0x00
 I/O error: dev 08:13, sector 3145816

It's the phase mismatch stuff which is scaring me quite a bit ;-). It
could have been a defective sector which has been remapped (a disk scan
didn't show any problem) as a result of the a error, but then i would have
expected a simple IO error without that bus reset just before the problem.

Weird...

--jochen
