From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: [PATCH] kobject: Read buffer overflow
Date: Sun, 2 Aug 2009 12:06:59 +0200
Message-ID: <7d01f9f00908020306s273eec60u8e50692c0f839828@mail.gmail.com>
References: <4A754814.50506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Roel Kluin <roel.kluin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A754814.50506@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 2, 2009 at 10:02 AM, Roel Kluin<roel.kluin@gmail.com> wrote=
:
> Check whether index is within bounds before testing the element.

The change is correct but:
- There are other places in the code with that construct. Even though
they wouldn't trigger an overflow, why not fixing them too?
- Keep the likely: we are more likely to run out of data in the layers
than to exhaust the counter (which is why no overflow was ever
triggered, I believe ;-)

HTH

T-Bone

> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.=
c
> index f9f9a5f..13a64bc 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c
> @@ -370,7 +370,7 @@ pdcspath_layer_read(struct pdcspath_entry *entry,=
 char *buf)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!i) /* entry is not ready */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODAT=
A;
>
> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; devpath->layers[i] && (likely(i =
< 6)); i++)
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < 6 && devpath->layers[i]; i++=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out +=3D sprin=
tf(out, "%u ", devpath->layers[i]);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0out +=3D sprintf(out, "\n");
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
