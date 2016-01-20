From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: Fix ptrace: syscall number and return value
 modification
Date: Wed, 20 Jan 2016 12:09:59 -0500
Message-ID: <20160120170959.GS14840@vapier.lan>
References: <20160119150849.GA22546@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ShzQXCswyqjgWi6k"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160119150849.GA22546@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--ShzQXCswyqjgWi6k
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

i've checked that i can reset the syscall # fine and mung the return
value.  i haven't checked arg replacement although i don't need that
myself (yet?).  thanks !

Tested-by: Mike Frysinger <vapier@gentoo.org>
-mike

--ShzQXCswyqjgWi6k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWn79nAAoJEEFjO5/oN/WBdswP/2sVeqU7IcDzHM7VwSM3u+fI
tumdCllLeMH7VzUMOHv2uapc9In7mC7MzWVb8mTccOes7LMg+uCEWp/2C8kF05XR
PpIs/SJQUuf5ymxondHn2zNW+VKXjZG6GPUaRaOy6IxocmIr7KYKenglzXLsvkjN
t883dXU1irFtop3xpHCTYqrZfJBW7LAQEuzEAnwY7lKGlhEBPrM8e9jz+SdK2pyr
sCyB/y+cD0WQrOqpQ2+YlIkPQ57Q4ALYYqdTTtURlHFkCwloq/DcEh+YskZhwnky
YoYlaD3BDTNmgkghGezOfV+viI02k5dBt+uXhC+NSnNOzNM9J5eOkOHyJ9Q9gFcW
sTcYkYJkTpPMmzps/TfVVIQf1R7ktKMFImOEu1ds/eA/QdNgWSCH+1BWk7H0BrfH
r3SN/93Wvyi106947cEgL7Wy8HVDfViY9avDxmaBHqPSUOa2+m5EWiMcRI4E4m2n
UkgKQHvc79Z2kJ61srv02rCLdE1SWv4chwPSgB+NjClSTi2EYFcF7eJb1ZA2syE8
3aBzOj6N8nuI99QQg+oyPMb0OEqXfSnjckmWZSx4Fa4KuByAi9xS45E8wNJ1NAbP
Biur/4UKlQ+MVFROPXrFgSyz+yATH8XhhL0kMQXV48rtxQymH7yAM8MMjYqL2UOL
Z8QhuYrps+MUVmE2vukk
=ZRD2
-----END PGP SIGNATURE-----

--ShzQXCswyqjgWi6k--
