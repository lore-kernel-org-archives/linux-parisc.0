From: SteX <stefano.melchior@fastwebnet.it>
Subject: [mc - Midnight Commander] new release for hppa
Date: Sun, 13 Feb 2005 23:24:35 +0100
Message-ID: <20050213222435.GC8205__44756.3847563744$1416624533$gmane$org@SteX>
Mime-Version: 1.0
Content-Type: multipart/signed;
  micalg=pgp-sha1;
  protocol="application/pgp-signature";
  boundary="TiqCXmo5T1hvSQQg"
Cc: parisc-linux@parisc-linux.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <Zvw0D.A.jCH.WP9DCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
I just finished the new pre-release (4.6.0-4.6.1-pre3) mc package for
Debian HPPA. I would like someone to take a look and eventually to give
some suggestion for its improvement.
You can apt-get both source and binary adding the following line in
/etc/apt/sources.list:

deb http://www.openlabs.it/~stex/debian ./
deb-src http://www.openlabs.it/~stex/debian ./

It has also been available for i386 and powerpc.
I would also like to submit a doubt: I used an HP9000/785 (C3k)
workstation for my work. How can I be sure that I compiled it as 32-bit
system binary of 64-bit system binary? If I remember well this C3k is a
64bit workstation, isn't it?

Thank you in advance for your precious help.

Regards

SteX

--=20
GPG key =3D D52DF829   --   Stex   --  <stefano.melchior@openlabs.it>
Keyserver: http://keyserver.kjsl.com - http://www.openlabs.it/~stex
Registered user #324592 on the Linux Counter, http://counter.li.org

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iQCVAwUBQg/To4lnkxrVLfgpAQK7KwQAtWee2B+v16y74vsxMKtqVsU85QUGqTk7
5boHC2BKyhVhqr8s4+C30L/QkPHRdLwOK5I1ImdMGwyrUxlA+0Fy+Yxvzw13ANlo
bd0mKUWKEOaZgIb2AroduW44Aa1UAY1EpzHvRtqu1LHtDJ+Ygz4fcbxQuM5g5Ugx
M7a/vZmrX94=
=Iw1Q
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
