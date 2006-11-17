From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Thu, 16 Nov 2006 23:59:03 -0500
Message-ID: <200611162359.05014.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
	<200611162316.26872.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1243345199=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611162316.26872.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1243345199==
Content-Type: multipart/signed; boundary="nextPart4086046.Q1Vv3LMnWu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4086046.Q1Vv3LMnWu
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 16 November 2006 23:16, Mike Frysinger wrote:
> ok, just tried glibc-2.5 + hppa + linuxthreads and that is for sure broken
> (the defines for handling locking is all broken in the release)

yeah glibc-2.5 fails as well:
=2E.. -o /var/tmp/portage/cross-hppa2.0-unknown-linux-gnu/glibc-2.5
/work/build-default-hppa2.0-unknown-linux-gnu-nptl/csu/crtn.o
In file included from ../nptl/descr.h:30,
                 from ../ports/sysdeps/hppa/nptl/tls.h:63,
                 from ../include/tls.h:6,
                 from <stdin>:2:
=2E./ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h: In=20
function '__lll_mutex_trylock':
=2E./ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:113: error:=20
expected ':' or ')' before '-' token
=2E..

i leave adding snap updates to GMsoft ... i try to stick with releases sinc=
e i=20
have to help so many arches :/

> what is the minimal binutils/gcc versions for TLS support ?  binutils-2.17
> + gcc-4.1.1 =3D=3D no hppa TLS

upgraded to binutils-2.17.50.0.6 and i got TLS with gcc-4.1.1
=2Dmike

--nextPart4086046.Q1Vv3LMnWu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV1BmEFjO5/oN/WBAQLtIQ//abuyo8k1LUYkoOL7ujtg1nmdwx1yGynM
EXk5CqaPlmggilBggt6D19a3/PbhSKX7K3wZ+yx/OWpUzTFk9z5+RiQ+yjEGE6dz
wEHxJM042Ww0vmn9lOwlMuJVYYB03K1mID1q75709SgrorMHK+sy1htki00VSTaq
08/7f4kkoVbROyVCEfemVIOs+N07unHWruWAQQo+sb6SxB8eBumGwFEHHkXOZ/Us
QkvPi8NYqEyYFg5tbaBXHW/68dOS4EY+W2bc1ZC176oFpD157GjJEzfWh2RDCifZ
C3XIBEI0KIvlxVO7fnnBlA8D+GQUqdicdBeiv0P35lzplWfRuR1QcMDx4qRM4UhR
w12xuBHU8S4oPbHv8XXcCECQ61SjJsqeLzrCHWaNH1vwujiTHMPBWs6wQFn7Lgj3
BEx0EOo4WBVn8S+Wru/7Ydj5VE+Cmnj79cjv3VYqa5QX37UKvfhxUYSztsTL3WAw
WdNFS1eyaMn8LdEOJ6c66lL3RVMYbnBqMxFO0uLwiavltRb6GvJ5FKUTNLFJT59F
GjA2nCuyNU4ACq+ABbLMnptJ/4A5vhpR5JryCWjNUrIRkRZfb8CGRdMf6BNA6r2b
tWvigtL+c/dgtqlXPljhdeeviIzSzkhAh+LzRgFQsji01hntHP1btAR9mR8athLj
MEudzwn8jmM=
=WB6r
-----END PGP SIGNATURE-----

--nextPart4086046.Q1Vv3LMnWu--

--===============1243345199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1243345199==--
