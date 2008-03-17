From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] arch/parisc/kernel/unaligned.c: Use time_* macros
Date: Mon, 17 Mar 2008 11:40:57 -0400
Message-ID: <20080317154057.GD3904@phobos.i.cabal.ca>
References: <1205746593-24820-1-git-send-email-caglar@pardus.org.tr> <1205746593-24820-2-git-send-email-caglar@pardus.org.tr> <1205746593-24820-3-git-send-email-caglar@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: "S.?a??lar Onur" <caglar@pardus.org.tr>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1205746593-24820-3-git-send-email-caglar@pardus.org.tr>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Mon, Mar 17, 2008 at 11:36:25AM +0200, S.?a??lar Onur wrote:

Sorry, I seem to be losing at charsets with your name. :(

> The functions time_before, time_before_eq, time_after, and time_after=
_eq are more robust for comparing jiffies against other values.
>=20
> So following patch implements usage of the time_after() macro, define=
d at linux/jiffies.h, which deals with wrapping correctly
>=20

I prefer the idea of using printk_ratelimit. I've committed a patch tha=
t
does this to git and credited you with pointing it out.

cheers, Kyle

> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: linux-parisc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: S.=C7a??lar Onur <caglar@pardus.org.tr>
> ---
>  arch/parisc/kernel/unaligned.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unal=
igned.c
> index aebf3c1..19b8a79 100644
> --- a/arch/parisc/kernel/unaligned.c
> +++ b/arch/parisc/kernel/unaligned.c
> @@ -460,7 +460,7 @@ void handle_unaligned(struct pt_regs *regs)
>  			goto force_sigbus;
>  		}
> =20
> -		if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
> +		if (unaligned_count > 5 && time_after(jiffies, last_time + 5 * HZ)=
) {
>  			unaligned_count =3D 0;
>  			last_time =3D jiffies;
>  		}
> --=20
> 1.5.4.3
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
