From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH -next 1/2] seq_puts: Convert to return void and convert
 uses too.
Date: Tue, 11 Nov 2014 00:32:36 +0000
Message-ID: <20141111003236.GS3815@sirena.org.uk>
References: <cover.1415645476.git.joe@perches.com>
 <c8249a5c6504275a0e22704dda83b34002a89eac.1415645476.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YW0vl6bOwYQ/J4Ih"
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@iguana.be>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Petr Mladek <pmladek@suse.cz>, Felipe Balbi <balbi@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
To: Joe Perches <joe@perches.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <c8249a5c6504275a0e22704dda83b34002a89eac.1415645476.git.joe@perches.com>
List-ID: <linux-fsdevel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--YW0vl6bOwYQ/J4Ih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2014 at 10:58:56AM -0800, Joe Perches wrote:
> Using the return value of seq_puts is error-prone, so
> make it return void instead.

Acked-by: Mark Brown <broonie@kernel.org>

--YW0vl6bOwYQ/J4Ih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUYVkjAAoJECTWi3JdVIfQpMYH/2Kbn9+gPddauhOdQJ0BGVz8
85A17JrLFg6lHJwNli66Oht8PMGCs4gKsdkG7+rfLr4SurZsBH//g8mym6ohWkr9
8tvBo1z74oJDu1JuzDIgRA9uMlKFIJjb3ClhgnGjDWTNCAqzuOwrdf243/+7KlJ4
gvHAi3mASlkI6uh3qCgmIHcIsDT8mcK8hY+I9TnDB0KusBTmNsyOaloEF9iOHs+A
UJHCH/gpq2nI/RAr77B1sJwgf7QlqW7zd6M0CllstDQIlqH5LCms73wXXBGdzSxs
6dFtTlH5ccibzhTYVa/n21WM3RLiPIV6PKzQQwV12GMmMxuHreH/AJcP1RZdmzE=
=8knI
-----END PGP SIGNATURE-----

--YW0vl6bOwYQ/J4Ih--
