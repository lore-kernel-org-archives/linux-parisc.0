Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29A0B482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 06:44:41 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 162BxV-0000gY-00
	for parisc-linux@lists.parisc-linux.org; Fri, 09 Nov 2001 15:44:37 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 162ByH-00020w-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 09 Nov 2001 15:45:25 +0200
Date: Fri, 9 Nov 2001 15:45:25 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011109154525.A7672@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Subject: [parisc-linux] palo problems
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

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello parisc-linux,

I can't quite get palo to boot a kernel from disk. My bootup progresses
as follows:

(c) Copyright.  Hewlett-Packard Company.  1991.
All rights reserved.

PDC ROM rev. 2.3
IODC ROM rev. 2.2
96 MB of memory configured and tested.

Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.3.0                 QUANTUM PD425S
P1                    scsi.2.0                 MICROP  1528-15MD1066702
P2                    lan.0000e8-e5fdeb.0.0    dogbert

b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: s

Searching for Devices with Bootable Media.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type and Utilities
----------------------------------------------------------------------------

P0                    scsi.2.0                 MICROP  1528-15MD1066702
                                                   IPL
P1                    lan.0000e8-e5fdeb.3.6    dogbert
                                                   IPL

Enter boot selection, (h)elp, or e(x)it: p0

Trying scsi.2.0
Boot path initialized.
Attempting to load IPL.

Hard booted.
palo ipl 0.95 root@geordi Tue Oct 16 20:04:23 MDT 2001
0/vmlinux32 2975629 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      18   f0 Palo
2              19    1163   83 ext2
3            1164    1279   82 swap

Command line: 'HOME=3D/ TERM=3Dlinux console=3Dtty'

Kernel: partition 2 file /boot/vmlinux
ext2 block size 4096
ext2_mount(partition 2) returns 0
Opening /boot/vmlinux
ext2_open(/boot/vmlinux) =3D 3
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1604596 mediaptr 0x1000
Segment 1 load 00288000 size 273544 mediaptr 0x189000
Segment 2 load 002cc000 size 355324 mediaptr 0x1cc000
Segment 3 load 00324000 size 8192 mediaptr 0x223000
Segment 4 load 00328000 size 32768 mediaptr 0x225000
Segment 5 load 00363a3c size 83120 mediaptr 0x22da3c
branching to kernel entry point 0x00100000

Then it seems to hang there. If I boot from the network, everything
works fine (and fast).

My /etc/palo.conf contains the following:

bob:/home/fullung# cat /etc/palo.conf=20
--commandline=3D2/boot/vmlinux HOME=3D/ TERM=3Dlinux console=3Dtty
--recoverykernel=3D/boot/vmlinux
--init-partitioned=3D/dev/sda

Relevant fdisk output:

bob:/home/fullung# fdisk /dev/sda

Command (m for help): p

Disk /dev/sda: 42 heads, 61 sectors, 1023 cylinders
Units =3D cylinders of 2562 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1        15     19184+  f0  Linux/PA-RISC boot
/dev/sda2            16       930   1172115   83  Linux
/dev/sda3           931      1023    119133   82  Linux swap

bob:/home/fullung# uname -a
Linux bob 2.4.9-pa79 #1 Fri Nov 9 13:36:26 UTC 2001 parisc unknown

Thanks.

Regards,

Albert

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE76930Dg+hOeRZtkMRAg25AJwKY/dYzsDzZ8uGqE2KVw0DvE4legCfWvRg
drhFMH/vJobE+4q+Kx3wWA8=
=wmwV
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
