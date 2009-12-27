From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: test off by one in sgl_frem() and dbl_frem()
Date: Sun, 27 Dec 2009 09:30:04 -0600
Message-ID: <1261927804.2697.4.camel@mulgrave.site>
References: <4B375F68.80301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
To: Roel Kluin <roel.kluin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B375F68.80301@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2009-12-27 at 14:21 +0100, Roel Kluin wrote:
> With `while (stepcount-- > 0)' stepcount reaches -1 after the loop.

This is true, but seems to be by design

> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  arch/parisc/math-emu/dfrem.c |    2 +-
>  arch/parisc/math-emu/sfrem.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Unless I am missing something?
> 
> diff --git a/arch/parisc/math-emu/dfrem.c b/arch/parisc/math-emu/dfrem.c
> index b983785..3283445 100644
> --- a/arch/parisc/math-emu/dfrem.c
> +++ b/arch/parisc/math-emu/dfrem.c
> @@ -234,7 +234,7 @@ dbl_frem (dbl_floating_point * srcptr1, dbl_floating_point * srcptr2,
>  		Dbl_subtract(opnd1p1,opnd1p2,opnd2p1,opnd2p2,opnd1p1,opnd1p2);
>  		roundup = TRUE;
>  	}
> -	if (stepcount > 0 || Dbl_iszero(opnd1p1,opnd1p2)) {
> +	if (stepcount >= 0 || Dbl_iszero(opnd1p1,opnd1p2)) {
>  		/* division is exact, remainder is zero */
>  		Dbl_setzero_exponentmantissa(resultp1,resultp2);
>  		Dbl_copytoptr(resultp1,resultp2,dstptr);
> diff --git a/arch/parisc/math-emu/sfrem.c b/arch/parisc/math-emu/sfrem.c
> index 3a1b7a3..ad87832 100644
> --- a/arch/parisc/math-emu/sfrem.c
> +++ b/arch/parisc/math-emu/sfrem.c
> @@ -229,7 +229,7 @@ sgl_frem (sgl_floating_point * srcptr1, sgl_floating_point * srcptr2,
>  		Sgl_subtract(opnd1,opnd2,opnd1);
>  		roundup = TRUE;
>  	}
> -	if (stepcount > 0 || Sgl_iszero(opnd1)) {
> +	if (stepcount >= 0 || Sgl_iszero(opnd1)) {
>  		/* division is exact, remainder is zero */
>  		Sgl_setzero_exponentmantissa(result);
>  		*dstptr = result;

Your patch does nothing to the actual execution flow (Sgl_iszero is true
if stepcount == 0) ... what's the point of applying it?

James


