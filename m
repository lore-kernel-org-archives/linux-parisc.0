From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Little endianness
Date: Sun, 15 Feb 2015 08:50:08 -0800
Message-ID: <1424019008.2114.10.camel@HansenPartnership.com>
References: <loom.20150210T112204-76@post.gmane.org>
	 <BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl>
	 <1423583801.2167.17.camel@HansenPartnership.com>
	 <4CB18756-188A-47DF-9E31-10EAFE3C558D@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: lausgans@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CB18756-188A-47DF-9E31-10EAFE3C558D@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2015-02-15 at 09:49 +0300, lausgans@gmail.com wrote:
> > James Bottomley <James.Bottomley@HansenPartnership.com>:
> >=20
> > On Tue, 2015-02-10 at 10:30 -0500, John David Anglin wrote:
> >> On 2015-02-10 5:31 AM, Held Bier wrote:
> >>> Hi.
> >>>=20
> >>> Looks like PA-RISC 1.1 added bi-endian support.
> >>> What about PA-RISC Linux? I know it's big endian.
> >>> But does it possible to build little endian kernel? If so, how?
> >>> Is migration to little endian planned? It should be reasonable
> >>> as it will bring more  compatibility with other Linux world.
> >=20
> > What compatibility?  x86 is LE, Arm is Schizophrenic, PPC, Sparc an=
d PA
> > are BE.  We're required to support the bus standards anyway, so the=
 SCSI
> > bus is BE and the PCI bus LE by spec.  There's no such thing as a
> > "compatible" endianness.
>=20
> Some software authors still assume that we're living in x86 only
> world, or just don't care. This leads to issues when one wish to run
> such software on a BE Linux.
>=20
> POWER is moving to LE:
> https://www.ibm.com/developerworks/community/blogs/fe313521-2e95-46f2=
-817d-44a4f27eba32/entry/just_the_faqs_about_little_endian
> "Although Power already has Linux distributions and supporting
> applications that run in big endian mode, the Linux application
> ecosystem for x86 platforms is much larger and Linux on x86 uses
> little endian mode.  Numerous clients, software partners, and IBM=E2=80=
=99s
> own software developers have told us that porting their software to
> Power becomes simpler if the Linux environment on Power supports
> little endian mode, more closely matching the environment provided by
> Linux on x86.  This new level of support will lower the barrier to
> entry for porting Linux on x86 software to Linux on Power."
>=20
> For PPC the patch was made: http://lwn.net/Articles/408845/

That's not a correct inference from the facts.  Power is interested in
playing in the embedded space and some of the graphics SoCs available
there are LE only, so they're interested in enabling a LE version to ru=
n
in that space ... it won't affect the rest of the PPC boxes.

All our boxes either have no graphics or a HP special big endian card.
The only exception is the C8000 which has an ATI with special firmware
(also designed for BE).

The thing you don't seem to understand is that the endianness is
actually fixed by the firmware of the shipping systems.  You're tied to
whatever the firmware starts you in because swapping after the firmware
init is unbelievably painful, especially when you need to call the
firmware to perform OS tasks.  We don't have any new systems planned, s=
o
all the firmware is now fixed for PA and the endianness with it.

James




--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
