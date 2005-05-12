From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] NFS problems : kernel panic
Date: Thu, 12 May 2005 14:46:17 +0200
Message-ID: <20050512144617.5b3569d9.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0838917233=="
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

--===============0838917233==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__12_May_2005_14_46_17_+0200_nTBTqXZEi+STk/_j"

--Signature=_Thu__12_May_2005_14_46_17_+0200_nTBTqXZEi+STk/_j
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello guys,

Many users are reporting me problems with kernel after 2.6.10-pa11. I've
had the problem myself on both my C3600 and my B180L.
When you upload or download big files via NFS, the kernel crash with no
more message than :
Kernel panic - not syncing

The nfs share can be either udp or tcp. That doesn't matter.

Is this a know problem ? Is there a workaround (don't tell me samba :) ?

Feel free to ask if you want more info or if you want me to do some
tests.


Cheers

--=20
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team


--Signature=_Thu__12_May_2005_14_46_17_+0200_nTBTqXZEi+STk/_j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCg1AbrpShrnoH4YYRAsbWAKCHR1BDSlv+k0FgUAYoGqeACCXOZgCggd5s
Qf8s/A4SZxF2cbzXV8lNilA=
=ygt8
-----END PGP SIGNATURE-----

--Signature=_Thu__12_May_2005_14_46_17_+0200_nTBTqXZEi+STk/_j--

--===============0838917233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0838917233==--
