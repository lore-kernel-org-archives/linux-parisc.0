From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] [RE:] Installation Prolblem on model 712
Date: Fri, 4 Mar 2005 07:37:18 -0600
Message-ID: <200503040737.18635.mszick@wolfbutter.com>
References: <20050304112112.57017.qmail@web26809.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050304112112.57017.qmail@web26809.mail.ukl.yahoo.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri March 4 2005 05:21, =CE=9C=CE=AC=CF=81=CE=B9=CE=BF=CF=82 =CE=9A. wro=
te:
>=20
> This is my dmesg output
>=20
> The model is 712-60 and not 612
>=20
> I am begging to suspect the error vomes from the cd-rom
>=20
Possible, but the installer read the kernel and the=20
initial ram-disk from it.


> It is a very old cd-rom.
>=20
> The cd i burned it is good quality and have been written in 4x speed
>=20
What kernel is this?
These messages look as if they are from a very old kernel.


> =20
>=20
> =20
>=20
> SCSI subsystem driver Revision: 1.00
>=20
> 53c700: version 2.6 By James...
>=20
> SCSI0: 53c710 rev 2
>=20
> SCSI0: LASI SCSI 53c700
>=20
> SCSI0: (3:0) Synchronous at offest 8, period 100ns
>=20
> Vendor: Seagete Model:ST34520N Rev:1444
>=20
> Type:Direct Access ANSI SCSI revision:02
>=20
> SCSI0: (5:0) Synchronous at offest 8, period 248ns
>=20
> Vendor: PIONEER Model:CD-ROM DR-104X Rev:0022
>=20
> Type:Direct CD-ROM ANSI SCSI revision:02
>=20
> =20
>=20
> Attached SCSI disk sda at scsi0, channel 0, id 3 lun 0
>=20
> SCSI device sda: 8888942 512-byte hdwr sectroe (4551 MB)
>=20
> PARTITION CHECK
>=20
> sda:unknown partition table
>
Expected, the install kernel does not know hp-ux disks.


>=20
> Attached SCSI CD-ROM sr0 at scsi0, channel 0, id 5 lun 0
>=20
> sr0: scsi-1 drive
>=20
> Uniform CD-ROM driver Revision:3.12
>=20
> =20
>=20
> RAMDISK: Compressed image found at block 0
>=20
> EXT2-FS warning: Checktime reached, running e2fsck is recommended
>=20
Expected, side effect of how ram disks are built.


> UFS:Mounted root (ext2 filesysstem)
>=20
The following seem to be from an old kernel.
Perhaps someone else on list can give more detail
than myself.


> NOT FREEING INITMEM (383K)
>=20
> VFS:DISK CHANGE DETECTED in DRIVE sr(11,0)
>=20
> SCSI0 (5:0) New error handler wants to abort command
>=20
> 0x28 88 88 88 88 10 00 00 01 00
>=20
> SCSI0 (5:0) New error handler wants device to reset
>=20
> 0x28 88 88 88 88 10 00 00 01 00
>=20
> SCSI0 (5:0) New error handler wants bus reset,cmd 13d14c00
>=20
> 0x28 88 88 88 88 10 00 00 01 00
>=20
> SCSI0(5:0) Synchronous at offset 8,period 248ms
>=20
> SCSI0 (5:0) New error handler wants to abort command
>=20
> 0x28 88 88 88 88 10 00 00 01 00
>=20
> SCSI:device set offline-not ready or command retry failed after bus reset
>=20
> I/O error: dev 0d:00,sector 64
>=20
> isofs_read_super:dread failed, dev=3D0d:00, iso_blunum=3D16,block=3D16
>=20
> SCSI0 (3:0) New error handler wants to abort command
>=20
> 0x28 88 88 88 88 10 00 00 08 00
>=20
> SCSI0 (3:0) New error handler wants device to reset
>=20
> 0x28 88 88 88 88 10 00 00 08 00
>=20
> SCSI0 (3:0) New error handler wants bus reset,cmd 13d14c00
>=20
> 0x28 88 88 88 88 10 00 00 08 00
>=20
> SCSI: device setoffline-not ready or command retry failed
>=20
> after bus reset:host 0 channel 0 id 3 lin 0
>=20
>=20
>=20
>=20
> ---------------------------------
> Do You Yahoo!?
> =EF=BE=81=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BE=9E=EF=BF=BD=EF=BF=BD=
=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BE=9C=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD@yahoo.gr =EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD  =EF=BF=BD=
=EF=BF=BD=EF=BF=BD Yahoo! Mail.
>=20
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
