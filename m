Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01C434A1B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 00:01:31 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nDBn-0001tw-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 08:01:27 +0200
Date: Sat, 29 Sep 2001 08:00:06 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010929080006.A25136@dogbert.localdomain>
References: <200109271442.KAA14125@mail.lokmail.net> <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
In-Reply-To: <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,


On Fri, 28 Sep 2001, Matthew Wilcox wrote:

> On Thu, Sep 27, 2001 at 10:42:25AM -0400, Jurij Smakov wrote:
> > I hope I've got it right. It only emulates MFCTL and only when the
> > source control register is 27. It turns out, that pt_regs does not
> > have a member for cr26 and adding one does not look like an easy
> > task.=20
>=20
> I think the right way to do this would be...
>=20
> > @@ -363,6 +364,17 @@
> >                 si.si_code =3D ILL_PRVOPC;
> >                 goto give_sigill;
> >         case 11:
> > +               if(!(regs->iir & 0xfc000000) && (((regs->iir & 0x1fe0)>=
>5) =3D=3D 0x45)) {
> > +                 /* This is MFCTL instruction */
> > +                 fromcr =3D (regs->iir & 0x03e00000)>>21;
> > +                 togr =3D (regs->iir & 0x1f);
> > +                 /* Emulate the instruction if the read is from cr27 */
>=20
> 		if (fromcr =3D=3D 26 || fromcr =3D=3D 27) {
> 			regs->gr[togr] =3D mfctl(fromcr);
> 			return;
> 		}

Making this change causes the build to fail:

make[1]: Entering directory `/tmp/.hppa/linux/arch/parisc/kernel'
hppa-linux-gcc -D__KERNEL__ -I/tmp/.hppa/linux/include -Wall -Wstrict-proto=
types -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-com=
mon -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-=
calls -mdisable-fpregs -ffunction-sections -march=3D1.1 -mschedule=3D7100 -=
c -o traps.o traps.c
{standard input}: Assembler messages:
{standard input}:912: Error: Undefined absolute constant: 'fromcr'.
{standard input}:912: Error: Field out of range [0..31] (-1).
{standard input}:912: Error: Invalid operands
make[1]: *** [traps.o] Error 1
make[1]: Leaving directory `/tmp/.hppa/linux/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

What gives?
=20
> > +               }
> > +               /* Something else is wrong */
> >                 die_if_kernel("Privileged register - shouldn't happen!"=
, regs, code);
> >                 si.si_code =3D ILL_PRVREG;
> >         give_sigill:
>=20
> Can you give this a try?

Did. I don't think I messed it up. :-) Jurij's code compiles, so I'm
leaving it there for the moment and testing again.

Is your code functionally equivalent, or does it do something else
entirely?

Aside, I'm working on putting all the recent patches together into one
big fix720.diff.

Jochen suggested that in the case 11 handler, Jurij's

regs->gr[togr] =3D regs->cr27;

be replaced with

regs->iaoq[0] =3D regs->iaoq[1];
regs->iaoq[1] =3D regs->iaoq[0] + 4;

Is this right, or should I leave Jurij's code?

Regards,

Albert

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tWNmDg+hOeRZtkMRApycAJ9Z9XovtaLqVPR+6RSx4SnrtrBViwCgltoT
xJUdgwwulvB6vFB9QflJXYg=
=LVci
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
