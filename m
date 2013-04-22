From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: install medium for c8000 [was Re: PARISC Linux website and status update]
Date: Mon, 22 Apr 2013 18:17:36 +0200
Message-ID: <2146001.U3u6lFCtbY@eto>
References: <CAFk90B8ZNjwyWKpO_LhGPPkYB_sgJduMVi_YBCoN_Z6hk-_sFQ@mail.gmail.com> <0d62eecac81e83ba969f27e280554c19.squirrel@mail.therion.be>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3748160.nhSkCMLMq4"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Graham Gower <graham.gower@gmail.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0d62eecac81e83ba969f27e280554c19.squirrel@mail.therion.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3748160.nhSkCMLMq4
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag 22 April 2013, 17:00:07 schrieb Geert Lorang:
> On Mon, April 22, 2013 15:12, Graham Gower wrote:
> > I'm wondering if there is an install iso with a kernel that has
> > CONFIG_PDC_CONSOLE=y, so that I can install on a c8000. (Or am I
> > missing something, is there a way to get it to work without this?)
> > 
> > Its kinda annoying if I've got to build a cross toolchain, cross
> > compile a kernel, tftpboot, nfsroot, etc. in order to put something on the
> > hard drive.
> 
> AFAIK the C8000s have unsupported serial ports / network card.

The network card is an e1000, which has a somewhat weird "checksum" for the 
EEPROM. In newer kernels the driver knows how to handle that. For older 
kernels you need to set the MAC by hand, but otherwise everything is fine.

About the serial I'm not absolutely sure, but I think it worked. The only 
thing I needed to change was to set the console to ttyB0 instead of ttyS0.

Greetings,

Eike
--nextPart3748160.nhSkCMLMq4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlF1YqAACgkQXKSJPmm5/E7GrQCdFfhJ8CeI9LDIaI9oD6x4w0gY
LOkAn2Pdd3X9GoPUd1/npEWsaZpIG/dA
=y3ZD
-----END PGP SIGNATURE-----

--nextPart3748160.nhSkCMLMq4--

