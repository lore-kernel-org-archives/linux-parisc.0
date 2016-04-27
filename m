From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: [PATCH] parisc: fix a bug when syscall number of tracee is __NR_Linux_syscalls
Date: Wed, 27 Apr 2016 06:28:26 +0300
Message-ID: <20160427032826.GA24101@altlinux.org>
References: <20160427015611.GA23316@altlinux.org> <20160427024511.GA5369@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=x-unknown;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160427024511.GA5369@vapier.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2016 at 10:45:11PM -0400, Mike Frysinger wrote:
> On 27 Apr 2016 04:56, Dmitry V. Levin wrote:
> > Do not load one entry beyond the end of the syscall table when the
> > syscall number of a traced process equals to __NR_Linux_syscalls.
> > Similar bug with regular processes was fixed by commit 3bb457af4fa8
> > ("[PARISC] Fix bug when syscall nr is __NR_Linux_syscalls").
> >=20
> > This bug was found by strace test suite.
> >=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> > ---
> >  arch/parisc/kernel/syscall.S | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> > index c976ebf..57b4836 100644
> > --- a/arch/parisc/kernel/syscall.S
> > +++ b/arch/parisc/kernel/syscall.S
> > @@ -344,7 +344,7 @@ tracesys_next:
> >  #endif
> > =20
> >  	cmpib,COND(=3D),n -1,%r20,tracesys_exit /* seccomp may have returned =
-1 */
> > -	comiclr,>>=3D	__NR_Linux_syscalls, %r20, %r0
> > +	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
> >  	b,n	.Ltracesys_nosys
> > =20
> >  	LDREGX  %r20(%r19), %r19
>=20
> i've deployd your fix to hake, so feel free to give the tests another
> run to try and crash the box :).

With this fix the box no longer crashes.


--=20
ldv

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXIDHaAAoJEAVFT+BVnCUIKxsQAJVhTUZttcS7ez3NLsGRP6QK
MLyA8eQjYlN/I1umBwRZNaAePk7pGYxeZYy/C5Wvt0WEe09kILINt9ED19VjmuhQ
FEQ37TqWeMK6w15hpUTRIhSoBklBi0NG4jPgzuv4TOaFfrB80/VRzp2BmdP0F2x1
iDSs8XkDHg6VUAv2bvd3ANhMDSuyY8OEUIaj6VVw+FGJxkL+0uzOu1MM8wmmvEpg
QkhEXEN/MBIsKOwWSkFxAQAqidxUPA4ytZh5RrIC81zytS//X/jlOE9Wx74ELR0N
PFPV7UQGOsUVSMdW6cWOJbWyxyJGfbpd6NMsF8OwNZ9waBmpZrHd+MuAw920rk6G
A+U5n4+IdFPX0S5SsICR2T8Cc4pC2gxsCB6vjxtRam0iXuEN62FptXtg0h63P8VV
ZQk+Mvqdvm26TPRnZoGcEWs9zJySuAUQq48Hyh2s7jFdFb6lvvdLXa6miyMPyyTA
Xp13TdR8w5g51LwNANXThlq40zzul+V1l6hd8lI1aNhv9oq/wQv0+Ag6MQvqOpcJ
eHMmFi2dacCgcBBLQRIJoa0050DYPF+pMYnQ4zEaiHIyjQ1KFTPThnl0RUP9BF3d
ON2J8dIcfcmXsT+nbrRbIMalOVLcIdYxR0T7Hux9c4iHXLCwwFyCLhALRgFVI1NI
oevppn6cGb+VfFXaA3/F
=CcFU
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
