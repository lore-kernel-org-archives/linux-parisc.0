Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DA58482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 07:22:49 -0600 (MDT)
Date: Mon, 12 May 2003 15:22:48 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
Message-ID: <20030512132248.GU27494@lug-owl.de>
References: <20030511133037.GN27494@lug-owl.de> <20030512121155.GV29534@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7aQJ/pUO7E0NVzIB"
In-Reply-To: <20030512121155.GV29534@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--7aQJ/pUO7E0NVzIB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-12 13:11:55 +0100, Matthew Wilcox <willy@debian.org>
wrote in message <20030512121155.GV29534@parcelfarce.linux.theplanet.co.uk>:
> On Sun, May 11, 2003 at 03:30:37PM +0200, Jan-Benedict Glaw wrote:
> >  - Add various void * casts to pointer compares (to solve the
> >    __canonicalize_funcptr_for_compare missing symbol when built as
> >    module because libgcc.a isn't linked into these modules)
>=20
> I'm not applying these bits.  It's just not reasonable to add (void *)
> casts to every function pointer comparison.  I know Linus will reject it.
> We need to find a better way to fix this one -- and I suspect the right
> way is to implement a __canonicalize_funcptr_for_compare in the kernel
> and EXPORT_SYMBOL it.

I thougt about that, but didn't do it this way because I didn't like the
approach to double libgcc's __canonicalize_funcptr_for_compare. Maybe
we'd simply find a way to EXPORT_SYMBOL libgcc's version of that one...

> > --- arch/parisc/oprofile/init.c	8 May 2003 13:31:44 -0000	1.5
> > +++ arch/parisc/oprofile/init.c	11 May 2003 13:09:18 -0000
> > @@ -11,6 +11,8 @@
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/oprofile.h>
> > +#include <linux/init.h>
> > +#include <linux/errno.h>
>=20
> hmm... init.h and errno.h are already included earlier, so I didn't
> apply this patch.

Oh, fs*k. I had a merge conflict there and didn't pay enough attention:(
init.h and errno.h should be included once each... Sorry.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--7aQJ/pUO7E0NVzIB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+v6AnHb1edYOZ4bsRAgSOAJ4udCTgBpLg2l6rfMbEczYnP+jPYgCfeQtL
MwINZ1ESBQdY5+ysmZl4I7w=
=7F4G
-----END PGP SIGNATURE-----

--7aQJ/pUO7E0NVzIB--
