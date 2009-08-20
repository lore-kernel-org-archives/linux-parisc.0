From: "Helge Deller" <deller@gmx.de>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 14:25:37 +0200
Message-ID: <20090820122537.29410@gmx.net>
References: <4A89CC4D.5040801@gmx.de>	 <1250549376.7858.96.camel@mulgrave.site>
	 <200908181248.52572.rusty@rustcorp.com.au>	
 <20090818050637.4C3E74730F@magilla.sf.frob.com>
 <1250640565.15079.3.camel@mulgrave.site> <20090820115122.123520@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John David Anglin <dave.anglin@nrc.ca>
To: "Helge Deller" <deller@gmx.de>, roland@redhat.com,
	James.Bottomley@HansenPartnership.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090820115122.123520@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > On Mon, 2009-08-17 at 22:06 -0700, Roland McGrath wrote:
> > > > I'd be happy to fail to load it.  There might be sysfs issues w=
ith
> it
> > too.
> > >=20
> > > That sounds reasonable to me.  And I'd be happy to at least look =
a
> > little
> > > and maybe give some advice to anybody who finds themself building=
 such
> a
> > > (free) module, doesn't know why or how it got that way, and wants=
 to
> > ask.
> >=20
> > Actually, for parisc, its not reasonable.  It's expected that our
> > modules have multiple text sections (we have to use -ffunction-sect=
ions
> > to generate them in order that the PCREL17 jump stubs can be
> > interleaved).
> >=20
> > The problem looks to be that some linker error gave the one of the =
named
> > function text sections a duplicate name.  Helge, can you post he ob=
jdump
> > info that shows which section had a duplicate name?
> >=20
> > Even with the duplicate name, though, the module should be perfectl=
y
> > loadable.
>=20
>=20
> It's the ac97_bus kernel module:
> -rw-r--r-- 1 root root 3.0K 2009-08-19 12:25 ac97_bus.ko=20

That's actually a problem of all kernel modules on hppa when using a ne=
wer compiler, not only the ac97_bus module.

The reason seems to be, that something in the newer gcc compilers chang=
ed to generate multiple sections all named ".text" for the PCREL17 relo=
cations.
Older compilers named those sections ".text.1", ".text.2", ".text.3" an=
d so forth.

"objdump -x ac97_bus.ko" with current (newer) compiler gives:
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>   0 .note.gnu.build-id 00000024  00000000  00000000  00000034  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA           =20
>   1 .text         00000000  00000000  00000000  00000058  2**0    =20
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE           =20
>   2 .text.ac97_bus_match 0000001c  00000000  00000000  00000058  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE             =20
>   3 .exit.text    00000030  00000000  00000000  00000074  2**2      =20
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE      =20
>   4 .init.text    00000030  00000000  00000000  000000a4  2**2      =20
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE      =20
>   5 .text         00000000  00000000  00000000  000000d4  2**0      =20
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE             =20
>...

older compiler produced:
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .text.ac97_bus_match 0000001c  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .exit.text    00000030  00000000  00000000  00000050  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  3 .init.text    00000030  00000000  00000000  00000080  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  4 .text.1       00000000  00000000  00000000  000000b0  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
=2E..

Helge
--=20
Neu: GMX Doppel-FLAT mit Internet-Flatrate + Telefon-Flatrate
f=FCr nur 19,99 Euro/mtl.!* http://portal.gmx.net/de/go/dsl01
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
