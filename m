Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57B73482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Dec 2001 10:25:47 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #6)
	id 16Awqd-0001NH-00
	for parisc-linux@lists.parisc-linux.org; Mon, 03 Dec 2001 19:25:43 +0200
Date: Mon, 3 Dec 2001 19:26:07 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Joerg Hartmann <j.hartmann@reinarts.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] init error on a 720
Message-ID: <20011203192606.A499@dogbert.localdomain>
References: <200112030820.JAA20988@post.webmailer.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
In-Reply-To: <200112030820.JAA20988@post.webmailer.de>
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

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Joerg,

I got my 720/50 up and running with 2.4.9-pa70 or thereabouts.
2.4.14-pa2 also worked fine. Haven't had time to test the newest kernel
yet. I suggest you check the parisc-linux archives. I was quite verbal
in my quest to get my 720/50 going. :-)

Basically, I did the following:

1. Enable the serial console
2. Create a new nfsroot by hacking the debootstrap scripts on my i386. I
   had to use some special debs here, but I believe they are now in
   unstable.
3. Cross-compile the latest kernel using xc-latest, and make a lifimage
   with palo.
4. Netboot the lifimage with bootpd/rbootd and mount the nfsroot created
   in step 2 read-write.
5. fdisk and mke2fs the partitions (remember the partition for palo!) I
   wanted to install on.
6. Manually walk through the debootstrap and install all the packages I
   required on the new mounted partition (you use a chroot sometimes).
7. Install palo.
8. Reboot. apt-get update. apt-get upgrade.

Or you could just wait for the 0.9.3 ISO which is out/will be out
shortly.

Regards,

Albert


On Mon, 03 Dec 2001, Joerg Hartmann wrote:

> Hello Guru's,
>=20
> as you guess, i like to install Linux on a HP Workstation.
> It is an hp9000 model 720.
> And here the problem starts - on some websites is stated that pa-risc=20
> linux will never work on 720's  on some other sites i can read it does !
> Maybe it depends - but on what ?=20
>=20
> So i took the 0.9.2 iso-image from www.parisc-linux.org and tried an=20
> installation. After switching to serial console i could see the kernel=20
> coming up until it has to start "init" - than it loops forever with
>=20
> handle_interruption() pid=3D1 command=3D'init'
>=20
> On the list archive i found, that some other people had the same problem,=
=20
> even with 720 models.  But i could not find a solution which works for me.
> If there is one , could you please tell me where to RTFM ?
>=20
> Here are some hardware infos :
>=20
> Found devices:
> 1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77, 0x0,=
=20
> 0x0
> 2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
> 3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
> 4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72,=20
> 0x0, 0x0
> 5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73, 0x0, 0x0
> 6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75, 0x0, 0x0
> 7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75, 0x0, 0x0
> 8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74,=20
> 0x0, 0x0
> 9. Cobra (720) (0) at 0xfffbe000, versions 0x200, 0x0, 0x4, 0x0, 0x81
> 10. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9, 0x0, 0x0
> That's a total of 10 devices.
> CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
>=20
> And there is a second problem with the scsi bus :
>=20
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
> scsi0: Revision 0x0
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
> scsi0: Unable to abort command for target 0
> scsi0: Unable to send Bus Device Reset for target 0
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> scsi0: istat =3D 0c, sstat0 =3D 00, sstat1 =3D 00, dstat =3D 00
> scsi0: dsp =3D 0b8f8058 (script[0x0016]), dsps =3D 0b8f8cee, target =3D 0
> scsi0: Failing command for ID0
> scsi0: Unable to abort command for target 0
> scsi0: Unable to abort command for target 1
> scsi0: Unable to send Bus Device Reset for target 1
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> scsi0: istat =3D 0c, sstat0 =3D 00, sstat1 =3D 00, dstat =3D 00
> scsi0: dsp =3D 0b8f8058 (script[0x0016]), dsps =3D 0b8f8cee, target =3D 0
> scsi0: Failing command for ID0
>   Vendor: IBM       Model: CDRM00203     !K  Rev: BZ33
>   Type:   CD-ROM                             ANSI SCSI revision: 02
>   Vendor: HP        Model: HP35480A          Rev: TI00
>   Type:   Sequential-Access                  ANSI SCSI revision: 02
>   Vendor: HP        Model: 97560             Rev: 0BW2
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
> SCSI device sda: 2647080 512-byte hdwr sectors (1355 MB)
> Partition check:
>  sda: unknown partition table
>=20
> I realy hope you can point me to the right direction.=20
> If i can not  get linux up and running on that box, this computer will be=
=20
> put in the waste basket :-(
>=20
> regards
> 			J=F6rg Hartmann
> --=20
> Joerg Hartmann
> j.hartmann@reinarts.de
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8C7WuDg+hOeRZtkMRAuMAAKCA4en6QyH1wTZPblBCZWNhR/8BQQCdHXNZ
J06jMqfhZBd+mOJJfTfP1AA=
=ZLke
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
