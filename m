From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Thu, 11 Apr 2013 23:38:53 -0400
Message-ID: <201304112338.56618.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304112155.46349.vapier@gentoo.org> <BLU0-SMTP62F4273B01E0328ADCD7BE97C10@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1603183.eDxiJ80Ly0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	"linux-man" <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP62F4273B01E0328ADCD7BE97C10@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1603183.eDxiJ80Ly0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 11 April 2013 22:34:43 John David Anglin wrote:
> On 11-Apr-13, at 9:55 PM, Mike Frysinger wrote:
> > On Sunday 07 April 2013 14:48:42 John David Anglin wrote:
> >> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
> >>> just to be clear, the only insn you need is:
> >>> 	ble 0x100(%sr2, %r0);
> >>>=20
> >>> the kernel docs say sr2 holds the kernel gateway page (so i guess
> >>> 0x100 is a
> >>> known offset into that).  the docs don't mention r0 that i can see,
> >>> so i'm
> >>> guessing it's one of those "always 0" registers ?
> >>=20
> >> Yes.  There is also an entry at offset 0xb0 for light-weight-
> >> syscalls.  Currently,
> >> this implements an atomic CAS operation used for pthread support.
> >=20
> > interesting.  sounds like a poor man's vDSO.  i'll document this the
> > new
> > vdso(7) man page.
>=20
> Not exactly, the code runs on the gateway page which is in kernel space.
> The main reason for doing the operation in kernel space is to prevent
> processes from being preempted while executing in the lock region.  In
> general,
> parisc processes are not preempted on the gateway page.  There are
> some subtleties regarding fault handling.

sure ... the Blackfin arch does a similar thing for providing fast atomic=20
primitives to userspace since the ISA can't.

what do you think of this section for vdso(7) ?  i might have to split the=
=20
"real" vdso arches from these others since there's a couple now (arm, bfin,=
=20
parisc), and i think there might be more down the line (microblaze).

=2ESS parisc (hppa) functions
=2E\" See linux/arch/parisc/kernel/syscall.S
=2E\" See linux/Documentation/parisc/registers
The parisc port has a code page full of utility functions.
Rather than use the normal ELF aux vector approach, it passes the address of
the page to the process via the SR2 register.
This is done to match the way HP-UX works.

Since it's just a raw page of code, there is no ELF information for doing
symbol lookups or versioning.
Simply call into the appropriate offset via the branch instruction, e.g.:
=2Ebr
ble <offset>(%sr2, %r0)
=2Eif t \{\
=2Eft CW
\}
=2ETS
l l.
offset	function
_
00b0	lws_entry
00e0	set_thread_pointer
0100	linux_gateway_entry (syscall)
0268	syscall_nosys
0274	tracesys
0324	tracesys_next
0368	tracesys_exit
03a0	tracesys_sigexit
03b8	lws_start
03dc	lws_exit_nosys
03e0	lws_exit
03e4	lws_compare_and_swap64
03e8	lws_compare_and_swap
0404	cas_wouldblock
0410	cas_action
=2ETE
=2Eif t \{\
=2Ein
=2Eft P
\}

> There is support in glibc and libgcc for these calls.  The libgcc
> implementation
> in linux-atomic.c is very similar to that on arm.

interesting.  another arch to add :).
=2Dmike

--nextPart1603183.eDxiJ80Ly0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZ4HQAAoJEEFjO5/oN/WBVbkP/236c+rARfRbBqshk9I6VDAj
HlBA+iLEN66BInmCO22yw6Nk3CO1Rao2FXjn+c+OojroHGB+cJAUS8M5r4+6aCoW
FLjMjy/qHdF5d7ZXbK4gM1I3D45emEzJSEKP+yqlCV9De6YzTG7zidza7LevEIaT
Fo4bso0zMaX4tacc3wsqkOJfrexIYtOhaPmXktqdEWtrOi+CLWEyncmFdWgtJb+D
raTnml7BgtDb+M5KHXq+Q8izsaPOemjzQQqSwReHYs1MUpdJn68NMaz5JWBOsZHS
JD8P+ed+KnNjmHn2c9tya3pJ8CEFQ9uxWOR9rgOkv8KJ2AQWz2gKM3kEVBvbsjQc
Z63BubtTuDV2n3wQTtCT5bGejA9K6riWWbgx84sbqWbKglqH8XkGivECcG+9QIgw
SRyzfkipvdls5REnvFzeLMstFx5eWgunHp/q3AdsXo8L+NAsXiYLgvvU+qvx/+4v
6+6RLbhRKIsoM2ftKd4/CKwmJT10ZN3PuKsg97OOXg3SE6wd+IgGe5SGfha+rRzD
serbNx2PMeQ4U76Q3J6LNWU8N6UbLdvCaiN6zKIMH+/YWqFkBTtn8xuc3MWfO3jb
a3gcEQeR9GDWn+SS5DOoHRwWaHSdUIE8/z8GJRuo8QYbV0LdsTSBcIaOTIBzHJ4g
9Z10fsTXsZkAQRsKxHo+
=B2rN
-----END PGP SIGNATURE-----

--nextPart1603183.eDxiJ80Ly0--
