Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38875482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 09:19:09 -0600 (MDT)
Date: Mon, 12 May 2003 17:19:08 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
Message-ID: <20030512151907.GX27494@lug-owl.de>
References: <20030511133037.GN27494@lug-owl.de> <20030512121155.GV29534@parcelfarce.linux.theplanet.co.uk> <20030512132248.GU27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SpiXHX+fVORj1nzn"
In-Reply-To: <20030512132248.GU27494@lug-owl.de>
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

--SpiXHX+fVORj1nzn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-12 15:22:48 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.de>
wrote in message <20030512132248.GU27494@lug-owl.de>:
> On Mon, 2003-05-12 13:11:55 +0100, Matthew Wilcox <willy@debian.org>
> wrote in message <20030512121155.GV29534@parcelfarce.linux.theplanet.co.u=
k>:
> > On Sun, May 11, 2003 at 03:30:37PM +0200, Jan-Benedict Glaw wrote:
> > >  - Add various void * casts to pointer compares (to solve the
> > >    __canonicalize_funcptr_for_compare missing symbol when built as
> > >    module because libgcc.a isn't linked into these modules)
> >=20
> > I'm not applying these bits.  It's just not reasonable to add (void *)
> > casts to every function pointer comparison.  I know Linus will reject i=
t.
> > We need to find a better way to fix this one -- and I suspect the right
> > way is to implement a __canonicalize_funcptr_for_compare in the kernel
> > and EXPORT_SYMBOL it.
>=20
> I thougt about that, but didn't do it this way because I didn't like the
> approach to double libgcc's __canonicalize_funcptr_for_compare. Maybe
> we'd simply find a way to EXPORT_SYMBOL libgcc's version of that one...

I got a private reply to this part (which I accidentally /dev/null'ed)
basically stating that the kernel should implement an own version of
__canonicalize_funcptr_for_compare (instead of using that one which is in
libgcc).

Greping around reveals no own version in the Linux kernel so that one
that is used with built-in function pointers already seems to be
borrowed from libgcc. So a question remains:

	Shall we have an own version, or shall we stick wich gcc's
	version?

I already do know that libgcc did bring some problems with it along
(generate an athlon-aware compiler and then build a kernel for an
original i386:-) But I do _not_ know if those problems got smashed...

I think it would be most helpful to get some people's comments who are
more into gcc...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--SpiXHX+fVORj1nzn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+v7trHb1edYOZ4bsRAoaGAJ0VXnWOApbcsViDGoEyMAzjkAthrgCfbTH/
aMaZMuP+9gZ+b3qb012QDKc=
=E2PK
-----END PGP SIGNATURE-----

--SpiXHX+fVORj1nzn--
