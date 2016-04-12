From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: PCI video card hangs during system boot
Date: Tue, 12 Apr 2016 18:55:45 +0200
Message-ID: <1587186.CtnrnCsSzp@caliban.sf-tec.de>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1880006.q5s1PXSvzY"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1880006.q5s1PXSvzY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 12. April 2016, 10:20:17 schrieb Simone Mannori:
> Dear All,
> 
> looking for a solution for a presistent issue (lack of any hardware
> acceleration support for X11 because error during the loading of the
> "radeon" or "nouveau" kernel module at boot time) I have bought a PCI
> video card: ATI RADEON 9300 128M PCI. This test has been suggested by
> many guys on several mailing list.
> 
> NOTA BENE: make sure that the PCI video card is 3.3V type or is an
> "universal" (3.3V and 5.0V) model like mine.
> 
> I have put this video card leaving the ATI FireCL X1 installed; I have
> removed the AGP video card; I have moved the PCI video card on
> different positions.
> 
> No matter what I do, the c8000 is unable to boot.
> 
> Using the serial console, I have his message
> 
> <Cpu0> 0e000e7a00e00000  600601005d441002  CC_IODISC_PCI_DEVICE_CONFIG
> pci_bus_walk line 2878 - bridge aperture too big

This probably means the PCI BAR of the card is too big, i.e. it has too much 
RAM. Looks like the firmware can't handle that. I once had the same thing on a 
C3600, IIRC with a 128MB BAR.

Greetings,

Eike
--nextPart1880006.q5s1PXSvzY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlcNKJUACgkQXKSJPmm5/E5+ZgCfaUCUSm1y+dIQYoWDqRCLmFoZ
VdEAn39iPthnBGnHqJnFwqYlHcdR+pAQ
=vxNy
-----END PGP SIGNATURE-----

--nextPart1880006.q5s1PXSvzY--

