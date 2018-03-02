From: James Hogan <jhogan@kernel.org>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval to
 compat_time.h
Date: Fri, 2 Mar 2018 21:57:02 +0000
Message-ID: <20180302215702.GD4197@saruman>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9066815376597682018=="
Cc: mark.rutland@arm.com, linux-mips@linux-mips.org, peterz@infradead.org,
 benh@kernel.crashing.org, heiko.carstens@de.ibm.com, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, y2038@lists.linaro.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, sebott@linux.vnet.ibm.com,
 jejb@parisc-linux.org, will.deacon@arm.com, borntraeger@de.ibm.com,
 mingo@redhat.com, oprofile-list@lists.sf.net, catalin.marinas@arm.com,
 rric@kernel.org, cmetcalf@mellanox.com, arnd@arndb.de,
 oberpar@linux.vnet.ibm.com, acme@kernel.org, jwi@linux.vnet.ibm.com,
 john.stultz@linaro.org, rostedt@goodmis.org, tglx@linutronix.de,
 ubraun@linux.vnet.ibm.com, gerald.schaefer@de.ibm.com,
 linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, hoeppner@linux.vnet.ibm.com,
To: Deepa Dinamani <deepa.kernel@gmail.com>
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180116021818.24791-3-deepa.kernel@gmail.com>
List-Id: Linux Driver Project Developer List
 <driverdev-devel.linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org


--===============9066815376597682018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 06:18:10PM -0800, Deepa Dinamani wrote:
> All the current architecture specific defines for these
> are the same. Refactor these common defines to a common
> header file.
>=20
> The new common linux/compat_time.h is also useful as it
> will eventually be used to hold all the defines that
> are needed for compat time types that support non y2038
> safe types. New architectures need not have to define these
> new types as they will only use new y2038 safe syscalls.
> This file can be deleted after y2038 when we stop supporting
> non y2038 safe syscalls.

=2E..

>  arch/mips/include/asm/compat.h    | 11 -----------
>  arch/mips/kernel/signal32.c       |  2 +-

For MIPS:
Acked-by: James Hogan <jhogan@kernel.org>

Cheers
James

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlqZyK0ACgkQbAtpk944
dnriXA//fiy/M44auOl6H3L/Sttb1xadP44YPlJKIkOi6RRm+XDNJWeIyb2dB28g
vkHkEqeW5OX0Yz+YmbMULh8EAl6TV42LSMUcRcDNmI3GjkArQIEQ7T1E7BiwukFd
lclSwy3Fe9HwtZdLeKQuO+C8W4pZ0rUXZeQW+8A0TvNM1zAKInEKaAGXgxS7PcMs
7pZBbOcIGBg9sTWFPhU4N63bfMn095wDXupegwflrlB1JSTvFktFxc2E6c0JmIwm
ij9jNw3J/lUtGaMq2ynmbJQWr+/I1EFVe740bkdKYP2Q1ZdTybWR2FnnoP+cC6kF
hS49c68Enp1mSirYIqRidTc8YLALwUFpdheUUky1VUPSjBWee2BqZ83VrshoMvkx
DQTuUfxvlFdnCLF6xHl0Ock5g7QTzrne9rpvqGBge3sGp25RZ1RcJYAruNJ36u+C
9VP1Y284Sz40x76q77yLxC5rT3inAHQYO2c+ob/BnrKoSrMxfDrWYea1X1yh+x80
6qyZomlmDEu7OREVX2dnpkIG/0j2GvhQBtjYHAHjvTkmHho80Fe/GBZhObkQjnoW
xgm1BLteveq/IEGK1tY2MEqjNFgUjQn1/r72KrP1b7PMtmwHjkyaXljB/dEv5TI3
tEttVw3wzqGUWmbvyj7KZcpv/BQUx/Otrqh/zGMnC30U53Lzrzw=
=PkCk
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--

--===============9066815376597682018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============9066815376597682018==--
