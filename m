From: lausgans@gmail.com
Subject: Re: Little endianness
Date: Sun, 15 Feb 2015 09:49:32 +0300
Message-ID: <4CB18756-188A-47DF-9E31-10EAFE3C558D@gmail.com>
References: <loom.20150210T112204-76@post.gmane.org> <BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl> <1423583801.2167.17.camel@HansenPartnership.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1423583801.2167.17.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> James Bottomley <James.Bottomley@HansenPartnership.com>:
>=20
> On Tue, 2015-02-10 at 10:30 -0500, John David Anglin wrote:
>> On 2015-02-10 5:31 AM, Held Bier wrote:
>>> Hi.
>>>=20
>>> Looks like PA-RISC 1.1 added bi-endian support.
>>> What about PA-RISC Linux? I know it's big endian.
>>> But does it possible to build little endian kernel? If so, how?
>>> Is migration to little endian planned? It should be reasonable
>>> as it will bring more  compatibility with other Linux world.
>=20
> What compatibility?  x86 is LE, Arm is Schizophrenic, PPC, Sparc and =
PA
> are BE.  We're required to support the bus standards anyway, so the S=
CSI
> bus is BE and the PCI bus LE by spec.  There's no such thing as a
> "compatible" endianness.

Some software authors still assume that we're living in x86 only world,=
 or just don't care. This leads to issues when one wish to run such sof=
tware on a BE Linux.

POWER is moving to LE:
https://www.ibm.com/developerworks/community/blogs/fe313521-2e95-46f2-8=
17d-44a4f27eba32/entry/just_the_faqs_about_little_endian
"Although Power already has Linux distributions and supporting applicat=
ions that run in big endian mode, the Linux application ecosystem for x=
86 platforms is much larger and Linux on x86 uses little endian mode.  =
Numerous clients, software partners, and IBM=E2=80=99s own software dev=
elopers have told us that porting their software to Power becomes simpl=
er if the Linux environment on Power supports little endian mode, more =
closely matching the environment provided by Linux on x86.  This new le=
vel of support will lower the barrier to entry for porting Linux on x86=
 software to Linux on Power."

=46or PPC the patch was made: http://lwn.net/Articles/408845/

>=20
>> Unlikely.  According to the PA 2.0 arch, implementation of this feat=
ure=20
>> was optional.
>=20
> I think it was originally designed for some type of LASI system.
> There's an endian flip in some of the LASI devices as well.  I think =
the
> original problem was LASI was designed big endian, but the chosen SCS=
I
> processor was designed for LE at that time, so they tried to flip the
> processor.  I suspect the reason the feature became optional is that =
it
> caused more problems than it solved.
>=20
>> Further the PDC/IODC firmware and software tool chains need little=20
>> endian support.  This
>> is a massive amount of work.  So, unless one one decided to create a=
=20
>> 64-bit embedded
>> PA-RISC processor for mass deployment, it wouldn't be worth the effo=
rt.
>=20
> It's a bit pointless too.  Coping with endianness isn't really an
> unsolved OS problem, so it would cost a huge amount, open a large can=
 of
> worms and buy us nothing.
>=20
> James
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
