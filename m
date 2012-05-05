From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sun, 06 May 2012 00:00:43 +0200
Message-ID: <4696140.nzSZDxnI1S@donald.sf-tec.de>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com> <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com> <CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8628527.YMkJWkif5a"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+55aFy2O8KcLC-yGCG2ZRpCpAdZ_T7z-sSme4fMrXG=YNAAhA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart8628527.YMkJWkif5a
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Linus Torvalds wrote:
> On Sat, May 5, 2012 at 11:53 AM, Mikulas Patocka <mpatocka@redhat.com> 
wrote:
> > What NO_IRQ problem do you mean? There is
> > #define NO_IRQ          (-1)
> > in arch/parisc/include/asm/irq.h.
> 
> That's the one he means.
> 
> Switching it to zero and testing that things still work would be
> appreciated.
> 
> Much code already knows that NO_IRQ is supposed to be zero, and
> there's tons of drivers that just do the (correct!) "if (!dev->irq)"
> kind of thing.
> 
> Any architecture that has a non-zero NO_IRQ is basically broken.
> Always has been.

The stuff in drivers/parisc/gsc.c doesn't look as if it would survive that 
change.

Eike
--nextPart8628527.YMkJWkif5a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+loxkACgkQXKSJPmm5/E6KQQCeIUj/xTTc2TaeoMjlB9IRCEXF
JPsAn0UvZ8cpqwOwRgVbJh+PWpzwwMWB
=pn4l
-----END PGP SIGNATURE-----

--nextPart8628527.YMkJWkif5a--

