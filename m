From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: drm/radeon: "ring test failed" on PA-RISC Linux
Date: Tue, 17 Sep 2013 12:13:43 +0400
Message-ID: <836081379405623@web17m.yandex.ru>
References: <20130910132529.GF5038@phenom.dumpdata.com> <1978F3C3-6AD8-4487-B9DD-8AF1DEDDA8B4@p0n4ik.tk>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1978F3C3-6AD8-4487-B9DD-8AF1DEDDA8B4@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This hand't been indexed, so i'll resending. Sorry for the noise...

11.09.2013, 15:11, "Alex Ivanov" <gnidorah@p0n4ik.tk>:
> Mates, let's continue with this issue at dri-devel@lists.freedesktop.=
org
> Here's where we stopped:
>
> --[start]--
>
>> =9A=EF=D4: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> =9A=F4=C5=CD=C1: =EF=D4=D7=C5=D4: drm/radeon: "ring test failed" on =
PA-RISC Linux
>> =9A=E4=C1=D4=C1: 10 =D3=C5=CE=D4=D1=C2=D2=D1 2013 =C7., 17:25:29 GMT=
+04:00
>> =9A=EB=CF=CD=D5: Alex Ivanov <gnidorah@p0n4ik.tk>
>> =9A=EB=CF=D0=C9=D1: Alex Deucher <alexdeucher@gmail.com>, Maling lis=
t - DRI developers <dri-devel@lists.freedesktop.org>
>>
>> =9AOn Tue, Sep 10, 2013 at 01:20:57PM +0400, Alex Ivanov wrote:
>>> =9AThanks! I'll try. Meanwhile i've tried a switch from page_alloc(=
) to
>>> =9Adma_alloc_coherent() in radeon_dummy_page_*(), which didn't help=
 :(
>> =9AIs this platform enabling the SWIOTLB layer? The reason I am aski=
ng is
>> =9Ab/c if you do indeed enable it you end up using the TTM DMA pool
>> =9Awhich allocates pages using the dma_alloc_coherent - which means =
that
>> =9Aall of the pages that come out of TTM are already 'DMA' mapped.
>>
>> =9AAnd that means the radeon_gart_bind and all its friends
>> =9Ause the DMA addresses that have been constructed by SWIOTLB IOMMU=
=2E
>>
>> =9APerhaps the PA-RISC IOMMU creates the DMA addresses differently?
>>
>> =9AWhen the card gets programmed, you do end up using ttm_agp_bind r=
ight?
>> =9AI am wondering if something like this:
>>
>> =9Ahttps://lkml.org/lkml/2010/12/6/512
>>
>> =9Ais needed to pass in the right DMA address?
>
> --[end]--
>
> Thomas,
>
>> =9AWhat I'm still wondering is whether radeon DRM really works on 64=
bit
>> =9Abig endian boxes.
>> =9AIs it running on any big endian boxes ?
>
> It's running ok at least on 32-bit big-endian PowerPCs and on 64-bit
> big-endian PowerPC G5 machines.
>
>> =9AIs there any prove, that someone has it running ?
>
> Here they are:
> https://groups.google.com/d/msg/linux.kernel/BnAMrzyO2wg/W-R5UVh_VLIJ
> And here's an excerpt from this one:
> http://lists.freedesktop.org/archives/dri-devel/2013-September/045029=
=2Ehtml
> "I don't think that will any difference. =9Aradeon kms works fine on
> other big endian platforms such as powerpc."
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
