From: "=?iso-8859-7?q?=CC=DC=F1=E9=EF=F2=20=CA.?=" <marios_hellas_23@yahoo.gr>
Subject: [parisc-linux] [RE:] Installation Prolblem on model 712
Date: Fri, 4 Mar 2005 11:21:12 +0000 (GMT)
Message-ID: <20050304112112.57017.qmail@web26809.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1532192685=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1532192685==
Content-Type: multipart/alternative; boundary="0-444901336-1109935272=:54695"
Content-Transfer-Encoding: 8bit

--0-444901336-1109935272=:54695
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: 8bit


This is my dmesg output

The model is 712-60 and not 612

I am begging to suspect the error vomes from the cd-rom

It is a very old cd-rom.

The cd i burned it is good quality and have been written in 4x speed

 

 

SCSI subsystem driver Revision: 1.00

53c700: version 2.6 By James...

SCSI0: 53c710 rev 2

SCSI0: LASI SCSI 53c700

SCSI0: (3:0) Synchronous at offest 8, period 100ns

Vendor: Seagete Model:ST34520N Rev:1444

Type:Direct Access ANSI SCSI revision:02

SCSI0: (5:0) Synchronous at offest 8, period 248ns

Vendor: PIONEER Model:CD-ROM DR-104X Rev:0022

Type:Direct CD-ROM ANSI SCSI revision:02

 

Attached SCSI disk sda at scsi0, channel 0, id 3 lun 0

SCSI device sda: 8888942 512-byte hdwr sectroe (4551 MB)

PARTITION CHECK

sda:unknown partition table

Attached SCSI CD-ROM sr0 at scsi0, channel 0, id 5 lun 0

sr0: scsi-1 drive

Uniform CD-ROM driver Revision:3.12

 

RAMDISK: Compressed image found at block 0

EXT2-FS warning: Checktime reached, running e2fsck is recommended

UFS:Mounted root (ext2 filesysstem)

NOT FREEING INITMEM (383K)

VFS:DISK CHANGE DETECTED in DRIVE sr(11,0)

SCSI0 (5:0) New error handler wants to abort command

0x28 88 88 88 88 10 00 00 01 00

SCSI0 (5:0) New error handler wants device to reset

0x28 88 88 88 88 10 00 00 01 00

SCSI0 (5:0) New error handler wants bus reset,cmd 13d14c00

0x28 88 88 88 88 10 00 00 01 00

SCSI0(5:0) Synchronous at offset 8,period 248ms

SCSI0 (5:0) New error handler wants to abort command

0x28 88 88 88 88 10 00 00 01 00

SCSI:device set offline-not ready or command retry failed after bus reset

I/O error: dev 0d:00,sector 64

isofs_read_super:dread failed, dev=0d:00, iso_blunum=16,block=16

SCSI0 (3:0) New error handler wants to abort command

0x28 88 88 88 88 10 00 00 08 00

SCSI0 (3:0) New error handler wants device to reset

0x28 88 88 88 88 10 00 00 08 00

SCSI0 (3:0) New error handler wants bus reset,cmd 13d14c00

0x28 88 88 88 88 10 00 00 08 00

SCSI: device setoffline-not ready or command retry failed

after bus reset:host 0 channel 0 id 3 lin 0




---------------------------------
Do You Yahoo!?
Αποκτήστε την δωρεάν σας@yahoo.gr διεύθυνση  στο Yahoo! Mail.

--0-444901336-1109935272=:54695
Content-Type: text/html; charset=iso-8859-7
Content-Transfer-Encoding: 8bit

<DIV><FONT size=2>
<P>This is my dmesg output</P>
<P>The model is 712-60 and not 612</P>
<P>I am begging to suspect the error vomes from the cd-rom</P>
<P>It is a very old cd-rom.</P>
<P>The cd i burned it is good quality and have been written in 4x speed</P></FONT><FONT face="Courier New" size=2>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>SCSI subsystem driver Revision: 1.00</P>
<P>53c700: version 2.6 By James...</P>
<P>SCSI0: 53c710 rev 2</P>
<P>SCSI0: LASI SCSI 53c700</P>
<P>SCSI0: (3:0) Synchronous at offest 8, period 100ns</P>
<P>Vendor: Seagete Model:ST34520N Rev:1444</P>
<P>Type:Direct Access ANSI SCSI revision:02</P>
<P>SCSI0: (5:0) Synchronous at offest 8, period 248ns</P>
<P>Vendor: PIONEER Model:CD-ROM DR-104X Rev:0022</P>
<P>Type:Direct CD-ROM ANSI SCSI revision:02</P>
<P>&nbsp;</P>
<P>Attached SCSI disk sda at scsi0, channel 0, id 3 lun 0</P>
<P>SCSI device sda: 8888942 512-byte hdwr sectroe (4551 MB)</P>
<P>PARTITION CHECK</P>
<P>sda:unknown partition table</P>
<P>Attached SCSI CD-ROM sr0 at scsi0, channel 0, id 5 lun 0</P>
<P>sr0: scsi-1 drive</P>
<P>Uniform CD-ROM driver Revision:3.12</P>
<P>&nbsp;</P>
<P>RAMDISK: Compressed image found at block 0</P>
<P>EXT2-FS warning: Checktime reached, running e2fsck is recommended</P>
<P>UFS:Mounted root (ext2 filesysstem)</P>
<P>NOT FREEING INITMEM (383K)</P>
<P>VFS:DISK CHANGE DETECTED in DRIVE sr(11,0)</P>
<P>SCSI0 (5:0) New error handler wants to abort command</P>
<P>0x28 88 88 88 88 10 00 00 01 00</P>
<P>SCSI0 (5:0) New error handler wants device to reset</P>
<P>0x28 88 88 88 88 10 00 00 01 00</P>
<P>SCSI0 (5:0) New error handler wants bus reset,cmd 13d14c00</P>
<P>0x28 88 88 88 88 10 00 00 01 00</P>
<P>SCSI0(5:0) Synchronous at offset 8,period 248ms</P>
<P>SCSI0 (5:0) New error handler wants to abort command</P>
<P>0x28 88 88 88 88 10 00 00 01 00</P>
<P>SCSI:device set offline-not ready or command retry failed after bus reset</P>
<P>I/O error: dev 0d:00,sector 64</P>
<P>isofs_read_super:dread failed, dev=0d:00, iso_blunum=16,block=16</P>
<P>SCSI0 (3:0) New error handler wants to abort command</P>
<P>0x28 88 88 88 88 10 00 00 08 00</P>
<P>SCSI0 (3:0) New error handler wants device to reset</P>
<P>0x28 88 88 88 88 10 00 00 08 00</P>
<P>SCSI0 (3:0) New error handler wants bus reset,cmd 13d14c00</P>
<P>0x28 88 88 88 88 10 00 00 08 00</P>
<P>SCSI: device setoffline-not ready or command retry failed</P>
<P>after bus reset:host 0 channel 0 id 3 lin 0</P></FONT></DIV><p><br><hr size=1><b>Do You Yahoo!?</b><br>Αποκτήστε την δωρεάν σας
@yahoo.gr διεύθυνση  στο 
<a href="http://www.otenet.gr/">Yahoo! Mail</a>.<br>
--0-444901336-1109935272=:54695--

--===============1532192685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1532192685==--
