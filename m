From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 15:52:13 -0400
Message-ID: <200709061552.14960.vapier__34550.6408055828$1416624435$gmane$org@gentoo.org>
References: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca> <200709061511.38991.vapier@gentoo.org> <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1277682.9KR2OukWNf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: parisc-linux@lists.parisc-linux.org,
 "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Matthias Klose" <doko@cs.tu-berlin.de>,
 debian-hppa@lists.debian.org
To: "Thibaut VARENE" <varenet@gmail.com>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491@mail.gmail.com>
Resent-Message-ID: <6HpYOC.A.ZpH.evF4GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

--nextPart1277682.9KR2OukWNf
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 06 September 2007, Thibaut VARENE wrote:
> On 9/6/07, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Tuesday 04 September 2007, John David Anglin wrote:
> > > Nominally, the first part of the target string represents the
> > > architecture of the kernel, and not the userspace architecture.
> > > This is not sufficient to configure runtime applications when multiple
> > > architectures are supported by one kernel.
> >
> > i'm not terribly familiar with the breadth of the parisc family, but is=
nt
> > 64bit only available with 2.0 ?  so it'd be pretty clean on Linux to sa=
y:
> > hppa64-*-linux-* means 64bit userland, everything else is 32bit
>
> Seems you misunderstood jda's above comment. We do not have a 64bit
> userland on hppa. the 'hppa64' part of the target string represents
> the architecture of the /kernel/. 64bit kernels run a 32bit userland,
> hence hppa64-linux should be treated (so far) as hppa-linux.

i didnt misunderstand anything

i'm stating that an autotool based package should treat all hppa2.0 hosts a=
s=20
32bit userland which is exactly what gmp does not do
=2Dmike

--nextPart1277682.9KR2OukWNf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.6 (GNU/Linux)

iQIVAwUARuBabkFjO5/oN/WBAQIC/A//epdbdRCe8BMxNO3k1w2RzmDoSsZsP7sU
AF7YmDEjxiuOi5kKjPVzgvk5QL4cQHlYiBDk2aIP2blM/au0oPaL1MV9XRNCVfL/
LAFyzv29Md0UfFDc3l2NvLlTzr7gUQXAVg7ICHNwNVgVFJkR6y+fM8zdNVb92cZh
3kCefnz8mW+MKrugsroyr9Za/LYklqgf31Bng8seVWtkd2w+CQORVHgUbljMA9Gf
lmtOtqZhc6pA9P1YjGYSDhUNhvrFusQUgDjTWWYizDwYdcXh8edDZTMeedqkxxCw
yOWCK5epO5pj6//cSggWZqPcFsyhDtNzDEQxGu+AyKEAJUOhTCGK/BrcGi84NZ1m
H5TAtVE8n+iB7plRpR4V595dv8MIgeiD9uVzt4yVgGmBeIWUTy9wrDmVYPs0jIDO
rPYhrDHcE/yCh1fPUl/B9oTurkKlKn2OkUPGtZcNTyf8k8gfcMZ+2cBfghacNqhv
IT9kW7iDxBvxrjjk1+GdIKtDDFpRzc+31h5l6whO0vyqds10T91T2vPuYpDgO38c
fdQ9ulWxpKDHawy8X9yaAKnWjH5ZUkh0cnzUtr2viV/SgR2vxUzBeF73zaae17CS
GxsSvgRppkev+Z1DmgFYcN8bFpW7TCVPkxpBbRbmOmunD/wDhF2MWzPV+4ayPykt
vpjUE4qIa7s=
=5QXu
-----END PGP SIGNATURE-----

--nextPart1277682.9KR2OukWNf--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
