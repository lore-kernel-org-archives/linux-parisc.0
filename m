From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: set ARCH_KMALLOC_MINALIGN
Date: Tue, 29 Jun 2010 10:07:27 -0400
Message-ID: <AANLkTikiJJ5G4Jy9sd644hpAljWFN_xvUJmpDZhxGf2x@mail.gmail.com>
References: <20100629154801C.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de,
	jejb@parisc-linux.org, linux-kernel@vger.kernel.org
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100629154801C.fujita.tomonori@lab.ntt.co.jp>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 29, 2010 at 2:50 AM, FUJITA Tomonori
<fujita.tomonori@lab.ntt.co.jp> wrote:
> This is a resend:
>
> http://marc.info/?t=3D127432584100006&r=3D1&w=3D2
>
> I thought that it was merged but seems that it was lost somewhere?
>
> =3D
> From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Subject: [PATCH] parisc: set ARCH_KMALLOC_MINALIGN
>
> Architectures that handle DMA-non-coherent memory need to set
> ARCH_KMALLOC_MINALIGN to make sure that kmalloc'ed buffer is DMA-safe=
:
> the buffer doesn't share a cache with the others.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Helge Deller <deller@gmx.de>
> Cc: James E.J. Bottomley <jejb@parisc-linux.org>
> Cc: stable@kernel.org
> ---
> =A0arch/parisc/include/asm/cache.h | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/as=
m/cache.h
> index 45effe6..5d87f27 100644
> --- a/arch/parisc/include/asm/cache.h
> +++ b/arch/parisc/include/asm/cache.h
> @@ -22,6 +22,8 @@
> =A0#define L1_CACHE_SHIFT 5
> =A0#endif
>
> +#define ARCH_KMALLOC_MINALIGN =A0L1_CACHE_BYTES
> +
> =A0#ifndef __ASSEMBLY__
>
> =A0#define L1_CACHE_ALIGN(x) =A0 =A0 =A0 (((x)+(L1_CACHE_BYTES-1))&~(=
L1_CACHE_BYTES-1))

Looks like you can send a patch to kill L1_CACHE_ALIGN too. :)

> --
> 1.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
