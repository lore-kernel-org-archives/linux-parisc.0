From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: Fix ptrace: syscall number and return value
 modification
Date: Tue, 19 Jan 2016 14:47:07 -0500
Message-ID: <20160119194707.GE14840@vapier.lan>
References: <20160119150849.GA22546@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160119150849.GA22546@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19 Jan 2016 16:08, Helge Deller wrote:
> Mike Frysinger reported that his ptrace testcase showed strange
> behaviour on parisc: It was not possible to avoid a syscall and the
> return value of a syscall couldn't be changed.
>=20
> To modify a syscall number, we were missing to save the new syscall
> number to gr20 which is then picked up later in assembly again.
>=20
> The effect that the return value couldn't be changed is a side-effect of
> another bug in the assembly code. When a process is ptraced, userspace
> expects each syscall to report entrance and exit of a syscall.  If a
> syscall number was given which doesn't exist, we jumped to the normal
> syscall exit code instead of informing userspace that the (non-existant)
> syscall exits. This unexpected behaviour confuses userspace and thus the
> bug was misinterpreted as if we can't change the return value.
>=20
> This patch fixes both problems and was tested on 64bit kernel with
> 32bit userspace.

thanks, i'll give it a spin on my box too

on a related note, can you check if arg reloading works too ?
i.e. i should also be able to mung syscall args on the fly.
e.g. if the tracee does open("/foo", O_RDWR), the tracer should
be able to munge it to do open("/foo", O_RDONLY).
-mike

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWnpK7AAoJEEFjO5/oN/WBEBQQAMB6bjAM1VAYiAqIFEm2f572
9bZIZZvSO06R9VgsFdWwbR6lXNddEUklIm4EuamxJz1/gjrlKe09CQe/QPoHvPS0
RG99jTkpNYcrthm6WWR3Gq1YnnRniw7S060F4BNIoGwqK2t6d0YinuUorhFwFBCp
xKtWEEhiB1CgEw/3ThLfgSRmDbbiAU2Auua7Zu50fYicFGfo0/jK/OTpMlMqklYQ
BFdVP2tq7/uRCmh+3TauRQxUnJA2HdMOqrg3TfJfLEWVA84F6JajXfOnLyMAeyNE
3zMucQ4NO9/gEd9oTPytPjoJkngOFFQk/SgRuu9qS9L5jwgyMpAV2SpqlH5jQPOY
pDI+kkMbRAhivSrw3XWGMnoEifjnuf6hnmNmX7Jcx7xX0OQq9cOVdbSHFKkU0b+o
BjIW6xLMyIkXwFuxj6U8GpB5F6F56dEuvXEZ32B8ZxhJg8XwZ9V3fsW7ed8wm1pg
ePvWQn+wIJtOD4gsnO/CZNHxxrLmCUS4onhp2QCluiaIsSLMqEjSmhk2YDfJGXnS
Tt0dxscxUQQ8N6qFlftVELk/mOW6lJ523FkUkuZMx3Dwa92exxji8lwWanNcKFos
9pgj+/qD4Z+2ySImrxLsRvKapPKjdftREN5qDxqQjI5pTIMwe9L+vcnN4+rrxJ4n
KgU4onlHVSK6LzDgIQOZ
=yuBA
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
