From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 15:11:37 -0400
Message-ID: <200709061511.38991.vapier__5241.7284030982$1416624441$gmane$org@gentoo.org>
References: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1513014.gISjmhhUTA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 Matthias Klose <doko@cs.tu-berlin.de>,
 debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca>
Resent-Message-ID: <hi_5yD.A.jAC.cJF4GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

--nextPart1513014.gISjmhhUTA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 04 September 2007, John David Anglin wrote:
> With respect to hppa variants, this is a hopeless mess and I don't
> believe this can be fixed.  For example, libgmp treats hppa2.0w as
> indicating a 64-bit runtime.  I'm sure you have hit this.

i think gmp is just plain broken in this respect

> Nominally, the first part of the target string represents the
> architecture of the kernel, and not the userspace architecture.
> This is not sufficient to configure runtime applications when multiple
> architectures are supported by one kernel.

i'm not terribly familiar with the breadth of the parisc family, but isnt=20
64bit only available with 2.0 ?  so it'd be pretty clean on Linux to say:=20
hppa64-*-linux-* means 64bit userland, everything else is 32bit
=2Dmike

--nextPart1513014.gISjmhhUTA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.6 (GNU/Linux)

iQIVAwUARuBQ6kFjO5/oN/WBAQI/gg//ehoJBfx7QomGKZ1KSEWr7A1ygRzippJn
WUvbBaJE/1fLBVGHhZpA5F4oH4p25445lf5mssiWPob7H3wOjFUqxcZUWTYXia79
SF/jiainsni1hbk0XOCqcmktjxBKb4U4uGgC1FwAR7TTA0vxFAVVdzK4DSqWzoWf
M2eqqiua0wOX9QRSla11oq0s+ipk/JRBfbr/Ck9/+zasyfTgxUAgud3ceWKgEtvv
VZ6jqGeLnXKV3dY4c1hTJLyZL5zTf+PajbAdgMkVgwrUqqBrF4Oqkxirv0nrmSzR
hZbqwKJgeZp7lJE3U40ZJkg+riRyqCFe0TFqrexDEKFe0cUJwcPFzpE7vKdHH4Yf
AtO0noCo6hTQdClOMlwGtV3FOcZuAfAMylCDGonNNQVsCiNm00e5Ckervh1QMaBk
LZeXLDjcWhczOXOGswAqiGuOAcE1QJBIzabwrnugrnELbIZEfFtWRmxThgfL1pfc
Y6huhfAv4QumUcvioAuzITzceG6KGSc4Y2SnLR9JK/tw29KdOyTul9G8TzwXaVBy
qh35lhZ1kr0LGRDPrTrRvlpXrh+1TID4SLVnXV+Y+CWUwPR2CUF2/NfG5fpG8ax4
LtA9BhdC9j9aq6dDeIujfW2p1PKUhCe29fXP+xjYnLJg3mQY0Xj6kbIDqDhVuwss
X7QQCo/Nwso=
=jM4F
-----END PGP SIGNATURE-----

--nextPart1513014.gISjmhhUTA--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
