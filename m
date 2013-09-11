From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Fwd: drm/radeon: "ring test failed" on PA-RISC Linux
Date: Wed, 11 Sep 2013 15:11:37 +0400
Message-ID: <1978F3C3-6AD8-4487-B9DD-8AF1DEDDA8B4@p0n4ik.tk>
References: <20130910132529.GF5038@phenom.dumpdata.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Mates, let's continue with this issue at dri-devel@lists.freedesktop.or=
g
Here's where we stopped:

--[start]--

> =EF=D4: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> =F4=C5=CD=C1: =EF=D4=D7=C5=D4: drm/radeon: "ring test failed" on PA-R=
ISC Linux
> =E4=C1=D4=C1: 10 =D3=C5=CE=D4=D1=C2=D2=D1 2013 =C7., 17:25:29 GMT+04:=
00
> =EB=CF=CD=D5: Alex Ivanov <gnidorah@p0n4ik.tk>
> =EB=CF=D0=C9=D1: Alex Deucher <alexdeucher@gmail.com>, Maling list - =
DRI developers <dri-devel@lists.freedesktop.org>
>=20
> On Tue, Sep 10, 2013 at 01:20:57PM +0400, Alex Ivanov wrote:
>>=20
>> Thanks! I'll try. Meanwhile i've tried a switch from page_alloc() to
>> dma_alloc_coherent() in radeon_dummy_page_*(), which didn't help :(
>=20
> Is this platform enabling the SWIOTLB layer? The reason I am asking i=
s
> b/c if you do indeed enable it you end up using the TTM DMA pool
> which allocates pages using the dma_alloc_coherent - which means that
> all of the pages that come out of TTM are already 'DMA' mapped.
>=20
> And that means the radeon_gart_bind and all its friends=20
> use the DMA addresses that have been constructed by SWIOTLB IOMMU.
>=20
> Perhaps the PA-RISC IOMMU creates the DMA addresses differently?
>=20
> When the card gets programmed, you do end up using ttm_agp_bind right=
?
> I am wondering if something like this:
>=20
> https://lkml.org/lkml/2010/12/6/512
>=20
> is needed to pass in the right DMA address?

--[end]--

Thomas,

> What I'm still wondering is whether radeon DRM really works on 64bit
> big endian boxes.
> Is it running on any big endian boxes ?

It's running ok at least on 32-bit big-endian PowerPCs and on 64-bit=20
big-endian PowerPC G5 machines.

> Is there any prove, that someone has it running ?

Here they are:
https://groups.google.com/d/msg/linux.kernel/BnAMrzyO2wg/W-R5UVh_VLIJ
And here's an excerpt from this one:
http://lists.freedesktop.org/archives/dri-devel/2013-September/045029.h=
tml
"I don't think that will any difference.  radeon kms works fine on
other big endian platforms such as powerpc."--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
