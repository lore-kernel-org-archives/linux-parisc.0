Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hal.pp.fishpool.fi (hal.pp.fishpool.fi [195.197.229.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F86C4829
	for <parisc-linux@parisc-linux.org>; Tue, 10 Sep 2002 08:59:32 -0600 (MDT)
Date: Tue, 10 Sep 2002 17:59:29 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: parisc-linux@parisc-linux.org
Cc: Richard Zidlicky <rz@linux-m68k.org>
Message-ID: <Pine.LNX.4.21.0209101752260.28289-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Subject: [parisc-linux] Re: accessing TOS and VFAT partitions on Linux (fwd)
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

I have submitted this to the m68k list first, hoping that someone might kno=
w,
and this is where Richard Zidlicky tried to help, but it looks like this _m=
ight_
be dependant upon an m68k-only patch... or is it?

Should the 2.4.18 kernel distributed thru the Woody/hppa tree be able to fi=
nd
not just Atari partitions, but also Atari's own flavor of DOS filesystem?

The kernel I run is based upon the defaults found in the 2.4.18-32 kernel, =
but
has Atari partitions support enabled.

PS:  I do not subscribe to parisc-linux, only to debian-hppa; please CC to =
me.

--=20
Martin-=C9ric Racine, Espoo, Finland.
"Kas sa tahad mind? - Nej!!! =C4r du en idiot?!!"
http://www.pp.fishpool.fi/~q-funk/

---------- Forwarded message ----------
Date: Tue, 10 Sep 2002 14:37:28 +0200
From: Richard Zidlicky <rz@linux-m68k.org>
To: Martin-=C9ric Racine <q-funk@pp.fishpool.fi>
Subject: Re: accessing TOS and VFAT partitions on Linux

On Tue, Sep 10, 2002 at 03:09:57PM +0300, Martin-=C9ric Racine wrote:
> On Tue, 10 Sep 2002, Richard Zidlicky wrote:
>=20
> > On Tue, Sep 10, 2002 at 08:36:29AM +0300, Martin-=C9ric Racine wrote:
> > > > > Is there any special trick to access those FAT partitions on Linu=
x?
> > > >=20
> > > > use 'atari=3Dyes' option to mount it.. doesn't appear to have it ma=
de into the
> > > > manpages yet?
> > >=20
> > > Nor does it appear to work. :(
> >=20
> > what does it say? Kernel or mount problem?=20
>=20
> The relevant part of /etc/fstab:
>=20
> /dev/sdb1 /TT030/C msdos defaults,errors=3Dremount-ro,atari=3Dyes 0 2
> /dev/sdb2 /TT030/D msdos defaults,errors=3Dremount-ro,atari=3Dyes 0 2
> /dev/sdb3 /TT030/E ext2 defaults,errors=3Dremount-ro 0 2
> /dev/sdb4 /TT030/F ext2 defaults,errors=3Dremount-ro 0 2
> /dev/sdb5 /TT030/G ext2 defaults,errors=3Dremount-ro 0 2
> /dev/sdb6 /TT030/H ext2 defaults,errors=3Dremount-ro 0 2
> /dev/sdb7 /TT030/I vfat defaults,errors=3Dremount-ro,atari=3Dyes 0 2
> /dev/sdb8 /TT030/J swap sw 0 2
> /dev/sdb9 /TT030/K ext2 defaults,errors=3Dremount-ro 0 2
> /dev/sdb10 /TT030/L msdos defaults,errors=3Dremount-ro,atari=3Dyes 0 2
> /dev/sdb11 /TT030/M ext2 defaults,errors=3Dremount-ro 0 2
>=20
> <root@zarya:/root># mount -a
> mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
>        or too many mounted file systems
> mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>        or too many mounted file systems
> mount: wrong fs type, bad option, bad superblock on /dev/sdb7,
>        or too many mounted file systems
> mount: wrong fs type, bad option, bad superblock on /dev/sdb10,
>        or too many mounted file systems

this looks like kernel problem than.. not quite sure if or when
that stuff was ever merged into mainline kernel. Certainly not
before 2.4.13.

>=20
> Linux zarya 2.4.18 #3 ti elo=A027 02:15:57 EEST 2002 parisc unknown unkno=
wn GNU/Linux
>=20
> > Quite possible that you will need to fetch a kernel from linux-m68k-cvs=
=2Eapia.dhs.org
>=20
> You produce non-m68k kernels too? ;-)

the diff between m68k and Linus tree is very small in 2.4.19, our
kernels should work perfectly on x86. Certainly not optimised for
parisc though :(
Compare your fs/fat/inode.c with ours, possibly also 2.4.19.

> > > Is that "atari=3Dyes" option found only in a special version of mount=
?
> >=20
> > doesn't appear like special support were required here, I know only the=
=20
> > kernel side of it. It would be possible to compile a special 386 kernel=
=20
> > with that parameter hardcoded into it (in fs/fat/inode.c change=20
> > #ifdef CONFIG_ATARI to #if 1). Might not work with ordinary MSDOS volum=
es
> > very well than.
>=20
> That's not desirable, of course.

might be worth a try, after looking at the stuff it appears to do some
autodetection. It should certainly continue to work at least on MSDOS
floppies.

Richard
