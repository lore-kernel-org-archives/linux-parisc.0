From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Kconfig: use 'PA8X00' as the default choise
 instead of 'PA7000'
Date: Wed, 24 Jul 2013 07:00:43 -0700
Message-ID: <1374674443.4634.3.camel@dabdike>
References: <51EF8C52.50403@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51EF8C52.50403@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Wed, 2013-07-24 at 16:12 +0800, Chen Gang wrote:
> For server, 64-bit kernel is widely used and '64BIT' have been alread=
y
> as the default option of a server.
>=20
> So better to use 64-bit kernel as default choise instead of 32-bit
> kernel.

I think this is irrelevant since we have defconfig for this.  You
apparent request doesn't match the code below.

> Or when use cross-compiler 'hppa64-linux-gnu-gcc' with allmodconfig, =
it
> will report BUILD_BUG_ON:
>=20
>   arch/parisc/mm/init.c: In function =E2=80=98mem_init=E2=80=99:
>   arch/parisc/mm/init.c:581:2: error: call to =E2=80=98__compiletime_=
assert_581=E2=80=99 declared with attribute error: BUILD_BUG_ON failed:=
 PTE_ENTRY_SIZE !=3D sizeof(pte_t)

This shows you're using a buggy compiler.  PTE_OFFSET_SIZE is generated
as part of the build process, so you need a correct compiler.

> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/parisc/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index aa399a5..37bdecf 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -111,7 +111,7 @@ menu "Processor type and features"
> =20
>  choice
>  	prompt "Processor type"
> -	default PA7000
> +	default PA8X00

This doesn't require 64 bit: PA8xxx processors can operate happily in 3=
2
bit mode it does make the question appear, since PA7xxx are 32 bit only=
=2E

James


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
