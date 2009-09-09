From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Wed, 9 Sep 2009 10:50:32 -0400
Message-ID: <200909091050.35128.vapier@gentoo.org>
References: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com> <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca> <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1577743.ODTd9NeaAD";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1577743.ODTd9NeaAD
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 09 September 2009 10:39:30 Carlos O'Donell wrote:
> On Sun, Jun 21, 2009 at 11:20 AM, John David
>=20
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> > Looking at my email archive, I see the real cause involves kernel memory
> > maps:
> >
> >  > > > On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin wrot=
e:
> >  > > > > > The tombstone is:
> >  > > > > >
> >  > > > > > do_page_fault() pid=3D10205 command=3D'strace' type=3D15
> > address=3D0x407d2f18 > > > > > vm_start =3D 0x4068d000, vm_end =3D 0x40=
68f000
> >  > > > >
> >  > > > > So, the pointer passed to __canonicalize_funcptr_for_compare is
> > outside > > > > the vm range.
>=20
> The strace problem is a compiler flaw.
>=20
> This is the problem:
> * Strace examines the applications syscall.
> * Strace extracts, via PTRACE, application addresses, addresses that
> don't exist in the strace address space (and should not exist).
> * Strace compares extracted address to a constant SIG_ERR.
> * Compiler generates a call to __c_f_f_c, which dereference the
> extracted address and strace faults.
>=20
> Strace and the application have completely different address spaces,
> and __c_f_f_c can't assume that an address is in the current address
> space.
>=20
> The solution is to detect that a comparison between two pointers is a
> comparison between pointer and small constant, and avoid calling
> __c_f_f_c for both.
>=20
> The workaround is to cast both long. I tested this and it works. I'll
> submit this to debian as the fix.

and include this explanation in a comment right above the cast ? ;)

also, the strace list is active currently, so posting a patch there should =
get=20
it merged (and since it's an important bugfix, it should get added before t=
he=20
next release).
=2Dmike

--nextPart1577743.ODTd9NeaAD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJKp8C7AAoJEEFjO5/oN/WB6AkP/1lKLyj4d0TPATXujBUnVTQ9
QNq0N178mYk9DtXFfvhvWdTi2H5QzEIYiiEK/kWHwgB9Np/YRsds6msEedxhCqne
V3P5GiC2EHP3rSEPKyL2Vw4udRm3ji4m8VzyZrdf8fMfN9W9dpWAwBKyPlxCSGK4
P8RyK37cUo6baIOF8Dk10vsgkma0+cjP6Thqt0BiT0oz+SOOwiODX5Dd0ddbyAIY
Xzw/Xe3NnL8v5rkVREGB105dxCqkayXLLndBizdQkosi17fDQUoNBBXdrJPGrzxd
YB46IaAWSdjusNlvd0JoHClSAnon9+Xyctnj9MzVo0NJHWl7IJqTxwgSAGe/bh6L
tiIMG2Z5oylACkq2KemWV+s3x+lu8uUfevl6HTA7fFHfCEI7IyzB/S/N+IyWvEaj
6UgpAdDGLAmDFimP1H1hobUpF5RiD4yV1Pc22eFIYJFaLb0xuDhNYtzPBm06tOHH
XxUWyBG3GjCAq2fq/v/u6krym1hXuXZo9sGd4vqbBBCP8oUUVd1A2+9aQR+iXrHC
MiQAMLLQb5PAtDEElCWaAj3zuYtLSnBRanJ9yY8LgV9hs2T/+M54ZjA53ESnh8bV
/Wzaz9PsaMCyEiZ2f4HXL4Ef8f/E9/zBDrkV/IGFyvBC9uYzPJ5RBcbs6SbrSKDz
fXwwd9DKJm6z8Hl8haD/
=u9Qo
-----END PGP SIGNATURE-----

--nextPart1577743.ODTd9NeaAD--
