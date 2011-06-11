From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc, don't claim cpu irqs more than once
Date: Sat, 11 Jun 2011 22:20:07 +0200
Message-ID: <1617203.1AoiWjTfrU@donald.sf-tec.de>
References: <20110611185524.GA1369@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4496845.Rk5gIvoysk"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de,
	jejb@parisc-linux.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110611185524.GA1369@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart4496845.Rk5gIvoysk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

John David Anglin wrote:
> The CPU irqs (timer and IPI) are not shared and only need to be claimed
> once.  A mismatch error occurs if they are claimed more than once.
> 
> Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> 
> Dave

It's a bad idea to put the patch behind your signature as it then get's 
stripped by mailers when replying. Anyway...

>         int i;
> +#ifdef CONFIG_SMP
> +       static int irqs_claimed;
> +       if (irqs_claimed)
> +               return;
> +       irqs_claimed = 1;
> +#endif

Shouldn't this be bool then? Now that we have it.

Eike
--nextPart4496845.Rk5gIvoysk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk3zzf4ACgkQXKSJPmm5/E7J/QCcCKh3690HtK+yQi3qYA4xWuhW
kpcAn11FHdbbXfgzax6GsZsN5LSf/JZb
=R92a
-----END PGP SIGNATURE-----

--nextPart4496845.Rk5gIvoysk--

