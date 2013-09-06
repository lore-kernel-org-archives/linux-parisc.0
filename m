From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Fri, 6 Sep 2013 18:12:01 +0400
Message-ID: <23BC892C-4F67-4669-A161-5F6ADE15F203@p0n4ik.tk>
References: <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net> <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl> <5228F071.4040000@gmx.de> <20130906085203.GA15333@alpha.franken.de>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130906085203.GA15333@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

06.09.2013, =D7 12:52, Thomas Bogendoerfer <tsbogend@alpha.franken.de> =
=CE=C1=D0=C9=D3=C1=CC(=C1):

> On Thu, Sep 05, 2013 at 10:58:25PM +0200, Helge Deller wrote:
>> Maybe section 4.5 (Chips et Coherency Issues) is relevant too: ?
>> The Rage128 product revealed a weakness in some motherboard chipsets=
 in that there is no mechanism to guarantee
>=20
> but radeon is not r128, iirc.

There is a discussion on coherency issues with radeon on powerpc platfo=
rm=20
in linuxppc-embedded mail list. See e.g. here: http://en.it-usenet.org/=
thread/19030/8457/
I actually tried sync suggestions from there, but they didn't help.

>=20
> My current state is:
>=20
> - parisc AGP GART code writes IOMMU entries in the wrong byte order a=
nd
>  doesn't add the coherency information SBA code adds

I've played with SBA IOMMU code once too. I've added an IOMMU bypass li=
ke
it done in counterpart ia64 driver, though it didn't help with DRM, plu=
s it broke
=46usion MPT SCSI driver, and then i've seen why:

/* We are just "encouraging" 32-bit DMA masks here since we can
 * never allow IOMMU bypass unless we add special support for ZX1.
 */

In addition, it has nothing to do in AGP mode which is DMA32 limited.

>=20
> - our PCI BAR setup doesn't really work very well together with the R=
adeon
>  DRM address setup.

> DRM will generate addresses, which are even outside
>  of the connected LBA

Aren't they fixing this sort of problems, like here: https://lkml.org/l=
kml/2010/12/6/516 ?

>=20
> I've hacked around both problems, but it doesn't solve the ring test
> issue. I even bought an PCI Radeon card to rule out any AGP oddities,
> but nothing new came out of the experiments with the PCI card.
>=20
> I've started checking drivers/video/aty to see what it does with
> acceleration and compare that with radeon DRM. The aty driver uses
> an endian config bit DRM doesn't use, but I haven't tested whether
> this makes a difference and how it is connected to the overall pictur=
e.=20
>=20
> What I'm still wondering is whether radeon DRM really works on 64bit
> big endian boxes. Is there any prove, that someone has it running ?
> Is it running on any big endian boxes ?

I've seen some patches were made for KMS in order to fix support for bi=
g-endian
machines, however all of them seem to be done for relatively new chips,=
 like r600.
All big endian support in r100.c looks like just one buffer swap, AFAIR=
=2E

>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necess=
arily a
> good idea.                                                [ RFC1925, =
2.3 ]

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
