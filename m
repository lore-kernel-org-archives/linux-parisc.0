From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Hacking SuperDome
Date: Sun, 15 Feb 2009 16:33:03 +0100
Message-ID: <20090215153303.GB31770@lug-owl.de>
References: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207142906.GA8553@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2009-02-07 15:29:06 +0100, Thomas Bogendoerfer <tsbogend@alpha.fran=
ken.de> wrote:
> Linux version 2.6.29-rc3-00000-g33bfad5-dirty (tsbogend@login) (gcc
[...]
> sym53c8xx 0000:18:00.0: enabling device (0146 -> 0147)
> sym0: <895> rev 0x2 at pci 0000:18:00.0 irq 67
> sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> sym0: SCSI BUS has been reset.
> scsi0 : sym-2.2.3
> scsi 0:0:0:0: ABORT operation started
> scsi 0:0:0:0: ABORT operation timed-out.
> scsi 0:0:0:0: DEVICE RESET operation started
>=20
> After that it hangs...
> The smaller partion hangs even earlier:

Just to name it (even though it might be a general interrupt problem),
IIRC there just was some email on LKML that some other guy had about the
same sym2 hangs in more conventional ix86 hardware...

So for a test, you might want to replace sym2 with one that's a bit
older...

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:              What we do for ourselves dies with us. What we d=
o for
the second  :         others and the world remains and is immortal. (Albert=
 Pine)

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFJmDWuHb1edYOZ4bsRAhqUAJ97KI8lHW6BcfyW/TpvEhWZDrimYACeOEDP
5FZ7isG4AihsVcVhMRubs8A=
=hes9
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
