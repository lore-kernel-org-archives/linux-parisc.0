Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A12B483F
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 17:28:22 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15oCTy-0006EO-00
	for parisc-linux@lists.parisc-linux.org; Tue, 02 Oct 2001 01:28:18 +0200
Date: Tue, 2 Oct 2001 01:27:23 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] woody install on 720/50
Message-ID: <20011002012722.B31659@dogbert.localdomain>
References: <20011001175425.A31305@dogbert.localdomain> <20011002082429.C1965@silly.cloud.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
In-Reply-To: <20011002082429.C1965@silly.cloud.net.au>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 02 Oct 2001, Hamish Moffatt wrote:

> On Mon, Oct 01, 2001 at 05:54:25PM +0200, Albert Strasheim wrote:
> > After applying Jurij's latest patch, and creating a new Debian bootdisk
> > lifimage with it, I booted it up and tried the Debian install again.
>=20
> Hmm, is that easy to do? I need to build a new kernel from the CVS
> sources for my D350, and it would be easiest to build a new CD
> to boot from rather than to boot the new kernel over the network.

I've think I've tried to convey the following command to you in about 3
different threads across 2 mailing lists :-)

Get palo-latest.tar.gz (about 62 KB) from puffin.external.hp.com,
compile that, cross-compile your kernel and then run the following:

(linux/ contains the kernel and palo/ contains the bootloader)

palo/palo/palo -f /dev/null -k linux/vmlinux -r root.bin -s lifimage \
  -b palo/iplboot -c "0/linux HOME=3D/ root=3D/dev/ram initrd=3D0/ramdisk"

What this does is the following:

palo takes the kernel (vmlinux (with Jurij's patches in my case)), the
latest Debian rootdisk (root.bin), puts them together and creates a
lifimage for you to boot via rbootd or tftpd (depending on your model).

Tada!

Have fun,

Albert

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7uPvaDg+hOeRZtkMRAjZTAJ99u1ELqyVQmlL7VOr8QDL9+z8RzQCdEGjb
DLjJzKknOYxeJtdllgK9/ps=
=Jpd2
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
