From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [PATCH] wire up sysmmsg syscall
Date: Sun, 31 Jul 2011 23:46:07 +0200
Message-ID: <CA+DQjFgbOy=VV0omtN6QKmzkEbP6kxwYtCFZ4MFwybTXDEav-g@mail.gmail.com>
References: <1311950222.8190.43.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1311950222.8190.43.camel@mulgrave>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

On Fri, Jul 29, 2011 at 4:37 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> Signed-off-by: James Bottomley <JBottomley@Parallels.com>
>
> ---
>
> diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/a=
sm/unistd.h
> index 3392de3..276df1c 100644
> --- a/arch/parisc/include/asm/unistd.h
> +++ b/arch/parisc/include/asm/unistd.h
> @@ -821,8 +821,10 @@
> =C2=A0#define __NR_open_by_handle_at (__NR_Linux + 326)
> =C2=A0#define __NR_syncfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_=
_NR_Linux + 327)
> =C2=A0#define __NR_setns =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_=
_NR_Linux + 328)
> +#define __NR_setns =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (__NR_L=
inux + 328)

^ I may be wrong but this looks like a spurious "+", just reading this =
patch...

HTH

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
