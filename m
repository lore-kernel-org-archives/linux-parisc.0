From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: ptrace interface does not permit modification of syscall return
Date: Mon, 28 Dec 2015 13:03:07 -0500
Message-ID: <20151228180307.GI25803@vapier.lan>
References: <20151221175558.GA11489@vapier.lan>
 <5679BC60.5090107@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0k2ZE0YWsaeoufzj"
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5679BC60.5090107@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--0k2ZE0YWsaeoufzj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22 Dec 2015 22:10, Helge Deller wrote:
> On 21.12.2015 18:55, Mike Frysinger wrote:
> > i have a ptrace program that watches for specific syscalls and when
> > matched, will:
> >  - on entry change the syscall nr to -1 (so the kernel will skip it)
> >  - on exit change the return to -EPERM so the userspace sees a denial
> >=20
> > i have this working on most arches (x86, x86_64, arm, alpha, ia64, etc.=
=2E.).
> > on parisc, the kernel (using 3.18.7 currently) appears to be wrong.  in=
 my
> > tests, if i don't mess with the syscall nr, i can change the return val=
ue
> > fine (to EPERM or whatever).  but the syscall executed which i do not w=
ant.
> > if i change the syscall to -1, then i can't change the return value (so=
 the
> > child sees ENOSYS), but the kernel still executes the original syscall.
> >=20
> > i have a simple test case attached to show the issue.  the code does:
> >  - spawn a child with the parent tracing it
> >  - child will do:
> >   - dupe stderr to another fd
> >   - unlink a file named ".test.flag"
> >   - write a message through the new fd
> >   - close a magic # so the parent knows to start denying
> >     - should see EPERM but it sees ENOSYS
> >   - close the new fd
> >     - should see EPERM but it is closed!
> >   - write to the new fd
> >     - should work, but the fd is closed
> >   - call create on ".test.flag"
> >     - should see EPERM, but the file is created!
> >  - parent will do:
> >   - log the syscalls until child runs close(-12345)
> >   - the parent will then try to deny all close/creat calls
> >   - uses PTRACE_POKEUSER w/PT_GR20 to set syscall to -1
> >   - uses PTRACE_POKEUSER w/PT_GR28 to set return to -EPERM
> >=20
> > you can run the test case by doing:
> > $ gcc test.c && ./a.out
>=20
> I agree, something is fishy :-)
>=20
> I did some tests with your testcase.
> First problem I had was, that compiling failed since it didn't found the =
asm/offset.h header file.
> Which one did you used? I know it usually should come with the kernel hea=
ders, but there it is asm-offsets.h.

hmm, looks like it got installed by hand at some point (Jul 2004 datestamp!)
and never cleaned up.

> First problem: I had to install the 64bit header file. PT_GR20 in this on=
e was much higher than it should be for 32bit userspace.
>=20
> So, I used those defines (taken from the strace source package):
> #define PT_GR20 (20*4)
> #define PT_GR26 (26*4)
> #define PT_GR28 (28*4)
> #define PT_IAOQ0 (106*4)
> #define PT_IAOQ1 (107*4)

these are the values in my local asm/offset.h, and what i was using
in my original code -- the register # multiplied by 4.

> With that I got those output:

looks like you're seeing the same as me.  i'm only testing 32bit user
and 32bit kernel currently as we don't have a 64bit userspace :).
-mike

--0k2ZE0YWsaeoufzj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWgXlbAAoJEEFjO5/oN/WBcfgQAIRL/OrmcsNRf5FlUu7D3y0r
hUzgwBnj7CNume4sgi9Kmzdhny5RG8mXK6OSDklNXCH2fAz2n7JuaJC8r78NeVN2
C/33BRaWYpUnI/BuLZ8fToOMIEh8gdr/wvaxE58zJxSovcBg9mK0z2X3+0ouXaVY
Fwtg9Vbe6EeFIMesOmTZypeM9oQ4rlrWktGDF2mXU5TPBz3tintq/3wSzrPwzTNT
YcQxZ3Itl3Tx6h41yoq0zAcCWBsksZ7msMw9aFiAWdPZp9CDn62nzwKFE0xPYoFj
ScQ6THNn2gZwbaRVyXHZTmFgl8pbuKx3PdDVSxeVyxoEcnuA5rs+OITJnpdBlZZu
xOgZy0JHh4OgGFStKo2RR+AzvQTXMJlp07eGvE07N78Opul8gmx/nbktyr8s+M3u
1H2qu6nFKHWk+LQdabTQtCn9ageZBg3imTy6yJYp+nwuw2jnTDjJuaQvTCU8UJ9C
6RvKDeFq2Z07AbSYcVgIJP2ssh7mlDvYhGuLLkMZTlcjhDoIj8pjS3vKk4bSXS4V
RjmyWZZGURQOswaYilkZb/OMxK9U325H2kQtbxIiayltXPpzuKWxNRwjYHS+5ZNr
An6mI22+sdyQhYdptvU789d4Jc4yCRf/KDBzCC3th3XqLF+Vm2T7ygiJk55T+wzn
71j3F1jSQC3jGHHk3tO7
=YkGF
-----END PGP SIGNATURE-----

--0k2ZE0YWsaeoufzj--
