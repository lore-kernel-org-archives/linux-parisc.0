From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Fri, 12 Apr 2013 14:45:05 -0400
Message-ID: <201304121445.08948.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304112338.56618.vapier@gentoo.org> <1365741912.6982.8.camel@dabdike>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4420897.mEGuZ0ATZu";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: John David Anglin <dave.anglin@bell.net>,
	Kyle McMartin <kyle@mcmartin.ca>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	"linux-man" <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1365741912.6982.8.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart4420897.mEGuZ0ATZu
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Friday 12 April 2013 00:45:12 James Bottomley wrote:
> On Thu, 2013-04-11 at 23:38 -0400, Mike Frysinger wrote:
> > On Thursday 11 April 2013 22:34:43 John David Anglin wrote:
> > > On 11-Apr-13, at 9:55 PM, Mike Frysinger wrote:
> > > > On Sunday 07 April 2013 14:48:42 John David Anglin wrote:
> > > >> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
> > > >>> just to be clear, the only insn you need is:
> > > >>>   ble 0x100(%sr2, %r0);
> > > >>>=20
> > > >>> the kernel docs say sr2 holds the kernel gateway page (so i guess
> > > >>> 0x100 is a
> > > >>> known offset into that).  the docs don't mention r0 that i can se=
e,
> > > >>> so i'm
> > > >>> guessing it's one of those "always 0" registers ?
> > > >>=20
> > > >> Yes.  There is also an entry at offset 0xb0 for light-weight-
> > > >> syscalls.  Currently,
> > > >> this implements an atomic CAS operation used for pthread support.
> > > >=20
> > > > interesting.  sounds like a poor man's vDSO.  i'll document this the
> > > > new
> > > > vdso(7) man page.
> > >=20
> > > Not exactly, the code runs on the gateway page which is in kernel
> > > space. The main reason for doing the operation in kernel space is to
> > > prevent processes from being preempted while executing in the lock
> > > region.  In general,
> > > parisc processes are not preempted on the gateway page.  There are
> > > some subtleties regarding fault handling.
> >=20
> > sure ... the Blackfin arch does a similar thing for providing fast atom=
ic
> > primitives to userspace since the ISA can't.
> >=20
> > what do you think of this section for vdso(7) ?  i might have to split
> > the "real" vdso arches from these others since there's a couple now
> > (arm, bfin, parisc), and i think there might be more down the line
> > (microblaze).
>=20
> I've got to say, I really don't think this can be classified as a vdso.
> For a vdso, the kernel exports an ELF object that can be linked
> dynamically into any elf binary requiring it.  The ELF section
> information provides full details and so vdso entries can be called by
> symbol.

strictly speaking, sure, a vDSO is only a vDSO if it's an ELF (since the=20
acronym is literally "virtual dynamic shared object").  however, i see the=
=20
vdso as being a bit more of a flexible concept -- it's a place of shared co=
de=20
that the kernel manages and exports for all userspace processes. =20
fundamentally, the point of the vDSO is to provide services to greatly spee=
d=20
up userspace.  in that regard, these mapped pages are exactly like vDSOs.

thus i think it's appropriate to document these "fixed code" regions that m=
any=20
arches export (ARM, Blackfin, Itanium, Microblaze, PA-RISC) in the same man=
=20
page as the vdso.  especially since (currently) arches do one or the other,=
=20
but not both.

> In the parisc gateway page implementation, we have a set of "hidden"
> primitives which the executable must know how to call (no self
> description like a vdso).  This mechanism is identical to the original
> intent of the x86 int <n> instruction (an instruction that traps into
> the kernel and performs some primitive action but to use it, you have to
> know which function corresponds to which value of <n>).

would it be useful to document all of them ?  or just the ones that userspa=
ce=20
actively uses (like syscall/cas) ?  or should all of this be recorded in th=
e=20
kernel's Documentation/parisc/ subdir and just have the man page refer peop=
le=20
there (like it does for ARM & Blackfin currently) ?
=2Dmike

--nextPart4420897.mEGuZ0ATZu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRaFY0AAoJEEFjO5/oN/WBHEkQAIN9G92cijtofJnh6JbbEnV7
shOnMnE7rYinX9UwbjGPDjiZ29WYzsseyn590jofBdN/lD84XWzzefG4yXsBDlwM
xi4THnqAb8VhM4spz/9wc88vDX1Lex8fgZrhqXKDuxr4VjqojMPh02Ezehe1eqCV
Q5jw6f5MYVMhp1CPsBMXBLJBPur/8vaWiVF4ldKVcTe0FlSfvAb3iDaKtJOwyaOv
L7EMTdTFgDha4g6f1xiGvxPl3x+wXjpqUfV2Ha/aLdZ+28R7/brmTwVINlAWgRHB
I6GU605MwCZa5xjzNw/7LKK762fdwyMgzgzrBwQGTWB7qqH80oby2VjNEf67NUuw
TMvdv+bgpW8+A4qJeQTqMc4ZJw7Cws23ldToo2trHXPwLA7fzlrJuetKg+a0W9vh
19ry303G9VnFfIuKTGCr943nsbGjuqLJZEq8NyRHzUE4Gr9m/WKcqkD1OCQuvii8
4GCXMB4JlkDpNS2m5uawwdbMJena7HrKln8pm5+E3QNHBADocyZ6aiYfMu8qNv8x
sAo0QvyORaNWlArc6/xOvkH0zGQyUeVVfGLCH5cNPMAeqSRklcM71ToN7pFKLjoC
QEKRFSEbgKcJmXBELS3jLlwDszB+qaDQECow6RcrSJN653Q7xqnrOgahqSXy3pPC
ARjTXutY4acEt41vhhwJ
=1ZVf
-----END PGP SIGNATURE-----

--nextPart4420897.mEGuZ0ATZu--
