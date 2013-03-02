From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [parisc] do not install modules when installing kernel
Date: Sat, 02 Mar 2013 20:42:15 +0100
Message-ID: <51325617.80102@gmx.de>
References: <3763734.hDYRZelWPG@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, James.Bottomley@hansenpartnership.com
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3763734.hDYRZelWPG@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03/01/2013 11:23 PM, Rolf Eike Beer wrote:
> PA-RISC is the only arch that installs the modules when installing th=
e kernel.
>=20
> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>


Thanks!

Applied to my fixes-for-3.9-latest branch at
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git

Helge

> ---
>  arch/parisc/Makefile | 4 +---
>  1 Datei ge=E4ndert, 1 Zeile hinzugef=FCgt(+), 3 Zeilen entfernt(-)
>=20
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index ed9a14c..01d95e2 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -113,12 +113,10 @@ palo: vmlinux
>  # Shorthands for known targets not supported by parisc, use vmlinux =
as default
>  Image zImage bzImage: vmlinux
> =20
> -kernel_install: vmlinux
> +install: vmlinux
>  	sh $(src)/arch/parisc/install.sh \
>  			$(KERNELRELEASE) $< System.map "$(INSTALL_PATH)"
> =20
> -install: kernel_install modules_install
> -
>  CLEAN_FILES	+=3D lifimage
>  MRPROPER_FILES	+=3D palo.conf
> =20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
