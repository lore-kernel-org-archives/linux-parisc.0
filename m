From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 18:03:17 +0100
Message-ID: <7905648.nun1s37FKj@eto>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net> <1417398.fmUESL4Ngr@eto> <BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1647935.XlaHKAT2zv"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1647935.XlaHKAT2zv
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> > One other thing: the serial line from the C8000 to my Sun Fire V240
> > works
> > flawlessly.
> 
> Same cable?  Does boot output look ok or are characters dropped?
> Which kernels specifically (c8000 can c3600)?

c8000: 3.12.5 minus the mmap patch (the same for 3.12.8)
c3600: 3.12.5

Boot output looks fine. Cables are normal nullmodem. I can interact using 
minicom with the firmware, i.e. typing "BO PRI<return>N<return>" or things 
like that work fine.

Eike
--nextPart1647935.XlaHKAT2zv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlLj7lUACgkQXKSJPmm5/E4rMQCeIRC3+9XmSvhobY2dQ1qlM+6q
wf0An1khHWlayHoESSDecEBOmJarId9E
=IVq6
-----END PGP SIGNATURE-----

--nextPart1647935.XlaHKAT2zv--

