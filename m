From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Fri, 12 Apr 2013 15:46:51 -0400
Message-ID: <201304121546.54478.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304121445.08948.vapier@gentoo.org> <1365794087.1934.50.camel@dabdike>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4323620.CjZlNmuAJo";
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
In-Reply-To: <1365794087.1934.50.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart4323620.CjZlNmuAJo
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Friday 12 April 2013 15:14:47 James Bottomley wrote:
> On Fri, 2013-04-12 at 14:45 -0400, Mike Frysinger wrote:
> > On Friday 12 April 2013 00:45:12 James Bottomley wrote:
> > > On Thu, 2013-04-11 at 23:38 -0400, Mike Frysinger wrote:
> > > > what do you think of this section for vdso(7) ?  i might have to
> > > > split the "real" vdso arches from these others since there's a
> > > > couple now (arm, bfin, parisc), and i think there might be more down
> > > > the line (microblaze).
> > >=20
> > > I've got to say, I really don't think this can be classified as a vds=
o.
> > > For a vdso, the kernel exports an ELF object that can be linked
> > > dynamically into any elf binary requiring it.  The ELF section
> > > information provides full details and so vdso entries can be called by
> > > symbol.
> >=20
> > strictly speaking, sure, a vDSO is only a vDSO if it's an ELF (since the
> > acronym is literally "virtual dynamic shared object").  however, i see
> > the vdso as being a bit more of a flexible concept -- it's a place of
> > shared code that the kernel manages and exports for all userspace
> > processes. fundamentally, the point of the vDSO is to provide services
> > to greatly speed up userspace.  in that regard, these mapped pages are
> > exactly like vDSOs.
>=20
> I don't entirely understand this classification.  If the kernel<->user
> gateway becomes classified as a vdso, that covers our syscall interface
> on every archtecture.  There's now no distinction between a vdso (which
> may not even move to kernel mode) and a syscall.
>=20
> I think the difference is that a syscall is a specific call to a known
> kernel routine by number and it involves a transition to kernel mode.  A
> vdso is an exported link object containing certain functions which may
> or may not cause a trap to kernel mode when executed.  The distinction
> is how you do the call.  For syscalls, you have to know the number and
> the arguments.  For vdso you just have to know the symbol (and
> obviously, the prototype for C code) and the kernel supplies the
> implementation direct to the userspace binary.

i'm not fully versed in the parisc linux gateway page or how the architectu=
re=20
is handling things, so i could be completely off here.  from reading the so=
urce=20
code, it *looked* like it was just a page of utility funcs that userspace=20
branches to without changing privilege modes or going through the full sysc=
all=20
routines.

so i'm saying the gateway page itself can be thought of in the same vein as=
 a=20
vDSO.  it's a black box with entry points that provide light weight service=
s=20
to userspace.  sometimes it ends up triggering a full syscall, sometimes it=
=20
doesn't (just like a vDSO).

> > thus i think it's appropriate to document these "fixed code" regions th=
at
> > many arches export (ARM, Blackfin, Itanium, Microblaze, PA-RISC) in the
> > same man page as the vdso.  especially since (currently) arches do one
> > or the other, but not both.
>=20
> I really see these as a type of lightweight syscall.  You use the
> syscall prototype (call by number with known arguments) but the call may
> not necessarily transition to kernel mode proper to handle the function.

if you think of the vdso in a very strict light (it's exactly an ELF that t=
he=20
kernel automatically maps into every process's address space), then i guess=
=20
you can only classify these as lightweight syscalls (where the address/offs=
et=20
is the "syscall #").

i see vdso as being a more flexible concept than that -- if it's code mappe=
d=20
into a process's address space and provides useful lightweight services tha=
t=20
are meant to be used specifically in lieu of syscall(), then it's vdso-like=
 and=20
should be in the vdso(7) man page.  it has a lot more in common imo with a=
=20
vdso than it does with an actual syscall.  i certainly think vdso(7) is mor=
e=20
appropriate for these regions than syscall(2) or syscalls(2).

> > > In the parisc gateway page implementation, we have a set of "hidden"
> > > primitives which the executable must know how to call (no self
> > > description like a vdso).  This mechanism is identical to the original
> > > intent of the x86 int <n> instruction (an instruction that traps into
> > > the kernel and performs some primitive action but to use it, you have
> > > to know which function corresponds to which value of <n>).
> >=20
> > would it be useful to document all of them ?  or just the ones that
> > userspace actively uses (like syscall/cas) ?  or should all of this be
> > recorded in the kernel's Documentation/parisc/ subdir and just have the
> > man page refer people there (like it does for ARM & Blackfin currently)
> > ?
>=20
> I'm not sure.  For x86 they're in include/asm/traps.h.  I think the only
> ones we really use are int3 for breakpoint, int4 for overflow and int80
> for legacy syscall.

hmm, i wasn't even considering the other arch-specific services offered by =
e.g.=20
software interrupts.  i don't think those belong in vdso(7) as they don't=20
confer any of the lightweight advantages the vdso is designed to bring, but=
 it=20
might be useful to document these somewhere.  they're also not as common fo=
r=20
people to encounter as a vdso ...
=2Dmike

--nextPart4323620.CjZlNmuAJo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRaGSuAAoJEEFjO5/oN/WBHQsP/RAaCknJh0hHHaqTgvfR7qD6
GiAwpxMSNp0uG6q2hlYYH4FNOk4yXR8l99XZOr0SHTzHNI6r+Dd742Lx9hAtxtZ/
VsNmO4pUsnORBTb5WnOYld2Ml4Pjd1RgCLwlKjj9Ol88nImyD2VTmRpBxfUsx0np
M6ZfwbLfITifb8e65mYhNhwA9EEcugIHseGTs4KKwDy9GAdLHOJAdzTx2f6+bMgf
sbQaSzL0Y1x3JylbCjcCsOkuy0yt+4mjezyNAM00vOZ3qLYN2bGpEGwHu43HdTTK
A/QZTw41DF0S6IMvT4m9HzVPOuL61mBOkOj/gIEd6BWwC0PXkQ0/DO9ZbvxclCy/
2sEHPaDHESM6btfGjaF0LeE/BsitIYSVZQp6Xyels8RCBp9U6NKlDzRou8vm+hJZ
7ivtqat3j2eJ1O95guQ//BQImhPp6wphSEOM+AwFpjL9sIBgUxsMxwHY8OvuZNO9
PzkLZCtplTZT0lLWTe/XPfuNcnQvxJflUAx2VAyCNKXEZj2CfmIQQvv5M/ZO223X
nOsWAKxQAJQJqGcukWJkProyDxSDUaDmkcNzumcnZVxw+42C6eorIPwwbH1eY8Ya
tVS3PZ2uUxsI2M0gs1M8+7r/oVIxRF5lQ4Tfm+b+MIgIFeYKZ2n6/6Lh3cyyWtsB
zquf4UJ2vTd1Ka/eLWTi
=DDbX
-----END PGP SIGNATURE-----

--nextPart4323620.CjZlNmuAJo--
