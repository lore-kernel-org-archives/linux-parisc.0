From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] Support for AD1889 PCI Soundchip
Date: Fri, 29 Jul 2005 21:20:12 +0200
Message-ID: <20050729212012.331a692d__1494.77565796605$1416623870$gmane$org@Tatooine.r3z0>
References: <20050729211634.566f5343@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1466400304=="
Cc: alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 kyle@parisc-linux.org
To: perex@suse.cz
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050729211634.566f5343@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1466400304==
Content-Type: multipart/signed;
	boundary="Signature_Fri__29_Jul_2005_21_20_12_+0200_=8HpQnl4oD4cWRP=";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Signature_Fri__29_Jul_2005_21_20_12_+0200_=8HpQnl4oD4cWRP=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Jul 2005 21:16:34 +0200
Thibaut VARENE <T-Bone@parisc-linux.org> wrote:

> Here's the diffstat summary:
>=20
>  MAINTAINERS        |    9
>  sound/pci/Kconfig  |   12
>  sound/pci/Makefile |    2
>  sound/pci/ad1889.c | 1166
> +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/pci/ad1889.h |  187 ++++++++
>  5 files changed, 1376 insertions(+)
>=20

Sorry for replying to myself, forgot the:

Signed-off-by: Thibaut VARENE <varenet@parisc-linux.org>

HTH

Thibaut VARENE
The PA/Linux Team
http://www.pateam.org/

--Signature_Fri__29_Jul_2005_21_20_12_+0200_=8HpQnl4oD4cWRP=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC6oFxHjLD2rfS8GMRAtJ6AJ0U3CXYbAtFGp8tI3R2bf6F1h+wBQCgtu4Z
zYDch5ahVrfDKKs1NT0PXGY=
=M3+A
-----END PGP SIGNATURE-----

--Signature_Fri__29_Jul_2005_21_20_12_+0200_=8HpQnl4oD4cWRP=--

--===============1466400304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1466400304==--
