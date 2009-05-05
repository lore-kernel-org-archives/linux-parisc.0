From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Mon, 4 May 2009 23:46:09 -0400
Message-ID: <200905042346.11132.vapier@gentoo.org>
References: <20080417075357.GB23641@phobos.i.cabal.ca> <20090502223459.BC8924EE8@hiauly1.hia.nrc.ca> <20090502234348.GE28342@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2571686.txqGUoi7D9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090502234348.GE28342@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2571686.txqGUoi7D9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 02 May 2009 19:43:48 Kyle McMartin wrote:
> On Sat, May 02, 2009 at 06:34:59PM -0400, John David Anglin wrote:
> > Hi Kyle,
> >
> > > On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > > > > If you strace it, what syscall returns -EOPNOTSUPP?
> > > >
> > > > strace is broken and quits before the relevant syscall.  Think I
> > > > mentioned this before is a different context.
> > >
> > > Fixed & updated strace available at
> > > http://people.debian.org/~kyle/strace/
> >
> > strace is either broken again or debian didn't pick up your fix.  The
> > link to your updated version is broken.
> >
> > This happens when tracing sshd during a connection attempt with -f
> > option:
> >
> > strace -f -p 2390
> > Process 2390 attached - interrupt to quit
> > _newselect(7, [3 4], NULL, NULL, NULL
> > ...
> > [pid  5627] open("/etc/selinux/config", O_RDONLY|O_LARGEFILE) =3D -1 EN=
OENT
> > (No such file or directory) upeek:
> > ptrace(PTRACE_PEEKUSER,5627,4294967292,0): Input/output error Process
> > 5627 detached
> > <... _newselect resumed> )              =3D 1 (in [6])
> >
> > Trying to figure out why sshd sometimes does wierd stuff.
>
> I'll take a look, the strace link is broken because sadly the debian
> people didn't migrate the entirety of the people machine when they
> brought in a new one.

if said fix could actually get posted to the strace devel list at sf.net,=20
that'd be even better ...

probably related:
http://bugs.gentoo.org/250631
=2Dmike

--nextPart2571686.txqGUoi7D9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJJ/7aDAAoJEEFjO5/oN/WBeqYP/AsPH8qMOrXJtBe9OgIzXL6d
0ZyrTdTjuSn+dJB2rJDpPQMcrousqDENuyv30xrD8OvK9cvEu3qUwD4pXSdRPMQm
V5I48yyM+osnW5puW4auMq+0VEmMxIjn6oeqSqBhBw+E7P9eraj9S9rViRxH8tDQ
tURWLLv9ETB2vda+t4PlDsNKMkMTSKR8oQHGU7Re54VEFgyv6YITZd/zFhrogec2
JqlXYhDrlcqHdP0NyWd9TZavsYusQP1AypPdenUe/t1AA4kTT97H0sRb5bgM/ZH+
udBbjoRejnMH4F6+zQ7fjXn811zAqzTNG78MtyVp43lB/pUF0TH4fKuKysJUI/SV
KHsGrHt7C4yJ7jPzQ+LupndpkgCHyu1oyOBAL+pf8V5mB5Gjqih4QOazm8Ey29/c
Jr12sInb2x9KTkq95Ay9vFsidYn+3F89feVVKKEEylMzRCRXEjOUhV2JXMG1yyc7
xoyaulXhjPtHOxJSjJYrUmUOf0AeOR+3xjo0VCexb9sKtLwdJSt9XP3IcRy0C/Fz
m6hVu7a5JJohmEJOuKLAdr3OYdQSMjsPfX8jAmeF/ZyPmMSnB+rsbgwo/j7TfwLe
XQSxpdryEJJL5TA80RiAggeMBtQ/5xNNh2qoQyFUYKIpFEMHcBJJZtCAJ0cNZaMS
AFSuwECrXqOoWt4LkK9n
=b89y
-----END PGP SIGNATURE-----

--nextPart2571686.txqGUoi7D9--
