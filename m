Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 005B2482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:27:27 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sPl2-0004LF-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 16:27:20 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15sPl0-00012V-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 16:27:18 +0200
Date: Sat, 13 Oct 2001 16:27:18 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011013162718.B3604@dogbert.localdomain>
References: <20011013162103.A3604@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
In-Reply-To: <200110082146.PAA00640@puffin.external.hp.com>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
List-ID: <linux-parisc.vger.kernel.org>

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Terribly sorry about that message. mutt is acting up. Intended message:

Hello all,

I just gave 2.4.9-pa53 a spin on my 720/50, wanting to see if perhaps
some random phenomena will allow me to complete the installation. The
Debian installer informed me that I had no disks connected, so I went
back and examined the bootup messages. The relevant portions:

=2E..
Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 MICROP  1528-15MD1066702
P1                    lan.0000e8-e5fdeb.0.0    dogbert
=2E..
Linux version 2.4.9-pa53 (s13640887@bach.sun.ac.za) (gcc version 3.0.2 2001=
0829
(prerelease)) #2 Sat Oct 13 15:42:01 SAST 2001
=2E..
CPUID   vers 0 rev 0
model   9000/720
=2E..
Kernel command line: HOME=3D/ root=3D/dev/ram console=3DttyS0 TERM=3Dvt102
=2E.. ( don't know if this was there before, but anyway: )
STI byte mode ROM at f8000000, hpa=3Df8000000
STI byte mode ROM, id 26d1488c-40a00499, conforms to spec rev. 8.02
STI device: HPA1924A
=2E..
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 25 4B E1 IRQ 87.
82596.c $Revision: 1.23 $
SCSI subsystem driver Revision: 1.00
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64
=2E..

No disks?

In my .config (obtained with make oldconfig) I have:

CONFIG_SCSI=3Dy
CONFIG_BLK_DEV_SD=3Dy
CONFIG_SD_EXTRA_DEVS=3D40
CONFIG_CHR_DEV_ST=3Dy
CONFIG_SR_EXTRA_DEVS=3D2
CONFIG_CHR_DEV_SG=3Dy
CONFIG_SCSI_ZALON=3Dy
CONFIG_SCSI_SYM53C8XX=3Dy
CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=3D8
CONFIG_SCSI_NCR53C8XX_MAX_TAGS=3D32
CONFIG_SCSI_NCR53C8XX_SYNC=3D20

Did I miss anything or is there something amiss with the driver? :-)

Regards,

Albert

On Mon, 08 Oct 2001, Richard Hirst wrote:

> CVSROOT:	/home/cvs/parisc
> Module name:	linux
> Changes by:	rhirst	01/10/08 15:46:04
>=20
> Modified files:
> 	.              : Makefile=20
> 	drivers/scsi   : Config.in Makefile=20
> 	arch/parisc/debian-configs: 32 64 default=20
> Added files:
> 	drivers/scsi   : 53c700.c 53c700.h 53c700.scr NCR_D700.c=20
> 	                 NCR_D700.h README.53c700 lasi700.c lasi700.h=20
>=20
> Log message:
> New driver from James Bottomley for 53c700 and 53c710.  Much improved
> over sim700.c, and already mostly in Linus' tree.  Major differences
> are support for sync working where the chip supports it, tagged
> commands, and disconnect/reselect works (sim700 had problems on
> 53c700, requiring that people booted with sim700=3Dnodisc:0xff).
> I've left the old driver in the source for now, just commented out its
> Config question.  Will remove it completely if there are no problems.
> Tested on 712, 715/50, 715/75, B180, C360 (32 and 64 bit kernels).

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7yE9GDg+hOeRZtkMRAvqSAKCQd5HEv2ZozWA7eSuO3a2+eBqgBQCeI0V+
LlJ5VOhubQ1HlbudfQd50JQ=
=Vn0z
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
