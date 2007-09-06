From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 15:53:46 -0400
Message-ID: <200709061553.47315.vapier__39555.79537801$1416624435$gmane$org@gentoo.org>
References: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca> <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491@mail.gmail.com> <200709061552.14960.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2913264.VGNSK12FV2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "Thibaut VARENE" <varenet@gmail.com>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709061552.14960.vapier@gentoo.org>
Resent-Message-ID: <bPQ5tB.A.FX.7wF4GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

--nextPart2913264.VGNSK12FV2
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 06 September 2007, Mike Frysinger wrote:
> On Thursday 06 September 2007, Thibaut VARENE wrote:
> > On 9/6/07, Mike Frysinger <vapier@gentoo.org> wrote:
> > > On Tuesday 04 September 2007, John David Anglin wrote:
> > > > Nominally, the first part of the target string represents the
> > > > architecture of the kernel, and not the userspace architecture.
> > > > This is not sufficient to configure runtime applications when
> > > > multiple architectures are supported by one kernel.
> > >
> > > i'm not terribly familiar with the breadth of the parisc family, but
> > > isnt 64bit only available with 2.0 ?  so it'd be pretty clean on Linux
> > > to say: hppa64-*-linux-* means 64bit userland, everything else is 32b=
it
> >
> > Seems you misunderstood jda's above comment. We do not have a 64bit
> > userland on hppa. the 'hppa64' part of the target string represents
> > the architecture of the /kernel/. 64bit kernels run a 32bit userland,
> > hence hppa64-linux should be treated (so far) as hppa-linux.
>
> i didnt misunderstand anything
>
> i'm stating that an autotool based package should treat all hppa2.0 hosts
> as 32bit userland which is exactly what gmp does not do

which is to say i've sort of forked the thread as i'm not talking about the=
=20
config.guess mis-guessing a 32bit userland under a 64bit kernel as hppa64 .=
=2E.
=2Dmike

--nextPart2913264.VGNSK12FV2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.6 (GNU/Linux)

iQIVAwUARuBay0FjO5/oN/WBAQIbcRAApQikWpg+AuTHTL08QrPDB42LTpaBkBLY
VL7qr7G2RDERM6aTP0y+cDYGeswnzW1BUe4y3VgNd1YHE8tpDyPRrIGv6mQthG/H
kr9deGRHp7YK9FxSi+/edW4oIRlim6nUHNWAoOtd0EGK/aBAecqJCk/Ieey/mmYC
0duS9k5O231FKx+m8x5cd8cSFG4d07Ha4AHXpfmRULbzOK4LqeSMuoL2ivKHL2yl
NE57m7h8a9fNh45BINim6/dU8K265ONHfV/kiER0OjphwbgNrlhuNSonHXrwnVG7
JSb45qwxeAiGgVts13H64nEHm0pUmcADzEgsISk+zrdKfUDZzdT0BTpNPg7nwYIQ
ndL47OOTE5xoAPbTtHPfYmSEVun4yurQaU2dApiFjSS7NFMS5EZ+645RBO80HPVQ
KBdywyJvKAtDJYEtNw7NLQPjHheJDrbbcNBJj3/xXBMun2ZuPu3a3DTpFp12jw1R
uzBkMw93leWeatPwpog0vnMZ5Pp1OWR/0gUsd4rW4eARN4QzhvRXZmZBKPWZTLd+
higW3UCNNybFf3ZXhI3RDVBoIULkdiHelslel9g1KQc2MrlK3IGJP4pzm/iokwDU
EWjRtpjCbHlSIf5thR5Ny42Q/4WTlQoeEgnsgVhDL+BlgmdkRfEl56PPrPpIVNNl
zymBUokqeQA=
=JhTc
-----END PGP SIGNATURE-----

--nextPart2913264.VGNSK12FV2--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
