From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: fix a bug when syscall number of tracee is
 __NR_Linux_syscalls
Date: Tue, 26 Apr 2016 22:45:11 -0400
Message-ID: <20160427024511.GA5369@vapier.lan>
References: <20160427015611.GA23316@altlinux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pcw6Z5YEpa6jVCsn"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: "Dmitry V. Levin" <ldv@altlinux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160427015611.GA23316@altlinux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Pcw6Z5YEpa6jVCsn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27 Apr 2016 04:56, Dmitry V. Levin wrote:
> Do not load one entry beyond the end of the syscall table when the
> syscall number of a traced process equals to __NR_Linux_syscalls.
> Similar bug with regular processes was fixed by commit 3bb457af4fa8
> ("[PARISC] Fix bug when syscall nr is __NR_Linux_syscalls").
>=20
> This bug was found by strace test suite.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  arch/parisc/kernel/syscall.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index c976ebf..57b4836 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -344,7 +344,7 @@ tracesys_next:
>  #endif
> =20
>  	cmpib,COND(=3D),n -1,%r20,tracesys_exit /* seccomp may have returned -1=
 */
> -	comiclr,>>=3D	__NR_Linux_syscalls, %r20, %r0
> +	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
>  	b,n	.Ltracesys_nosys
> =20
>  	LDREGX  %r20(%r19), %r19

i've deployd your fix to hake, so feel free to give the tests another
run to try and crash the box :).
-mike

--Pcw6Z5YEpa6jVCsn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXICe3AAoJEEFjO5/oN/WBuygP/1nPmdnppZqXhIOkW6E4dGm/
gUIpQZxjCRs6qaw0ncjkIP/5QYJ780/RIWOmfr0+bFQC6XsDHWXy2+Ub7Tp4eYoT
m8nF4T6KYRbPN4qisjExVrPPLgUevV87+bf28dKFPk228Nh+3YwbmxQXIL37A1rv
VB2gqDFP7ym/E5w5w/dd8KI2oSJQJk0efegwebA8RCjOgPzeezNv7s/HLZkZazB7
WPJGplwCn8z2HasoxKXlR+jsrHMxFvMp/mINvJwJM4h1XFoOKF0NnEMaINl1MwM7
zyHHWQaj6Fa18mnJwOAShwAjYDw10lJQGwqVcJIFaKnWfxOR9fSTMl03qcEpVBml
TFo3/1muz9uq/9ODNuQsZMSV3Ne1HGMKohMMLBm/91TJagh99K672VHxYQkxCXlW
pCd6CST0cdAcxBljqudRWO/kVkCScia0fcIBwGvYa2hqWB6Iot2kE9sMUl9n4bp8
qcb6xkgQpx4oa6eyOvsJnbULHn69fW4lFhY7rHfaGZ3fyiWXWn3kH4D8wgRBcVcH
YMNsIh1l6O5LP05TqvH+JpqtqA2eb5xauUvx62b/QPuNsxULFU5TGBvAsbGMTRsN
3iMuCOP3AM4ULBtRyQc/emvKhrRce/Ori0o6MYmxXabAN72y3MzMIyJNvYIeSCUm
eliconcPfhFlTPpXgCbj
=1U7X
-----END PGP SIGNATURE-----

--Pcw6Z5YEpa6jVCsn--
