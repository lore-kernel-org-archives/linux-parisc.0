From: Ben Hutchings <ben@decadent.org.uk>
Subject: Unexpected behaviour of idr_get_empty_slot() on parisc
Date: Sun, 03 Jan 2010 23:23:25 +0000
Message-ID: <1262561005.2238.51.camel@localhost>
References: <20091220234610.GG11237@jade.home>
	 <1261354364.25157.246.camel@localhost>  <20091221003500.GK11237@jade.home>
	 <1261357334.25157.272.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-+Bt2syK3FfD0sTZZw5zB"
Cc: Ryan Niebur <ryan@debian.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1261357334.25157.272.camel@localhost>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--=-+Bt2syK3FfD0sTZZw5zB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ryan Niebur reported in <http://bugs.debian.org/561880> that on a
PA-RISC system running Linux 2.6.32 the following test case for inotify:

#include <sys/inotify.h>
#include <stdio.h>

int main()
{
    int fd, wd;

    fd =3D inotify_init ();
    wd =3D inotify_add_watch (fd,
                            "test.c",
                            IN_OPEN | IN_CLOSE);
    printf("First: %d\n", wd);
    inotify_rm_watch(fd, wd);
    wd =3D inotify_add_watch (fd,
                            "a.out",
                            IN_OPEN | IN_CLOSE);
    printf("Second: %d\n", wd);
    inotify_rm_watch(fd, wd);
}

produces the output:

First: 1
Second: 1

The behaviour he (and the test case's author) expects is that ids for
closed descriptors are not reused and the second id will be 2.  The
implementation does seem to ensure that:

static int inotify_handle_get_wd(struct inotify_handle *ih,
				 struct inotify_watch *watch)
{
	int ret;

	do {
		if (unlikely(!idr_pre_get(&ih->idr, GFP_NOFS)))
			return -ENOSPC;
		ret =3D idr_get_new_above(&ih->idr, watch, ih->last_wd+1, &watch->wd);
	} while (ret =3D=3D -EAGAIN);

	if (likely(!ret))
		ih->last_wd =3D watch->wd;

	return ret;
}

Removing the inotify_rm_watch() calls from the test case results in the
expected output, so I have no reason to think that id can be assigned
while it is already in use.  However, it does appear that
idr_get_empty_slot() can somehow select an id smaller than starting_id.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption] would be
development of an easy way to factor large prime numbers. - Bill Gates

--=-+Bt2syK3FfD0sTZZw5zB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUAS0Em5+e/yOyVhhEJAQLjJw/6A9r2xScCXvOkaEo9S469PLt0Gw4XSGbi
PfEqjy81qhcjSTa2YfEU+mmfdehgMu3KNaudNjBe7ayR9ZskA5rEB1xq6cn4CpNi
N8RYkVkY8WTya4unwJC3kU8RnINP0xZVE65OuxTsTjXaFUEMkSyDxQdD8eR9ExQc
XSchSYKb1PLZFni7zVOy7X8QfkrMrCyP7XL09f5TJblPPcMJLa/hHIa9pAXWqb6s
7xgU0SkrlGUxIul07UFOTXOd/JZ+dVN1EyA6DqnghCD0buhSPq0OnzU+GTc+2iK6
Zut+DCBuxv7hXDzxViVz+olC/KPoc4266sDHqgbdMXyjsYEP4h7s0fPqcoPJ3U5q
MDduNtUfbxfuGAbKjw5Qj3nCd6m86u3tBRz5VglFoGqk2SjHDYlKdXivabZdYCC8
2GYe6rGn3l1Tl/uEwHNvXbbpzpQOPvc5lkhAvFJ/686GlRkIrUkZPK6bxlTfKRop
8+ycqal7vAZqSNb3exCH+QN5n3cYtl5kQaSw40TyszQA9qWd+Q06lZQI8QcMhF/P
CtINLPEcuZkQhlzzfXByUHwAotZR9CmO5RnyWzJEompmdyWA8Mcd8y/fKVJ07+Qk
8jlHQ+kRVPAinzHZsx+yylNoIxrX+hLJKs/hDwH6WkFj/9MrKjW8Tm5GfmmiXSVZ
F2VZF/ie7bk=
=UvTF
-----END PGP SIGNATURE-----

--=-+Bt2syK3FfD0sTZZw5zB--
