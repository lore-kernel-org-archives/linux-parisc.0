From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Fri, 8 Jul 2011 17:00:11 +0200
Message-ID: <201107081700.19668.eike-kernel@sf-tec.de>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com> <201107051951.16931.eike@sf-mail.de> <CADZpyiyi8=FY-2ihDq0RnXt5BZ3H09pSN1bYCHvQuFTvroCyrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1441556.NrPLRjVJ8c";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiyi8=FY-2ihDq0RnXt5BZ3H09pSN1bYCHvQuFTvroCyrQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1441556.NrPLRjVJ8c
Content-Type: multipart/mixed;
  boundary="Boundary-01=_7txFOAxfc+I3rVU"
Content-Transfer-Encoding: 7bit


--Boundary-01=_7txFOAxfc+I3rVU
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch 06 Juli 2011, 00:17:03 schrieben Sie:
> On Tue, Jul 5, 2011 at 1:51 PM, Rolf Eike Beer <eike@sf-mail.de> wrote:
> > Am Dienstag 05 Juli 2011, 19:28:35 schrieben Sie:
> >> On Mon, Jul 4, 2011 at 2:59 PM, Carlos O'Donell
> >> <carlos@systemhalted.org>
> >=20
> > wrote:
> >> > On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin
> >> > <dave.anglin@bell.net>
> >=20
> > wrote:
> >> >> The Linux man page says the mprotect addr must be a valid pointer or
> >> >> a multiple of PAGESIZE.
> >> >> It's not clear what the mprotect call is trying to protect but it is
> >> >> definitely not page aligned.
> >> >=20
> >> > It's trying to protect the new stack for the thread, which is
> >> > obviously in the wrong spot.
> >>=20
> >> Good news.
> >>=20
> >> I have fixed tst-cputimer1.
> >=20
> > You also wrote "OK, fixed the kernel." So where an when will these fixes
> > show up?
>=20
> Unfortunately I hosed my setup and I didn't have git installed to make
> a proper diff so here's a diff versus a somewhat recent tree.
>=20
>  WIP patch: http://www.parisc-linux.org/~carlos/futex.diff

Half of your diff (e.g. the int->u32 conversion) is already in upstream. I'=
ve=20
rediffed it against Linus tree and fixed some of the whitespace damage.

Eike

--Boundary-01=_7txFOAxfc+I3rVU
Content-Type: text/x-patch;
  charset="UTF-8";
  name="hppa-futex.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="hppa-futex.patch"

=46rom 26950303065f2d1d5e36bbb818d3ee8621a6fc2c Mon Sep 17 00:00:00 2001
=46rom: Carlos O'Donell <carlos@systemhalted.org>
Date: Fri, 8 Jul 2011 09:42:31 +0200
Subject: [PATCH] fix futexes

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>
Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
=2D--
 arch/parisc/include/asm/futex.h |   65 +++++++++++++++++++++++++++++++++++=
+---
 1 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/fute=
x.h
index 67a33cc..3008d06 100644
=2D-- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -5,11 +5,14 @@
=20
 #include <linux/futex.h>
 #include <linux/uaccess.h>
+#include <asm/atomic.h>
 #include <asm/errno.h>
=20
 static inline int
 futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 {
+	unsigned long int flags;
+	u32 val;
 	int op =3D (encoded_op >> 28) & 7;
 	int cmp =3D (encoded_op >> 24) & 15;
 	int oparg =3D (encoded_op << 8) >> 20;
@@ -23,16 +26,53 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uad=
dr)
=20
 	pagefault_disable();
=20
+	_atomic_spin_lock_irqsave(uaddr, flags);
+
 	switch (op) {
 	case FUTEX_OP_SET:
+		/* *(int *)UADDR2 =3D OPARG; */
+		ret =3D get_user(oldval, uaddr);
+		if (!ret)
+			ret =3D put_user(oparg, uaddr);
+		break;
 	case FUTEX_OP_ADD:
+		/* *(int *)UADDR2 +=3D OPARG; */
+		ret =3D get_user(oldval, uaddr);
+		if (!ret) {
+			val =3D oldval + oparg;
+			ret =3D put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_OR:
+		/* *(int *)UADDR2 |=3D OPARG; */
+		ret =3D get_user(oldval, uaddr);
+		if (!ret) {
+			val =3D oldval | oparg;
+			ret =3D put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_ANDN:
+		/* *(int *)UADDR2 &=3D ~OPARG; */
+		ret =3D get_user(oldval, uaddr);
+		if (!ret) {
+			val =3D oldval & ~oparg;
+			ret =3D put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_XOR:
+		/* *(int *)UADDR2 ^=3D OPARG; */
+		ret =3D get_user(oldval, uaddr);
+		if (!ret) {
+			val =3D oldval ^ oparg;
+			ret =3D put_user(val, uaddr);
+		}
+		break;
 	default:
 		ret =3D -ENOSYS;
 	}
=20
+	_atomic_spin_unlock_irqrestore(uaddr, flags);
+
 	pagefault_enable();
=20
 	if (!ret) {
@@ -54,7 +94,9 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
+	int ret;
 	u32 val;
+	unsigned long flags;
=20
 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -65,12 +107,25 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *u=
addr,
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
 		return -EFAULT;
=20
=2D	if (get_user(val, uaddr))
=2D		return -EFAULT;
=2D	if (val =3D=3D oldval && put_user(newval, uaddr))
=2D		return -EFAULT;
+	/* HPPA has no cmpxchg in hardware and therefore the
+	 * best we can do here is use an array of locks. The
+	 * lock selected is based on a hash of the userspace
+	 * address. This should scale to a couple of CPUs.
+	 */
+
+	_atomic_spin_lock_irqsave(uaddr, flags);
+
+	ret =3D get_user(val, uaddr);
+
+	if (!ret)
+		if (val =3D=3D oldval)
+			ret =3D put_user(newval, uaddr);
+
 	*uval =3D val;
=2D	return 0;
+
+	_atomic_spin_unlock_irqrestore(uaddr, flags);
+
+	return ret;
 }
=20
 #endif /*__KERNEL__*/
=2D-=20
1.7.6


--Boundary-01=_7txFOAxfc+I3rVU--

--nextPart1441556.NrPLRjVJ8c
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk4XG4MACgkQXKSJPmm5/E4oDQCfU3+aJz1nymSatm8D2rc717dM
YP4AoIz2dDy3NExi+otgJUAgwnrMKpfE
=uaW5
-----END PGP SIGNATURE-----

--nextPart1441556.NrPLRjVJ8c--
