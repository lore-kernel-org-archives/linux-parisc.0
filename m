Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 835384855
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 09:58:43 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15oRw4-0006PW-00
	for parisc-linux@lists.parisc-linux.org; Tue, 02 Oct 2001 17:58:20 +0200
Date: Tue, 2 Oct 2001 17:56:24 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] woody install on 720/50
Message-ID: <20011002175624.A32452@dogbert.localdomain>
References: <20011001175425.A31305@dogbert.localdomain> <20011002082429.C1965@silly.cloud.net.au> <20011002012722.B31659@dogbert.localdomain> <20011002204531.A3317@silly.cloud.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
In-Reply-To: <20011002204531.A3317@silly.cloud.net.au>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

The palo README has some information on this. I quote:

                     Creating ISO9660 Bootable CD-ROMs

   Bootable CDs are often used for installation. In short the process is:
    1. Master your CD image but don't burn it. The image MUST containthe
       kernel(s), iplboot, and ramdisk file (if used).
    2. Run palo to make the image bootable:
        ./palo  -k path/to/vmlinux \
                -b iplboot \
                -c '0/vmlinux ....' \
                -C your-iso-image
       -C   tells   palo   to  prepare  a  CD-ROM  image.  'iplboot' and
       'path/to/vmlinux'  must  be exactly the same files (same contents)
       you  previously  copied  into  the future root file system or palo
       will  fail.  I usually point those paths at the exact files in the
       directory from which I mastered the CD just to be sure.
    3. Burn the CD and boot it.

   CD-ROM support at the moment is a bit of a hack. Here's how it works.

Read the README for some more info. I haven't tried this since my
(probably VERY old) SCSI CD-ROM drive won't read RW discs.

Regards,

Albert

On Tue, 02 Oct 2001, Hamish Moffatt wrote:

> On Tue, Oct 02, 2001 at 01:27:23AM +0200, Albert Strasheim wrote:
> > I've think I've tried to convey the following command to you in about 3
> > different threads across 2 mailing lists :-)
>=20
> Err, yeah, you have. Sorry about that. Thanks for being patient :-)
>=20
> > Get palo-latest.tar.gz (about 62 KB) from puffin.external.hp.com,
> > compile that, cross-compile your kernel and then run the following:
> >=20
> > (linux/ contains the kernel and palo/ contains the bootloader)
> >=20
> > palo/palo/palo -f /dev/null -k linux/vmlinux -r root.bin -s lifimage \
> >   -b palo/iplboot -c "0/linux HOME=3D/ root=3D/dev/ram initrd=3D0/ramdi=
sk"
> >=20
> > What this does is the following:
> >=20
> > palo takes the kernel (vmlinux (with Jurij's patches in my case)), the
> > latest Debian rootdisk (root.bin), puts them together and creates a
> > lifimage for you to boot via rbootd or tftpd (depending on your model).
>=20
> I'd particularly like to boot from CD if possible. The network boot
> is possible, but less convenient. Is it possible (and not unreasonably
> difficult) to create a new CD with the new kernel?
>=20
>=20
> thanks
> Hamish
> --=20
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ueOoDg+hOeRZtkMRAi0rAJwN0Rvy/Iucq3NdLa2fg2ZGn5HTvwCfUkX6
WuymHWrodP19wlDlxJpOZu8=
=A7XJ
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
