Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40AA44842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 10:07:59 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15mdbl-0001Jd-00
	for parisc-linux@lists.parisc-linux.org; Thu, 27 Sep 2001 18:01:53 +0200
Date: Thu, 27 Sep 2001 18:01:07 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FW SCSI on the D350
Message-ID: <20010927180107.B21482@dogbert.localdomain>
References: <20010928001354.A1519@silly.cloud.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
In-Reply-To: <20010928001354.A1519@silly.cloud.net.au>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

When in doubt, boot a brand-new kernel. :-)

I suggest downloading the latest CVS snapshot from
puffin.external.hp.com, then cross-compile it according to the
instructions on http://parisc-linux.org/. Basically just add the
xc-latest.tar.gz (the cross-compiler) binaries to your path, then make
mrproper; make oldconfig (possibly making some changes here...
someone?), make dep, make clean, make palo.

Now, grab the latest Debian root.bin, and do the following:

 palo -f /dev/null -k vmlinux -r root.bin -s lifimage \
        -c "0/linux HOME=3D/ root=3D/dev/ram initrd=3D0/ramdisk"

(and perhaps -b iplbool)

where vmlinux is the new kernel you compiled, root.bin is the latest
Debian HPPA root disk) and lifimage is the lifimage make palo made.

Now merrily netboot this lifimage and try installing from the CD (or
network perhaps).

Assuming it works, you'll need to overwrite the kernel the installer=20
drops in /boot with your new vmlinux, or rerun palo without the
root.bin and initrd parts, and with root=3D/dev/sdaN and netboot that=20
kernel.

Did I miss anything?

Regards,

Albert

P.S. Thanks to Richard Hirst who provided me with much of this
information on a prior occasion.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7s01DDg+hOeRZtkMRAgIrAJ0cUs38SkIeDFvyr+YJhbqiBvn2rACff5Oy
+0rTvttBNVCTXA7+tRDA4wc=
=UMpr
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
