From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or reboot.
Date: Fri, 12 May 2017 21:38:42 +0200
Message-ID: <4792357.d5SYhxNKWE@daneel.sf-tec.de>
References: <20170512165513.GA23551@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1619466.usUTFGK7q7"; micalg="pgp-"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170512165513.GA23551@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1619466.usUTFGK7q7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Nitpick:

> +	return retval;
> +}
> +
> +
> +/**
>   * pdc_pat_get_irt_size - Retrieve the number of entries in the cell's

Double newline.

Greetings,

Eike
--nextPart1619466.usUTFGK7q7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlkWD0cACgkQXKSJPmm5/E43ZgCeJXlE5F7L919rsObnzCAGxG+c
Y7wAnR5OeneFbpbM0sA++9bZz/LjF6bc
=Oq3f
-----END PGP SIGNATURE-----

--nextPart1619466.usUTFGK7q7--

